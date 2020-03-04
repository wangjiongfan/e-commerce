# Host: localhost  (Version: 5.5.53)
# Date: 2020-02-28 08:38:26
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "usercart"
#

DROP TABLE IF EXISTS `usercart`;
CREATE TABLE `usercart` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `productDetail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "usercart"
#

/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
INSERT INTO `usercart` VALUES (1,1,4,'蓝色，10寸',1),(2,1,5,'黑色，小号',2),(3,2,3,'蓝色，60码',1),(4,3,7,'A套',1),(5,3,10,'黑色，酷炫版',2),(6,3,11,'红色，XL',2),(7,1,1,'草莓，1500g',1);
/*!40000 ALTER TABLE `usercart` ENABLE KEYS */;
