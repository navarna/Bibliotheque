/* AUTEUR Navarna */ 
\echo 'creation trigger'


CREATE TRIGGER verifAjout_bu 
BEFORE INSERT OR UPDATE ON bu
FOR EACH ROW
    execute procedure ajoutBu_trigger() ; 

CREATE TRIGGER verifAjout_Doc 
BEFORE INSERT OR UPDATE ON document
FOR EACH ROW
    execute procedure ajoutDoc_trigger() ; 

CREATE TRIGGER verifAjout_Exemp 
BEFORE INSERT OR UPDATE ON exemplaire
FOR EACH ROW
    execute procedure ajoutExemp_trigger() ; 
 
CREATE TRIGGER verifAjout_Usag
BEFORE INSERT OR UPDATE ON usager
FOR EACH ROW
    execute procedure ajoutUsag_trigger() ; 

CREATE TRIGGER verifAjout_Date
BEFORE INSERT ON dateJ
FOR EACH ROW
    execute procedure ajoutDate_trigger() ; 

CREATE TRIGGER verifModif_Doc
AFTER UPDATE ON document
FOR EACH ROW
    execute procedure modifDoc_trigger() ; 

CREATE TRIGGER verifModif_Exemp
AFTER UPDATE ON exemplaire
FOR EACH ROW
    execute procedure modifExemp_trigger() ; 

CREATE TRIGGER verifAjout_Empr
BEFORE INSERT ON emprunt
FOR EACH ROW
    execute procedure ajoutEmpr_trigger() ; 

CREATE TRIGGER verifModif_Empr
BEFORE UPDATE ON emprunt
FOR EACH ROW
    execute procedure modifEmpr_trigger() ; 

CREATE TRIGGER verifModif_EmprAft
AFTER UPDATE ON emprunt
FOR EACH ROW
    execute procedure modifEmprAft_trigger() ; 


CREATE TRIGGER verifAjout_Res
BEFORE INSERT ON reservation
FOR EACH ROW
    execute procedure ajoutRes_trigger() ; 


CREATE TRIGGER verifModif_Date
AFTER UPDATE ON dateJ
FOR EACH ROW
    execute procedure modifDate_trigger() ; 




