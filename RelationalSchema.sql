
-- Created by Pawel Zamorski G00364553@gmit.ie

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2018 at 06:47 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g00364553_zamorski`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentNumber` int(11) NOT NULL,
  `patientNumber` int(11) NOT NULL,
  `employeeNumber` smallint(6) NOT NULL,
  `appointmentDateTime` timestamp NULL DEFAULT NULL,
  `appointmentStatus` varchar(15) DEFAULT 'ARRANGED',
  `apptAim` varchar(255) DEFAULT NULL,
  `apptHistory` varchar(255) DEFAULT NULL,
  `followUpTreatment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appointmentdetail`
--

CREATE TABLE `appointmentdetail` (
  `appointmentNumber` int(11) NOT NULL,
  `employeeNumber` smallint(6) NOT NULL,
  `treatmentNumber` smallint(6) NOT NULL,
  `finalPrice` decimal(7,2) NOT NULL,
  `quantity` smallint(6) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `appointmentNumber` int(11) NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `issuedDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `paymentStatus` varchar(30) DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchNumber` smallint(6) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `phone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancellation`
--

CREATE TABLE `cancellation` (
  `appointmentNumber` int(11) NOT NULL,
  `appointmentDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cancellationDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryNumber` smallint(6) NOT NULL,
  `category` varchar(70) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeNumber` smallint(6) NOT NULL,
  `branchNumber` smallint(6) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `jobTitle` varchar(15) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientNumber` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `gender` char(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL,
  `landline` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `preferedContact` varchar(15) DEFAULT NULL,
  `firstVisit` tinyint(1) DEFAULT '1',
  `teethDescription` blob,
  `healthHistoryForm` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentNumber` int(11) NOT NULL,
  `appointmentNumber` int(11) NOT NULL,
  `amountPaid` decimal(7,2) NOT NULL,
  `paymentDate` date NOT NULL,
  `paymentMethod` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentNumber` smallint(6) NOT NULL,
  `categoryNumber` smallint(6) NOT NULL,
  `treatmentName` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatmentoffered`
--

CREATE TABLE `treatmentoffered` (
  `employeeNumber` smallint(6) NOT NULL,
  `treatmentNumber` smallint(6) NOT NULL,
  `price` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workschema`
--

CREATE TABLE `workschema` (
  `employeeNumber` smallint(6) NOT NULL,
  `workDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentNumber`),
  ADD KEY `patientNumber` (`patientNumber`),
  ADD KEY `employeeNumber` (`employeeNumber`);

--
-- Indexes for table `appointmentdetail`
--
ALTER TABLE `appointmentdetail`
  ADD PRIMARY KEY (`appointmentNumber`,`treatmentNumber`,`employeeNumber`),
  ADD KEY `treatmentNumber` (`treatmentNumber`),
  ADD KEY `employeeNumber` (`employeeNumber`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`appointmentNumber`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchNumber`);

--
-- Indexes for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD PRIMARY KEY (`appointmentNumber`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryNumber`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeNumber`),
  ADD KEY `branchNumber` (`branchNumber`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientNumber`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentNumber`,`appointmentNumber`),
  ADD KEY `appointmentNumber` (`appointmentNumber`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentNumber`),
  ADD UNIQUE KEY `treatmentName` (`treatmentName`),
  ADD KEY `categoryNumber` (`categoryNumber`);

--
-- Indexes for table `treatmentoffered`
--
ALTER TABLE `treatmentoffered`
  ADD PRIMARY KEY (`employeeNumber`,`treatmentNumber`),
  ADD KEY `treatmentNumber` (`treatmentNumber`);

--
-- Indexes for table `workschema`
--
ALTER TABLE `workschema`
  ADD PRIMARY KEY (`employeeNumber`,`workDateTime`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientNumber`) REFERENCES `patient` (`patientNumber`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`employeeNumber`) REFERENCES `employee` (`employeeNumber`);

--
-- Constraints for table `appointmentdetail`
--
ALTER TABLE `appointmentdetail`
  ADD CONSTRAINT `appointmentdetail_ibfk_1` FOREIGN KEY (`appointmentNumber`) REFERENCES `appointment` (`appointmentNumber`),
  ADD CONSTRAINT `appointmentdetail_ibfk_2` FOREIGN KEY (`treatmentNumber`) REFERENCES `treatmentoffered` (`treatmentNumber`),
  ADD CONSTRAINT `appointmentdetail_ibfk_3` FOREIGN KEY (`employeeNumber`) REFERENCES `treatmentoffered` (`employeeNumber`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`appointmentNumber`) REFERENCES `appointment` (`appointmentNumber`);

--
-- Constraints for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD CONSTRAINT `cancellation_ibfk_1` FOREIGN KEY (`appointmentNumber`) REFERENCES `appointment` (`appointmentNumber`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branchNumber`) REFERENCES `branch` (`branchNumber`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`appointmentNumber`) REFERENCES `bill` (`appointmentNumber`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`categoryNumber`) REFERENCES `category` (`categoryNumber`);

--
-- Constraints for table `treatmentoffered`
--
ALTER TABLE `treatmentoffered`
  ADD CONSTRAINT `treatmentoffered_ibfk_1` FOREIGN KEY (`employeeNumber`) REFERENCES `employee` (`employeeNumber`),
  ADD CONSTRAINT `treatmentoffered_ibfk_2` FOREIGN KEY (`treatmentNumber`) REFERENCES `treatment` (`treatmentNumber`);

--
-- Constraints for table `workschema`
--
ALTER TABLE `workschema`
  ADD CONSTRAINT `workschema_ibfk_1` FOREIGN KEY (`employeeNumber`) REFERENCES `employee` (`employeeNumber`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
