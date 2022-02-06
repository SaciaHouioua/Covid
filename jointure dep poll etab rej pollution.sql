
# jointure entre Departements, Polluer_dep_etab, Etablissement, Rejeter_poll et pollution
SELECT * 
From Departements
INNER JOIN Polluer_dep_etab ON Departements.dep = Polluer_dep_etab.dep
INNER JOIN Etablissements ON Polluer_dep_etab.dep = Etablissements.dep 
and Polluer_dep_etab.identifiant = Etablissements.identifiant
INNER JOIN Rejeter_poll_etab ON  Etablissements.identifiant = Rejeter_poll_etab.identifiant
and Etablissements.dep = Rejeter_poll_etab.dep
INNER JOIN Pollution ON Rejeter_poll_etab.dep = Pollution.dep and Rejeter_poll_etab.identifiant = Pollution.identifiant
and Rejeter_poll_etab.annee_emission = Pollution.annee_emission and Rejeter_poll_etab.polluant_id = Pollution.polluant_id