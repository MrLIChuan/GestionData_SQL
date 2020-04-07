INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:00:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent1'));

INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:10:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='Joconde'));

INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:15:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='Venus de Milo'));

INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:19:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='Victoire de Samothrace'));

INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:28:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='Hippopotame bleu'));

INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:32:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='Radeau de la méduse'));

INSERT INTO `baton_rondier_has_Point_de_passage` 
(`id`, `baton_rondier_idbaton_rondier`, `DateEvent`, `Point_de_passage_idPoint_de_passage`) 
	VALUES (NULL, 1, 
		'2019-10-03 16:42:00', 
		(select p.idPoint_de_passage from Point_de_passage p where p.Nom='agent1'));