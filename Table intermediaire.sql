##### Creation des tables intermédiaires

###pour tester une manip , proceder de la sorte
select replace('le été','é','e');

select replace('(exprimés en tant que Cu)','exprimés en tant que','');

#### changement de dep 01 à 1 : faire cette manipulation juste aprs le remplissage des table

SET SQL_SAFE_UPDATES=0;
UPDATE ML.Indicateurs SET dep=right(dep,1) where left(dep,1) = 0;

UPDATE ML.Pollution
SET polluant = REPLACE(polluant, 'exprimés en tant que', '');

UPDATE ML.Pollution
SET polluant = REPLACE(polluant, 'exprimés en', '');

UPDATE ML.Pollution
SET polluant = REPLACE(polluant, 'en tant que', '');



################ groupe by dep , sum_quantite, nbr de polluants
select dep, sum(quantite), count(polluant_id)
from Pollution
group by dep;

############################ Greation de la table  Dep_pollSQL ######################
CREATE TABLE Dep_pollSQL AS select dep, sum(quantite), count(polluant_id)
from Pollution
group by dep;

select * from Dep_pollSQL;

###########
#récupérer la liste columns names

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'Dep_pollSQL';

# changer le nom de sum(quantite) en quantite
ALTER TABLE Dep_pollSQL
CHANGE `sum(quantite)` quantite float;

# renommer  la colonne de 'count(polluant)' en nbr-polluant
ALTER TABLE Dep_pollSQL
CHANGE `count(polluant_id)` nbr_polluant int;

####################### Jointure entre la table departement et les donnée de la pollution
select *
from Departements D
inner join Dep_pollSQL DSL On D.dep = DSL.dep;
#################################" LA meme requete précedente en spécifiant les champs

select D.lib_dep, D.dep, D.reg, SUPERFICIE, POPULATION, DENSITE, quantite, nbr_polluant
from Departements D 
inner join Dep_pollSQL DSL On D.dep = DSL.dep;

######################### Creation de la table  Departements_Pollution à partir de la requete precedence
##########on n' pas besoin de la créer la table, je récupère juste la requete et je l'appelle ds le notebook
CREATE TABLE Departements_Pollution as select D.lib_dep, D.dep, D.reg, SUPERFICIE, POPULATION, DENSITE, quantite, nbr_polluant
from Departements D
inner join Dep_pollSQL DSL On D.dep = DSL.dep;
########################""
select * from 
Departements_Pollution;
#########################"
select * 
from Indicateurs I
left join Departements_Pollution DP On I.dep = DP.dep;

#######################requete ds_covid
select I.date,I.dep,I.TO,I.hosp,I.rea,I.incid_hosp,
I.incid_rea,DP.lib_dep,DP.reg,DP.SUPERFICIE,DP.SUPERFICIE,DP.POPULATION,DP.DENSITE,DP.quantite,DP.nbr_polluant
from Indicateurs I 
left join Departements_Pollution DP On I.dep = DP.dep;
