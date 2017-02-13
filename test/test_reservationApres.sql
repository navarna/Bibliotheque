/* AUTEUR Navarna */ 
\echo 'test apres une reservation '

select * from reservation ; 

\echo 'retour d un livre'
select retour_pret(4) ; 

select * from reservation ; 
select * from exemplaire where id_exemplaire = 98 ; 

\echo ' un autre usager (celui avec l id 1 )  essaie d emprunter l exemplaire'

select pret (1,98) ; 
\echo 'emprunt de l usager 1 ' 
select * from emprunt where id_usager = 1 ; 
\echo 'celui qui a reserver emprunte l exemplaire (le 4) '

select pret(4,98) ; 
select * from emprunt where id_usager = 4 ; 
