/*
SQLyog Community v13.1.8 (64 bit)
MySQL - 10.4.22-MariaDB : Database - printdemo_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`printdemo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `printdemo_db`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `customers` */

insert  into `customers`(`id`,`firstName`,`middleName`,`lastName`) values 
(1,'John',NULL,'Doe'),
(2,'Andrea','Brillantes','Villanueva'),
(3,'Angelo',NULL,'Buenavida'),
(4,'Miley',NULL,'Cyrus'),
(5,'James','Beyond','Aplasca'),
(6,'Jenna',NULL,'Ortega');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `customerId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`price`,`customerId`) values 
(1,'Pineapple',50.5,2),
(2,'Apple',30.35,4),
(3,'Mango',36.55,3),
(4,'Pineapple',50.5,3),
(5,'Lemon',40,4),
(6,'Milk',70.25,6),
(7,'Dragon Fruit',100.5,1),
(8,'Peach',35.25,1),
(9,'Tuna',25.5,5),
(10,'Beans',50.5,5),
(11,'Egg',15,2),
(12,'Rice',120.25,4),
(13,'Sting',30,6),
(14,'Mountain Dew',35,3),
(15,'Bread',50,1),
(16,'Egg',15,6),
(17,'Tomato',25,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
