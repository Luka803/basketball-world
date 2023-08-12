/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.28-MariaDB : Database - basketball
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`basketball` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `basketball`;

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `country` */

insert  into `country`(`id`,`name`) values 
(1,'Serbia'),
(2,'USA'),
(3,'France'),
(4,'Australia'),
(5,'Lithuania');

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `id_country` int(11) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_player_country_idx` (`id_country`),
  CONSTRAINT `fk_player_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `player` */

insert  into `player`(`id`,`name`,`id_country`,`birthday`) values 
(1,'Bogdan Bogdanovic',1,'2010-06-10'),
(2,'Dirk Nowitzki',1,'2010-06-10'),
(3,'Dante Exum',2,'2010-06-10'),
(4,'Kevin Punter',4,'2010-06-10'),
(5,'Jonas Valančiūnas',2,'2010-06-10');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `achievements` varchar(2000) NOT NULL,
  `founded` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_country_idx` (`id_country`),
  CONSTRAINT `fk_team_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `team` */

insert  into `team`(`id`,`name`,`achievements`,`founded`,`id_country`) values 
(1,'KK Partizan Mozzart-bet','Some Achievements',1945,1),
(2,'Bayern Munich','Some Achievements',1957,2),
(3,'Zalgiris Kaunas','Four high-school teachers consume alcohol on a daily basis to see how it affects their social and professional lives.',2020,5),
(4,'Barcelona','Some Achievements',2021,4),
(5,'Maccabi Tel Aviv','Some Achievements',2009,2);

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id_player` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `position` varchar(1) NOT NULL,
  PRIMARY KEY (`id_player`),
  KEY `fk_role_team_idx` (`id_team`),
  CONSTRAINT `fk_role_player` FOREIGN KEY (`id_player`) REFERENCES `player` (`id`),
  CONSTRAINT `fk_role_team` FOREIGN KEY (`id_team`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `role` */

/*Table structure for table `team` */



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
