/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.31 : Database - blog_flask
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog_flask` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `blog_flask`;

/*Table structure for table `alembic_version` */

DROP TABLE IF EXISTS `alembic_version`;

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `alembic_version` */

insert  into `alembic_version`(`version_num`) values 
('bd8e338097e5');

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `answer` */

insert  into `answer`(`id`,`content`,`create_time`,`question_id`,`author_id`) values 
(1,'这是评论内容','2023-05-21 14:30:57',1,1),
(2,'评论内容','2023-05-21 14:31:09',1,1),
(3,'这是评论内容','2023-05-21 15:02:13',7,1),
(4,'这是评论内容','2023-05-21 15:43:18',7,1);

/*Table structure for table `email_captcha` */

DROP TABLE IF EXISTS `email_captcha`;

CREATE TABLE `email_captcha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `captcha` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `email_captcha` */

insert  into `email_captcha`(`id`,`email`,`captcha`) values 
(1,'2546582616@qq.com','2036');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

/*Data for the table `question` */

insert  into `question`(`id`,`title`,`content`,`create_time`,`author_id`) values 
(1,'标题1','内容1\r\n','2023-05-21 14:23:07',1),
(3,'这是标题','这是内容\r\n','2023-05-21 14:24:36',1),
(4,'这是标题','这是内容\r\n','2023-05-21 14:25:06',1),
(6,'这是标题','这是内容\r\n','2023-05-21 14:25:15',1),
(7,'这是标题','这是内容\r\n','2023-05-21 14:25:46',1),
(8,'修改后的标题','修改后的标题','2023-05-21 15:55:11',1),
(9,'修改标题','修改内容','2023-05-21 15:55:27',1),
(10,'测试标题','测试修改内容','2023-05-21 15:58:25',1),
(11,'测试修改标题','测试修改内容','2023-05-21 15:58:58',1),
(12,'测试修改标题','测试修改内容','2023-05-21 16:05:26',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `join_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`join_time`) values 
(1,'xutiande ','pbkdf2:sha256:260000$wUTST4NQ2h2paFt5$e7b0dbc9155dfa3fa9a0c30cffecba204f04387a54556a757d2fec79ddfb7a01','2546582616@qq.com','2023-05-21 14:19:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
