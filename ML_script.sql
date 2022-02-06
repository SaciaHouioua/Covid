Create database MachineLearning;
# Créer la base de donnée 


# Afficher toutes les bases de données existantes
show databases;

# Utiliser cette base de données
use MachineLearning;

# Afficher les tables si elles existent
show tables;

# Créer un nouvel utilisateur
create user 'ML_user'@'localhost' identified by 'ML_password1';
grant all privileges on MachineLearning.* to 'ML_user'@'localhost';
flush privileges;

# Afficher les users
select User, Host from mysql.user;
# Supprimer table 
drop table Departements;

CREATE TABLE `Departements` (
  `lib_dep` varchar(30) DEFAULT NULL,
  `dep` varchar(5) NOT NULL,
  `reg` varchar(30) DEFAULT NULL,
  `SUPERFICIE` double DEFAULT NULL,
  `POPULATION` double DEFAULT NULL,
  `DENSITE` double DEFAULT NULL,
  PRIMARY KEY (`dep`)
  );


# Supprimer table 
drop table Indicateurs;

#creation de la table Indicateurs
CREATE TABLE `Indicateurs` (
  `dep` varchar(5) NOT NULL,
  `date` date,
  `TO` double,
  `hosp` int,
  `rea` int ,
  `incid_hosp` double,
  `incid_rea` double,
  PRIMARY KEY (`dep`, `date`)
	);
    
#drop table Pollution ;

CREATE TABLE `Pollution` (
  `dep` varchar(5),
  `identifiant` varchar(12),
  `annee_emission` varchar(4),
  `milieu` varchar(30),
  `polluant` varchar(200),
  `quantite` double,
  `polluant_id` int8
  #PRIMARY KEY (`identifiant`, `dep`,`polluant_id`)
	);
    
#supprimer Etablissements si elle existe
drop table Etablissements ;
    
CREATE TABLE `Etablissements` (
  `dep` varchar(5),
  `identifiant` varchar(12),
  `nom_etablissement` varchar(150),
  `numero_siret` varchar(16),
  `coordonnees_x` double,
  `coordonnees_Y` double
  #PRIMARY KEY (`identifiant`)
	);
    
CREATE TABLE `Polluer_dep_etab` (
 `dep` varchar(5),
 `identifiant` varchar(12)
);

CREATE TABLe `Rejeter_poll_etab`(
`dep` varchar(5),
`identifiant` varchar(12),
 `annee_emission` varchar(4),
 `polluant_id` int8 
);

