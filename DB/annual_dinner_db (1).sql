-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2026 at 10:40 AM
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
-- Database: `annual_dinner_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123'),
(2, 'Zohaib', 'zohaib123');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `target_ticket_serial` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `reason_provided` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `admin_username`, `action_type`, `target_ticket_serial`, `details`, `reason_provided`, `ip_address`, `created_at`) VALUES
(8, 'staff', 'UPDATE', '117194', 'Updated record: Noor', NULL, '::1', '2026-02-10 05:42:21'),
(9, 'staff', 'UPDATE', '117192', 'Updated record: Zafir Kamran', NULL, '::1', '2026-02-10 06:31:15'),
(10, 'System', 'EXIT', '117163', 'Student Exited Event', NULL, '::1', '2026-02-10 13:38:35'),
(11, 'zohaib', 'DELETE', '117380', 'Deleted student record', NULL, '::1', '2026-02-10 14:29:53'),
(12, 'zohaib', 'UPDATE', '117429', 'Updated record: Haseeb Ali Khan', NULL, '::1', '2026-02-11 07:31:00'),
(13, 'zohaib', 'UPDATE', '117408', 'Updated record: Abdullah Amjad', NULL, '::1', '2026-02-11 08:33:18'),
(14, 'System', 'EXIT', '117001', 'Student Exited Event', NULL, '::1', '2026-02-11 08:34:22'),
(15, 'zohaib', 'UPDATE', '117295', 'Updated record: Aansa Ramzan', NULL, '::1', '2026-02-11 08:37:23'),
(16, 'System', 'EXIT', '117412', 'Student Exited Event', NULL, '::1', '2026-02-11 10:29:40'),
(17, 'System', 'EXIT', '117412', 'Student Exited Event', NULL, '::1', '2026-02-11 10:31:36'),
(18, 'System', 'EXIT', '117411', 'Student Exited Event', NULL, '::1', '2026-02-11 10:32:58'),
(19, 'zohaib', 'UPDATE', '117048', 'Updated record: Irfan Tahir', NULL, '::1', '2026-02-11 10:42:47'),
(20, 'zohaib', 'UPDATE', '117194', 'Updated record: Reyyan Ali', NULL, '::1', '2026-02-11 11:18:02'),
(21, 'System', 'EXIT', '117400', 'Student Exited Event', NULL, '::1', '2026-02-11 11:23:45'),
(22, 'System', 'EXIT', '117400', 'Student Exited Event', NULL, '::1', '2026-02-11 11:25:53'),
(23, 'System', 'EXIT', '117249', 'Student Exited Event', NULL, '::1', '2026-02-11 11:35:12'),
(24, 'zohaib', 'UPDATE', '117001', 'Updated record: Yousra Akram', NULL, '::1', '2026-02-12 05:22:21'),
(25, 'zohaib', 'UPDATE', '117400', 'Updated record: Hamza Sajid', NULL, '::1', '2026-02-12 05:25:48'),
(26, 'zohaib', 'UPDATE', '117080', 'Updated record: ABdul Rehman', NULL, '::1', '2026-02-12 05:27:12'),
(27, 'zohaib', 'UPDATE', '117365', 'Updated record: Farwa Zainab', NULL, '::1', '2026-02-12 05:28:50'),
(28, 'zohaib', 'UPDATE', '117356', 'Updated record: M Hassan', NULL, '::1', '2026-02-12 05:37:26'),
(29, 'zohaib', 'UPDATE', '117356', 'Updated record: M Hassan', NULL, '::1', '2026-02-12 05:39:09'),
(30, 'zohaib', 'UPDATE', '117112', 'Updated record: Umair', NULL, '::1', '2026-02-12 05:41:22'),
(31, 'zohaib', 'UPDATE', '117367', 'Updated record: Faizan Ul Haq', NULL, '::1', '2026-02-12 05:44:00'),
(32, 'zohaib', 'UPDATE', '117369', 'Updated record: Talha Khalid', NULL, '::1', '2026-02-12 05:47:03'),
(33, 'zohaib', 'UPDATE', '117368', 'Updated record: Mehsan Azeen', NULL, '::1', '2026-02-12 05:56:40'),
(34, 'zohaib', 'UPDATE', '117087', 'Updated record: Sania', NULL, '::1', '2026-02-12 06:00:45'),
(35, 'zohaib', 'UPDATE', '117354', 'Updated record: M Husnain', NULL, '::1', '2026-02-12 06:08:04'),
(36, 'zohaib', 'UPDATE', '117022', 'Updated record: Daud Nadeem', NULL, '::1', '2026-02-12 06:10:06'),
(37, 'zohaib', 'UPDATE', '117078', 'Updated record: Tanveer Nasir', NULL, '::1', '2026-02-12 06:12:05'),
(38, 'zohaib', 'UPDATE', '117296', 'Updated record: Shama', NULL, '::1', '2026-02-12 09:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(6) UNSIGNED NOT NULL,
  `ticket_serial` varchar(50) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `roll_no` varchar(50) NOT NULL,
  `class_section` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL DEFAULT 'Information Technology',
  `has_entered` tinyint(1) DEFAULT 0,
  `entry_time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_manual` tinyint(1) DEFAULT 0,
  `guest_category` varchar(50) DEFAULT 'Student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticket_serial`, `student_name`, `roll_no`, `class_section`, `department`, `has_entered`, `entry_time`, `created_at`, `is_manual`, `guest_category`) VALUES
(111, '117001', 'Yousra Akram', '242344', 'BS 4th Morning B', 'Information Technology', 0, '2026-02-11 13:34:04', '2026-02-07 11:35:28', 0, 'Student'),
(112, '117002', 'Urwa Arshad', '248051', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(113, '117003', 'Zohaib Akhtar', '248073', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(114, '117004', 'Noor ul huda', '248062', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(115, '117005', 'Momin Razaq', '248059', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(116, '117006', 'Laiba Asaf', '248074', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(117, '117007', 'Ahtsham skhawat', '248076', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(118, '117008', 'Memoona Sajid', '248061', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(119, '117009', 'Ayesha', '248066', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(120, '117010', 'Muhammad Faraz', '248067', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(121, '117011', 'Arsha khalid', '248063', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(122, '117012', 'Rabiya khalid', '248064', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(123, '117013', 'Abdul qadeer', '248056', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(124, '117014', 'Asma', '248048', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(125, '117015', 'Shazab', '248072', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(126, '117016', 'Ali bahadur', '248084', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(127, '117017', 'Mateen Ahmad', '248069', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(128, '117018', 'Muhammad Nafees', '248085', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-07 11:35:28', 0, 'Student'),
(129, '117019', 'Noman Aslam', '248049', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-09 13:25:53', 0, 'Student'),
(130, '117020', 'Manahil Gull', '225175', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(131, '117021', 'Mariyam Khalid', '225191', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(132, '117022', 'Daud Nadeem', '246780', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(133, '117023', 'Mubashir Saleem', '225172', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(134, '117024', 'Ayesha Shahid', '225204', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(135, '117025', 'Hafiz Huzaifa', '225209', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(136, '117026', 'Nida Tariq', '225169', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(137, '117027', 'Saqlain Sajjad', '225218', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(138, '117028', 'Hafsa Kanwal', '225203', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(139, '117029', 'Qaim Abbass', '225176', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(140, '117030', 'M Ali Nasir', '225180', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(141, '117031', 'Aneesa Asad', '225171', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(142, '117032', 'Ahmad Muneer', '225163', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(143, '117033', 'Abdul Basit', '225181', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(144, '117034', 'Zohaib Ahmad', '225207', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(145, '117035', 'Hammad Ahmad', '225201', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(146, '117036', 'Rehan Arshad', '225198', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(147, '117037', 'Talha Bin Abdullah', '225199', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(148, '117038', 'Saad Amir', '225161', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(149, '117039', 'Hassan Butt', '225194', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(150, '117040', 'Ahmad Ijaz', '225200', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(151, '117041', 'Talha Saleem', '225214', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(152, '117042', 'M Mubeen', '225167', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(153, '117043', 'Zulqarnain Haider', '225179', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(154, '117044', 'Husnain Shah', '225193', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(155, '117045', 'Abdullah Shahid', '225196', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(156, '117046', 'Umair Raza', '225192', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(157, '117047', 'Raheel Chishti', '225186', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(158, '117048', 'Irfan Tahir', '246785', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(159, '117049', 'Moazzam Hameed', '225168', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(160, '117050', 'Hafsa Noreen', '225211', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:07:17', 0, 'Student'),
(161, '117051', 'Alisha Faraz', '225276', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(162, '117052', 'Sara Rehman', '225265', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(163, '117053', 'Ahmad Raza', '225226', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(164, '117054', 'Wajid Ali', '225224', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(165, '117055', 'Arsal Ali', '225254', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(166, '117056', 'M Ibrahim', '225241', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(167, '117057', 'Areeba Eman', '225222', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(168, '117058', 'Aatika Shahzad', '225245', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(169, '117059', 'Areeha Zainab', '225238', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(170, '117060', 'Hassan Farooq', '225247', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(171, '117061', 'Laiba Attique', '225252', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(172, '117062', 'Ishal Fatima', '225258', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(173, '117063', 'Zeeshan Ali', '225237', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(174, '117064', 'M Bilal Hussain', '225231', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(175, '117065', 'Ali Raza', '225271', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(176, '117066', 'Usama Rafique', '225257', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(177, '117067', 'Kinza Farooq', '225240', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(178, '117068', 'Akasha Iftikhar', '225248', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(179, '117069', 'Zeeshan Ijaz', '225228', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(180, '117070', 'Shoaib Akhtar', '225242', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(181, '117071', 'Shehroz Akhtar', '225272', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(182, '117072', 'Talha Poswel', '225236', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(183, '117073', 'Rehan Ali', '225268', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(184, '117074', 'Hanzala Rehman', '225266', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:33:07', 0, 'Student'),
(185, '117075', 'Faisal Hanif', '222083', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(186, '117076', 'M Owais', '222084', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(187, '117077', 'Bilal Aqeel', '222086', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(188, '117078', 'Tanveer Nasir', '246784', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(189, '117079', 'Ariel Sharoon', '222091', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(190, '117080', 'ABdul Rehman', '245440', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(191, '117081', 'Rozy Abbas', '222095', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(192, '117082', 'Harmas Raza', '222096', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(193, '117083', 'Bilal Ahmad', '222098', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(194, '117084', 'Nimra Iqbal', '222100', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(195, '117085', 'M.Imtiaz', '222101', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(196, '117086', 'M.Anas', '222103', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(197, '117087', 'Sania', '235334', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(198, '117088', 'Talha Amin', '222107', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(199, '117089', 'M.Faisal', '222108', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(200, '117090', 'Abdul Waleed', '222109', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(201, '117091', 'Anosh Batool', '222111', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(202, '117092', 'Haider Ali', '222114', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(203, '117093', 'Sibgha Javed', '222116', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(204, '117094', 'Noor Ul Ain', '222117', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(205, '117095', 'M.Irfan', '222118', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(206, '117096', 'Umar Amjad', '222124', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(207, '117097', 'Waleed Abdullah', '222125', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(208, '117098', 'M.Hamza', '222131', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(209, '117099', 'Ali Akbar', '222132', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(210, '117100', 'Hareem Fatima', '222133', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(211, '117101', 'Ahmad Haseeb', '222134', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(212, '117102', 'Tanveer Abbas', '222136', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(213, '117103', 'Ayesha Aamir', '222120', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(214, '117104', 'Ahmad Nabi', '222085', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(215, '117105', 'Zohaib Tahir', '222123', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(216, '117106', 'Kubra Majeed', '222126', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-09 14:50:45', 0, 'Student'),
(217, '117107', 'Shah Jhan', '222160', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-09 14:59:16', 0, 'Student'),
(218, '117108', 'Kiran Fatima', '222148', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-09 14:59:16', 0, 'Student'),
(219, '117109', 'Saifullah', '222184', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-09 14:59:16', 0, 'Student'),
(220, '117110', 'Faiza Akram', '222141', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-09 14:59:16', 0, 'Student'),
(221, '117111', 'Sawera Saif', '222149', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-09 14:59:16', 0, 'Student'),
(248, '117112', 'Umair', '225255', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(249, '117113', 'Bazeed Khan', '248005', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(250, '117114', 'Danish Raza', '248019', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(251, '117115', 'Amina Tariq', '248036', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(252, '117116', 'Quanitah Noor', '248016', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(253, '117117', 'Aroob Chaudary', '248006', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(254, '117118', 'Hira Nasir', '248004', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(255, '117119', 'Daud Ahmad', '248014', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(256, '117120', 'Waqas Ashraf', '248027', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(257, '117121', 'Mahnor', '248012', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(258, '117122', 'Esha Maham', '248035', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(259, '117123', 'Awais Raza', '248020', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(260, '117124', 'Asna Habiba', '248037', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(261, '117125', 'Ali Hamza', '248007', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(262, '117126', 'Areesha Zafar', '248021', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(263, '117127', 'Bilal Rauf', '248040', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(264, '117128', 'Areeba Irfan', '248003', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(265, '117129', 'M Farhan Farhat', '248031', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(266, '117130', 'M Saad', '248024', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(267, '117131', 'Abdullah Shafiq', '248030', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(268, '117132', 'Ahmad Raza', '248017', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(269, '117133', 'M Umer', '248033', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(270, '117134', 'Ishmal Irfan', '248029', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(271, '117135', 'Iman Arif', '248038', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(272, '117136', 'Tahreem Fatima', '248026', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(273, '117137', 'Alia Riaz', '248023', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-09 15:00:38', 0, 'Student'),
(274, '117138', 'Armeeza Shehzadi Sabir', '254367', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(275, '117139', 'Erum Saba Maqbool', '254385', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(276, '117140', 'Ali Nizami', '254381', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(277, '117141', 'Faiq Hassan', '254373', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(278, '117142', 'Ayesha Khan Durani', '254380', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(279, '117143', 'Amen Aziz', '254368', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(280, '117144', 'Hina Murtaza', '254377', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(281, '117145', 'Muneeba Asif', '(MS 3rd)', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(282, '117146', 'Tabish Herl', '254383', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(283, '117147', 'Rimsha Shafiq', '254384', 'MS Students', 'Information Technology', 0, NULL, '2026-02-09 15:15:59', 0, 'Student'),
(284, '117148', 'Mahnoor Azhar', '250934', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(285, '117149', 'Muhammad Faizan', '250936', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(286, '117150', 'Ayesha khalid', '250889', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(287, '117151', 'Muhammad Ahmad', '250935', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(288, '117152', 'Ali Hasnain', '250916', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(289, '117153', 'Touseeb Khan', '250925', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(290, '117154', 'Roha Naseer', '250927', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(291, '117155', 'Basima Hussain', '250947', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(292, '117156', 'Muhammad Hanan', '250906', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(293, '117157', 'Rizwan Ali', '250947', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(294, '117158', 'Maryam Amjad', '250902', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(295, '117159', 'Sheikh Hamza', '250897', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(296, '117160', 'Roqaya Zuha', '250903', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(297, '117161', 'Qandeel Fatima', '250915', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(298, '117162', 'M Ahmed Qasim', '250905', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 03:36:14', 0, 'Student'),
(299, '117163', 'Hafiz Saad Raza', '252664', 'BS 2nd Evening', 'Information Technology', 0, '2026-02-10 18:38:20', '2026-02-10 03:38:12', 0, 'Student'),
(300, '117164', 'Awais Ahmad', '252638', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(301, '117165', 'Huzaifa Saeed', '252676', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(302, '117166', 'Ali Haider', '252656', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(303, '117167', 'Muhammad Ali', '252645', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(304, '117168', 'Hamza', '252671', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(305, '117169', 'Ruhma Asim', '252668', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(306, '117170', 'Muhammad Taha', '252647', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(307, '117171', 'Amina Shahid', '252636', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(308, '117172', 'Iram Siddique', '252679', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(309, '117173', 'Eman Fatima', '252667', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(310, '117174', 'Adeel Hassan', '252661', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(311, '117175', 'Khadija Hussain', '252644', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(312, '117176', 'Zain Ul Abideen', '252674', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(313, '117177', 'Ushna', '252643', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(314, '117178', 'Uswa', '252649', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(315, '117179', 'Bilal Jabbar', '252632', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(316, '117180', 'Faqeeha Maryam', '252633', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(317, '117181', 'Shahryar', '252663', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(318, '117182', 'M. Arsheq', '252640', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(319, '117183', 'Hussain', '252677', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(320, '117184', 'Maida Amin', '252658', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(321, '117185', 'Aiman', '252641', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(322, '117186', 'Rida Zahra', '252654', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(323, '117187', 'Muhammad Nabeel', '252680', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-10 03:38:12', 0, 'Student'),
(324, '117188', 'Zara Hassan', '248041', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-10 05:24:24', 0, 'Student'),
(325, '117189', 'Ayesha Liaqat', '248039', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-10 05:24:49', 0, 'Student'),
(326, '117190', 'Umer Iftikhar', '248034', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-10 05:25:34', 0, 'Student'),
(327, '117192', 'Zafir Kamran', '225250', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 05:37:33', 0, 'Student'),
(328, '117191', 'Rabia Yaseen', '225162', 'BS 8th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 05:39:32', 0, 'Student'),
(329, '117193', 'Awais', '225244', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 05:41:17', 0, 'Student'),
(330, '117194', 'Reyyan Ali', '245453', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 05:41:58', 0, 'Student'),
(331, '117195', 'Ahmad Bilal', '225235', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 05:43:40', 0, 'Student'),
(332, '117196', 'Mahnoor Shahbaz', '222130', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 05:45:30', 0, 'Student'),
(333, '117197', 'Moeez Ahmad', '222163', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 05:47:11', 0, 'Student'),
(334, '117198', 'Laiba Gill', '222162', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 05:47:57', 0, 'Student'),
(335, '117199', 'Muhammad Umer', '222176', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 05:49:08', 0, 'Student'),
(336, '117200', 'Bushra RIaz', '222179', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 05:49:56', 0, 'Student'),
(337, '117201', 'Shazia Aniqa', '242287', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(338, '117202', 'Ali hamza', '242234', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(339, '117203', 'Zain Sajjad', '242246', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(340, '117204', 'Hassan', '242267', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(341, '117205', 'Subhan', '242247', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(342, '117206', 'Aleeha Zehra', '242252', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(343, '117207', 'Mohsin Ahmad', '242286', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(344, '117208', 'Tehseen Ahmad', '242249', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(345, '117209', 'Ahmad Ali', '242271', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(346, '117210', 'Amna Talat', '242285', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(347, '117211', 'Haseeb', '242283', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(348, '117212', 'Amna Bushra', '242280', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(349, '117213', 'Ayesha Tariq', '242237', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(350, '117214', 'Ahmad Mustafa', '242275', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(351, '117215', 'Salahuddin Tahir', '242256', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(352, '117216', 'Tayyab Hassan', '242238', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(353, '117217', 'Ahsan Amir', '242245', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(354, '117218', 'Abdullah', '242273', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(355, '117219', 'Ramish Farooq', '242243', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(356, '117220', 'Umar Afzal', '242278', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(357, '117221', 'Umar Adeel', '242279', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(358, '117222', 'Sidra Parveen', '242253', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(359, '117223', 'Rafia Saman', '242265', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(360, '117224', 'Fiza Amjad', '242281', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(361, '117225', 'Yousuf Iqbal', '242277', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 05:57:48', 0, 'Student'),
(362, '117226', 'Ayesha Noor', '242296', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(363, '117227', 'Amna Shahid', '242329', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(364, '117228', 'Aman Fatima', '242294', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(365, '117229', 'Tahreem Rida', '242338', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(366, '117230', 'Maryam Tariq', '242299', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(367, '117231', 'Maryam Kashaf', '242331', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(368, '117232', 'Zubair Rasheed', '242300', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(369, '117233', 'Talha Randhawa', '242316', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(370, '117234', 'Noman Hussain', '242347', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(371, '117235', 'Hareema', '242324', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(372, '117236', 'Tahirah Batool', '242312', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(373, '117237', 'Ahmad Rizwan', '242339', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(374, '117238', 'Awais Sajid', '242326', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(375, '117239', 'Ifrah Sana', '242317', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(376, '117240', 'Ahmad Hussain', '242332', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(377, '117241', 'Zainab Imran', '242335', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(378, '117242', 'Salman Naveed', '242301', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(379, '117243', 'Sameen Javed', '242328', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(380, '117244', 'Ammar Malik', '242346', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(381, '117245', 'Maryam Ijaz', '242304', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 06:10:14', 0, 'Student'),
(382, '117246', 'Momna Abbas', '245461', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 06:19:29', 0, 'Student'),
(383, '117247', 'Memoona Butt', '245417', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 06:19:29', 0, 'Student'),
(384, '117248', 'Samra Bushra', '245426', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 06:19:29', 0, 'Student'),
(385, '117249', 'Muhammad Mubeen', '245469', 'BS 4th Evening A', 'Information Technology', 0, '2026-02-11 16:35:01', '2026-02-10 06:19:29', 0, 'Student'),
(386, '117250', 'Muhammad Hassan', '245416', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 06:19:29', 0, 'Student'),
(387, '117251', 'Muhammad Asad', '245505', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(388, '117252', 'Muhammad Arfat', '245507', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(389, '117253', 'Muhammad umer', '245506', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(390, '117254', 'Muhammad Mahad', '245508', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(391, '117255', 'Muhammad Ahmad', '245512', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(392, '117256', 'Muhammad Ahsan shehzad', '245495', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(393, '117257', 'Sawera asmat', '245483', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(394, '117258', 'Arub', '245489', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(395, '117259', 'Gulnaz', '245480', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(396, '117260', 'Sayyam akhlas', '245490', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(397, '117261', 'Ahmed riaz', '245526', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(398, '117262', 'Sabtain', '245482', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(399, '117263', 'Maryam', '245492', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(400, '117264', 'Asad Ali', '245484', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(401, '117265', 'Umair amir', '245532', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(402, '117266', 'Noor fatima', '245514', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(403, '117267', 'Nimra saeed', '245524', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(404, '117268', 'Rehman ahmed', '245500', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(405, '117269', 'Muhammad usman tariq', '245509', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(406, '117270', 'Mahrukh hashmi', '245486', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-10 06:27:25', 0, 'Student'),
(407, '117271', 'Muneeb', '232701', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(408, '117272', 'Anaya', '232704', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(409, '117273', 'Arham', '232705', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(410, '117274', 'Kashaf', '232711', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(411, '117275', 'Haseeb Nasar', '232712', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(412, '117276', 'Ali', '232713', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(413, '117277', 'Omais', '232715', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(414, '117278', 'Eman', '232716', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(415, '117279', 'S Mohsin', '232722', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(416, '117280', 'Abdul Hadi', '232723', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(417, '117281', 'Esha', '232725', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(418, '117282', 'Samra', '232726', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(419, '117283', 'Sufwan', '232728', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(420, '117284', 'Umar', '232731', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(421, '117285', 'Rizwan', '232732', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(422, '117286', 'Ayesha', '232733', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(423, '117287', 'Ali Hamza', '232736', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(424, '117288', 'Rimsha', '232738', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(425, '117289', 'Hassan', '232740', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(426, '117290', 'Bilal', '232747', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(427, '117291', 'saad', '232753', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(428, '117292', 'Humsa', '232756', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(429, '117293', 'Sovaiba Younas', '232721', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(430, '117294', 'Sehar Iqbal', '232720', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 06:50:04', 0, 'Student'),
(431, '117295', 'Aansa Ramzan', '234298', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(432, '117296', 'Shama', '225270', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(433, '117297', 'Nawal Zahra', '234285', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(434, '117298', 'Khaleel Ahmad', '234294', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(435, '117299', 'Daniyal', '234302', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(436, '117300', 'Muhammad', '234299', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(437, '117301', 'Ahmad Maqsood', '234303', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(438, '117302', 'Zain Ul Abideen', '234288', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(439, '117303', 'Umair maqsood', '234307', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(440, '117304', 'Ayesha Munawar', '234315', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:01:38', 0, 'Student'),
(441, '117305', 'Saad Hassan', '235155', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(442, '117306', 'Saad Ali Shah', '235162', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(443, '117307', 'Jawad Ali Shah', '235173', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(444, '117308', 'Mariam', '235150', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(445, '117309', 'Ammara Naeem', '235168', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(446, '117310', 'Arbaaz', '235143', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(447, '117311', 'Husnain', '235139', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(448, '117312', 'Saim Naveed', '235149', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(449, '117313', 'Zille Huma', '235140', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(450, '117314', 'Gulam Dastgeer', '235146', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(451, '117315', 'wajid Ali', '235160', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(452, '117316', 'Zain Ali', '235154', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(453, '117317', 'Khadija', '235148', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(454, '117318', 'Muzzamil Fatima', '235156', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(455, '117319', 'Atif Raza', '235174', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(456, '117320', 'Aisha Ahmad', '235161', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(457, '117321', 'Muzzamil', '235137', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(458, '117322', 'Afifa', '235138', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(459, '117323', 'M Aqeel', '235147', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(460, '117324', 'Areeb', '235153', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(461, '117325', 'Ammar', '235166', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(462, '117326', 'Abdul Moiz', '235167', 'BS 6th Morning Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:12:58', 0, 'Student'),
(463, '117327', 'Ayesha Fatima', '235303', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(464, '117328', 'Ali Nawaz Khan', '235305', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(465, '117329', 'Abdul Rehman', '235306', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(466, '117330', 'Muhammad Hamza', '235309', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(467, '117331', 'Hammad Ali', '235310', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(468, '117332', 'Adnan Haider', '235311', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(469, '117333', 'Muhammad Usman', '235312', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(470, '117334', 'Arham Ali', '235313', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(471, '117335', 'Hafsa Dilawar', '235314', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(472, '117336', 'Muhammad Talha', '235315', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(473, '117337', 'Hafiz Usama', '235316', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(474, '117338', 'Muhammad Siddique', '235317', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(475, '117339', 'Malyika Rashid', '235320', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(476, '117340', 'Sakhawat Ali', '235322', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(477, '117341', 'Hazima Maria', '235324', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(478, '117342', 'Zain Ul Abdin', '235325', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(479, '117343', 'Farman Ali', '235332', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(480, '117344', 'Muhammad Ahmad', '235335', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(481, '117345', 'Abdullah Shahid', '235337', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(482, '117346', 'Aiman Usman', '235338', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(483, '117347', 'Faiq Ul Hassan', '235343', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(484, '117348', 'Waleed Amjad', '235345', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(485, '117349', 'Arham Lateef', '235346', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(486, '117350', 'Abdullah Chaudhary', '235347', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(487, '117351', 'Fahad Rafique', '235350', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(488, '117352', 'Sameen', '235352', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(489, '117353', 'Sajjad Ahmad', '235353', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(490, '117354', 'M Husnain', '246788', 'MS Students', 'Information Technology', 0, NULL, '2026-02-10 07:16:21', 0, 'Student'),
(491, '117355', 'Muhammad Sher', '248047', 'BS 8th Bridging A', 'Information Technology', 0, NULL, '2026-02-10 07:25:41', 0, 'Student'),
(492, '117356', 'M Hassan', '225269', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:29:23', 0, 'Student'),
(493, '117357', 'Ramen Shahzad', '232748', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 07:33:24', 0, 'Student'),
(494, '117358', 'Amna Sarfraz', '232745', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 07:35:16', 0, 'Student'),
(495, '117359', 'Saeed Ahmad', '250895', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 07:40:08', 0, 'Student'),
(496, '117360', 'Muhammad Usman', '250900', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 07:40:27', 0, 'Student'),
(497, '117361', 'Own Zahid', '250912', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 07:41:31', 0, 'Student'),
(498, '117362', 'Eman Arif', '250917', 'BS 2nd Morning', 'Information Technology', 0, NULL, '2026-02-10 07:42:04', 0, 'Student'),
(499, '117363', 'Malaika Shahid', '222172', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(500, '117364', 'Memona Afzal', '222159', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(501, '117365', 'Farwa Zainab', '222666', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(502, '117366', 'Anees Zafar', '222145', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(503, '117367', 'Faizan Ul Haq', '225225', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(504, '117368', 'Mehsan Azeen', '222173', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(505, '117369', 'Talha Khalid', '225253', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student');
INSERT INTO `tickets` (`id`, `ticket_serial`, `student_name`, `roll_no`, `class_section`, `department`, `has_entered`, `entry_time`, `created_at`, `is_manual`, `guest_category`) VALUES
(506, '117370', 'Arham Zia', '222168', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(507, '117371', 'Zain Sial', '222181', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(508, '117372', 'Zara Naseer', '222142', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(509, '117373', 'Fiza Arooj', '222144', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-10 07:52:16', 0, 'Student'),
(510, '117374', 'Rabia', '225264', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 07:56:50', 0, 'Student'),
(511, '117375', 'Ahsan Sohail', '248077', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-10 08:24:31', 0, 'Student'),
(512, '117376', 'Zoha Ijaz', '242322', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 08:31:20', 0, 'Student'),
(513, '117377', 'Maryam', '242314', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 08:31:20', 0, 'Student'),
(514, '117378', 'Wania', '242310', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 08:31:20', 0, 'Student'),
(515, '117379', 'Areeba', '242318', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 08:31:20', 0, 'Student'),
(517, '117381', 'Talha Zahid', '242315', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-10 08:31:20', 0, 'Student'),
(518, '117382', 'Maria Saeed', '232729', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 08:33:40', 0, 'Student'),
(519, '117383', 'Aqsa', '232719', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-10 08:34:04', 0, 'Student'),
(520, '117384', 'Adil Hassan', '245451', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(521, '117385', 'Khwaja Rayyan', '245412', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(522, '117386', 'Mani Khokhar', '245433', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(523, '117387', 'Talha', '245411', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(524, '117388', 'Asma', '245422', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(525, '117389', 'Sameeha', '245435', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(526, '117390', 'Abu Bakar', '245444', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(527, '117391', 'Husnain Abbas', '245463', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:05', 0, 'Student'),
(528, '117392', 'Hina Asghar', '245458', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 08:53:45', 0, 'Student'),
(529, '117393', 'Muhammad Rehmat Waleed', '235326', 'BS 6th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-10 08:56:39', 0, 'Student'),
(530, '117394', 'Asna Jannat', '242250', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 09:33:17', 0, 'Student'),
(531, '117395', 'Muneeb Naseem', '242241', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 09:33:43', 0, 'Student'),
(532, '117396', 'Taaha Saddique', '242282', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-10 09:34:03', 0, 'Student'),
(533, '117397', 'Qadeer Khan', '245457', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 09:41:11', 0, 'Student'),
(534, '117398', 'Muhammad Ali', '245413', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-10 09:41:41', 0, 'Student'),
(535, '117399', 'Ashraf Khan', '248087', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-10 09:56:01', 0, 'Student'),
(536, '117400', 'Hamza Sajid', '245442', 'BS 4th Evening A', 'Information Technology', 0, '2026-02-11 16:24:41', '2026-02-10 10:03:56', 0, 'Student'),
(537, '117401', 'Muhammad Ravi', '252665', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 05:56:57', 0, 'Student'),
(538, '117402', 'Muhammad Ibrahim', '252659', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 05:57:13', 0, 'Student'),
(539, '117403', 'Muhammad Faizan', '252646', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 05:57:33', 0, 'Student'),
(540, '117404', 'Umer Ashar', '248086', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-11 06:14:04', 0, 'Student'),
(541, '117405', 'Jawad Sarfraz', '242257', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-11 06:18:20', 0, 'Student'),
(542, '117406', 'Jawad Asghar', '242248', 'BS 4th Morning A', 'Information Technology', 0, NULL, '2026-02-11 06:18:44', 0, 'Student'),
(543, '117380', 'Zafar Hussain', '242309', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-11 06:20:14', 0, 'Student'),
(544, '117407', 'Muhammad ismail', '242340', 'BS 4th Morning B', 'Information Technology', 0, NULL, '2026-02-11 06:20:50', 0, 'Student'),
(545, '117408', 'Abdullah Amjad', '245448', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-11 06:22:15', 0, 'Student'),
(546, '117409', 'Wajeeha Izhar', '245474', 'BS 4th Evening B', 'Information Technology', 0, NULL, '2026-02-11 06:31:11', 0, 'Student'),
(547, '117410', 'Sajid hussain', '234304', 'BS 6th Evening Regular', 'Information Technology', 0, NULL, '2026-02-11 06:35:03', 0, 'Student'),
(548, '117411', 'Usman Zafar', '225178', 'BS 8th Morning Shifted', 'Information Technology', 0, '2026-02-11 15:32:25', '2026-02-11 06:38:59', 0, 'Student'),
(549, '117412', 'Azeem Aslam', '225183', 'BS 8th Morning Shifted', 'Information Technology', 0, '2026-02-11 15:29:48', '2026-02-11 06:39:21', 0, 'Student'),
(550, '117413', 'Abdul Rehman', '225256', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-11 06:46:09', 0, 'Student'),
(551, '117414', 'Mahad Asalm', '225232', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-11 06:46:42', 0, 'Student'),
(552, '117415', 'Ahsan', '225251', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-11 06:47:41', 0, 'Student'),
(553, '117416', 'Asia Saeed', '222110', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 06:52:22', 0, 'Student'),
(554, '117417', 'Kareem-Ullah', '222087', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 06:53:41', 0, 'Student'),
(555, '117418', 'Hafiz Junaid', '222140', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 06:55:40', 0, 'Student'),
(556, '117419', 'Noor Fatima', '222187', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-11 07:00:20', 0, 'Student'),
(557, '117420', 'Muhammad Muneeb', '222152', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-11 07:00:57', 0, 'Student'),
(558, '117421', 'Hashir', '222167', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-11 07:01:40', 0, 'Student'),
(559, '117422', 'Abdul Ansar', '222151', 'BS 8th Evening Regular', 'Information Technology', 0, NULL, '2026-02-11 07:02:19', 0, 'Student'),
(560, '117423', 'Sayyam', '225220', 'BS 8th Evening Shifted', 'Information Technology', 0, NULL, '2026-02-11 07:06:23', 0, 'Student'),
(561, '117424', 'Alishba Rasheed', '222099', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 07:08:58', 0, 'Student'),
(562, '117425', 'Muhammad Tayyab', '252642', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 07:12:07', 0, 'Student'),
(563, '117426', 'Meher-Un-Nissa', '222119', 'BS 8th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 07:18:25', 0, 'Student'),
(564, '117427', 'Fazeen', '241635', 'MS Students', 'Information Technology', 0, NULL, '2026-02-11 07:22:45', 0, 'Student'),
(565, '117428', 'Abdullah Khalid', '252652', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 07:25:18', 0, 'Student'),
(566, '117429', 'Haseeb Ali Khan', '248075', 'BS 8th Bridging B', 'Information Technology', 0, NULL, '2026-02-11 07:30:46', 0, 'Student'),
(567, '117430', 'Rizwan CR', '232708', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 07:33:52', 0, 'Student'),
(568, '117431', 'Haseeb Shahid', '232744', 'BS 6th Morning Regular', 'Information Technology', 0, NULL, '2026-02-11 08:11:02', 0, 'Student'),
(569, '117432', 'Munawar Hassan', '246772', 'MS Students', 'Information Technology', 0, NULL, '2026-02-11 08:24:10', 0, 'Student'),
(570, '117433', 'Zahid Gill', '241642', 'MS Students', 'Information Technology', 0, NULL, '2026-02-11 08:41:57', 0, 'Student'),
(571, '117434', 'Aqib Sohail', '241644', 'MS Students', 'Information Technology', 0, NULL, '2026-02-11 08:42:21', 0, 'Student'),
(572, '117435', 'Abbas Pathan', '241637', 'MS Students', 'Information Technology', 0, NULL, '2026-02-11 08:43:26', 0, 'Student'),
(573, '117436', 'Abdul Moiz', '252670', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 09:20:27', 0, 'Student'),
(574, '117437', 'Ahmad Ali', '252672', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 09:22:29', 0, 'Student'),
(575, '117438', 'M Umer', '252673', 'BS 2nd Evening', 'Information Technology', 0, NULL, '2026-02-11 09:22:50', 0, 'Student'),
(576, '117439', 'Saba Niaz', '245462', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-11 09:23:25', 0, 'Student'),
(577, '117440', 'M Anas', '245427', 'BS 4th Evening A', 'Information Technology', 0, NULL, '2026-02-11 09:23:50', 0, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'staff', 'pass123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_serial` (`ticket_serial`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
