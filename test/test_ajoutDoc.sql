/* AUTEUR Navarna */ 
\echo 'test ajout de document'

select * from document ;
 
\echo 'livre : ' 
select ajouter_document('français', 'Mme Laplante','BD Avancer Version Livre' ,'2016-01-18', true ,0, 'cours');
\echo 'Cd : '
select ajouter_document('français', 'Mme Laplante','BD Avancer Version CD' ,'2016-01-18', true ,1, 'cours');
\echo 'DVD' 
select ajouter_document('français', 'Mme Laplante','BD Avancer Version DVD ' ,'2016-01-18', true ,2, 'cours');

select * from document ; 

\echo ' test ajout d un exemplaire dans la bibliothèque 1 '
select ajouter_exemplaire(1,36,1) ; 
select ajouter_exemplaire(1,37,1) ;
select ajouter_exemplaire(1,38,1); 
select * from exemplaire where id_doc >35; 

