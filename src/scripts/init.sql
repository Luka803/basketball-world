[
"CREATE DATABASE IF NOT EXISTS `basketball`;"
"USE `basketball`;"

"DROP TABLE IF EXISTS `role`;"
"DROP TABLE IF EXISTS `team`;"
"DROP TABLE IF EXISTS `player`;"
"DROP TABLE IF EXISTS `country`;"

"CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"

"insert  into `country`(`id`,`name`) values 
(1,'Germany'),
(2,'Serbia'),
(3,'France'),
(4,'Lithuania'),
(5,'USA');"

"CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `id_country` int(11) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_player_country_idx` (`id_country`),
  CONSTRAINT `fk_player_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"


"CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `achievements` varchar(2000) NOT NULL,
  `founded` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_country_idx` (`id_country`),
  CONSTRAINT `fk_team_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"

"CREATE TABLE `role` (
  `id_player` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `position` varchar(2) NOT NULL,
  PRIMARY KEY (`id_player`,`id_team`),
  KEY `fk_role_team_idx` (`id_team`),
  CONSTRAINT `fk_role_player` FOREIGN KEY (`id_player`) REFERENCES `player` (`id`),
  CONSTRAINT `fk_role_team` FOREIGN KEY (`id_team`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"

]


