/* AUTEUR Navarna */ 
\echo 'creation de ligne' 

\echo 'les bibliothèques' 

select ajouter_bu('pompidou','1 rue de l étoile' , 14) ;
select ajouter_bu ('le roi lion' , '84 avenue général de gaule' ,3) ;
select ajouter_bu ('lelivreux' , '12 rue blicottuer' , 6) ;
select ajouter_bu ('bibliodse' , '9 passage de l hiver' , 19) ;
select ajouter_bu ('coussin bleu' , '61 rue concubin' , 8) ;


\echo 'les documents'
 
select ajouter_document('français','loise','la face cachée','2001-12-13',true ,1,'pop');
select ajouter_document('français','Madame cuivin','comment faire un bon bouillon','2003-7-20',false ,0,'apprentissage');
select ajouter_document('français','Poteay','Nous nous sommes aimés','2010-1-3',true,2,'realiste');
select ajouter_document('anglais','Mac dubin','where did we lose Ms jane','2015-5-28',false,2,'science_fiction');
select ajouter_document('français','melissa Brunez','les aventures de lisa','2001-12-13',false,0,'fantastique' );
select ajouter_document('espagnol' ,'Liz clia','Rosa','2016-5-4',false , 0,'realiste');
select ajouter_document('français' , 'Pierre moulu','la vie en rose' ,'2016-4-4', false , 0,'romance');
select ajouter_document('anglais' , 'Jane Smith' , 'walk dead' ,'2016-5-1', true , 0 ,'fantastique');
select ajouter_document('français' , 'Lise Morita' , 'rigoler c est permis!','2016-5-4',false , 0 , 'comedie');
select ajouter_document('français','John duc','irresistible','2015-3-14',false ,1,'jazz');
select ajouter_document('anglais' , 'Poles jock','course poursuite','2004-10-21',false,2,'suspence');
select ajouter_document('Japonais' , 'Akata kiori','Sakura' ,'2001-6-24', false , 1 , 'electro');
select ajouter_document('coreen' , 'Lee moun gun' , 'Huyng dont leave me' ,'2016-4-28',false , 2 , 'romance');
select ajouter_document('anglais' , 'Elisabeth taylor' , 'Bullying is not good' ,'2014-8-10', false , 0 , 'comedie' ) ; 
select ajouter_document('français' ,'michael soulis', 'A la derive ', '2006-1-30',false , 0 , 'tragedie');
select ajouter_document('anglais' ,'Shanna', 'Loving all' ,'2013-2-1', false , 1 , 'r&b');
select ajouter_document('anglais','Danshe'  , 'make your soul ' , '2009-9-17',false , 1 , 'pop');
select ajouter_document('français' , 'eurovision' , 'Saut dans le vide' ,'2012-6-15', false , 1 , 'pop');
select ajouter_document('français' ,'Celia quara' , 'manger la vie' ,'2016-5-3', false , 0 , 'comedie');
select ajouter_document('français' , 'lolita' , 'dansons','2014-4-4',false , 1 , 'classique');
select ajouter_document('anglais' , 'john lolz' , 'the walz' ,'1998-4-7', false ,1 , 'classique');
select ajouter_document('français' , 'lilia' , 'nous marchons toujours seul' ,'2011-3-13', false , 0 ,'tragedie') ;
select ajouter_document('fançais' , 'sophia guerin' , 'La découverte' ,'2000-1-5', false , 0 , 'realiste' ) ;
select ajouter_document('anglais' , 'Hugh tueren','Losing everything' ,'1984-2-16', false , 0 , 'tragedie');
select ajouter_document('français' , 'Plaf' , 'fou rire' ,'2016-1-26', false , 1 , 'jazz');
select ajouter_document('français','loise','la face de la lune','2001-11-30',false ,1,'documentaire');
select ajouter_document('français','nathan','le volcan','2000-06-14',true ,0,'documentaire');
select ajouter_document('français','antoine','la france','20015-12-14',true ,2,'historique');
select ajouter_document('anglais','steeve','london','20012-12-12',false ,0,'fantastique');
select ajouter_document('anglais','david','the king','2003-03-31',true ,0,'historique');
select ajouter_document('anglais','bruce','ocean','2008-09-04',false ,2,'documentaire');
select ajouter_document('allemand','roger','ya','2007-04-19',false ,0,'policier');
select ajouter_document('italien','amanda','roma','20013-10-26',true ,2,'historique');
select ajouter_document('american','katie','little big horn','2006-09-01',true ,2,'historique');
select ajouter_document('japonais','zen-su','futzi','2016-02-15',false ,0,'science-fiction');


\echo 'les exemplaire' 

select ajouter_exemplaire (1,1,1) ; 
select ajouter_exemplaire (1,2,3) ; 
select ajouter_exemplaire (1,3,1) ; 
select ajouter_exemplaire (1,4,2) ;
select ajouter_exemplaire (1,6,2);
select ajouter_exemplaire (1,7,1) ;
select ajouter_exemplaire (1,8,2);
select ajouter_exemplaire (1,12,3);
select ajouter_exemplaire (1,14,2);
select ajouter_exemplaire (1,15,1);
select ajouter_exemplaire (1,17,2);
select ajouter_exemplaire (1,21,1);
select ajouter_exemplaire (1,22,2);
select ajouter_exemplaire (2,1,1) ; 
select ajouter_exemplaire (2,2,3) ; 
select ajouter_exemplaire (2,5,1) ; 
select ajouter_exemplaire (2,4,3) ;
select ajouter_exemplaire (2,3,2) ;
select ajouter_exemplaire (2,6,1);
select ajouter_exemplaire (2,7,1);
select ajouter_exemplaire (2,9,2);
select ajouter_exemplaire (2,11,3);
select ajouter_exemplaire (2,15,2);
select ajouter_exemplaire (2,16,1);
select ajouter_exemplaire (2,17,1);
select ajouter_exemplaire (2,19,1);
select ajouter_exemplaire (2,22,1);
select ajouter_exemplaire (2,25,1);
select ajouter_exemplaire (3,5,2) ; 
select ajouter_exemplaire (3,2,1) ;
select ajouter_exemplaire (3,3,1) ;	 
select ajouter_exemplaire (3,4,3) ;
select ajouter_exemplaire (3,10,1);
select ajouter_exemplaire (3,11,1);
select ajouter_exemplaire (3,14,1);
select ajouter_exemplaire (3,16,2);
select ajouter_exemplaire (3,17,1);
select ajouter_exemplaire (3,20,2);
select ajouter_exemplaire (3,21,1);
select ajouter_exemplaire (3,22,2);
select ajouter_exemplaire (3,23,2);
select ajouter_exemplaire (3,24,2);
select ajouter_exemplaire (3,25,3); 
select ajouter_exemplaire (5,5,1) ;
select ajouter_exemplaire (4,2,1) ; 
select ajouter_exemplaire (4,4,2) ; 
select ajouter_exemplaire (4,1,1) ;
select ajouter_exemplaire (4,10,2);
select ajouter_exemplaire (4,13,2);
select ajouter_exemplaire (4,14,1);
select ajouter_exemplaire (4,15,2);
select ajouter_exemplaire (4,16,2);
select ajouter_exemplaire (4,17,1);
select ajouter_exemplaire (4,19,2);
select ajouter_exemplaire (4,18,1);
select ajouter_exemplaire (4,21,1);
select ajouter_exemplaire (4,23,1); 
select ajouter_exemplaire (5,3,2) ;
select ajouter_exemplaire (5,6,1);
select ajouter_exemplaire (5,7,1);
select ajouter_exemplaire (5,8,1);
select ajouter_exemplaire (5,9,1);
select ajouter_exemplaire (5,10,2);
select ajouter_exemplaire (5,11,3);
select ajouter_exemplaire (5,12,1);
select ajouter_exemplaire (5,13,1);
select ajouter_exemplaire (5,14,1);
select ajouter_exemplaire (5,15,1);
select ajouter_exemplaire (5,16,2);
select ajouter_exemplaire (5,17,1);
select ajouter_exemplaire (5,18,3);
select ajouter_exemplaire (5,19,2);
select ajouter_exemplaire (5,20,3);
select ajouter_exemplaire (5,21,1);
select ajouter_exemplaire (5,22,1);
select ajouter_exemplaire (5,23,1);
select ajouter_exemplaire (5,24,1);
select ajouter_exemplaire (5,25,1);
select ajouter_exemplaire (1,27,1);
select ajouter_exemplaire (1,29,1);
select ajouter_exemplaire (1,30,1);
select ajouter_exemplaire (1,32,1);
select ajouter_exemplaire (1,34,1) ; 
select ajouter_exemplaire (1,35,1) ;  

\echo 'la date'

insert into dateJ (dateJour) values('2016-05-02');

\echo 'les usagers' 

select ajouter_usager('cylly','valloris','test@gmail.com','0212365478',19 , 1);
select ajouter_usager('Mischael','dori','lisaq@yahou.com','+3345789125',10 , 0);
select ajouter_usager('Solaq','jean','jokz@hotmail.com','0741548962',40 , 2);
select ajouter_usager('viche','Antoinette','viche@hotmail.fr','+3471548269',85 , 1);
select ajouter_usager('ciossa','Plase','itali652@gmail.com','0641714558',13 , 0);
select ajouter_usager('Smith','Michael','miks@gmail.com','0154112874',24 , 2);
select ajouter_usager('Plasx','mohamed','dores@hotmail.com','0415789632',8 , 1);
select ajouter_usager('Molir','Michin','lipilutis@hotmail.com','0475120365',60 , 1);

\echo 'les pret'




insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'la face cachée' ,1,0,'2016-02-25','2016-04-08',1,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(2,'where did we lose Ms jane' ,1,0,'2016-03-01','2016-03-22',6,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'Sakura' ,0,0,'2016-03-10','2016-03-31',13,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'rigoler c est permis ' ,2,1,'2016-03-15','2016-05-17',98,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'nous marchons toujours seul' ,0,0,'2016-03-16','2016-04-7',22,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'Rosa' ,1,0,'2016-03-18','2016-04-9',8,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'loving all' ,0,0,'2016-03-21','2016-04-12',108,7 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'make your soul' ,0,0,'2016-03-28','2016-04-19',110,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'Rosa' ,0,0,'2016-04-02','2016-04-23',9,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'la vie en rose ' ,0,1,'2016-04-05','2016-04-26',1,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(2,'course poursuite' ,1,1,'2016-04-07','2016-05-04',38,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'walk dead' ,1,1,'2016-04-13','2016-05-26',11,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'rigoler c est permis!' ,0,1,'2016-04-15','2016-05-11',36,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'A la derive' ,0,1,'2016-04-20','2016-05-16',41,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'A la derive' ,0,1,'2016-04-22','2016-05-14',42,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'rigoler c est permis ' ,0,1,'2016-04-25','2016-05-15',37,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'manger la vie' ,0,1,'2016-04-26','2016-05-18',45,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'the walz' ,0,1,'2016-04-27','2016-05-19',21,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'les adventures de lisa' ,0,1,'2016-04-27','2016-05-19',28,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'le volcan' ,0,1,'2016-04-27','2016-05-19',124,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'london' ,0,1,'2016-04-27','2016-05-19',125,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'the king' ,0,1,'2016-04-27','2016-05-19',126,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'ya' ,0,1,'2016-04-27','2016-05-19',127,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'little big horn' ,0,1,'2016-04-27','2016-05-19',128,3 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(0,'futzi' ,0,1,'2016-04-27','2016-05-19',129,2 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'fou rire' ,0,1,'2016-04-30','2016-05-21',70,1 ) ;
insert into emprunt (format, titre , renouveler , etat , date_deb , date_fin , id_exemplaire , id_usager )
values(1,'irresistible' ,0,1,'2016-05-01','2016-05-22',78,3 ) ;


\echo 'certain changement pour les test' 

update usager set retard = 15.05 where id_usager = 5 ;  
update usager set retard = 2.0 where id_usager = 7 ; 
update usager set date_fin = '2016-03-02' where id_usager = 8 ; 
