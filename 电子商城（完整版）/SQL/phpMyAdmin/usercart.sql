-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2020 年 02 月 27 日 01:16
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
-- 表的结构 `usercart`
--

CREATE TABLE IF NOT EXISTS `usercart` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `productDetail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `usercart`
--

INSERT INTO `usercart` (`Id`, `uid`, `pid`, `productDetail`, `count`) VALUES
(1, 1, 4, '蓝色，10寸', 1),
(2, 1, 5, '黑色，小号', 2),
(3, 2, 3, '蓝色，60码', 1),
(4, 3, 7, 'A套', 1),
(5, 3, 10, '黑色，酷炫版', 2),
(6, 3, 11, '红色，XL', 2),
(7, 1, 1, '草莓，1500g', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
