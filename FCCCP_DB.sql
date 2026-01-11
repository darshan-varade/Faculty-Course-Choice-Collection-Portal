-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 15, 2024 at 03:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FCCCP_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sem` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `sem`) VALUES
(3, 'Mathematics-III', '3'),
(4, 'Mathematics-IV', '4'),
(5, 'DBMS', '3'),
(6, 'DS', '3'),
(7, 'DE', '3'),
(8, 'FLAT', '5'),
(9, 'FLAT', '5'),
(10, 'AA', '5'),
(11, 'DWM', '5'),
(12, 'CN', '5'),
(13, 'AI', '5');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(20) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `expertise` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `age`, `designation`, `expertise`, `experience`, `email`, `password`) VALUES
(2, 'Tejas Bhavsar', 20, 'B.Tech', 'Web Development', '1 year', 'tejas@gmail.com', '12345'),
(4, 'Sandip Sonawane', 45, 'Assistant Professor', 'IOT , Network Security', '18 years', 'sandip.sonawane@rcpit.ac', '12345'),
(7, 'xyz', 20, 'B.tech', 'DSA', '1 year', 'xyz@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_courses`
--

CREATE TABLE `faculty_courses` (
  `name` varchar(100) NOT NULL,
  `choice_1` varchar(255) NOT NULL,
  `choice_2` varchar(100) NOT NULL,
  `choice_3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_courses`
--

INSERT INTO `faculty_courses` (`name`, `choice_1`, `choice_2`, `choice_3`) VALUES
('Tejas Bhavsar', 'Mathematics-III', 'DBMS', 'DE'),
('Tejas Bhavsar', 'Mathematics-III', 'DBMS', 'DS'),
('Tejas Bhavsar', 'DWM', 'CN', 'AI'),
('Tejas Bhavsar', 'AA', 'DWM', 'CN'),
('null', 'FLAT', 'AA', 'DWM'),
('null', 'FLAT', 'AA', 'DWM'),
('xyz', 'FLAT', 'AA', 'DWM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
