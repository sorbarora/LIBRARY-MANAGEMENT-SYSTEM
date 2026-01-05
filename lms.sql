-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2024 at 06:53 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms12`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publication_year` varchar(10) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `publication_year`, `isbn`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(24, 'Introduction To Algorithms', 'Thomas H.Cormen', '2009', '978-0070131514', 6, 1, '2024-11-28 13:02:06', NULL),
(25, 'Computer Organization and Design', 'David A. Patterson, John L. Hennessy', '2017', '978-0124077263', 6, 1, '2024-11-28 13:04:01', NULL),
(26, 'Discrete Mathematics and Its Applications', 'Kenneth H. Rosen', '2018', '978-0073383095', 6, 1, '2024-11-28 13:07:25', NULL),
(27, 'Electronics Devices and Circuit Theory', 'Robret L. Boylestad, Louis Nashelsky', '2010', '978-0132545978', 7, 1, '2024-11-28 13:09:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_loans`
--

DROP TABLE IF EXISTS `book_loans`;
CREATE TABLE IF NOT EXISTS `book_loans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `loan_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_loans`
--

INSERT INTO `book_loans` (`id`, `book_id`, `student_id`, `loan_date`, `return_date`, `is_return`, `created_at`, `updated_at`) VALUES
(10, 27, 2, '2024-11-27', '2024-12-27', 0, '2024-11-28 13:10:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(6, 'B.Tech CSE', '2024-11-28 12:57:20'),
(7, 'B.Tech ECE', '2024-11-28 12:58:24'),
(8, 'B.Tech ME', '2024-11-28 12:58:48'),
(9, 'B.Tech CE', '2024-11-28 12:59:00'),
(10, 'B.Tech EE', '2024-11-28 12:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `phone_no`, `email`, `address`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Lakshman', '8768768560', 'lakshman@gmail.com', 'Building no 9, flat no 102', 1, '2023-06-06 02:07:08', '2024-11-28 13:13:07'),
(6, 'Ram', '9829001122', 'ram@outlook.com', '', 1, '2023-06-06 02:19:43', '2024-11-28 13:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_no`, `password`, `profile_pic`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '9810230918', '$2y$10$jBkfSECnF9JJBwFUm9gBperYfgB5dhmJmeQ6o2k4b5i.EzUmSw31C', 'mar.png', '2023-06-07 09:44:48', '2023-06-07 08:59:31');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
