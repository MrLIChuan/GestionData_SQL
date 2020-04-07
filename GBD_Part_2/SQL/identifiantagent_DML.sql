INSERT INTO `identifiant_agent` (`id`, `fk_agent`, `Grade`, `fk_point_de_passage`) 
	VALUES (NULL, (select a.id from Agent a where a.Nom='terieur' and a.Prenom='alex'), 
		'0', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent1'));

INSERT INTO `identifiant_agent` (`id`, `fk_agent`, `Grade`, `fk_point_de_passage`) 
	VALUES (NULL, (select a.id from Agent a where a.Nom='terieur' and a.Prenom='alain'), 
		'0',
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent2'));

INSERT INTO `identifiant_agent` (`id`, `fk_agent`, `Grade`, `fk_point_de_passage`) 
	VALUES (NULL, (select a.id from Agent a where a.Nom='tartofrigo' and a.Prenom='djemila'), 
		'0',
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent3'));

INSERT INTO `identifiant_agent` (`id`, `fk_agent`, `Grade`, `fk_point_de_passage`) 
	VALUES (NULL, (select a.id from Agent a where a.Nom='zeblouze' and a.Prenom='agathe'), 
		'1', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='chef1'));

INSERT INTO `identifiant_agent` (`id`, `fk_agent`, `Grade`, `fk_point_de_passage`) 
	VALUES (NULL, (select a.id from Agent a where a.Nom='zeblouze' and a.Prenom='agathe'), 
		'1', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent5'));
