/* AUTEUR Navarna */ 
\echo 'test creation usager'

select ajouter_usager('BD','groupe 2' , 'test@univ-paris.diderot.fr' , '0123456789' , 30 , 2) ; 

select * from usager ; 
