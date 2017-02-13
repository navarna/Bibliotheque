/* AUTEUR Navarna */ 
\echo 'test_renouvellement'

\echo 'l emprunt a renouveler'
select * from emprunt where id_emprunt =13 ; 

\echo 'renouvelement' 
select renouvellement_pret(13) ; 

\echo 'l emprunt  renouveler'
select * from emprunt where id_emprunt =13 ; 

\echo 'erreur plus de 2 fois de renouvelement ' 
\echo 'l emprunt a renouveler'
select * from emprunt where id_emprunt =12 ; 

\echo 'renouvelement' 
select renouvellement_pret(12) ; 
select renouvellement_pret(12) ; 

\echo 'l emprunt  renouveler '
select * from emprunt where id_emprunt =12 ; 
