/* AUTEUR Navarna */ 
\echo 'test reservation'
select * from reservation ; 
select reserver(4,9) ; 

select * from reservation ; 
\echo 'reservation incorrecte : '

\echo 'reservation de dvd alors que l usager n as le droit qu au livre ' 
select reserver(4,34) ;
\echo 'reservation'  
select * from reservation ;
 
\echo 'la carte de l usager est perimer ' 
\echo 'information usager 8'
select * from usager where id_usager = 8 ; 
select reserver(8,9) ; 
\echo 'reservation'  
select * from reservation ;
 
\echo 'reservation  de + de 5 document'  
select reserver(4,27) ; 
select reserver(4,29) ; 
select reserver(4,30) ; 
select reserver(4,32) ; 
select reserver(4,35) ; 
select * from reservation ; 


\echo 'l usager ayant un pret sur une reservation tente un renouvellement '
\echo 'pret en question' 
select * from emprunt where id_exemplaire = 124 and etat = 1 ;
\echo 'renouvellement'    
select renouvellement_pret (124) ;

\echo 'il n y arrive pas '
select * from emprunt where id_exemplaire = 124 and etat = 1 ; 


\echo 'usager ayant un document en retard essaie de reserver'

select * from emprunt where id_usager = 1 and etat = 1 and date_fin < '2016-05-02' ; 

\echo 'il essaie de reserver '
select reserver(1,9) ;  

\echo 'il n y arrive pas'
select * from reservation ; 
