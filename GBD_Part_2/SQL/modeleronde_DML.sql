INSERT INTO `Modele_de ronde` (`idModele_de ronde`, `Nom`, `DateCreation`,`fk_identifiant_agent`) 
	VALUES (NULL, 
		'modele1', 
		'2019-10-03 16:00:00', 
		(select a.id from identifiant_agent a where 
			(select b.id from Agent b where b.Nom='terieur' and b.Prenom='alex') = a.fk_agent));


INSERT INTO `Modele_de ronde` (`idModele_de ronde`, `Nom`, `DateCreation`,`fk_identifiant_agent`) 
	VALUES (NULL, 
		'modele2', 
		'2019-10-02 16:00:00', 
		(select a.id from identifiant_agent a where 
			(select b.id from Agent b where b.Nom='terieur' and b.Prenom='alain') = a.fk_agent));


INSERT INTO `Modele_de ronde` (`idModele_de ronde`, `Nom`, `DateCreation`,`fk_identifiant_agent`) 
	VALUES (NULL, 
		'modele3', 
		'2019-10-06 16:00:00', 
		(select a.id from identifiant_agent a where 
			(select b.id from Agent b where b.Nom='terieur' and b.Prenom='alain') = a.fk_agent));

INSERT INTO `Modele_de ronde` (`idModele_de ronde`, `Nom`, `DateCreation`,`fk_identifiant_agent`) 
	VALUES (NULL, 
		'modele4', 
		'2019-10-01 16:00:00', 
		(select a.id from identifiant_agent a where 
			(select b.id from Agent b where b.Nom='tartofrigo' and b.Prenom='djemila') = a.fk_agent));

INSERT INTO `Modele_de ronde` (`idModele_de ronde`, `Nom`, `DateCreation`,`fk_identifiant_agent`) 
	VALUES (NULL, 
		'modele5', 
		'2019-01-03 16:00:00', 
		(select a.id from identifiant_agent a where 
			((select b.id from Agent b where b.Nom='zeblouze' and b.Prenom='agathe') = a.fk_agent)
			and
			(select p.idPoint_de_passage from Point_de_passage p where p.Nom='chef1') = a.fk_point_de_passage));


INSERT INTO `Modele_de ronde` (`idModele_de ronde`, `Nom`, `DateCreation`,`fk_identifiant_agent`) 
	VALUES (NULL, 
		'modele6', 
		'2019-01-03 16:00:00', 
		(select a.id from identifiant_agent a where 
			((select b.id from Agent b where b.Nom='zeblouze' and b.Prenom='agathe') = a.fk_agent)
			and
			(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent5') = a.fk_point_de_passage));
