-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2014 at 08:29 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
(7, 'Ireland', 'Cork', 'Cork1', 'cork clinicq', 'street', '12345', 'g@g.com');

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
  PRIMARY KEY (`user_id`),
  KEY `clinicId` (`clinic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `user_type`, `address`, `phone`, `email`, `password`, `clinic_id`) VALUES
(1, 'aaa', 'GP', 'aaa', 234, 'sdf', '23e', NULL),
(2, 'Michael Holmes', 'GP', '123 fake street', 645935, 'michael@michael.com', 'myPassword', NULL),
(7, 'Michael Holmes', 'GP', 'Main Street', 12345, 'michaelholmes@gmail.com', 'password123', NULL),
(9, 'John Doe', 'Admin', 'Nowhere', 454545, 'mystery@hollywood.com', 'allstars', NULL),
(10, 'Bob Jelly', 'GP', 'My House, something street', 123123123, 'coolhouse@somewhere.com', 'nopassword', NULL),
(11, 'Jerry Springer', 'Consultant', 'Studio House', 888888, 'sillyshow@tv.com', 'jerryjerry', NULL),
(12, 'Susan Scofield', 'Admin', 'Warzone avenue', 7676667, 'conflict@house.com', 'thamesriver', NULL),
(13, 'Cora Hayes', 'GP', 'Cobh', 123456789, 'corahayes@gmail.com', 'corapassword', NULL),
(14, 'Berry Power', 'Consultant', 'House Street', 87654321, 'berrypower@gmail.com', 'berrybush123', NULL),
(15, 'Michael', 'Admin', 'House', 123, 'Gmach223@gmal.com', '123', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
