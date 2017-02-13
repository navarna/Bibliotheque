/* AUTEUR Navarna */ 
\echo 'test erreur d emprunt + de 20 exemplaire dans une bu'

select pret(1,73) ;
select pret(1,95);
select pret(1,96);
select pret(1,99);
select pret(1,100);
select pret(1,104);
select pret(1,106);
select pret(1,107);
select pret(1,108);
select pret(1,109);
select pret(1,110);
select pret(1,111);
select pret(1,112);
select pret(1,113);
select pret(1,116);
select pret(1,117);
select pret(1,118);
select pret(1,119);
select pret(1,120);
select pret(1,121);
select pret(1,122);

\echo 'emprunt de l usager 1 dans la bibliotheque 5' 
select id_emprunt , format , titre , renouveler , emprunt.etat ,date_deb ,date_fin , emprunt.id_exemplaire , id_usager , id_bu from emprunt natural join exemplaire  where id_usager = 1 and id_bu = 5 ;  
