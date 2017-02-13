/* AUTEUR Navarna */ 
\echo 'destruction fonction' 

DROP FUNCTION IF EXISTS ajouter_bu (n TEXT , a TEXT, ar INT) ;
DROP FUNCTION IF EXISTS ajouter_document  (l TEXT , a TEXT , tt TEXT , d date ,  mat boolean , g TEXT , t TEXT ); 
DROP FUNCTION IF EXISTS  ajouter_exemplaire (idB int , idD int , nb int) ; 
DROP FUNCTION IF EXISTS ajouter_usager (n text , p text , ml text , t text ,  a int , ins int , df date ) ;
DROP FUNCTION IF EXISTS renouvellement_usager (id int ) ;
DROP FUNCTION IF EXISTS changement_inscription_usager( id int , ins int ) ;
DROP FUNCTION IF EXISTS pret (idU int , idE int ) ;
DROP FUNCTION IF EXISTS renouvellement_pret (idEm int) ;
DROP FUNCTION IF EXISTS retour_pret (idEm int ) ;
DROP FUNCTION IF EXISTS retour_Exemplaire (idEx int , idU int) ;
DROP FUNCTION IF EXISTS paiement (idU int , a int ) ;
DROP FUNCTION IF EXISTS reserver (idU int , idD int ) ;
DROP FUNCTION IF EXISTS verifNbrEmprunt(f int , idU int , idEx int) ;
DROP FUNCTION IF EXISTS verifNouveaute( idD int , idU int) ;
DROP FUNCTION IF EXISTS coutRetard() ;
DROP FUNCTION IF EXISTS retardAbusif () ;
DROP FUNCTION IF EXISTS dateRetour() ;

DROP FUNCTION IF EXISTS ajoutBu_trigger();
DROP FUNCTION IF EXISTS ajoutDoc_trigger();
DROP FUNCTION IF EXISTS ajoutExemp_trigger();
DROP FUNCTION IF EXISTS ajoutUsag_trigger() ;
DROP FUNCTION IF EXISTS ajoutDate_trigger() ;
DROP FUNCTION IF EXISTS modifDoc_trigger();
DROP FUNCTION IF EXISTS modifExemp_trigger() ;
DROP FUNCTION IF EXISTS ajoutEmpr_trigger();
DROP FUNCTION IF EXISTS modifEmpr_trigger() ;
DROP FUNCTION IF EXISTS modifEmprAft_trigger();
DROP FUNCTION IF EXISTS ajoutRes_trigger() ;
DROP FUNCTION IF EXISTS modifDate_trigger();
