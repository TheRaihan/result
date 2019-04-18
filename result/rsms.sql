-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2019 at 10:23 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `co1` double NOT NULL DEFAULT '0',
  `co2` double NOT NULL DEFAULT '0',
  `co3` double NOT NULL DEFAULT '0',
  `co4` double NOT NULL DEFAULT '0',
  `exam_in_taken` double NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`id`, `name`, `co1`, `co2`, `co3`, `co4`, `exam_in_taken`) VALUES
(5, 'Mid1', 5, 5, 5, 0, 40),
(2, 'Mid2', 5, 5, 5, 0, 40),
(3, 'Final Exam', 10, 10, 5, 5, 50),
(27, 'Quiz', 5, 2, 3, 0, 10),
(21, 'Lab', 0, 0, 0, 20, 20),
(16, 'Project', 0, 0, 0, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `student_id` text NOT NULL,
  `a_id` int(11) NOT NULL,
  `co1` double NOT NULL,
  `co2` double NOT NULL,
  `co3` double NOT NULL,
  `co4` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `student_id`, `a_id`, `co1`, `co2`, `co3`, `co4`) VALUES
(44, '2017-1-60-151', 3, 0, 0, 0, 19),
(43, '2017-1-60-072', 3, 0, 0, 0, 20),
(28, '2017-1-60-091', 21, 0, 0, 0, 20),
(26, '2017-1-60-091', 42, 0, 0, 0, 0),
(65, '-', 2, 0, 0, 0, 0),
(24, '2017-1-60-091', 16, 0, 0, 0, 10),
(64, '2017-1-60-106', 2, 0, 0, 0, 0),
(22, '2017-1-60-091', 5, 9, 9, 7, 0),
(63, '-', 5, 0, 0, 0, 0),
(20, '2017-1-60-091', 2, 10, 10, 11, 0),
(62, '2017-1-60-106', 3, 0, 0, 0, 0),
(18, '2017-1-60-091', 3, 15, 16, 7, 7),
(48, '2017-1-60-151', 5, 11, 10, 7, 0),
(45, '2017-1-60-072', 2, 11, 11, 12, 0),
(37, '2017-1-60-091', 27, 5, 2, 2, 0),
(47, '2017-1-60-072', 5, 10, 10, 10, 0),
(46, '2017-1-60-151', 2, 9, 13, 10, 0),
(61, '2017-1-60-106', 5, 0, 0, 0, 0),
(49, '2017-1-60-153', 5, 0, 0, 0, 19.5),
(50, '2017-1-60-153', 2, 9, 9, 11, 0),
(51, '2017-1-60-153', 3, 16, 16, 5, 5),
(52, '2017-1-60-072', 27, 5, 2, 3, 0),
(53, '2017-1-60-151', 27, 5, 2, 2, 0),
(54, '2017-1-60-153', 27, 4, 2, 2, 0),
(55, '2017-1-60-072', 16, 0, 0, 0, 10),
(56, '2017-1-60-151', 16, 0, 0, 0, 9),
(57, '2017-1-60-153', 16, 0, 0, 0, 9),
(58, '2017-1-60-072', 21, 0, 0, 0, 0),
(59, '2017-1-60-151', 21, 0, 0, 0, 0),
(60, '2017-1-60-153', 21, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `student_id` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `student_id`) VALUES
(1, 'Raihan', '2017-1-60-072'),
(16, 'Priota', '2017-1-60-106'),
(13, 'Rafi', '2017-1-60-151'),
(15, 'Soikot', '2017-1-60-153'),
(17, '-', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
