/* AUTEUR Navarna */ 
\echo 'test pas plus de 40 document emprunter' 

select pret(1,1);
select pret(1,13);
select pret(1,14);
select pret(1,19);
select pret(1,58);
select pret(1,61);
select pret(1,71);
select pret(1,72);
select pret(1,83);
select pret(1,55);
select pret(1,18);
select pret(1,85);
select pret(1,90);
select pret(1,47);
select pret(1,84);
\echo 'emprunt de l usager 1 '  
select * from emprunt where id_usager =1 and etat = 1 ; 
