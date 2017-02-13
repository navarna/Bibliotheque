/* AUTEUR Navarna */ 
\echo "creation fonction"

CREATE OR REPLACE FUNCTION  ajouter_bu (n TEXT , a TEXT, ar INT) 
RETURNS void AS $$
BEGIN 
      Insert into Bu (nom,adresse ,arrondissement) 
      VALUES (n,a,ar);
      Return ;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION  ajouter_document (l TEXT , a TEXT , tt TEXT , d date ,  mat boolean , f  int , t TEXT DEFAULT NULL )
RETURNS void AS  $$ 
BEGIN 
      insert into document (langue , auteur , titre , date_parution , mature , format , theme) 
      VALUES (l,a,tt,d,mat,f,t);
       return ;
END;
$$
LANGUAGE plpgsql ; 


CREATE OR REPLACE FUNCTION ajouter_exemplaire (idB int , idD int , nb int) 
RETURNS void AS $$
DECLARE 
	verifD int ;
	verifB int ;
	tt text ;
	f int ; 
BEGIN  
       select into verifD count(*) from document 
       where id_doc = idD ;
       select into verifB count(*) from bu 
       where id_bu = idB ;
       IF ((verifD = 1)AND(verifB =1)) 
       	then 
	select into tt,f titre , format  from document 
	where id_doc = idD ;
	LOOP 
	EXIT WHEN nb < 1 ;
	     insert into exemplaire (titre,etat,id_bu,id_doc,format) 
	     Values (tt,0,idB,idD,f) ;
	     nb = nb -1 ;  
	END LOOP ;           
	ELSE raise notice 'les ids ne sont pas correct '; 

	end if ;
END ; 
$$
LANGUAGE plpgsql ; 


CREATE OR REPLACE FUNCTION ajouter_usager (n text , p text , ml text , t text ,  a int , ins int) 
RETURNS void AS $$
DECLARE 
	df date ;
BEGIN 
      Select into df dateJour from dateJ ;
      df = df +365 ; 
      insert into usager (nom , prenom , mail , telephone , age, inscription , date_fin, retard )
      values (n,p,ml,t,a,ins,df,0);
END ;
$$
language plpgsql ; 


CREATE OR REPLACE FUNCTION renouvellement_usager (id int ) 
RETURNS void AS $$
DECLARE 
	df date ;
BEGIN 
      Select into df dateJour from dateJ ;
      df = df +365 ; 
      update usager 
      set date_fin = df  
      where id_usager = id ; 
END ;
$$
language plpgsql ; 


CREATE OR REPLACE FUNCTION changement_inscription_usager( id int , ins int ) 
RETURNS VOID AS $$
DECLARE 
	df date ;
BEGIN 
      Select into df dateJour from dateJ ;
      df = df +365 ; 
      update usager 
      set date_fin = df , inscription = ins 
      where id_usager = id ; 
END ;
$$
language plpgsql ; 


CREATE OR REPLACE FUNCTION pret (idU int , idE int ) 
RETURNS VOID AS $$ 
DECLARE 
	db date ; 
	df date ;
	et int ; 
	tt text ; 
 	f int ;
	c int ;
	doc int ;
BEGIN 
      select into db dateJour from dateJ ; 
      df = db +21 ; 
      select into et , tt , f,doc  etat , titre , format,id_doc from exemplaire 
      where id_exemplaire = idE ; 
      if(et is not null) 
      then if (et = 0 ) 
      	   then insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
	   	values (f,tt,0,1,db,df,idE,idU ) ;
	   elsif (et = 2)
	   then select into  c count(*) from reservation 
	   	where id_usager = idU 
		AND id_doc = doc 
		AND reserve = 1 ; 
		if(c = 1) then 
		      insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
	   	      values (f,tt,0,1,db,df,idE,idU ) ; 
		      update reservation set reserve = 2 where id_usager = idU AND id_doc = doc AND reserve = 1 ;    
	   	end if ;
	  end if ; 
      end if  ; 
END ;
$$
language plpgsql ; 	  	   
			   

CREATE OR REPLACE FUNCTION renouvellement_pret (idEm int) 
RETURNS VOID AS $$
DECLARE 
	df date ;
BEGIN
	select into df * from DateJ ; 
	df = df + 21 ; 
	update emprunt set renouveler = renouveler+1 ,date_fin = df 
	where id_emprunt = idEm ; 
END ; 
$$ 
language plpgsql ; 


CREATE OR REPLACE FUNCTION retour_pret (idEm int ) 
RETURNS void AS $$
BEGIN 
      update emprunt set etat = 0 
      where id_emprunt = idEm 
      ; 
END;
$$ 
language plpgsql ; 

CREATE OR REPLACE FUNCTION retour_Exemplaire (idEx int , idU int) 
RETURNS void AS $$
BEGIN
	update emprunt set etat = 0 
	where id_exemplaire = idEx 
	AND id_usager = idU 
	AND etat = 1 ; 
END ; 
$$
Language plpgsql ; 
	
CREATE OR REPLACE FUNCTION paiement (idU int , a decimal ) 
RETURNS void AS $$ 
BEGIN 
      update usager set retard = retard -a 
      where id_usager = idU ; 
END ; 
$$
language plpgsql ; 
 
CREATE OR REPLACE FUNCTION reserver (idU int , idD int ) 
RETURNS void as $$
DECLARE 
	d date ; 
BEGIN
	select into d dateJour FROM dateJ ;
	insert into reservation (id_usager, id_doc , date_reservation , reserve )
	values (idU,idD , d , 0 ) ;
END; 
$$
language plpgsql ; 

prepare recherche_auteur(text) AS
select * from exemplaire natural join document 
where auteur like '%'||$1||'%' ; 


prepare recherche_titre(text) AS
select * from exemplaire natural join document 
where titre like '%'||$1||'%' ;

prepare pourcentageEmprunt  AS
select id_bu , (nbEmp*100/nbTot) as pourcentage 
from (select count(*)as nbEmp ,id_bu from exemplaire where etat = 1 group by id_bu )as t1 
natural join (select count(*) as nbTot , id_bu from exemplaire group by id_bu)  as t2 ; 


prepare nbrempruntMoisPrec AS
select count(*) as nbr_Emprunt_Mois_Dernier from emprunt natural join dateJ 
where extract(month from dateJour) - extract(month from date_deb) = 1 ; 

CREATE OR REPLACE FUNCTION ajoutBu_trigger() returns TRIGGER as $verifAjout_bu$
DECLARE 
	c int ; 
BEGIN
	 Select into c count(*) from bu 
	 where nom = new.nom 
	 AND arrondissement  = new.arrondissement 
	 AND adresse = new.adresse ;
	 if(c < 1 )
	 then return new ; 
	 else 
	 raise notice 'Cette bibliotheque existe deja , refus de l inscription' ; 
	 return null ;  	
	 end if ;
end;
$verifAjout_bu$ language plpgsql ; 


CREATE OR REPLACE FUNCTION ajoutDoc_trigger() returns TRIGGER as $verifAjout_Doc$
DECLARE 
	c int ; 
BEGIN
	 Select into c count(*) from document
	 where langue = new.langue 
	 AND auteur  = new.auteur
	 AND titre = new.titre 
	 AND format = new.format 
	 AND date_parution = new.date_parution;
	 if(c < 1 )
	 then return new ; 
	 else 
	 raise notice 'Ce document existe deja , refus de l inscription' ; 
	 return null ;  	
	 end if ;
end;
$verifAjout_Doc$ language plpgsql ; 


CREATE OR REPLACE FUNCTION ajoutExemp_trigger() returns TRIGGER as $verifAjout_Exemp$
DECLARE 
	tt text ;
	f int ; 
BEGIN  
       	select into tt,f titre , format  from document 
	where id_doc = new.id_doc ;
	if((tt = new.titre ) AND (f = new.format))
	 then return new ;   
	 else return null ;  	
	 end if ;
end;
$verifAjout_Exemp$ language plpgsql ; 

CREATE OR REPLACE FUNCTION ajoutUsag_trigger() returns TRIGGER as $verifAjout_Usag$
DECLARE 
	c int ; 
	id int ; 
BEGIN
	 Select into c count(*) from usager
	 where nom = new.nom 
	 AND prenom  = new.prenom
	 AND telephone = new.telephone 
	 AND mail = new.mail
	 AND age = new.age;
	 if((c < 1 ) AND (new.retard > -1.99)) 
	 then return new ; 
	 elsif((c = 1) AND (new.retard > -1.99)) 
	 then select into id id_usager from usager 
	 where nom = new.nom 
	 AND prenom  = new.prenom
	 AND telephone = new.telephone 
	 AND mail = new.mail
	 AND age = new.age;
	     if (id= new.id_usager)
	     then return new ; 
	     end if ;
	     raise notice 'cet usager existe deja ';  
	     return null ; 
	 else return null ;  	
	 end if ;
end;
$verifAjout_Usag$ language plpgsql ;

CREATE OR REPLACE FUNCTION ajoutDate_trigger() returns TRIGGER as $verifAjout_Date$
DECLARE 
	c int ; 
BEGIN
	 Select into c count(*) from DateJ ;
	 if(c < 1 )
	 then return new ; 
	 else return null ;  	
	 end if ;
end;
$verifAjout_Date$ language plpgsql ; 

CREATE OR REPLACE FUNCTION modifDoc_trigger() returns TRIGGER as $verifModif_Doc$
BEGIN
	return null ; 
end;
$verifModif_Doc$ language plpgsql ; 


CREATE OR REPLACE FUNCTION modifExemp_trigger() returns TRIGGER as $verifModif_Exemp$
BEGIN
	if((old.titre = new.titre)AND (old.format = new.format)AND (old.id_doc = new.id_doc)AND (old.id_bu = new.id_bu))
	then if not (old.etat = new.etat) 
	     then   return new ; 
	     end if ; 
	 end if ;     
	return null ;      	    
end;
$verifModif_Exemp$ language plpgsql ; 

CREATE OR REPLACE FUNCTION verifNbrEmprunt(f int , idU int , idEx int) 
RETURNS BOOLEAN AS $$ 
DECLARE 
	c int ; 
	bu int ;  	
BEGIN 	
	select into bu count(*) from emprunt natural join exemplaire 
	where id_bu =idEx AND id_usager = idU AND etat = 1 ;
	if (bu > 19 ) 
	then  raise notice 'vous avez emprunter + de 20 livre a cette bibliotheque' ;   
	return false ;
	end if ; 
	select into c count(*) from emprunt 
      	where id_usager = idU AND etat = 1 ;
	if(c >39) 
	then raise notice 'vous avez emprunter + de 40 livre' ; 
	return false ; 	  
	end if ;  	
      	if(f < 2 ) then 
 	     return true ; 
	else 
	   select into c count(*) from emprunt 
      	   where id_usager = idU AND etat = 1 AND format = 2 ;
	   if(c > 4 ) then
	   raise notice 'il y a + de 5 dvd' ;  
	   return false ;
	   end if ; 
	end if ;
	return true ;     
END; 
$$
language plpgsql ; 

CREATE OR REPLACE FUNCTION verifNouveaute( idD int , idU int) 
RETURNS BOOLEAN AS $$ 
DECLARE 
	nouv int ;
	c int ; 
	d date ; 
BEGIN 
      select into d dateJour from dateJ ; 
      select into nouv (d- date_parution) from document 
      where id_doc = idD ; 
      if(nouv > 60 ) then return true ;
      else 
      select  into c count(*) 
      from emprunt inner join 
      (exemplaire 
	    inner join (select id_doc , (d-date_parution) as temps from document )as t2 
	    on exemplaire.id_doc = t2.id_doc) as t0 
	    on emprunt.id_exemplaire = t0.id_exemplaire 
	    where emprunt.id_usager = idU and emprunt.etat = 1 and temps < 60 ; 
	   if(c <3 ) then 	   
	   return true ;
	   end if ;
    end if ;
    raise notice 'il y a + de 3 nouveauté' ;
    return false ;     
 
END; 
$$
language plpgsql ; 


CREATE OR REPLACE FUNCTION ajoutEmpr_trigger() returns TRIGGER as $verifAjout_Empr$
DECLARE 
	et int ;
	doc int ; 
	r decimal ; 
	nouv int ;
	c int ; 
	f int ;
	ok boolean ; 
	ok1 boolean ; 
	ins int ; 
	bu int ; 
	df date ; 
	d date ; 
BEGIN
	select into d dateJour from dateJ ; 
	select into r,ins,df retard,inscription,date_fin from usager 
	where id_usager = new.id_usager;
	if(r > 15) 
	then raise notice 'votre cate usager est bloquer , veuiller rembourser votre dette';
	return null ; 
	end if ; 
	if(df - d < 0 ) 
	then raise notice 'votre cate usager est périmer , veuiller vous reinscrire';
	return null ;
	end if ; 
	select into et,f,doc,bu etat,format,id_doc,id_bu from exemplaire 
	where id_exemplaire = new.id_exemplaire ;
	if(ins < f ) 
	then raise notice 'vous n avez pas le droit d emprunter cet exemplaire'; 
	return null ;
	end if ; 
	if(new.etat = 0 )
	then 
	return new ;
	end if ;  
	if( et = 1) 
	then raise notice 'l exemplaire est deja emprunter' ;
	return null ;
	elsif (et = 2 ) then 
	   select into  c count(*) from reservation 
	   where id_usager = new.id_usager  
	   AND id_doc = doc 
	   AND reserve = 1 ;
	   if (c = 1) then 
	      ok = verifNbremprunt(f,new.id_usager, bu)   ;
	      ok1 = verifNouveaute(doc, new.id_usager) ;
	      if(ok AND ok1)then 
	      	    update exemplaire set etat = 1 
		    where id_exemplaire = new.id_exemplaire ;
		    update reservation set reserve = 2
		    where id_doc = doc   
		    AND id_usager = new.id_usager 
		    AND reserve = 1 ;  
	      	    return new ; 
	      end if ; 
	   end if ; 
	else 
	   ok = verifNbremprunt(f,new.id_usager, bu)   ;
	   ok1 = verifNouveaute(doc, new.id_usager) ;
	      if(ok AND ok1)then 
	      	    update exemplaire set etat = 1 
		    where id_exemplaire = new.id_exemplaire ; 
	      	    return new ;
	      end if ; 
	end if ;
	return null ;        	   
end;
$verifAjout_Empr$ 
language plpgsql ; 


CREATE OR REPLACE FUNCTION modifEmpr_trigger() returns TRIGGER as $verifModif_Empr$
DECLARE 
	c int ; 
	d date ;
	cd int;
	cr int ;   
	doc int ; 
BEGIN
	 if (new.etat = 0) then 
	    select into c count(*) from emprunt 
	    where id_usager = new.id_usager 
	    AND id_emprunt = new.id_emprunt 
	    AND etat = 1 ; 
	    if(c = 1 ) then 
	    	 update exemplaire set etat = 0 
	     	  where id_exemplaire = new.id_exemplaire ;
	      	  return new ; 
	     end if ;
	     return null ;
	  elsif(new.renouveler != old.renouveler) then 
	  	select into d dateJour from dateJ ; 
		select into cd old.date_fin -d from emprunt 
		where id_emprunt = old.id_emprunt ; 	       		        
	  	if (cd <0 ) then return null ;
		end if ;
		select into  doc id_doc from exemplaire 
		where id_exemplaire = new.id_exemplaire ; 
		select into cr count(*) from reservation 
		where id_doc = doc and reserve = 0 ; 
		if(cr >0 ) then return null ;
		end if ;
		if(new.renouveler > 2 )
		then  
		return null; 
		end if ;   
		return new ; 
	end if ;  
end;
$verifModif_Empr$ language plpgsql ; 


CREATE OR REPLACE FUNCTION modifEmprAft_trigger() returns TRIGGER as $verifModif_EmprAft$
DECLARE
	doc int ;
	dr date ; 
	idu int ;   
BEGIN
	select into doc id_doc from exemplaire 
	where id_exemplaire = new.id_exemplaire ;	
	select into dr,idu date_reservation,id_usager from reservation
	where id_doc = doc 
	AND reserve = 0 
	ORDER BY date_reservation 
	Limit  1 ; 
	if((idU IS NOT NULL) AND (dr IS NOT NULL )) 
	then update reservation set reserve = 1 
	     where id_doc = doc 
	     AND id_usager = idU 
	     AND date_reservation = dr 
	     AND reserve = 0 ; 
	     update exemplaire set etat = 2 
	     where id_exemplaire= new.id_exemplaire ; 
	     raise notice ' usager % le document % est a votre disposition ' , idU, doc ; 
	END if ; 
	return null ; 
	
end;
$verifModif_EmprAft$ language plpgsql ; 

CREATE OR REPLACE FUNCTION ajoutRes_trigger() returns TRIGGER as $verifAjout_Res$
DECLARE
	c int ;
	cr int ; 
	ins int ; 
	f int ; 
	r int; 
	d date ; 
	df date ; 
BEGIN
	select into c count(*) from exemplaire 
	where id_doc = new.id_doc
	AND etat = 0 ; 
	select into cr count(*) from reservation
	where id_usager = new.id_usager
	AND reserve < 2 ;
	select into ins,df inscription,date_fin from usager 
	where id_usager = new.id_usager ; 
	select into f format from document 
	where id_doc = new.id_doc ; 
	select into d datejour from dateJ ;
	select into r count(*) from emprunt 
	where id_usager = new.id_usager 
	AND etat = 1 
	AND d < date_fin ; 
	if((cr < 5) AND (c < 1 )AND (f between 0 and ins) AND (r < 1)AND (df>d)) then return new ;
	end if ;  
	raise notice 'refus réservation' ; 
	return null ; 
	
end;
$verifAjout_Res$ language plpgsql ; 
CREATE OR REPLACE FUNCTION coutRetard(d date) 
RETURNS boolean AS $$
DECLARE
	tab refcursor ; 
	idu int ; 
	c int ; 
BEGIN
	open tab for select id_usager,count(*) as c0 from emprunt
	where date_fin < d and etat = 1 
	group By id_usager ;
	LOOP 
	FETCH tab into idu , c ;
	if((idu is not null)and (c is not null )) then  
	update usager set retard = retard + 0.15*c 
	where id_usager = idu ;
	else
	close tab ;   
	return true ;
	end if ;  
	END LOOP ; 
	return true;	 
END ;
$$
language plpgsql ; 
 
CREATE OR REPLACE FUNCTION  retardAbusif () 
RETURNS boolean as $$
DECLARE 
	idu int ; 
	tab refcursor ; 
BEGIN 
      open tab for select id_usager from usager 
      where retard > 15 ;
      LOOP 
      fetch tab into idu ; 
      if(idU Is NOT NULL) THEN 
      	     raise notice 'usager n°%, vous avez depasser le plafond de dette autorisée ', idu ; 
      else 
      close tab; 
      return true;      	     
      END IF;  
      END LOOP ; 
      return true; 
END; 
$$
Language plpgsql ; 

CREATE OR REPLACE FUNCTION dateRetour(d date ) 
RETURNS boolean as $$
DECLARE
	idu int ; 
	idex int ;
	tab refcursor ;  
BEGIN 
      open tab for select id_usager, id_exemplaire from emprunt 
      where date_fin - d between  0 and 2 ;
      LOOP 
      fetch tab into idu,idex ; 
      if(idu is not null) then  
      	     raise notice 'usager n°%, vous devez rendre l exemplaire % dans - de 2 jours',idu , idEx ; 
      else 
      close tab ;
      return true ; 
      end if ; 
      end loop ; 
      return true ;
END ;
$$
Language plpgsql ; 

CREATE OR REPLACE FUNCTION tropVieux(d date ) 
RETURNS boolean as $$
DECLARE
	idEm int ;
	tab refcursor ;  
BEGIN 
      open tab for select id_emprunt from emprunt 
      where d - date_deb  > 60 and etat = 0 ;
      LOOP 
      fetch tab into idEm ; 
      if(idEm is not null) 
      then  delete from emprunt where id_emprunt = idEm ;  	     
      else 
      close tab ;
      return true ; 
      end if ; 
      end loop ; 
      return true ;
END ;
$$
Language plpgsql ; 

CREATE OR REPLACE FUNCTION modifDate_trigger() returns TRIGGER as $verifModif_Date$
DECLARE 
	ok boolean  ;   
	d date ;
	diff int ;  
BEGIN
	diff = new.dateJour - old.dateJour ;
	d = old.dateJour ; 
	loop 
	if(diff <1  ) then return null ; 
	end if ; 
	d = d +1 ; 
	ok = coutRetard(d) ;
	ok=  retardAbusif() ;
	ok =  dateRetour(d) ;
	ok = tropVieux(d) ; 
	diff = diff -1 ; 
	end loop ; 
	return null ; 
end;
$verifModif_Date$ language plpgsql ; 
