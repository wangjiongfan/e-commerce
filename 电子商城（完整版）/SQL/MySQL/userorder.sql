# Host: localhost  (Version: 5.5.53)
# Date: 2020-02-28 08:38:37
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "userorder"
#

DROP TABLE IF EXISTS `userorder`;
CREATE TABLE `userorder` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `productDetail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "userorder"
#

/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES (1,1,4,'蓝色，10寸',1),(2,1,5,'黑色，小号',2),(9,1,2,'黑色，中量',2),(10,1,1,'原味，1500g',1);
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
