-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 10:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitalmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `appoint_date` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phno` varchar(11) DEFAULT NULL,
  `diseases` varchar(100) DEFAULT NULL,
  `doctorid` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `userid`, `fullname`, `gender`, `age`, `appoint_date`, `email`, `phno`, `diseases`, `doctorid`, `address`, `status`) VALUES
(1, 1, 'chintan', 'male', '15', '2022-11-30', 'het@gmail.com', '88888888', 'fever', 1, 'anand', 'Pending'),
(2, 1, 'neel', 'male', '21', '2022-11-23', 'neel@gmail.com', '1478523998', 'fever', 1, 'surat', 'baki che hazu'),
(3, 1, 'jay', 'male', '58', '2022-11-08', 'jay@gmail.com', '1478523990', 'fever', 1, 'surat', 'Check up Completed'),
(4, 6, 'mehul', 'male', '25', '2022-11-29', 'mehul@gmail.com', '4586925364', 'fever', 1, 'lambhel', 'Pending'),
(5, 1, 'Nihal', 'male', '24', '2022-11-08', 'nihal@gmail.com', '9478526451', 'cold', 1, 'surat', 'Pending'),
(6, 7, 'neel', 'male', '25', '2022-11-14', 'neel@gmail.com', '1478523998', 'cold', 8, 'surat', 'kale avjo');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `specialist` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobNo` varchar(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `full_name`, `dob`, `qualification`, `specialist`, `email`, `mobNo`, `password`) VALUES
(1, 'Chintan', '2022-11-10', 'bsc', 'Orthopedic surgery', 'chintan@gmail.com', '9499829139', '1234'),
(7, 'neel', '2022-11-11', 'mbbs', 'dentist', 'neel@gmail.com', '5897456321', '1234'),
(8, 'aamir', '2022-11-23', 'mbbs', 'dentist', 'aamir@gmail.com', '9488653254', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL,
  `spec_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`id`, `spec_name`) VALUES
(1, 'dentist'),
(2, 'Orthopedic surgery');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'chintan', 'chintan.mandaliya12@gmail.com', '12345'),
(4, 'het', 'het@gmail.com', '1234'),
(5, 'harshal', 'harshal@gmail.com', '1234'),
(6, 'mehul', 'mehul@gmail.com', '1234'),
(7, 'neel', 'neel@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userid_2` (`userid`),
  ADD KEY `doctor_id_fk` (`doctorid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `doctor_id_fk` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`userid`) REFERENCES `user_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
