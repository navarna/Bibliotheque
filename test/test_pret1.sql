/* AUTEUR Navarna */ 
\echo 'test de pret'

\echo 'emprunt de l usager 6'
select * from emprunt where id_usager = 6 ; 

\echo 'emprunts de dvd'
select pret(6,5) ; 
select pret(6,6) ;
select pret(6,32);
select pret (6,39) ; 
select pret(6,105) ;
\echo 'si on essaie de prendre + de 5 dvd'
select pret (6,101)  ; 

\echo 'emprunt de l usager 6'
select * from emprunt where id_usager = 6 ;  
 
\echo 'emprunt de nouveauté' 

select pret(6,8) ; 
select pret(6,10) ; 
\echo 'si on essaie de prendre + de 3 nouveauté' 
select pret (6,97) ; 

\echo 'emprunt de l usager 6'
select id_emprunt , format , titre , renouveler , emprunt.etat ,date_deb ,date_fin , emprunt.id_exemplaire , id_usager , date_parution from emprunt natural join exemplaire inner join (select date_parution,id_doc from document)as t0 on exemplaire.id_doc = t0.id_doc where id_usager = 6 ;  
 
