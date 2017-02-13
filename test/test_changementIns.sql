/* AUTEUR Navarna */ 
\echo ' l usager 7 change son type d inscription' 

\echo 'information usager 7 ' 
select * from usager where id_usager = 7 ; 
\echo 'il veut l inscription gratuite (seulement les livres)'
select changement_inscription_usager(7,0);

\echo 'information usager 7'
select * from usager where id_usager = 7 ; 
