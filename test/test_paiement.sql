/* AUTEUR Navarna */ 
\echo ' l usager 7 paie sa dette' 

\echo 'information usager 7 ' 
select * from usager where id_usager = 7 ; 
\echo 'il paie 1 euro'
select paiement(7,1);

\echo 'information usager 7'
select * from usager where id_usager = 7 ; 
