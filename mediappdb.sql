-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2014 at 01:41 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mediappdb`
--
CREATE DATABASE IF NOT EXISTS `mediappdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mediappdb`;

-- --------------------------------------------------------

--
-- Table structure for table `associations`
--

CREATE TABLE IF NOT EXISTS `associations` (
  `clinic_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `associations`
--

INSERT INTO `associations` (`clinic_id`, `user_id`) VALUES
(8, 9),
(7, 9),
(9, 9),
(9, 16),
(9, 31),
(6, 31);

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
  `user_id` varchar(50) NOT NULL,
  `authority` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`user_id`, `authority`) VALUES
('7', 'ROLE_ADMIN'),
('9', 'ROLE_USER'),
('16', 'ROLE_ADMIN'),
('17', 'ROLE_ADMIN'),
('18', 'ROLE_USER'),
('19', 'ROLE_ADMIN'),
('20', 'ROLE_ADMIN'),
('21', 'ROLE_ADMIN'),
('22', 'ROLE_ADMIN'),
('23', 'ROLE_ADMIN'),
('23', 'ROLE_ADMIN'),
('24', 'ROLE_ADMIN'),
('25', 'ROLE_ADMIN'),
('26', 'ROLE_ADMIN'),
('27', 'ROLE_ADMIN'),
('28', 'ROLE_ADMIN'),
('29', 'ROLE_ADMIN'),
('30', 'ROLE_USER'),
('31', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE IF NOT EXISTS `clinics` (
  `clinic_id` int(10) NOT NULL AUTO_INCREMENT,
  `country` text,
  `province` text,
  `town` text,
  `name` text,
  `address` text,
  `phone` varchar(30) NOT NULL,
  `email` text,
  PRIMARY KEY (`clinic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`clinic_id`, `country`, `province`, `town`, `name`, `address`, `phone`, `email`) VALUES
(6, 'England', 'Durham', 'Darlington', 'Darlington clinic', 'Clinic Road, Darlo District', '063250685', 'darlingtonclinic@gmail.com'),
(7, 'Ireland', 'Cork', 'Cork', 'Clinic of Corcaigh', 'Cork Street', '0987653', 'cork@clinic.com'),
(8, 'England', 'Durham', 'Dingdongton', 'DingDong Clinic', 'Doesn''t Exist Street', '123666', 'something@that.com'),
(9, 'Ireland', 'Limerick', 'Limerick', 'Stab Street Clinic', 'Stab Street', '82828282', 'This@Those.These'),
(11, 'Ireland', 'Galway', 'Galway', 'Darragh Clinic', 'Darragh''s House', '0872126363', 'd@clinic.com'),
(12, 'France', 'OuiOui', 'NonNon', 'L''Hopital', 'La Rue!', '888999', 'france@french.com'),
(13, 'Ireland', 'Somewhere', 'Bogsville', 'My house', '123 house', '373737', 'something@222.com');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `image_id` varchar(10) NOT NULL,
  `image_type` text,
  `size` int(11) DEFAULT NULL,
  `image_data` text,
  `name` text,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `time` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `patient_id` int(10) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `image_id` int(10) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  UNIQUE KEY `time` (`time`,`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` varchar(10) NOT NULL,
  `name` text,
  `age` int(11) DEFAULT NULL,
  `address` text,
  `phone` int(11) DEFAULT NULL,
  `clinic_id` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `user_type` enum('GP','Consultant','Admin') NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `clinic_id` int(10) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `clinicId` (`clinic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `user_type`, `address`, `phone`, `email`, `password`, `clinic_id`, `enabled`) VALUES
(12, 'Susan Scofield', 'Admin', 'Warzone avenue', '7676667', 'conflict@house.com', 'thamesriver', NULL, 1),
(13, 'Cora Hayes', 'GP', 'Cobh', '123456789', 'corahayes@gmail.com', 'corapassword', NULL, 1),
(14, 'Berry Power', 'Consultant', 'House Street', '87654321', 'berrypower@gmail.com', 'berrybush123', NULL, 1),
(16, 'Michael', 'Admin', 'House', '928374', 'something@gmail.com', 'qweqweqwe', NULL, 1),
(18, 'Michael', 'GP', 'Holm', '1230914', 'gmai@gmas', 'alsksdjdhf', NULL, 1),
(20, 'Preslav', 'Admin', 'asdads', '121212', 'asddsa@asd.com', '`12345678', NULL, 1),
(21, 'Preslav', 'Admin', 'asdads', '121212', 'asddsa@asd.com', '`12345678', NULL, 1),
(22, 'Preslav', 'Admin', 'asdads', '121212', 'asddsa@asd.com', '`12345678', NULL, 1),
(23, 'NewHashDude', 'Admin', 'Hash Street', '575755454', 'hash@sha.com', 'c0daca965dc4022d2403284cf884925ee3cfef95dc45701fdcaabd986d12cf86', NULL, 1),
(24, 'NewDude', 'Admin', 'dskjadlkjd', '823472894', 'dsjkads@dasjhdkaw.cm', '69836b35b87a585fd82d0993a616744d20c4fa4c69b6269a8f84132311702262', NULL, 1),
(25, 'Moe', 'Admin', 'Nowhere', '3004930', 'someplace@gmail.com', '45eb877a9043c0143fdccf3c5389bb5af227d19109465852069463fd29e937f1', NULL, 1),
(26, 'NewHashUser', 'Admin', 'Hash Street', '27384959', 'hash@sha256.com', '8d81879c0b08f23bd157c58b693dd91b29ed7169e1efc39b1f400457774ac42b', NULL, 1),
(27, 'NewGuy', 'Admin', 'somewhere 3', '44444', 'g@d.com', '6ecc444a6dc902d90b95a10494486fff9c91b016df7ad86712fe0579dad49dd4', NULL, 1),
(28, 'NewGuy222', 'Admin', 'somewhere 3222', '44444222', 'g@d.com222', '6b3a594d6060db4cdd52bff67376a746cf60f1552bd7e14ac5eac5e4e904ca92', NULL, 1),
(29, 'Mickey', 'Admin', '123 somethwer', '342434', 'dadsa@Dwadsd', '5cc1b6fe25b1593cadd73b52fab5acb9ac0acf26261e26518e547de8f0c8fbe1', NULL, 1),
(30, 'Michael H', 'GP', 'Somewhere', '234', 'gmach234@gmail.com', '40e92f2e41cc46a5f6a0fdf030970cd9abcc5de8f4c5aa3fdb15d28b6048d7ad', NULL, 1),
(31, 'Glenn Fitz', 'Admin', 'Cork Somewhere', '666', 'glenn@gmail.com', 'a167d041e8d568e8ac78a442e3fdd74677b7d4c262c916d8b8773a2f1bf9ae1d', NULL, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
