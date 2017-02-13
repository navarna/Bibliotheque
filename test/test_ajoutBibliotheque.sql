/* AUTEUR Navarna */ 
\echo 'test AJouter un bibliothèque' 

select * from bu ; 

select ajouter_bu('Bibliothèque universitaire' , '5 rue thomas mann' , 13) ;

select * from bu ;  

\echo 'ajout de la meme bibliotheque'
select ajouter_bu('Bibliothèque universitaire' , '5 rue thomas mann' , 13) ;
