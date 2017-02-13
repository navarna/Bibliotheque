/* AUTEUR Navarna */ 
\echo 'destruction trigger' 

DROP TRIGGER IF EXISTS verifAjout_bu ON bu ; 
DROP TRIGGER IF EXISTS verifAjout_Doc ON document ; 
DROP TRIGGER IF EXISTS verifAjout_Exemp ON exemplaire ; 
DROP TRIGGER IF EXISTS verifAjout_Usag ON usager ; 
DROP TRIGGER IF EXISTS verifAjout_Date ON dateJ ; 
DROP TRIGGER IF EXISTS verifModif_Doc ON document ;
DROP TRIGGER IF EXISTS verifModif_Exemp ON exemplaire;
DROP TRIGGER IF EXISTS verifAjout_Empr ON emprunt ; 
DROP TRIGGER IF EXISTS verifModif_Empr ON emprunt ; 
DROP TRIGGER IF EXISTS verifModif_EmprAft ON emprunt ;
DROP TRIGGER IF EXISTS verifAjout_Res ON reservation;
DROP TRIGGER IF EXISTS verifModif_Date on dateJ ; 
