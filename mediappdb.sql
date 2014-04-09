-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2014 at 05:04 PM
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
(1, 33);

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
('33', 'ROLE_ADMIN');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`clinic_id`, `country`, `province`, `town`, `name`, `address`, `phone`, `email`) VALUES
(1, 'Ireland', 'Cork', 'Glanmire', 'Glanmire Medical Centre ', 'The Glanmire Medical Centre Crestfield Glanmire Co.Cork', '0214821257', 'glanmireclinic@gmail.com');

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
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `patient_id` varchar(10) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `image_id` varchar(10) DEFAULT NULL,
  `user_id` varchar(10) NOT NULL,
  UNIQUE KEY `time` (`time`,`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`time`, `date`, `patient_id`, `note`, `image_id`, `user_id`) VALUES
('2014-04-04 16:31:40', '2014-04-04', '1', 'The Patient is fairly healthy, but he demands the expensive Medecine.', NULL, '33');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `clinic_id` varchar(10) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `age`, `address`, `phone`, `clinic_id`) VALUES
(1, 'Michael Holmes', 22, '8 Adelaide Court, Adelaide Street, Cork, Co.Cork', '0862126410', '1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `user_type`, `address`, `phone`, `email`, `password`, `clinic_id`, `enabled`) VALUES
(33, 'Admin', 'Admin', 'localhost', '127001', 'admin@admin.com', 'd8169fbbb0f7e1a14762688661e2206005d1a17871e288ae628ceb4ae67f7f4c', NULL, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
