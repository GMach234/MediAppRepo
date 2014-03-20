-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2014 at 11:34 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mediappdb`
--

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
('33', 'ROLE_ADMIN'),
('34', 'ROLE_ADMIN'),
('35', 'ROLE_ADMIN'),
('36', 'ROLE_USER'),
('37', 'ROLE_ADMIN'),
('38', 'ROLE_USER');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`clinic_id`, `country`, `province`, `town`, `name`, `address`, `phone`, `email`) VALUES
(1, 'Ireland', 'Cork', 'Cork', 'Corcaigh Clinic', 'Main Street', '123456789', 'corkclinic@gmail.com'),
(2, 'Ireland', 'Cork', 'Fermoy', 'Fermoy Clinic', '31st Street', '8649523', 'fermoyclinic@gmail.com'),
(3, 'Ireland', 'Cork', 'Dunmanway', 'Dunmanway Clinic', 'Cul De Sac Road', '467913258', 'dunmanwayclinic@gmail.com'),
(4, 'Ireland', 'Limerick', 'Limerick', 'Limerick Clinic', 'Limerick Avenue', '193746825', 'stabclinic@gmail.com'),
(5, 'Ireland', 'Dublin', 'Dublin', 'Dublin Clinic', 'Road House, Road Street', '0862126410', 'dublinclinic@gmail.com'),
(6, 'England', 'Durham', 'Darlington', 'Darlington clinic', 'Clinic Road, Darlo District', '063250685', 'darlingtonclinic@gmail.com'),
(7, 'Ireland', 'Cork', 'Cork1', 'cork clinicq', 'street', '12345', 'g@g.com'),
(10, 'Ireland', 'Dublin', 'Dublin ', 'Michael Johannes Clinic Emporium', '8 Dublin Quay, Dublin Avenue', '12345654321', 'mjEmporium@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `image_id` varchar(10) NOT NULL,
  `image_data` text NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `patient_id` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `image_id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
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
  `phone` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `clinic_id` int(10) DEFAULT NULL,
  `enabled` varchar(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `clinicId` (`clinic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `user_type`, `address`, `phone`, `email`, `password`, `clinic_id`, `enabled`) VALUES
(1, 'aaa', 'GP', 'aaa', 234, 'sdf', '23e', NULL, '1'),
(2, 'Michael Holmes', 'GP', '123 fake street', 645935, 'michael@michael.com', 'myPassword', NULL, '1'),
(7, 'Michael Holmes', 'GP', 'Main Street', 12345, 'michaelholmes@gmail.com', 'password123', NULL, '1'),
(9, 'John Doe', 'Admin', 'Nowhere', 454545, 'mystery@hollywood.com', 'allstars', NULL, '1'),
(10, 'Bob Jelly', 'GP', 'My House, something street', 123123123, 'coolhouse@somewhere.com', 'nopassword', NULL, '1'),
(11, 'Jerry Springer', 'Consultant', 'Studio House', 888888, 'sillyshow@tv.com', 'jerryjerry', NULL, '1'),
(12, 'Susan Scofield', 'Admin', 'Warzone avenue', 7676667, 'conflict@house.com', 'thamesriver', NULL, '1'),
(13, 'Cora Hayes', 'GP', 'Cobh', 123456789, 'corahayes@gmail.com', 'corapassword', NULL, '1'),
(14, 'Berry Power', 'Consultant', 'House Street', 87654321, 'berrypower@gmail.com', 'berrybush123', NULL, '1'),
(15, 'Michael', 'Admin', 'House', 123, 'Gmach223@gmal.com', '123', NULL, '1'),
(16, 'admin', 'Admin', '9 Fenr', 123213, 'admin@admin.com', '', NULL, '1'),
(17, 'yyy', 'GP', 'yyy', 111, 'yyy', 'yyy', NULL, '1'),
(33, 'Ben', 'GP', 'Ben', 345, 'ben@ben.com', 'ben', NULL, '1'),
(34, 'Joe', 'GP', 'Joe Street', 1234, 'joe@gmail.com', 'joe', NULL, '1'),
(35, 'Greta', 'GP', 'Greta Street ', 666, 'greta@gmail.com', 'greta', NULL, '1'),
(36, 'GuestUser', 'GP', 'Nowhere', 123, 'gmail@gmail.com', 'guest', NULL, '1'),
(37, 'AdminUser', 'Admin', 'admin', 123, 'admin@admin.com', 'admin', NULL, '1'),
(38, 'UserUser', 'Consultant', 'user', 123, 'user@user.com', 'user', NULL, '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
