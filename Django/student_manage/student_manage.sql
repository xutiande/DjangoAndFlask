/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.31 : Database - student_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`student_manage` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `student_manage`;

/*Table structure for table `app01_login` */

DROP TABLE IF EXISTS `app01_login`;

CREATE TABLE `app01_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `app01_login` */

/*Table structure for table `app01_registered` */

DROP TABLE IF EXISTS `app01_registered`;

CREATE TABLE `app01_registered` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `app01_registered` */

insert  into `app01_registered`(`id`,`username`,`password`) values 
(1,'xutiande','73e5e52d64db3937a406d950eb78a2d3');

/*Table structure for table `app01_studentdata` */

DROP TABLE IF EXISTS `app01_studentdata`;

CREATE TABLE `app01_studentdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(32) NOT NULL,
  `student_class` varchar(8) NOT NULL,
  `name` varchar(8) NOT NULL,
  `age` int NOT NULL,
  `gender` smallint NOT NULL,
  `score` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_studentdata_teacher_id_d32eec24_fk_app01_teacherdata_id` (`teacher_id`),
  CONSTRAINT `app01_studentdata_teacher_id_d32eec24_fk_app01_teacherdata_id` FOREIGN KEY (`teacher_id`) REFERENCES `app01_teacherdata` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1405 DEFAULT CHARSET=utf8mb3;

/*Data for the table `app01_studentdata` */

insert  into `app01_studentdata`(`id`,`student_id`,`student_class`,`name`,`age`,`gender`,`score`,`teacher_id`) values 
(1,'202151020900010','智能2101班','徐天德',20,1,99,1),
(2,'20215102090020','智能2101','徐天德1',18,1,75,1),
(102,'20215102090010','1','我的博客',60,1,77,1),
(111,'2021510209006','智能2101','徐天德6',18,1,6,1),
(112,'2021510209007','智能2101','徐天德7',18,1,7,1),
(113,'2021510209008','智能2101','徐天德8',18,1,8,1),
(114,'2021510209009','智能2101','徐天德9',18,1,9,1),
(115,'20215102090010','智能2101','徐天德10',18,1,10,1),
(120,'20215102090015','智能2101','徐天德15',18,1,15,1),
(124,'20215102090019','智能2101','徐天德19',18,1,19,1),
(125,'20215102090020','智能2101','徐天德20',18,1,20,1),
(127,'20215102090022','智能2101','徐天德22',18,1,22,1),
(128,'20215102090023','智能2101','徐天德23',18,1,23,1),
(129,'20215102090024','智能2101','徐天德24',18,1,24,1),
(130,'20215102090025','智能2101','徐天德25',18,1,25,1),
(131,'20215102090026','智能2101','徐天德26',18,1,26,1),
(132,'20215102090027','智能2101','徐天德27',18,1,27,1),
(134,'20215102090029','智能2101','徐天德29',18,1,29,1),
(135,'20215102090030','智能2101','徐天德30',18,1,30,1),
(136,'20215102090031','智能2101','徐天德31',18,1,31,1),
(140,'20215102090035','智能2101','徐天德35',18,1,35,1),
(141,'20215102090036','智能2101','徐天德36',18,1,36,1),
(142,'20215102090037','智能2101','徐天德37',18,1,37,1),
(144,'20215102090039','智能2101','徐天德39',18,1,39,1),
(145,'20215102090040','智能2101','徐天德40',18,1,40,1),
(146,'20215102090041','智能2101','徐天德41',18,1,41,1),
(152,'20215102090047','智能2101','徐天德47',18,1,47,1),
(154,'20215102090049','智能2101','徐天德49',18,1,49,1),
(160,'20215102090055','智能2101','徐天德55',18,1,55,1),
(161,'20215102090056','智能2101','徐天德56',18,1,56,1),
(163,'20215102090058','智能2101','徐天德58',18,1,58,1),
(164,'20215102090059','智能2101','徐天德59',18,1,59,1),
(166,'20215102090061','智能2101','徐天德61',18,1,61,1),
(167,'20215102090062','智能2101','徐天德62',18,1,62,1),
(171,'20215102090066','智能2101','徐天德66',18,1,66,1),
(172,'20215102090067','智能2101','徐天德67',18,1,67,1),
(177,'20215102090072','智能2101','徐天德72',18,1,72,1),
(182,'20215102090077','智能2101','徐天德77',18,1,77,1),
(184,'20215102090079','智能2101','徐天德79',18,1,79,1),
(186,'20215102090081','智能2101','徐天德81',18,1,81,1),
(188,'20215102090083','智能2101','徐天德83',18,1,83,1),
(190,'20215102090085','智能2101','徐天德85',18,1,85,1),
(197,'20215102090092','智能2101','徐天德92',18,1,92,1),
(198,'20215102090093','智能2101','徐天德93',18,1,93,1),
(201,'20215102090096','智能2101','徐天德96',18,1,96,1),
(202,'20215102090097','智能2101','徐天德97',18,1,97,1),
(208,'2021510209003','智能2101','徐天德3',18,1,3,1),
(209,'2021510209004','智能2101','徐天德4',18,1,4,1),
(210,'2021510209005','智能2101','徐天德5',18,1,5,1),
(213,'2021510209008','智能2101','徐天德8',18,1,8,1),
(221,'20215102090016','智能2101','徐天德16',18,1,16,1),
(222,'20215102090017','智能2101','徐天德17',18,1,17,1),
(223,'20215102090018','智能2101','徐天德18',18,1,18,1),
(225,'20215102090020','智能2101','徐天德20',18,1,20,1),
(232,'20215102090027','智能2101','徐天德27',18,1,27,1),
(234,'20215102090029','智能2101','徐天德29',18,1,29,1),
(235,'20215102090030','智能2101','徐天德30',18,1,30,1),
(236,'20215102090031','智能2101','徐天德31',18,1,31,1),
(237,'20215102090032','智能2101','徐天德32',18,1,32,1),
(239,'20215102090034','智能2101','徐天德34',18,1,34,1),
(241,'20215102090036','智能2101','徐天德36',18,1,36,1),
(1097,'20215102090092','智能2101','徐天德92',18,1,92,1),
(1098,'20215102090093','智能2101','徐天德93',18,1,93,1),
(1099,'20215102090094','智能2101','徐天德94',18,1,94,1),
(1100,'20215102090095','智能2101','徐天德95',18,1,95,1),
(1101,'20215102090096','智能2101','徐天德96',18,1,96,1),
(1102,'20215102090097','智能2101','徐天德97',18,1,97,1),
(1103,'20215102090098','智能2101','徐天德98',18,1,98,1),
(1104,'20215102090099','智能2101','徐天德99',18,1,99,1),
(1105,'2021510209000','智能2101','徐天德0',18,1,0,1),
(1106,'2021510209001','智能2101','徐天德1',18,1,1,1),
(1107,'2021510209002','智能2101','徐天德2',18,1,2,1),
(1108,'2021510209003','智能2101','徐天德3',18,1,3,1),
(1109,'2021510209004','智能2101','徐天德4',18,1,4,1),
(1110,'2021510209005','智能2101','徐天德5',18,1,5,1),
(1111,'2021510209006','智能2101','徐天德6',18,1,6,1),
(1112,'2021510209007','智能2101','徐天德7',18,1,7,1),
(1113,'2021510209008','智能2101','徐天德8',18,1,8,1),
(1114,'2021510209009','智能2101','徐天德9',18,1,9,1),
(1115,'20215102090010','智能2101','徐天德10',18,1,10,1),
(1116,'20215102090011','智能2101','徐天德11',18,1,11,1),
(1117,'20215102090012','智能2101','徐天德12',18,1,12,1),
(1118,'20215102090013','智能2101','徐天德13',18,1,13,1),
(1119,'20215102090014','智能2101','徐天德14',18,1,14,1),
(1120,'20215102090015','智能2101','徐天德15',18,1,15,1),
(1121,'20215102090016','智能2101','徐天德16',18,1,16,1),
(1122,'20215102090017','智能2101','徐天德17',18,1,17,1),
(1123,'20215102090018','智能2101','徐天德18',18,1,18,1),
(1124,'20215102090019','智能2101','徐天德19',18,1,19,1),
(1125,'20215102090020','智能2101','徐天德20',18,1,20,1),
(1126,'20215102090021','智能2101','徐天德21',18,1,21,1),
(1127,'20215102090022','智能2101','徐天德22',18,1,22,1),
(1128,'20215102090023','智能2101','徐天德23',18,1,23,1),
(1129,'20215102090024','智能2101','徐天德24',18,1,24,1),
(1130,'20215102090025','智能2101','徐天德25',18,1,25,1),
(1131,'20215102090026','智能2101','徐天德26',18,1,26,1),
(1132,'20215102090027','智能2101','徐天德27',18,1,27,1),
(1133,'20215102090028','智能2101','徐天德28',18,1,28,1),
(1134,'20215102090029','智能2101','徐天德29',18,1,29,1),
(1135,'20215102090030','智能2101','徐天德30',18,1,30,1),
(1136,'20215102090031','智能2101','徐天德31',18,1,31,1),
(1137,'20215102090032','智能2101','徐天德32',18,1,32,1),
(1138,'20215102090033','智能2101','徐天德33',18,1,33,1),
(1139,'20215102090034','智能2101','徐天德34',18,1,34,1),
(1140,'20215102090035','智能2101','徐天德35',18,1,35,1),
(1141,'20215102090036','智能2101','徐天德36',18,1,36,1),
(1142,'20215102090037','智能2101','徐天德37',18,1,37,1),
(1143,'20215102090038','智能2101','徐天德38',18,1,38,1),
(1144,'20215102090039','智能2101','徐天德39',18,1,39,1),
(1145,'20215102090040','智能2101','徐天德40',18,1,40,1),
(1146,'20215102090041','智能2101','徐天德41',18,1,41,1),
(1147,'20215102090042','智能2101','徐天德42',18,1,42,1),
(1148,'20215102090043','智能2101','徐天德43',18,1,43,1),
(1149,'20215102090044','智能2101','徐天德44',18,1,44,1),
(1150,'20215102090045','智能2101','徐天德45',18,1,45,1),
(1151,'20215102090046','智能2101','徐天德46',18,1,46,1),
(1152,'20215102090047','智能2101','徐天德47',18,1,47,1),
(1153,'20215102090048','智能2101','徐天德48',18,1,48,1),
(1154,'20215102090049','智能2101','徐天德49',18,1,49,1),
(1155,'20215102090050','智能2101','徐天德50',18,1,50,1),
(1156,'20215102090051','智能2101','徐天德51',18,1,51,1),
(1157,'20215102090052','智能2101','徐天德52',18,1,52,1),
(1158,'20215102090053','智能2101','徐天德53',18,1,53,1),
(1159,'20215102090054','智能2101','徐天德54',18,1,54,1),
(1160,'20215102090055','智能2101','徐天德55',18,1,55,1),
(1161,'20215102090056','智能2101','徐天德56',18,1,56,1),
(1162,'20215102090057','智能2101','徐天德57',18,1,57,1),
(1163,'20215102090058','智能2101','徐天德58',18,1,58,1),
(1164,'20215102090059','智能2101','徐天德59',18,1,59,1),
(1165,'20215102090060','智能2101','徐天德60',18,1,60,1),
(1166,'20215102090061','智能2101','徐天德61',18,1,61,1),
(1167,'20215102090062','智能2101','徐天德62',18,1,62,1),
(1168,'20215102090063','智能2101','徐天德63',18,1,63,1),
(1169,'20215102090064','智能2101','徐天德64',18,1,64,1),
(1170,'20215102090065','智能2101','徐天德65',18,1,65,1),
(1171,'20215102090066','智能2101','徐天德66',18,1,66,1),
(1172,'20215102090067','智能2101','徐天德67',18,1,67,1),
(1173,'20215102090068','智能2101','徐天德68',18,1,68,1),
(1174,'20215102090069','智能2101','徐天德69',18,1,69,1),
(1175,'20215102090070','智能2101','徐天德70',18,1,70,1),
(1176,'20215102090071','智能2101','徐天德71',18,1,71,1),
(1177,'20215102090072','智能2101','徐天德72',18,1,72,1),
(1178,'20215102090073','智能2101','徐天德73',18,1,73,1),
(1179,'20215102090074','智能2101','徐天德74',18,1,74,1),
(1180,'20215102090075','智能2101','徐天德75',18,1,75,1),
(1181,'20215102090076','智能2101','徐天德76',18,1,76,1),
(1182,'20215102090077','智能2101','徐天德77',18,1,77,1),
(1183,'20215102090078','智能2101','徐天德78',18,1,78,1),
(1184,'20215102090079','智能2101','徐天德79',18,1,79,1),
(1185,'20215102090080','智能2101','徐天德80',18,1,80,1),
(1186,'20215102090081','智能2101','徐天德81',18,1,81,1),
(1187,'20215102090082','智能2101','徐天德82',18,1,82,1),
(1188,'20215102090083','智能2101','徐天德83',18,1,83,1),
(1189,'20215102090084','智能2101','徐天德84',18,1,84,1),
(1190,'20215102090085','智能2101','徐天德85',18,1,85,1),
(1191,'20215102090086','智能2101','徐天德86',18,1,86,1),
(1192,'20215102090087','智能2101','徐天德87',18,1,87,1),
(1193,'20215102090088','智能2101','徐天德88',18,1,88,1),
(1194,'20215102090089','智能2101','徐天德89',18,1,89,1),
(1195,'20215102090090','智能2101','徐天德90',18,1,90,1),
(1196,'20215102090091','智能2101','徐天德91',18,1,91,1),
(1197,'20215102090092','智能2101','徐天德92',18,1,92,1),
(1198,'20215102090093','智能2101','徐天德93',18,1,93,1),
(1199,'20215102090094','智能2101','徐天德94',18,1,94,1),
(1200,'20215102090095','智能2101','徐天德95',18,1,95,1),
(1201,'20215102090096','智能2101','徐天德96',18,1,96,1),
(1202,'20215102090097','智能2101','徐天德97',18,1,97,1),
(1203,'20215102090098','智能2101','徐天德98',18,1,98,1),
(1204,'20215102090099','智能2101','徐天德99',18,1,99,1),
(1205,'2021510209000','智能2101','徐天德0',18,1,0,1),
(1206,'2021510209001','智能2101','徐天德1',18,1,1,1),
(1207,'2021510209002','智能2101','徐天德2',18,1,2,1),
(1208,'2021510209003','智能2101','徐天德3',18,1,3,1),
(1209,'2021510209004','智能2101','徐天德4',18,1,4,1),
(1210,'2021510209005','智能2101','徐天德5',18,1,5,1),
(1211,'2021510209006','智能2101','徐天德6',18,1,6,1),
(1212,'2021510209007','智能2101','徐天德7',18,1,7,1),
(1213,'2021510209008','智能2101','徐天德8',18,1,8,1),
(1214,'2021510209009','智能2101','徐天德9',18,1,9,1),
(1215,'20215102090010','智能2101','徐天德10',18,1,10,1),
(1216,'20215102090011','智能2101','徐天德11',18,1,11,1),
(1217,'20215102090012','智能2101','徐天德12',18,1,12,1),
(1218,'20215102090013','智能2101','徐天德13',18,1,13,1),
(1219,'20215102090014','智能2101','徐天德14',18,1,14,1),
(1220,'20215102090015','智能2101','徐天德15',18,1,15,1),
(1221,'20215102090016','智能2101','徐天德16',18,1,16,1),
(1222,'20215102090017','智能2101','徐天德17',18,1,17,1),
(1223,'20215102090018','智能2101','徐天德18',18,1,18,1),
(1224,'20215102090019','智能2101','徐天德19',18,1,19,1),
(1225,'20215102090020','智能2101','徐天德20',18,1,20,1),
(1226,'20215102090021','智能2101','徐天德21',18,1,21,1),
(1227,'20215102090022','智能2101','徐天德22',18,1,22,1),
(1228,'20215102090023','智能2101','徐天德23',18,1,23,1),
(1229,'20215102090024','智能2101','徐天德24',18,1,24,1),
(1230,'20215102090025','智能2101','徐天德25',18,1,25,1),
(1231,'20215102090026','智能2101','徐天德26',18,1,26,1),
(1232,'20215102090027','智能2101','徐天德27',18,1,27,1),
(1233,'20215102090028','智能2101','徐天德28',18,1,28,1),
(1234,'20215102090029','智能2101','徐天德29',18,1,29,1),
(1235,'20215102090030','智能2101','徐天德30',18,1,30,1),
(1236,'20215102090031','智能2101','徐天德31',18,1,31,1),
(1237,'20215102090032','智能2101','徐天德32',18,1,32,1),
(1238,'20215102090033','智能2101','徐天德33',18,1,33,1),
(1239,'20215102090034','智能2101','徐天德34',18,1,34,1),
(1240,'20215102090035','智能2101','徐天德35',18,1,35,1),
(1241,'20215102090036','智能2101','徐天德36',18,1,36,1),
(1242,'20215102090037','智能2101','徐天德37',18,1,37,1),
(1243,'20215102090038','智能2101','徐天德38',18,1,38,1),
(1244,'20215102090039','智能2101','徐天德39',18,1,39,1),
(1245,'20215102090040','智能2101','徐天德40',18,1,40,1),
(1246,'20215102090041','智能2101','徐天德41',18,1,41,1),
(1247,'20215102090042','智能2101','徐天德42',18,1,42,1),
(1248,'20215102090043','智能2101','徐天德43',18,1,43,1),
(1249,'20215102090044','智能2101','徐天德44',18,1,44,1),
(1250,'20215102090045','智能2101','徐天德45',18,1,45,1),
(1251,'20215102090046','智能2101','徐天德46',18,1,46,1),
(1252,'20215102090047','智能2101','徐天德47',18,1,47,1),
(1253,'20215102090048','智能2101','徐天德48',18,1,48,1),
(1254,'20215102090049','智能2101','徐天德49',18,1,49,1),
(1255,'20215102090050','智能2101','徐天德50',18,1,50,1),
(1256,'20215102090051','智能2101','徐天德51',18,1,51,1),
(1257,'20215102090052','智能2101','徐天德52',18,1,52,1),
(1258,'20215102090053','智能2101','徐天德53',18,1,53,1),
(1259,'20215102090054','智能2101','徐天德54',18,1,54,1),
(1260,'20215102090055','智能2101','徐天德55',18,1,55,1),
(1261,'20215102090056','智能2101','徐天德56',18,1,56,1),
(1262,'20215102090057','智能2101','徐天德57',18,1,57,1),
(1263,'20215102090058','智能2101','徐天德58',18,1,58,1),
(1264,'20215102090059','智能2101','徐天德59',18,1,59,1),
(1265,'20215102090060','智能2101','徐天德60',18,1,60,1),
(1266,'20215102090061','智能2101','徐天德61',18,1,61,1),
(1267,'20215102090062','智能2101','徐天德62',18,1,62,1),
(1268,'20215102090063','智能2101','徐天德63',18,1,63,1),
(1269,'20215102090064','智能2101','徐天德64',18,1,64,1),
(1270,'20215102090065','智能2101','徐天德65',18,1,65,1),
(1271,'20215102090066','智能2101','徐天德66',18,1,66,1),
(1272,'20215102090067','智能2101','徐天德67',18,1,67,1),
(1273,'20215102090068','智能2101','徐天德68',18,1,68,1),
(1274,'20215102090069','智能2101','徐天德69',18,1,69,1),
(1275,'20215102090070','智能2101','徐天德70',18,1,70,1),
(1276,'20215102090071','智能2101','徐天德71',18,1,71,1),
(1277,'20215102090072','智能2101','徐天德72',18,1,72,1),
(1278,'20215102090073','智能2101','徐天德73',18,1,73,1),
(1279,'20215102090074','智能2101','徐天德74',18,1,74,1),
(1280,'20215102090075','智能2101','徐天德75',18,1,75,1),
(1281,'20215102090076','智能2101','徐天德76',18,1,76,1),
(1282,'20215102090077','智能2101','徐天德77',18,1,77,1),
(1283,'20215102090078','智能2101','徐天德78',18,1,78,1),
(1284,'20215102090079','智能2101','徐天德79',18,1,79,1),
(1285,'20215102090080','智能2101','徐天德80',18,1,80,1),
(1286,'20215102090081','智能2101','徐天德81',18,1,81,1),
(1287,'20215102090082','智能2101','徐天德82',18,1,82,1),
(1288,'20215102090083','智能2101','徐天德83',18,1,83,1),
(1289,'20215102090084','智能2101','徐天德84',18,1,84,1),
(1290,'20215102090085','智能2101','徐天德85',18,1,85,1),
(1291,'20215102090086','智能2101','徐天德86',18,1,86,1),
(1292,'20215102090087','智能2101','徐天德87',18,1,87,1),
(1293,'20215102090088','智能2101','徐天德88',18,1,88,1),
(1294,'20215102090089','智能2101','徐天德89',18,1,89,1),
(1295,'20215102090090','智能2101','徐天德90',18,1,90,1),
(1296,'20215102090091','智能2101','徐天德91',18,1,91,1),
(1297,'20215102090092','智能2101','徐天德92',18,1,92,1),
(1298,'20215102090093','智能2101','徐天德93',18,1,93,1),
(1299,'20215102090094','智能2101','徐天德94',18,1,94,1),
(1300,'20215102090095','智能2101','徐天德95',18,1,95,1),
(1301,'20215102090096','智能2101','徐天德96',18,1,96,1),
(1302,'20215102090097','智能2101','徐天德97',18,1,97,1),
(1303,'20215102090098','智能2101','徐天德98',18,1,98,1),
(1304,'20215102090099','智能2101','徐天德99',18,1,99,1),
(1305,'2021510209000','智能2101','徐天德0',18,1,0,1),
(1306,'2021510209001','智能2101','徐天德1',18,1,1,1),
(1307,'2021510209002','智能2101','徐天德2',18,1,2,1),
(1308,'2021510209003','智能2101','徐天德3',18,1,3,1),
(1309,'2021510209004','智能2101','徐天德4',18,1,4,1),
(1310,'2021510209005','智能2101','徐天德5',18,1,5,1),
(1311,'2021510209006','智能2101','徐天德6',18,1,6,1),
(1312,'2021510209007','智能2101','徐天德7',18,1,7,1),
(1313,'2021510209008','智能2101','徐天德8',18,1,8,1),
(1314,'2021510209009','智能2101','徐天德9',18,1,9,1),
(1315,'20215102090010','智能2101','徐天德10',18,1,10,1),
(1316,'20215102090011','智能2101','徐天德11',18,1,11,1),
(1317,'20215102090012','智能2101','徐天德12',18,1,12,1),
(1318,'20215102090013','智能2101','徐天德13',18,1,13,1),
(1319,'20215102090014','智能2101','徐天德14',18,1,14,1),
(1320,'20215102090015','智能2101','徐天德15',18,1,15,1),
(1321,'20215102090016','智能2101','徐天德16',18,1,16,1),
(1322,'20215102090017','智能2101','徐天德17',18,1,17,1),
(1323,'20215102090018','智能2101','徐天德18',18,1,18,1),
(1324,'20215102090019','智能2101','徐天德19',18,1,19,1),
(1325,'20215102090020','智能2101','徐天德20',18,1,20,1),
(1326,'20215102090021','智能2101','徐天德21',18,1,21,1),
(1327,'20215102090022','智能2101','徐天德22',18,1,22,1),
(1328,'20215102090023','智能2101','徐天德23',18,1,23,1),
(1329,'20215102090024','智能2101','徐天德24',18,1,24,1),
(1330,'20215102090025','智能2101','徐天德25',18,1,25,1),
(1331,'20215102090026','智能2101','徐天德26',18,1,26,1),
(1332,'20215102090027','智能2101','徐天德27',18,1,27,1),
(1333,'20215102090028','智能2101','徐天德28',18,1,28,1),
(1334,'20215102090029','智能2101','徐天德29',18,1,29,1),
(1335,'20215102090030','智能2101','徐天德30',18,1,30,1),
(1336,'20215102090031','智能2101','徐天德31',18,1,31,1),
(1337,'20215102090032','智能2101','徐天德32',18,1,32,1),
(1338,'20215102090033','智能2101','徐天德33',18,1,33,1),
(1339,'20215102090034','智能2101','徐天德34',18,1,34,1),
(1340,'20215102090035','智能2101','徐天德35',18,1,35,1),
(1341,'20215102090036','智能2101','徐天德36',18,1,36,1),
(1342,'20215102090037','智能2101','徐天德37',18,1,37,1),
(1343,'20215102090038','智能2101','徐天德38',18,1,38,1),
(1344,'20215102090039','智能2101','徐天德39',18,1,39,1),
(1345,'20215102090040','智能2101','徐天德40',18,1,40,1),
(1346,'20215102090041','智能2101','徐天德41',18,1,41,1),
(1347,'20215102090042','智能2101','徐天德42',18,1,42,1),
(1348,'20215102090043','智能2101','徐天德43',18,1,43,1),
(1349,'20215102090044','智能2101','徐天德44',18,1,44,1),
(1350,'20215102090045','智能2101','徐天德45',18,1,45,1),
(1351,'20215102090046','智能2101','徐天德46',18,1,46,1),
(1352,'20215102090047','智能2101','徐天德47',18,1,47,1),
(1353,'20215102090048','智能2101','徐天德48',18,1,48,1),
(1354,'20215102090049','智能2101','徐天德49',18,1,49,1),
(1355,'20215102090050','智能2101','徐天德50',18,1,50,1),
(1356,'20215102090051','智能2101','徐天德51',18,1,51,1),
(1357,'20215102090052','智能2101','徐天德52',18,1,52,1),
(1358,'20215102090053','智能2101','徐天德53',18,1,53,1),
(1359,'20215102090054','智能2101','徐天德54',18,1,54,1),
(1360,'20215102090055','智能2101','徐天德55',18,1,55,1),
(1361,'20215102090056','智能2101','徐天德56',18,1,56,1),
(1362,'20215102090057','智能2101','徐天德57',18,1,57,1),
(1363,'20215102090058','智能2101','徐天德58',18,1,58,1),
(1364,'20215102090059','智能2101','徐天德59',18,1,59,1),
(1365,'20215102090060','智能2101','徐天德60',18,1,60,1),
(1366,'20215102090061','智能2101','徐天德61',18,1,61,1),
(1367,'20215102090062','智能2101','徐天德62',18,1,62,1),
(1368,'20215102090063','智能2101','徐天德63',18,1,63,1),
(1369,'20215102090064','智能2101','徐天德64',18,1,64,1),
(1370,'20215102090065','智能2101','徐天德65',18,1,65,1),
(1371,'20215102090066','智能2101','徐天德66',18,1,66,1),
(1372,'20215102090067','智能2101','徐天德67',18,1,67,1),
(1373,'20215102090068','智能2101','徐天德68',18,1,68,1),
(1374,'20215102090069','智能2101','徐天德69',18,1,69,1),
(1375,'20215102090070','智能2101','徐天德70',18,1,70,1),
(1376,'20215102090071','智能2101','徐天德71',18,1,71,1),
(1377,'20215102090072','智能2101','徐天德72',18,1,72,1),
(1378,'20215102090073','智能2101','徐天德73',18,1,73,1),
(1379,'20215102090074','智能2101','徐天德74',18,1,74,1),
(1380,'20215102090075','智能2101','徐天德75',18,1,75,1),
(1381,'20215102090076','智能2101','徐天德76',18,1,76,1),
(1382,'20215102090077','智能2101','徐天德77',18,1,77,1),
(1383,'20215102090078','智能2101','徐天德78',18,1,78,1),
(1384,'20215102090079','智能2101','徐天德79',18,1,79,1),
(1385,'20215102090080','智能2101','徐天德80',18,1,80,1),
(1386,'20215102090081','智能2101','徐天德81',18,1,81,1),
(1387,'20215102090082','智能2101','徐天德82',18,1,82,1),
(1388,'20215102090083','智能2101','徐天德83',18,1,83,1),
(1389,'20215102090084','智能2101','徐天德84',18,1,84,1),
(1390,'20215102090085','智能2101','徐天德85',18,1,85,1),
(1391,'20215102090086','智能2101','徐天德86',18,1,86,1),
(1392,'20215102090087','智能2101','徐天德87',18,1,87,1),
(1393,'20215102090088','智能2101','徐天德88',18,1,88,1),
(1394,'20215102090089','智能2101','徐天德89',18,1,89,1),
(1395,'20215102090090','智能2101','徐天德90',18,1,90,1),
(1396,'20215102090091','智能2101','徐天德91',18,1,91,1),
(1397,'20215102090092','智能2101','徐天德92',18,1,92,1),
(1398,'20215102090093','智能2101','徐天德93',18,1,93,1),
(1399,'20215102090094','智能2101','徐天德94',18,1,94,1),
(1400,'20215102090095','智能2101','徐天德95',18,1,95,1),
(1401,'20215102090096','智能2101','徐天德96',18,1,96,1),
(1402,'20215102090097','智能2101','徐天德97',18,1,97,1),
(1403,'20215102090098','智能2101','徐天德98',18,1,98,1),
(1404,'20215102090099','智能2101','徐天德99',18,1,99,1);

/*Table structure for table `app01_teacherdata` */

DROP TABLE IF EXISTS `app01_teacherdata`;

CREATE TABLE `app01_teacherdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `subjects` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `app01_teacherdata` */

insert  into `app01_teacherdata`(`id`,`name`,`subjects`) values 
(1,'张三','Python'),
(3,'李四','1');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add student data',7,'add_studentdata'),
(26,'Can change student data',7,'change_studentdata'),
(27,'Can delete student data',7,'delete_studentdata'),
(28,'Can view student data',7,'view_studentdata'),
(29,'Can add teacher data',8,'add_teacherdata'),
(30,'Can change teacher data',8,'change_teacherdata'),
(31,'Can delete teacher data',8,'delete_teacherdata'),
(32,'Can view teacher data',8,'view_teacherdata'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add registered',10,'add_registered'),
(38,'Can change registered',10,'change_registered'),
(39,'Can delete registered',10,'delete_registered'),
(40,'Can view registered',10,'view_registered');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(9,'app01','login'),
(10,'app01','registered'),
(7,'app01','studentdata'),
(8,'app01','teacherdata'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-05-20 08:37:43.682205'),
(2,'auth','0001_initial','2023-05-20 08:37:44.191878'),
(3,'admin','0001_initial','2023-05-20 08:37:44.259639'),
(4,'admin','0002_logentry_remove_auto_add','2023-05-20 08:37:44.267423'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-05-20 08:37:44.283147'),
(6,'app01','0001_initial','2023-05-20 08:37:44.348976'),
(7,'contenttypes','0002_remove_content_type_name','2023-05-20 08:37:44.390229'),
(8,'auth','0002_alter_permission_name_max_length','2023-05-20 08:37:44.420249'),
(9,'auth','0003_alter_user_email_max_length','2023-05-20 08:37:44.454424'),
(10,'auth','0004_alter_user_username_opts','2023-05-20 08:37:44.461019'),
(11,'auth','0005_alter_user_last_login_null','2023-05-20 08:37:44.491512'),
(12,'auth','0006_require_contenttypes_0002','2023-05-20 08:37:44.496226'),
(13,'auth','0007_alter_validators_add_error_messages','2023-05-20 08:37:44.502420'),
(14,'auth','0008_alter_user_username_max_length','2023-05-20 08:37:44.535142'),
(15,'auth','0009_alter_user_last_name_max_length','2023-05-20 08:37:44.565950'),
(16,'sessions','0001_initial','2023-05-20 08:37:44.591129'),
(17,'app01','0002_auto_20230520_1640','2023-05-20 08:40:46.963485'),
(18,'app01','0003_auto_20230520_1645','2023-05-20 08:45:31.606641'),
(19,'app01','0004_auto_20230520_1657','2023-05-20 08:57:21.235528'),
(20,'app01','0005_auto_20230520_2051','2023-05-20 12:51:30.648610'),
(21,'app01','0006_login_registered','2023-05-24 05:47:28.202949'),
(22,'app01','0007_auto_20230524_1410','2023-05-24 06:10:28.073096');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('07lk4f1phuvt0ttlpf5jq2hvkocee6ed','YjhjYmIxYTEyMjk0YTFiZjcwYzZmMmJkMGM1NDcwZGYyNzNmOTU5Mzp7ImltYWdlX2NvZGUiOiJGUFVZTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsImluZm8iOiJ4dXRpYW5kZSJ9','2023-05-24 11:55:32.952820'),
('2wck54wzo1ip5lxn4tph7lckc2td7agh','MDNjNmZiYWE4ZTJhYmY5ZWQwZjYwZTY1ODA4MzdiYTI0NWI4ZWM5Nzp7ImltYWdlX2NvZGUiOiJTQ0ZKUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:52:14.926745'),
('4pyr1g4n05vc762ixpvwalfhgrp7c4k5','MmZmMWYwNzA4NDY2NWU3YmRjYmQ3YTYxZThhMDExZDhiZTljYWY4Mjp7ImltYWdlX2NvZGUiOiJJTkFXSSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:36:14.450391'),
('5dopoyivthjlo3lawzissf9xuwxob3xx','YjYwYWMzNWZiYWZkMDBmMDU2MjczZTFiMzYyNTAwNThjMGJjNGFkOTp7ImltYWdlX2NvZGUiOiJaTFBHSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 12:29:40.168359'),
('9hpj5nq9u3rjat11avyh2e2yowcqk504','ZTU1YmRjN2RlYmQxOGU0NjE2MDFkNjEzOGEzNjJlZjQ4YzJmZGU4MTp7ImltYWdlX2NvZGUiOiJaQUNRUSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 12:06:44.353920'),
('9zo582fj2n9dx2ft69q6t52yyarbrlsk','NWE2ZmRjNWUwMGU3MjcxNTA5ZDU4YWI2MThhM2FjNmYyMjk0OWYyYjp7ImltYWdlX2NvZGUiOiJTV0xGVyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:34:16.438491'),
('darc8hm84qwu8zraznilkhptt86580oi','YWYyNjBmZDE2MTNhNjcxZTFlMDZmODMwYTVkYzljMjgwY2I2YWE1Yjp7InVzZXJuYW1lIjpbXSwiaW1hZ2VfY29kZSI6Ik5OS01aIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0=','2023-05-24 11:23:30.495688'),
('dvsxq8mjkujqzzi7p6977d5kriqcuslj','MzRjYWJmZTE5MGMxZDNmMThjZTAyYWM4MzFmYTViOTE0YmFiMTZmNTp7InVzZXJuYW1lIjpbXSwiaW1hZ2VfY29kZSI6IkNCR1ZYIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0=','2023-05-24 10:20:04.029014'),
('g6k7y087u2uvbxue6w510smoizmhl6wf','MGJiZWEzZmIwNGRkODBkOWJiZDM5NTY5ODJlY2E3NDk2YmQ0MDJhMDp7ImltYWdlX2NvZGUiOiJTT0dBTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:50:40.026390'),
('g8txa9ls10tk7zij0a3o7ou1yqi7rfmx','NjNiNTM1YjRjNzQ1MjYzNjAzYzgyNWJlODhiNTcxNTU1YjNjYmFjMjp7ImltYWdlX2NvZGUiOiJGRkZIUCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsImluZm8iOiJ4dXRpYW5kZSJ9','2023-05-24 11:41:19.940035'),
('gfvq68stjmjgums7vr36xpb84pg3nkn1','MTgyOTI0NTAyN2Y5YTMxZWU4ZDZkOTAwNWY1M2ViNDE2ZWY4YzliODp7ImltYWdlX2NvZGUiOiJDSUVUWSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:38:57.662716'),
('gpe5xse2ho3342q813go20zpmjl09gdq','OWFkYjZlZGMzZDU5ZDg5MjBkZjZhMDI3N2U3NWY4NDFlMTU5YWZmZDp7ImltYWdlX2NvZGUiOiJLQ0FKTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:54:20.903796'),
('kadz5snkoljztdtmehbtvz25gxrqnbvw','MDVlYzcyNWZlMGY0ZWM2ODhmNzkyNTYwNzEwZmJjZTQwMGM1OWEzMzp7ImltYWdlX2NvZGUiOiJaR1BGTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:26:02.842546'),
('mjrau87z2ezkurk3lm5pe76r6ihimip0','MWYyMzk2YTM0YmVlN2Y0YjEwY2RiZDczNzBmZWE4MDU5M2RiZmFkYjp7ImltYWdlX2NvZGUiOiJYQVJOSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsInVzZXJuYW1lIjpbXX0=','2023-05-24 10:17:52.618912'),
('mmd3ru335eyvboe4ffjsb7d4e1e7ounw','NWE4YzY1OTViZTBmMzlkMDExNjZmMzcyM2E3ODBlYTA0NTgyNjBlMDp7ImltYWdlX2NvZGUiOiJNWVBaSiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 12:31:18.131184'),
('o1v3ytfqcglev48s04n904vjec59p636','NmY2NDlkMDYwNTQ3YzQzY2MzZTA5OGY5MThlNTRmNDliYjU5ZTg0MDp7ImltYWdlX2NvZGUiOiJIVE1aTSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:29:16.118350'),
('plhuzv7y0c15z96vlv35la6c09kagn7b','OTk3MzNlY2JlYmI3ZmI1NWU3NTQ1ZTRiNDI0MTQzYmExZjM4YjgwZTp7ImltYWdlX2NvZGUiOiJKUVNYVCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 12:23:41.892878'),
('t44asmzx15u31r6073xswy46y79tlyw2','NWZmNDcxZTc1MGVkZmVmZDJhMjAzMTRjMzAxZWUwYTNiZmVjMjNjNDp7ImltYWdlX2NvZGUiOiJKRENPTCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsImluZm8iOiJ4dXRpYW5kZSJ9','2023-05-24 11:43:43.085387'),
('tzsgw1v6i95dbfkg6d4db7bqci44tdrd','ZTQ5MDA0MWQxYzIzYjk3NmI0ODBmMDRkOTViYjkwNzRiOTc4ZmExZjp7ImltYWdlX2NvZGUiOiJWWkZSTyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:44:44.516990'),
('zu9lyagkqe31mtdchrt9gmd5s67hevhs','YzY5Mzg3YjgyNTk0MDNmZTQ2MTRjODA4NDg3NDA2MzE4MzJkMGE1NTp7ImltYWdlX2NvZGUiOiJNUVlKUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2023-05-24 11:27:19.947452');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
