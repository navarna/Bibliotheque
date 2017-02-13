/* AUTEUR Navarna */ 
\echo 'test de pret de base '

select * from emprunt where id_usager = 6 ; 
\echo 'emprunt de base' 

select pret(6,2) ; 
\echo 'pret de l usager 6 ' 
select * from emprunt where id_usager = 6 ; 
\echo 'exemplaire emprunter'
select * from exemplaire where id_exemplaire = 2 ; 


\echo 'echec d emprunt carte bloque : '
\echo 'voici l usager 5 ' 
\echo 'pret de l usager 5 ' 
select * from emprunt where id_usager = 5 ;  
\echo 'information de l usager 5'
select * from usager where id_usager = 5 ; 
\echo 'il essaie d emprunter'
select pret(5,3) ; 
\echo 'pret de l usager 5 ' 
select * from emprunt where id_usager = 5 ; 
\echo 'exemplaire emprunter'
select * from exemplaire where id_exemplaire = 3 ;

\echo 'echec d emprunt pas la bonne inscription'
\echo 'information usager 7'
select * from usager where id_usager = 7 ; 
\echo 'il essaie d emprunter'
select pret(7,7) ; 
\echo 'exemplaire emprunter : un DVD'
select * from exemplaire where id_exemplaire = 7 ; 
\echo 'les pret de l usager 7' 
select * from emprunt where id_usager = 7 ; 
   
\echo 'echec date d inscription passez '
\echo 'information usager 8 ' 
select * from usager where id_usager = 8 ;

\echo 'il essaie un pret' 
select pret(8,3) ; 

\echo 'les pret de l usager 8' 
select * from emprunt where id_usager = 8 ; 


