/* AUTEUR Navarna */ 
\echo "creationTable" 


CREATE TABLE IF NOT EXISTS bu (
       id_bu SERIAL PRIMARY KEY ,
       nom VARCHAR(50) NOT NULL,
       adresse VARCHAR(100) NOT NULL, 
       arrondissement INT NOT NULL CHECK (arrondissement BETWEEN 1 AND 20) 
      );

CREATE TABLE IF NOT EXISTS document (
       id_doc SERIAL PRIMARY KEY,
       langue VARCHAR(25) NOT NULL,
       auteur VARCHAR (50) NOT NULL,
       titre VARCHAR (50) NOT NULL,
       date_parution DATE NOT NULL,
       mature BOOLEAN NOT NULL,
       format int NOT NULL ,
       theme VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS  exemplaire (
       id_exemplaire SERIAL PRIMARY KEY , 
       titre VARCHAR (50) NOT NULL,
       etat INT  NOT NULL,
       id_bu INT NOT NULL REFERENCES Bu(id_bu) ON DELETE CASCADE,
       id_doc INT NOT NULL REFERENCES document(id_doc) ON DELETE CASCADE ,
       format int not NULL 	      

);


CREATE TABLE IF NOT EXISTS usager (
       id_usager SERIAL PRIMARY KEY ,
       nom VARCHAR(25) NOT NULL,
       prenom VARCHAR(25) NOT NULL,
       mail VARCHAR(50) NOT NULL,
       telephone VARCHAR(12) NOT NULL,
       age INT NOT NULL ,
       inscription INT NOT NULL,
       date_fin DATE NOT NULL,
       retard DECIMAL NOT NULL 
);

CREATE TABLE IF NOT EXISTS reservation(
       id_usager INT REFERENCES usager(id_usager) ON DELETE CASCADE,
       id_doc INT REFERENCES document(id_doc) ON DELETE CASCADE,
       date_reservation DATE NOT NULL,
       reserve INT NOT NULL,
       PRIMARY KEY(id_usager,id_doc,date_reservation) 
       );

CREATE TABLE IF NOT EXISTS emprunt (
       id_emprunt SERIAL PRIMARY KEY,
       format int NOT NULL,
       titre VARCHAR(50) NOT NULL,
       renouveler INT NOT NULL,
       etat INT NOT NULL,
       date_deb DATE NOT NULL,
       date_fin DATE NOT NULL,
       id_exemplaire INT NOT NULL REFERENCES exemplaire(id_exemplaire),
       id_usager INT NOT NULL REFERENCES usager(id_usager)
);

CREATE TABLE IF NOT EXISTS dateJ (
       dateJour DATE NOT NULL
);


       
