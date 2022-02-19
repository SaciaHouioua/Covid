##### Creation des tables intermédiaires

################ groupe by dep , sum_quantite, nbr de polluants
select dep, sum(quantite), count(polluant_id)
from Pollution
group by dep;

############################ Greation de la table ######################
CREATE TABLE Dep_pollSQL AS select dep, sum(quantite), count(polluant_id)
from Pollution
group by dep;

select * from Dep_pollSQL;
####################### Jointure entre la table departement et les donnée de la pollution
select *
from Departements D
inner join Dep_pollSQL DSL On D.dep = DSL.dep;
#################################" LA meme requete précedente en spécifiant les champs
select D.lib_dep, D.dep, D.reg, SUPERFICIE, POPULATION, DENSITE, quantite, polluant_nbr
from Departements D 
inner join Dep_pollSQL DSL On D.dep = DSL.dep;
######################### Creation de la table  Departements_Pollution à partir de la requete precedence
CREATE TABLE Departements_Pollution as select D.lib_dep, D.dep, D.reg, SUPERFICIE, POPULATION, DENSITE, quantite, polluant_nbr
from Departements D
inner join Dep_pollSQL DSL On D.dep = DSL.dep;
########################""
select * from 
Departements_Pollution;
#########################"
select * 
from Indicateurs I
left join Departements_Pollution DP On I.dep = DP.dep;


