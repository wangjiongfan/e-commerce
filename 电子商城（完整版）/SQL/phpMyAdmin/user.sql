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
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `sex` varchar(10) NOT NULL DEFAULT '',
  `power` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `creatTime` varchar(255) NOT NULL DEFAULT '',
  `loginTime` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`Id`, `name`, `password`, `phone`, `sex`, `power`, `email`, `creatTime`, `loginTime`, `src`) VALUES
(1, 'xiaoming', '123456', '', '男', '1', NULL, '', NULL, 'http://192.168.1.6/img/headImg/f47d0ad31c4c49061b9e505593e3db981582708597.png'),
(2, '张三', '111111', '', '女', '1', NULL, '', NULL, 'http://192.168.1.6/img/headImg/02.jpeg'),
(3, '小红', '222222', '', '女', '2', NULL, '', NULL, 'http://192.168.1.6/img/headImg/03.jpg'),
(4, '李三', '123123', 'asdasd', '男', '2', 'asasd', '', NULL, 'http://192.168.1.6/img/headImg/04.jpg'),
(5, '张四', '444444', 'sdfsdf', '男', '2', 'sdfsdfs', '', NULL, 'http://192.168.1.6/img/headImg/05.jpg'),
(6, '杨三', '333333', '', '女', '5', '', '', NULL, 'http://192.168.1.6/img/headImg/06.jpg'),
(7, '王六', '666666', '', '男', '5', '', '', NULL, 'http://192.168.1.6/img/headImg/07.jpg'),
(8, 'kitty', 'aaaaaa', 'awefawef', '女', '5', 'wefwefwe', '', NULL, 'http://192.168.1.6/img/headImg/08.jpg'),
(9, 'peter', 'bbbbbb', '', '男', '3', '', '', NULL, 'http://192.168.1.6/img/headImg/09.jpg'),
(10, '老王', '555555', '', '男', '3', '', '', NULL, 'http://192.168.1.6/img/headImg/10.jpg'),
(11, '老刘', '', '', '女', '4', '', '', NULL, 'img/zhanghao_icon.png'),
(12, '老表', '', '', '女', '5', '', '', NULL, 'img/zhanghao_icon.png'),
(13, '四哥', '', '', '男', '3', '', '', NULL, 'img/zhanghao_icon.png'),
(14, '王五', '333333', '12312312312', '男', '4', '管理员', '', NULL, 'img/zhanghao_icon.png'),
(15, '李四', '444444', '12345678909', '男', '4', '会员', '', NULL, 'img/zhanghao_icon.png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
