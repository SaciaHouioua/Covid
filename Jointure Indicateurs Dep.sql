Use MachineLearning;


# jointure entre Indicateurs et departements

select *
From Indicateurs
INNER JOIN Departements ON Indicateurs.dep = Departements.dep;