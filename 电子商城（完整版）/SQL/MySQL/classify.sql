# Host: localhost  (Version: 5.5.53)
# Date: 2020-02-28 08:37:21
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "classify"
#

DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `classification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for table "classify"
#

/*!40000 ALTER TABLE `classify` DISABLE KEYS */;
INSERT INTO `classify` VALUES (1,'食品药品'),(2,'穿着用品'),(3,'数码产品'),(4,'书籍书本'),(5,'家用电器'),(6,'学习用品'),(7,'家务用具'),(8,'其他分类');
/*!40000 ALTER TABLE `classify` ENABLE KEYS */;
