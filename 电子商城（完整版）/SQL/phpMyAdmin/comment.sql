-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2020 年 02 月 27 日 01:15
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `commentary` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `replayId` int(11) DEFAULT NULL,
  `replayTid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`Id`, `pid`, `uid`, `commentary`, `time`, `reply`, `replayId`, `replayTid`) VALUES
(1, 1, 1, '味道很好，休闲时打发时间用', '2019-03-05 15:00', '0', NULL, NULL),
(2, 1, 2, '很不错的零食，我的孩子非常喜欢', '2019-03-09 10:20', '0', NULL, NULL),
(3, 1, 3, '真的很好吃，爱不释手', '2019-03-10 14:25', '1', 2, 2),
(4, 1, 1, '所以我真的很喜欢这个零食', '2019-03-12 16:30', '1', 2, 2),
(5, 1, 6, '非常喜欢', '2019-03-07 15:00', '0', NULL, NULL),
(6, 2, 2, '疗效不错，我爸吃了效果很好', '2019-05-11 17:20', '0', NULL, NULL),
(7, 2, 5, '很不错的补品', '2019-04-14 15:29', '0', NULL, NULL),
(8, 2, 4, '补品效果很好，味道也很棒', '2019-06-14 15:21', '0', NULL, NULL),
(9, 2, 3, '我也觉得效果很好', '2019-07-11 19:21', '1', 6, 6),
(10, 3, 2, '质量很好，用了很久都没事', '2019-02-18 16:30', '0', NULL, NULL),
(11, 3, 6, '穿着感觉很舒服', '2019-04-07 17:24', '0', NULL, NULL),
(12, 3, 8, '很好用的拖鞋，我很喜欢', '2019-05-07 18:20', '0', NULL, NULL),
(13, 3, 4, '非常舒服', '2019-05-13 15:20', '1', 12, 12),
(14, 3, 9, '这款拖鞋很实用', '2019-05-14 15:20', '1', 13, 12),
(15, 4, 2, '手感很好，使用起来很舒服', '2019-04-15 19:20', '0', NULL, NULL),
(16, 4, 3, '颜色很好看', '2019-08-05 09:10', '0', NULL, NULL),
(17, 4, 5, '送货很快，服务态度很好', '2019-10-11 08:21', '0', NULL, NULL),
(18, 4, 8, '确实很好用，我也很喜欢', '2019-10-22 21:18', '1', 15, 15),
(19, 5, 7, '纸的质量很好', '2019-05-12 10:10', '0', NULL, NULL),
(20, 6, 1, '很流畅的手机，非常好用', '2020-2-24 16:17', '0', NULL, NULL),
(21, 11, 1, '超帅气的男装，强烈推荐', '2020-2-24 16:22', '0', NULL, NULL),
(22, 3, 1, '我也很喜欢', '2020-2-25 16:0', '1', 14, 12);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
