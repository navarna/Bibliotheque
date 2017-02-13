/* AUTEUR Navarna */ 
\echo 'changement de date '

update dateJ set dateJour = dateJour+1 ;	 


select * from emprunt where date_fin < '2016-05-03'and etat = 1  ; 
select * from usager ; 
