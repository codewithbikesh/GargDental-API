-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 09:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omsok`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_zone`
--

CREATE TABLE `address_zone` (
  `id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `zone_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address_zone`
--

INSERT INTO `address_zone` (`id`, `city_id`, `zone_name`, `created_at`, `updated_at`) VALUES
(3, 19, 'Balaju - Bypass', '2024-09-26 15:53:14', '2024-09-26 15:53:14'),
(4, 19, 'Balaju Chauki', '2024-09-26 15:53:28', '2024-09-26 15:53:28'),
(5, 19, 'Balaju Chowk', '2024-09-26 15:53:41', '2024-09-26 15:53:41'),
(6, 19, 'Balaju - Machha Pokhari', '2024-09-26 15:53:59', '2024-09-26 15:53:59'),
(7, 19, 'Banasthali', '2024-09-26 15:54:15', '2024-09-26 15:54:15'),
(8, 19, 'Banasthali Dhungedhara', '2024-09-26 15:54:32', '2024-09-26 15:54:32'),
(9, 19, 'Kaldhara', '2024-09-26 15:54:51', '2024-09-26 15:54:51'),
(10, 19, 'Khusibu', '2024-09-26 15:55:03', '2024-09-26 15:55:03'),
(11, 19, 'Paknajol', '2024-09-26 15:55:14', '2024-09-26 15:55:14'),
(12, 19, 'People\'s Dental Campus Area', '2024-09-26 15:55:31', '2024-09-26 15:55:31'),
(13, 19, 'Sorhakhutte', '2024-09-26 15:55:44', '2024-09-26 15:55:44'),
(14, 1, 'Durbarmarg', '2024-09-26 15:58:46', '2024-09-26 15:58:46'),
(15, 1, 'Hattisar Area', '2024-09-26 15:58:58', '2024-09-26 15:58:58'),
(16, 1, 'Jamal', '2024-09-26 15:59:07', '2024-09-26 15:59:07'),
(17, 1, 'Kamal Pokhari Area', '2024-09-26 15:59:19', '2024-09-26 15:59:19'),
(18, 1, 'Kantipath', '2024-09-26 15:59:28', '2024-09-26 15:59:28'),
(19, 1, 'Naxal Bhagwati Bahal Area', '2024-09-26 15:59:48', '2024-09-26 15:59:48'),
(20, 1, 'Naxal Narayan Chaur', '2024-09-26 16:00:03', '2024-09-26 16:00:03'),
(21, 5, 'Dhobichaur', '2024-09-26 16:00:55', '2024-09-26 16:00:55'),
(22, 5, 'Gairidhara', '2024-09-26 16:01:05', '2024-09-26 16:01:05'),
(23, 5, 'Lazimpat', '2024-09-26 16:01:15', '2024-09-26 16:01:15'),
(24, 6, 'Basundhara inside ringroad area', '2024-09-30 12:57:08', '2024-09-30 12:57:08'),
(25, 6, 'Narayan Gopal Chowk Area', '2024-09-30 12:57:56', '2024-09-30 12:57:56'),
(26, 6, 'Teaching Hospital', '2024-09-30 12:58:23', '2024-09-30 12:58:23'),
(27, 7, 'Bishalnagar', '2024-09-30 13:01:08', '2024-09-30 13:01:08'),
(28, 7, 'Chandol', '2024-10-02 11:14:26', '2024-10-02 11:14:26'),
(29, 7, 'Chapal Karkhana', '2024-10-02 11:14:47', '2024-10-02 11:14:47'),
(30, 7, 'Chun Devi', '2024-10-02 11:14:58', '2024-10-02 11:14:58'),
(31, 7, 'Dhumbarahi Chowk', '2024-10-02 11:15:12', '2024-10-02 11:15:12'),
(32, 7, 'Dhumbarahi Pipalbot', '2024-10-02 11:15:26', '2024-10-02 11:15:26'),
(33, 7, 'Sukedhara', '2024-10-02 11:15:40', '2024-10-02 11:15:40'),
(34, 40, 'Baluwatar', '2024-10-02 11:16:22', '2024-10-02 11:16:22'),
(35, 40, 'Lamtangin Marg', '2024-10-02 11:16:43', '2024-10-02 11:16:43'),
(36, 40, 'Pabitra Workshop Area', '2024-10-02 11:16:58', '2024-10-02 11:16:58'),
(37, 40, 'Panchakanya School Area', '2024-10-02 11:17:11', '2024-10-02 11:17:11'),
(38, 40, 'Panipokhari', '2024-10-02 11:17:23', '2024-10-02 11:17:23'),
(39, 8, 'Bhatbhateni', '2024-10-02 11:17:44', '2024-10-02 11:17:44'),
(40, 8, 'Handigaun', '2024-10-02 11:17:55', '2024-10-02 11:17:55'),
(41, 8, 'Maligaun', '2024-10-02 11:18:04', '2024-10-02 11:18:04'),
(42, 8, 'Sano Gaucharan', '2024-10-02 11:18:16', '2024-10-02 11:18:16'),
(43, 8, 'Tangal', '2024-10-02 11:18:26', '2024-10-02 11:18:26'),
(44, 10, 'Chabahil Chowk', '2024-10-02 11:19:35', '2024-10-02 11:19:35'),
(45, 10, 'Chuchepati', '2024-10-02 11:19:46', '2024-10-02 11:19:46'),
(46, 10, 'Gangahiti', '2024-10-02 11:19:57', '2024-10-02 11:19:57'),
(47, 10, 'Gaurighat', '2024-10-02 11:20:09', '2024-10-02 11:20:09'),
(48, 10, 'Gopilrishna Hall Area', '2024-10-02 11:20:23', '2024-10-02 11:20:23'),
(49, 10, 'Kalopul', '2024-10-02 11:20:33', '2024-10-02 11:20:33'),
(50, 10, 'Kumaristhan', '2024-10-02 11:20:46', '2024-10-02 11:20:46'),
(51, 10, 'Maijubahal', '2024-10-02 11:20:58', '2024-10-02 11:20:58'),
(52, 10, 'Mitrapark', '2024-10-02 11:21:11', '2024-10-02 11:21:11'),
(53, 10, 'Siphal', '2024-10-02 11:21:19', '2024-10-02 11:21:19'),
(54, 11, 'Gaushala', '2024-10-02 11:21:53', '2024-10-02 11:21:53'),
(55, 11, 'Jayabageshwori', '2024-10-02 11:22:06', '2024-10-02 11:22:06'),
(56, 11, 'Pashupatinath', '2024-10-02 11:22:23', '2024-10-02 11:22:23'),
(57, 11, 'Pingalasthan', '2024-10-02 11:22:35', '2024-10-02 11:22:35'),
(58, 11, 'Ram Mandir', '2024-10-02 11:22:45', '2024-10-02 11:22:45'),
(59, 12, 'Airport', '2024-10-02 11:23:02', '2024-10-02 11:23:02'),
(60, 12, 'Battisputali', '2024-10-02 11:23:14', '2024-10-02 11:23:14'),
(61, 12, 'Gaurigaun', '2024-10-02 11:23:23', '2024-10-02 11:23:23'),
(62, 12, 'Old Baneshwor', '2024-10-02 11:23:35', '2024-10-02 11:23:35'),
(63, 12, 'Sinamangal', '2024-10-02 11:23:44', '2024-10-02 11:23:44'),
(64, 12, 'Tilganga', '2024-10-02 11:23:55', '2024-10-02 11:23:55'),
(65, 13, 'Apex College Area - Pipalbot', '2024-10-02 11:24:46', '2024-10-02 11:24:46'),
(66, 13, 'Bijulibazar', '2024-10-02 11:24:58', '2024-10-02 11:24:58'),
(67, 13, 'Buddhanagar', '2024-10-02 11:25:08', '2024-10-02 11:25:08'),
(68, 13, 'Civil Hospital Area', '2024-10-02 11:25:22', '2024-10-02 11:25:22'),
(69, 13, 'Ekta Marg', '2024-10-02 11:25:32', '2024-10-02 11:25:32'),
(70, 13, 'New Baneshwor Chowk', '2024-10-02 11:25:45', '2024-10-02 11:25:45'),
(71, 13, 'Ratna Rajya Area', '2024-10-02 11:25:59', '2024-10-02 11:25:59'),
(72, 13, 'Shankhamul Area', '2024-10-02 11:26:13', '2024-10-02 11:26:13'),
(73, 13, 'Thapagaun Area', '2024-10-02 11:26:24', '2024-10-02 11:26:24'),
(74, 14, 'Babarmahal', '2024-10-02 11:27:07', '2024-10-02 11:27:07'),
(75, 14, 'Maitighar', '2024-10-02 11:27:18', '2024-10-02 11:27:18'),
(76, 14, 'Shahid Gate', '2024-10-02 11:27:28', '2024-10-02 11:27:28'),
(77, 14, 'Thapathali', '2024-10-02 11:27:39', '2024-10-02 11:27:39'),
(78, 14, 'Tripureshwor', '2024-10-02 11:27:49', '2024-10-02 11:27:49'),
(79, 15, 'Teku', '2024-10-02 11:28:18', '2024-10-02 11:28:18'),
(80, 16, 'Bafal', '2024-10-02 11:28:31', '2024-10-02 11:28:31'),
(81, 16, 'Kalimati', '2024-10-02 11:28:49', '2024-10-02 11:28:49'),
(82, 16, 'Soalteemode', '2024-10-02 11:29:05', '2024-10-02 11:29:05'),
(83, 16, 'Tahachal', '2024-10-02 11:29:20', '2024-10-02 11:29:20'),
(84, 16, 'Tankeshwor', '2024-10-02 11:29:34', '2024-10-02 11:29:34'),
(85, 17, 'Balkhu', '2024-10-02 11:29:58', '2024-10-02 11:29:58'),
(86, 17, 'Kalanki Chowk', '2024-10-02 11:31:29', '2024-10-02 11:31:29'),
(87, 17, 'Kuleshwor', '2024-10-02 11:32:05', '2024-10-02 11:32:05'),
(88, 17, 'Ravi Bhawan', '2024-10-02 11:32:16', '2024-10-02 11:32:16'),
(89, 18, 'Bahiti', '2024-10-02 11:32:42', '2024-10-02 11:32:42'),
(90, 18, 'Bijeshwori', '2024-10-02 11:32:55', '2024-10-02 11:32:55'),
(91, 18, 'Chhauni', '2024-10-02 11:33:04', '2024-10-02 11:33:04'),
(92, 18, 'Dallu', '2024-10-02 11:33:13', '2024-10-02 11:33:13'),
(93, 18, 'Kimdol', '2024-10-02 11:33:26', '2024-10-02 11:33:26'),
(94, 18, 'Sobhabhagwati', '2024-10-02 11:33:44', '2024-10-02 11:33:44'),
(95, 18, 'Swayambhu - Bhuikhel', '2024-10-02 11:34:00', '2024-10-02 11:34:00'),
(96, 20, 'Chhetrapati', '2024-10-02 11:34:23', '2024-10-02 11:34:23'),
(97, 20, 'Dhalko', '2024-10-02 11:34:36', '2024-10-02 11:34:36'),
(98, 20, 'Dhobichaur', '2024-10-02 11:34:49', '2024-10-02 11:34:49'),
(99, 21, 'Bhurungkhel', '2024-10-02 11:35:19', '2024-10-02 11:35:19'),
(100, 21, 'Raktakali', '2024-10-02 11:35:31', '2024-10-02 11:35:31'),
(101, 22, 'Hanumandhoka', '2024-10-02 11:35:55', '2024-10-02 11:35:55'),
(102, 22, 'Tamsipakha', '2024-10-02 11:36:07', '2024-10-02 11:36:07'),
(103, 23, 'Jaishidebal', '2024-10-02 11:36:40', '2024-10-02 11:36:40'),
(104, 23, 'Marutole', '2024-10-02 11:36:52', '2024-10-02 11:36:52'),
(105, 24, 'Ikubahal', '2024-10-02 11:37:20', '2024-10-02 11:37:20'),
(106, 24, 'Lagantole', '2024-10-02 11:37:34', '2024-10-02 11:37:34'),
(107, 24, 'Tebahal', '2024-10-02 11:37:47', '2024-10-02 11:37:47'),
(108, 25, 'Dharmapath', '2024-10-02 11:38:11', '2024-10-02 11:38:11'),
(109, 25, 'Khichapokhari', '2024-10-02 11:38:25', '2024-10-02 11:38:25'),
(110, 25, 'Newroad', '2024-10-02 11:38:38', '2024-10-02 11:38:38'),
(111, 25, 'Om Bahal Area', '2024-10-02 11:38:49', '2024-10-02 11:38:49'),
(112, 25, 'Sundhara', '2024-10-02 11:39:05', '2024-10-02 11:39:05'),
(113, 26, 'Basantapur', '2024-10-02 11:39:24', '2024-10-02 11:39:24'),
(114, 27, 'Indrachowk', '2024-10-02 11:39:43', '2024-10-02 11:39:43'),
(115, 27, 'Naradevi', '2024-10-02 11:39:56', '2024-10-02 11:39:56'),
(116, 28, 'Asan', '2024-10-02 11:40:17', '2024-10-02 11:40:17'),
(117, 28, 'Kilagal', '2024-10-02 11:40:29', '2024-10-02 11:40:29'),
(118, 28, 'Tengal', '2024-10-02 11:40:43', '2024-10-02 11:40:43'),
(119, 29, 'Gongabu Chowk', '2024-10-02 11:41:00', '2024-10-02 11:41:00'),
(120, 29, 'Kapurdhara', '2024-10-02 11:41:19', '2024-10-02 11:41:19'),
(121, 29, 'Mhepi', '2024-10-02 11:41:31', '2024-10-02 11:41:31'),
(122, 29, 'Mitra Nagar', '2024-10-02 11:41:45', '2024-10-02 11:41:45'),
(123, 29, 'Naya Bus Park', '2024-10-02 11:41:59', '2024-10-02 11:41:59'),
(124, 29, 'Ranibari', '2024-10-02 11:42:12', '2024-10-02 11:42:12'),
(125, 29, 'Samakhusi', '2024-10-02 11:42:25', '2024-10-02 11:42:25'),
(126, 30, 'Galkopakha', '2024-10-02 11:42:59', '2024-10-02 11:42:59'),
(127, 30, 'Jyatha', '2024-10-02 11:43:11', '2024-10-02 11:43:11'),
(128, 30, 'Lainchaur', '2024-10-02 11:43:22', '2024-10-02 11:43:22'),
(129, 30, 'Thamel', '2024-10-02 11:43:31', '2024-10-02 11:43:31'),
(130, 31, 'Bhotahiti', '2024-10-02 11:43:56', '2024-10-02 11:43:56'),
(131, 31, 'Kamalakshi', '2024-10-02 11:44:13', '2024-10-02 11:44:13'),
(132, 32, 'Bagbazar', '2024-10-02 11:44:32', '2024-10-02 11:44:32'),
(133, 32, 'Bhrikutimandap', '2024-10-02 11:44:43', '2024-10-02 11:44:43'),
(134, 32, 'Ratnapark', '2024-10-02 11:44:55', '2024-10-02 11:44:55'),
(135, 33, 'Bir Hospital', '2024-10-02 11:45:26', '2024-10-02 11:45:26'),
(136, 33, 'Kamaladi', '2024-10-02 11:45:38', '2024-10-02 11:45:38'),
(137, 33, 'Tundikhel', '2024-10-02 11:45:48', '2024-10-02 11:45:48'),
(138, 34, 'Anamnagar', '2024-10-02 11:46:25', '2024-10-02 11:46:25'),
(139, 34, 'Ghattekulo', '2024-10-02 11:46:55', '2024-10-02 11:46:55'),
(140, 34, 'Singha Durbar', '2024-10-02 11:47:12', '2024-10-02 11:47:12'),
(141, 35, 'Bhaktapur Buspark', '2024-10-02 11:48:36', '2024-10-02 11:48:36'),
(142, 35, 'Exhibition Road', '2024-10-02 11:48:55', '2024-10-02 11:48:55'),
(143, 35, 'Newplaza Area', '2024-10-02 11:49:09', '2024-10-02 11:49:09'),
(144, 35, 'Putalisadak', '2024-10-02 11:49:21', '2024-10-02 11:49:21'),
(145, 36, 'Dillibazar Pipalbot', '2024-10-02 11:50:42', '2024-10-02 11:50:42'),
(146, 36, 'Gyaneshwor', '2024-10-02 11:51:10', '2024-10-02 11:51:10'),
(147, 36, 'Maitidevi', '2024-10-02 11:51:23', '2024-10-02 11:51:23'),
(148, 37, 'Aloknagar', '2024-10-02 11:53:04', '2024-10-02 11:53:04'),
(149, 37, 'Bhinsengola', '2024-10-02 11:53:29', '2024-10-02 11:53:29'),
(150, 37, 'Chhitij Nagar', '2024-10-02 11:53:46', '2024-10-02 11:53:46'),
(151, 37, 'Katyani Chowk Area', '2024-10-02 11:53:59', '2024-10-02 11:53:59'),
(152, 37, 'Milan Chowk Area', '2024-10-02 11:54:12', '2024-10-02 11:54:12'),
(153, 37, 'Min Bhawan', '2024-10-02 11:54:22', '2024-10-02 11:54:22'),
(154, 37, 'Shantinagar', '2024-10-02 11:54:34', '2024-10-02 11:54:34'),
(155, 38, 'Jadibuti Area', '2024-10-02 11:55:09', '2024-10-02 11:55:09'),
(156, 38, 'Kandaghari', '2024-10-02 11:55:27', '2024-10-02 11:55:27'),
(157, 38, 'Koteshwor Chowk', '2024-10-02 11:55:40', '2024-10-02 11:55:40'),
(158, 38, 'Mahadevsthan', '2024-10-02 11:55:57', '2024-10-02 11:55:57'),
(159, 38, 'Narephant', '2024-10-02 11:56:07', '2024-10-02 11:56:07'),
(160, 38, 'Pepsicola Area', '2024-10-02 11:56:19', '2024-10-02 11:56:19'),
(161, 39, 'Subidhanagar', '2024-10-02 11:56:42', '2024-10-02 11:56:42'),
(162, 39, 'Tinkune', '2024-10-02 11:56:54', '2024-10-02 11:56:54'),
(163, 42, 'Balkot Area', '2024-10-02 11:58:32', '2024-10-02 11:58:32'),
(164, 42, 'Biruwa Buspark Area', '2024-10-02 11:58:47', '2024-10-02 11:58:47'),
(165, 42, 'Bode', '2024-10-02 11:58:56', '2024-10-02 11:58:56'),
(166, 42, 'Duwakot', '2024-10-02 11:59:04', '2024-10-02 11:59:04'),
(167, 42, 'Gaththaghar Area', '2024-10-02 11:59:23', '2024-10-02 11:59:23'),
(168, 42, 'Jagati Area', '2024-10-02 11:59:35', '2024-10-02 11:59:35'),
(169, 42, 'Kamalbinayak Area', '2024-10-02 11:59:48', '2024-10-02 11:59:48'),
(170, 42, 'Katunje Area', '2024-10-02 12:00:19', '2024-10-02 12:00:19'),
(171, 42, 'Kaushaltar Area', '2024-10-02 12:00:41', '2024-10-02 12:00:41'),
(172, 42, 'Kharipati', '2024-10-02 12:00:56', '2024-10-02 12:00:56'),
(173, 42, 'Lokanthali Area', '2024-10-02 12:01:15', '2024-10-02 12:01:15'),
(174, 42, 'Naya Thimi', '2024-10-02 12:01:32', '2024-10-02 12:01:32'),
(175, 42, 'Purano Thimi', '2024-10-02 12:01:43', '2024-10-02 12:01:43'),
(176, 42, 'Palase', '2024-10-02 12:01:51', '2024-10-02 12:01:51'),
(177, 42, 'Sallaghari Area', '2024-10-02 12:02:04', '2024-10-02 12:02:04'),
(178, 42, 'Sano Thimi Area', '2024-10-02 12:02:15', '2024-10-02 12:02:15'),
(179, 42, 'Sirutar', '2024-10-02 12:02:25', '2024-10-02 12:02:25'),
(180, 42, 'Suryabinayak Area', '2024-10-02 12:02:43', '2024-10-02 12:02:43'),
(183, 41, 'Bouddha Area - Dibya Nagar', '2024-10-02 17:03:16', '2024-10-02 17:03:16'),
(184, 41, 'Bouddha Area - Kumarigal', '2024-10-02 17:03:39', '2024-10-02 17:03:39'),
(185, 41, 'Bouddha Area - Nayabasti', '2024-10-02 17:03:54', '2024-10-02 17:03:54'),
(186, 41, 'Bouddha Area', '2024-10-02 17:04:05', '2024-10-02 17:04:05'),
(187, 41, 'Bouddha Area - Fulbari', '2024-10-02 17:04:16', '2024-10-02 17:04:16'),
(188, 41, 'Bouddha Area - Tushal', '2024-10-02 17:04:27', '2024-10-02 17:04:27'),
(189, 41, 'Budhanilkantha - Baluwakhani', '2024-10-02 17:04:53', '2024-10-02 17:04:53'),
(190, 41, 'Budhanilkantha - Bansbari Area', '2024-10-02 17:05:12', '2024-10-02 17:05:12'),
(191, 41, 'Budhanilkantha - Budhanilkantha Nayapul', '2024-10-02 17:05:31', '2024-10-02 17:05:31'),
(192, 41, 'Budhanilkantha - Chapali Area', '2024-10-02 17:05:48', '2024-10-02 17:05:48'),
(193, 41, 'Budhanilkantha - Chunikhel Buspark Area', '2024-10-02 17:06:03', '2024-10-02 17:06:03'),
(194, 41, 'Budhanilkantha - Golfutar Area', '2024-10-02 17:06:15', '2024-10-02 17:06:15'),
(195, 41, 'Budhanilkantha - Hattigauda Area', '2024-10-02 17:06:28', '2024-10-02 17:06:28'),
(196, 41, 'Budhanilkantha - Kapan Aakasedhara', '2024-10-02 17:06:41', '2024-10-02 17:06:41'),
(197, 41, 'Budhanilkantha - Kapan Chauki Area', '2024-10-02 17:06:58', '2024-10-02 17:06:58'),
(198, 41, 'Budhanilkantha - Kapan Saraswatinagar', '2024-10-02 17:07:15', '2024-10-02 17:07:15'),
(199, 41, 'Budhanilkantha - Mandikhatar Area', '2024-10-02 17:07:36', '2024-10-02 17:07:36'),
(200, 41, 'Budhanilkantha - Narayanthan Temple Area', '2024-10-02 17:07:54', '2024-10-02 17:07:54'),
(201, 41, 'Budhanilkantha - Paiyatar Area', '2024-10-02 17:08:11', '2024-10-02 17:08:11'),
(202, 41, 'Budhanilkantha - Pasikot Area', '2024-10-02 17:08:26', '2024-10-02 17:08:26'),
(203, 41, 'Chandragiri - Balambu Area', '2024-10-02 17:10:02', '2024-10-02 17:10:02'),
(204, 41, 'Chandragiri - Dahachowk', '2024-10-02 17:10:21', '2024-10-02 17:10:21'),
(205, 41, 'Chandragiri - Gurjudhara Area', '2024-10-02 17:10:38', '2024-10-02 17:10:38'),
(206, 41, 'Chandragiri - Kalanki Area', '2024-10-02 17:10:50', '2024-10-02 17:10:50'),
(207, 41, 'Chandragiri - Khadka Gaun', '2024-10-02 17:11:07', '2024-10-02 17:11:07'),
(208, 41, 'Chandragiri - Machhe Gaun', '2024-10-02 17:11:19', '2024-10-02 17:11:19'),
(209, 41, 'Chandragiri - Matatirtha Area', '2024-10-02 17:11:35', '2024-10-02 17:11:35'),
(210, 41, 'Chandragiri - Nagdhunga', '2024-10-02 17:12:17', '2024-10-02 17:12:17'),
(211, 41, 'Chandragiri - Satungal Area', '2024-10-02 17:12:28', '2024-10-02 17:12:28'),
(212, 41, 'Chandragiri - Thankot Checkpost Area', '2024-10-02 17:12:46', '2024-10-02 17:12:46'),
(213, 41, 'Chandragiri - Tinthana Area', '2024-10-02 17:12:58', '2024-10-02 17:12:58'),
(214, 41, 'Dakdhinkali - Chalnakhel', '2024-10-02 17:13:20', '2024-10-02 17:13:20'),
(215, 41, 'Dakshinkali - Pharping', '2024-10-02 17:13:36', '2024-10-02 17:13:36'),
(216, 41, 'Gokarneshwor - Arubari', '2024-10-02 17:14:12', '2024-10-02 17:14:12'),
(217, 41, 'Gokarneshwor - Attarkhel Area', '2024-10-02 17:14:23', '2024-10-02 17:14:23'),
(218, 41, 'Gokarneshwor - Jorpati Area', '2024-10-02 17:14:39', '2024-10-02 17:14:39'),
(219, 41, 'Gokarneshwor - Jorpati Narayantar', '2024-10-02 17:14:56', '2024-10-02 17:14:56'),
(220, 41, 'Gokarneshwor - Jorpati Nayabasti', '2024-10-02 17:15:08', '2024-10-02 17:15:08'),
(221, 41, 'Gokarneshwor - Makalbari', '2024-10-02 17:15:22', '2024-10-02 17:15:22'),
(222, 41, 'Gokarneshwor - Makalbari Dakshindhoka', '2024-10-02 17:15:36', '2024-10-02 17:15:36'),
(223, 41, 'Gokarneshwor - Sundarijal', '2024-10-02 17:15:50', '2024-10-02 17:15:50'),
(224, 41, 'Gokarneshwor - Tinchuli', '2024-10-02 17:16:06', '2024-10-02 17:16:06'),
(225, 41, 'Gokarneshwor - Nayapati', '2024-10-02 17:16:15', '2024-10-02 17:16:15'),
(226, 41, 'Gokarneshwor Temple Area', '2024-10-02 17:16:31', '2024-10-02 17:16:31'),
(227, 41, 'Kageshwori Manohara - GothatarTej Binayak Chowk', '2024-10-02 17:17:01', '2024-10-02 17:17:01'),
(228, 41, 'Kageshwori Manohara - Green Hill City Area', '2024-10-02 17:17:49', '2024-10-02 17:17:49'),
(229, 41, 'Kageshwori Manohara - Mulpani', '2024-10-02 17:18:14', '2024-10-02 17:18:14'),
(230, 41, 'Kageshwori Manohara - Thali', '2024-10-02 17:18:26', '2024-10-02 17:18:26'),
(231, 41, 'Kirtipur - Buspark Area', '2024-10-02 17:18:49', '2024-10-02 17:18:49'),
(232, 41, 'Kirtipur - Chobhar', '2024-10-02 17:19:01', '2024-10-02 17:19:01'),
(233, 41, 'Kirtipur - Nayabazar Area', '2024-10-02 17:19:13', '2024-10-02 17:19:13'),
(234, 41, 'Kirtipur - Panga Area', '2024-10-02 17:19:26', '2024-10-02 17:19:26'),
(235, 41, 'Kirtipur - Taudaha', '2024-10-02 17:19:36', '2024-10-02 17:19:36'),
(236, 41, 'Kirtipur - TU Area', '2024-10-02 17:19:49', '2024-10-02 17:19:49'),
(237, 41, 'Kirtipur - Tyanglaphat Area', '2024-10-02 17:20:01', '2024-10-02 17:20:01'),
(238, 41, 'Nagarjun - Banasthali Kharibot Chowk', '2024-10-02 17:20:30', '2024-10-02 17:20:30'),
(239, 41, 'Nagarjun - Bhimdhunga', '2024-10-02 17:20:42', '2024-10-02 17:20:42'),
(240, 41, 'Nagarjun - Boharatar Area', '2024-10-02 17:20:57', '2024-10-02 17:20:57'),
(241, 41, 'Nagarjun - Buddha Park Area', '2024-10-02 17:21:06', '2024-10-02 17:21:06'),
(242, 41, 'Nagarjun - Dadapauwa Ramkot Area', '2024-10-02 17:21:23', '2024-10-02 17:21:23'),
(243, 41, 'Nagarjun - Naya Naikap', '2024-10-02 17:21:36', '2024-10-02 17:21:36'),
(244, 41, 'Nagarjun - Nursery Chowk', '2024-10-02 17:21:54', '2024-10-02 17:21:54'),
(245, 41, 'Nagarjun - Padma Colony', '2024-10-02 17:22:05', '2024-10-02 17:22:05'),
(246, 41, 'Nagarjun - Purano Naikap', '2024-10-02 17:22:16', '2024-10-02 17:22:16'),
(247, 41, 'Nagarjun - Radhakrishna Mandir', '2024-10-02 17:22:30', '2024-10-02 17:22:30'),
(248, 41, 'Nagarjun - Sano Bharyang Area', '2024-10-02 17:22:41', '2024-10-02 17:22:41'),
(249, 41, 'Nagarjun - Saranpur', '2024-10-02 17:22:54', '2024-10-02 17:22:54'),
(250, 41, 'Nagarjun - Sitapaila Area', '2024-10-02 17:23:03', '2024-10-02 17:23:03'),
(251, 41, 'Nagarjun - Soltee Dobato Area', '2024-10-02 17:23:21', '2024-10-02 17:23:21'),
(252, 41, 'Nagarjun - Syuchatar', '2024-10-02 17:23:36', '2024-10-02 17:23:36'),
(253, 41, 'Nagarjun - Thulo Bharyang Area', '2024-10-02 17:23:48', '2024-10-02 17:23:48'),
(254, 41, 'Nagarjun - Thulo Bharyang Buddha Chowk', '2024-10-02 17:24:05', '2024-10-02 17:24:05'),
(255, 41, 'Nagarjun - Thulo Bharyang Gairigaun', '2024-10-02 17:24:19', '2024-10-02 17:24:19'),
(256, 41, 'Nagarjun - Thulo Bharyang Namgel Chowk', '2024-10-02 17:24:36', '2024-10-02 17:24:36'),
(257, 41, 'Nagarjun - Thulo Bharyang Tindhara', '2024-10-02 17:25:00', '2024-10-02 17:25:00'),
(258, 41, 'Nagarjun - White Gumba', '2024-10-02 17:25:14', '2024-10-02 17:25:14'),
(259, 41, 'Shankharapur - Salambutar', '2024-10-02 17:25:43', '2024-10-02 17:25:43'),
(260, 41, 'Sankharapur - Sankhu', '2024-10-02 17:26:00', '2024-10-02 17:26:00'),
(261, 41, 'Tarakeshwor - Dadagaun Area', '2024-10-02 17:26:31', '2024-10-02 17:26:31'),
(262, 41, 'Tarakeshwor - Dharmasthali', '2024-10-02 17:26:49', '2024-10-02 17:26:49'),
(263, 41, 'Tarakeshwor - Goldhunga Nagarjun School Area', '2024-10-02 17:27:08', '2024-10-02 17:27:08'),
(264, 41, 'Tarakeshwor - Hiledol Area', '2024-10-02 17:27:21', '2024-10-02 17:27:21'),
(265, 41, 'Tarakeshwor - Jarankhu Area', '2024-10-02 17:27:33', '2024-10-02 17:27:33'),
(266, 41, 'Tarakeshwor - Kavresthali Buspark Area', '2024-10-02 17:27:47', '2024-10-02 17:27:47'),
(267, 41, 'Tarakeshwor - Lolang Area', '2024-10-02 17:27:59', '2024-10-02 17:27:59'),
(268, 41, 'Tarakeshwor - Manamaiju Area', '2024-10-02 17:28:16', '2024-10-02 17:28:16'),
(269, 41, 'Tarakeshwor - Nepaltar Area', '2024-10-02 17:28:28', '2024-10-02 17:28:28'),
(270, 41, 'Tarakeshwor - Phutung Bus Stop Area', '2024-10-02 17:28:45', '2024-10-02 17:28:45'),
(271, 41, 'Tarakeshwor - Purano Gueshwari Area', '2024-10-02 17:29:03', '2024-10-02 17:29:03'),
(272, 41, 'Tokha - Baniyatar', '2024-10-02 17:29:22', '2024-10-02 17:29:22'),
(273, 41, 'Tokha - Basundhara Area', '2024-10-02 17:29:35', '2024-10-02 17:29:35'),
(274, 41, 'Tokha - Bhatke Ko Pul', '2024-10-02 17:29:56', '2024-10-02 17:29:56'),
(275, 41, 'Tokha - Bhutkhel', '2024-10-02 17:30:09', '2024-10-02 17:30:09'),
(276, 41, 'Tokha - Dhapasi Area', '2024-10-02 17:30:21', '2024-10-02 17:30:21'),
(277, 41, 'Tokha - Gongabu Area', '2024-10-02 17:30:32', '2024-10-02 17:30:32'),
(278, 41, 'Tokha - Grande Hospital Area', '2024-10-02 17:30:48', '2024-10-02 17:30:48'),
(279, 41, 'Tokha - Jalpachowk', '2024-10-02 17:30:59', '2024-10-02 17:30:59'),
(280, 41, 'Tokha - Suryadarshan Height', '2024-10-02 17:31:12', '2024-10-02 17:31:12'),
(281, 41, 'Tokha - Tokha Ganesthan Area', '2024-10-02 17:31:26', '2024-10-02 17:31:26'),
(282, 43, 'Bakhundole Area', '2024-10-02 17:37:44', '2024-10-02 17:37:44'),
(283, 43, 'Jwagal Area', '2024-10-02 17:37:55', '2024-10-02 17:37:55'),
(284, 43, 'Ward 1 - Kupondole Area', '2024-10-02 17:38:20', '2024-10-02 17:38:20'),
(285, 43, 'Ward 2 - Jhamsikhel Area', '2024-10-02 17:38:36', '2024-10-02 17:38:36'),
(286, 43, 'Ward 2 - Kalopul Area', '2024-10-02 17:38:52', '2024-10-02 17:38:52'),
(287, 43, 'Ward 2 - Sanepa Area', '2024-10-02 17:39:08', '2024-10-02 17:39:08'),
(288, 43, 'Ward 3 - Pulchowk Area', '2024-10-02 17:39:25', '2024-10-02 17:39:25'),
(289, 43, 'Ward 4 - Jawalakhel Area', '2024-10-02 17:39:49', '2024-10-02 17:39:49'),
(290, 43, 'Ward 5 - Kumaripati Area', '2024-10-02 17:40:08', '2024-10-02 17:40:08'),
(291, 43, 'Ward 5 - Patan Hospital Area', '2024-10-02 17:40:27', '2024-10-02 17:40:27'),
(292, 43, 'Ward 6 - Kanibahal Area', '2024-10-02 17:40:44', '2024-10-02 17:40:44'),
(293, 43, 'Ward 7 - Sundhara Area', '2024-10-02 17:41:01', '2024-10-02 17:41:01'),
(294, 43, 'Ward 8 - Guitole Area', '2024-10-02 17:41:24', '2024-10-02 17:41:24'),
(295, 43, 'Ward 9 - Balkumari Area', '2024-10-02 17:42:27', '2024-10-02 17:42:27'),
(296, 43, 'Ward 9 - Chyasal Area', '2024-10-02 17:42:43', '2024-10-02 17:42:43'),
(297, 43, 'Ward 10 - Chakupat Area', '2024-10-02 17:43:07', '2024-10-02 17:43:07'),
(298, 43, 'Ward 11 - Banglamukhi Area', '2024-10-02 17:43:28', '2024-10-02 17:43:28'),
(299, 43, 'Ward 12 - Thaina Area', '2024-10-02 17:43:46', '2024-10-02 17:43:46'),
(300, 43, 'Ward 14 - Kusunti Area', '2024-10-02 17:44:11', '2024-10-02 17:44:11'),
(301, 43, 'Ward 15 - Lagankhel Area', '2024-10-02 17:44:30', '2024-10-02 17:44:30'),
(302, 43, 'Ward 15 - Satdobato Area', '2024-10-02 17:44:45', '2024-10-02 17:44:45'),
(303, 43, 'Ward 16 - Mangalbazar Area', '2024-10-02 17:45:01', '2024-10-02 17:45:01'),
(304, 43, 'Ward 17 - Gwarko Area', '2024-10-02 17:45:22', '2024-10-02 17:45:22'),
(305, 43, 'Ward 19 - Macchindrabahal Area', '2024-10-02 17:45:46', '2024-10-02 17:45:46'),
(306, 43, 'Ward 20 - Patandhoka Area', '2024-10-02 17:46:10', '2024-10-02 17:46:10'),
(307, 44, 'Bagdole Area', '2024-10-02 17:46:56', '2024-10-02 17:46:56'),
(308, 44, 'Godawari - Bajrabarahi Area', '2024-10-02 17:47:19', '2024-10-02 17:47:19'),
(309, 44, 'Godawari - Botanical Garden Area', '2024-10-02 17:47:34', '2024-10-02 17:47:34'),
(310, 44, 'Godawari - Chapagaun Buspark Area', '2024-10-02 17:47:52', '2024-10-02 17:47:52'),
(311, 44, 'Godawari - Jharuwarasi', '2024-10-02 17:48:10', '2024-10-02 17:48:10'),
(312, 44, 'Godawari - Thaiba', '2024-10-02 17:48:21', '2024-10-02 17:48:21'),
(313, 44, 'Godawari - Thecho', '2024-10-02 17:48:31', '2024-10-02 17:48:31'),
(314, 44, 'Karyabinayak - Chhampi', '2024-10-02 17:48:54', '2024-10-02 17:48:54'),
(315, 44, 'Karyabinayak - Chunikhel', '2024-10-02 17:49:07', '2024-10-02 17:49:07'),
(316, 44, 'Karyabinayak - Dhaichhap', '2024-10-02 17:49:27', '2024-10-02 17:49:27'),
(317, 44, 'Karyabinayak - Khokana', '2024-10-02 17:49:38', '2024-10-02 17:49:38'),
(318, 44, 'Karyabinayak - Tikabhairabh', '2024-10-02 17:49:52', '2024-10-02 17:49:52'),
(319, 44, 'Lalitpur - Bhaisepati Area', '2024-10-02 17:50:15', '2024-10-02 17:50:15'),
(320, 44, 'Lalitpur - Bungamati Area', '2024-10-02 17:50:30', '2024-10-02 17:50:30'),
(321, 44, 'Lalitpur - Chokhel Area', '2024-10-02 17:50:44', '2024-10-02 17:50:44'),
(322, 44, 'Lalitpur - Dhapakhel Area', '2024-10-02 17:50:57', '2024-10-02 17:50:57'),
(323, 44, 'Lalitpur - Dholahiti', '2024-10-02 17:51:16', '2024-10-02 17:51:16'),
(324, 44, 'Lalitpur - Harisiddhi Patan Area', '2024-10-02 17:51:31', '2024-10-02 17:51:31'),
(325, 44, 'Lalitpur - Imadole Area', '2024-10-02 17:51:42', '2024-10-02 17:51:42'),
(326, 44, 'Lalitpur - Khumaltar Area', '2024-10-02 17:51:57', '2024-10-02 17:51:57'),
(327, 44, 'Lalitpur - Loha Chowk', '2024-10-02 17:52:08', '2024-10-02 17:52:08'),
(328, 44, 'Lalitpur - Nakhipot Area', '2024-10-02 17:52:19', '2024-10-02 17:52:19'),
(329, 44, 'Lalitpur - Nakhipot Kantipur Colony', '2024-10-02 17:52:43', '2024-10-02 17:52:43'),
(330, 44, 'Lalitpur - Nakhu Area', '2024-10-02 17:53:05', '2024-10-02 17:53:05'),
(331, 44, 'Lalitpur - Ranibu Area', '2024-10-02 17:53:16', '2024-10-02 17:53:16'),
(332, 44, 'Lalitpur - Sanepa Indrayeni Mandir', '2024-10-02 17:53:35', '2024-10-02 17:53:35'),
(333, 44, 'Lalitpur - Sunakoti Area', '2024-10-02 17:53:49', '2024-10-02 17:53:49'),
(334, 44, 'Mahalaxmi - Changathali', '2024-10-02 17:54:11', '2024-10-02 17:54:11'),
(335, 44, 'Mahalaxmi - Lamatar Bus Stop Area', '2024-10-02 17:54:28', '2024-10-02 17:54:28'),
(336, 44, 'Mahalaxmi - Lubhu', '2024-10-02 17:54:37', '2024-10-02 17:54:37'),
(337, 44, 'Mahalaxmi - Tikathali', '2024-10-02 17:54:46', '2024-10-02 17:54:46'),
(338, 15, 'Teku', '2025-02-05 17:18:36', '2025-02-05 17:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `address`, `phone`, `country`, `account_type`, `password`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Janam Pandey', 'jananpandey1995@gmail.com', 'Kathmandu, Nepal', '9866077949', 'Nepal', 'A', '$2y$12$mPMrlpDRBD4Lcjf4GaC7.O4qr0hRqent5IIyBMiI5OTHRQ4tGHA0e', '2025-04-13-67fb65525f152.png', '2025-04-13 06:55:52', '2025-04-13 07:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` bigint(20) NOT NULL,
  `api_name` varchar(255) NOT NULL,
  `api_value` varchar(255) NOT NULL,
  `api_username` varchar(255) DEFAULT NULL,
  `api_password` varchar(255) DEFAULT NULL,
  `api_granttype` varchar(255) DEFAULT NULL,
  `db_name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `api_name`, `api_value`, `api_username`, `api_password`, `api_granttype`, `db_name`, `remarks`, `created_at`, `updated_at`) VALUES
(2, 'P', 'https://omstofm.globaltech.com.np/api/v1/full-reset?Storecode=OMSOK08101', NULL, NULL, NULL, NULL, 'Fetching products', '2024-09-05 23:21:55', '2025-01-07 14:40:38'),
(5, 'T', 'https://omstofm.globaltech.com.np/token', '9851069562', '9851069562', 'password', NULL, 'For generating token', '2024-09-15 06:34:55', '2025-01-07 14:40:11'),
(6, 'O', 'https://omstofm.globaltech.com.np/api/v1/PlaceOrder?Storecode=OMSOK08101', NULL, NULL, NULL, 'OMSOK08101', 'For Post orders', '2024-09-17 00:33:12', '2025-01-07 14:40:52'),
(7, 'OC', 'https://omstofm.globaltech.com.np/api/v1/CancelOrder?Storecode=OMSOK08101', NULL, NULL, NULL, 'OMSOK08101', 'For Order Cancel Post', '2024-10-01 15:41:57', '2025-01-07 14:41:07'),
(8, 'R', 'https://omstofm.globaltech.com.np/api/RegisterEcomUser', NULL, NULL, NULL, 'OMSOK08101', 'For Registration', '2024-10-21 14:49:38', '2025-01-07 14:42:23'),
(9, 'L', 'https://omstofm.globaltech.com.np/api/loginecom', NULL, NULL, NULL, 'OMSOK08101', 'For Login', '2024-10-21 14:53:30', '2025-01-07 14:42:30'),
(10, 'VE', 'https://omstofm.globaltech.com.np/api/ValidateEmail', NULL, NULL, NULL, 'OMSOK08101', 'For Email Validation', '2024-10-21 14:54:30', '2025-01-07 14:42:42'),
(11, 'CP', 'https://omstofm.globaltech.com.np/api/changeEcomPass', NULL, NULL, NULL, 'OMSOK08101', 'For Change Password', '2024-10-21 14:57:22', '2025-01-07 14:42:49'),
(12, 'FP', 'https://omstofm.globaltech.com.np/api/ForgotEcomPassword', NULL, NULL, NULL, 'OMSOK08101', 'For Forgot Password', '2024-10-21 14:58:59', '2025-01-07 14:42:59'),
(13, 'RP', 'https://omstofm.globaltech.com.np/api/ResetEcomPassword', NULL, NULL, NULL, 'OMSOK08101', 'For Reset Password', '2024-10-21 14:59:42', '2025-01-07 14:43:08'),
(14, 'REVC', 'https://omstofm.globaltech.com.np/api/ResendEmailValidationCode', NULL, NULL, NULL, 'OMSOK08101', 'For Resend Email Validation Code', '2024-10-27 17:23:58', '2025-01-07 14:43:15'),
(15, 'UP', 'https://omstofm.globaltech.com.np/api/EcomUserProfile', NULL, NULL, NULL, 'OMSOK08101', 'For User Prodile Data', '2024-10-27 17:24:45', '2025-01-07 14:43:22'),
(16, 'EUP', 'https://omstofm.globaltech.com.np/api/EditEcomUser', NULL, NULL, NULL, 'OMSOK08101', 'For Edit User Profile', '2024-10-27 17:25:28', '2025-01-07 14:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Meta', 1, '2025-05-02 06:11:17', '2025-05-04 07:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carousel_images`
--

CREATE TABLE `carousel_images` (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousel_images`
--

INSERT INTO `carousel_images` (`id`, `product_code`, `file_path`, `status`, `created_at`, `updated_at`) VALUES
(9, 'A500003', 'garg1.png', 1, '2025-04-11 06:31:49', '2025-05-09 11:28:02'),
(10, 'A100002', 'garg2.png', 1, '2025-04-11 06:32:01', '2025-05-04 07:29:37'),
(11, 'M200001', 'garg3.png', 1, '2025-04-11 06:32:10', '2025-05-04 07:29:04'),
(12, 'A300001', 'future_design_344320.mp3', 1, '2025-05-26 06:00:52', '2025-05-26 06:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `province_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  `shipping_cost_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_id`, `province_id`, `city_id`, `session_id`, `tax`, `shipping_cost`, `shipping_cost_total`, `subtotal`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 0.00, 70.00, 70.00, 0.00, NULL, '2025-04-22 08:10:22', '2025-05-26 07:13:45'),
(9, 2, NULL, NULL, NULL, 0.00, 70.00, 70.00, 5400.00, NULL, '2025-05-04 11:48:46', '2025-05-11 07:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `mr_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_code`, `quantity`, `price`, `mr_price`, `created_at`, `updated_at`) VALUES
(114, 9, 'M200001', 6, 900.00, 0.00, '2025-05-11 07:02:29', '2025-05-11 07:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'category 1', NULL, '2025-05-01-68134ec252d23.png', 1, '2025-05-01 10:08:44', '2025-05-01 10:36:50'),
(2, 'Category 2', NULL, 'c_1.png', 1, '2025-05-04 07:56:34', '2025-05-04 08:04:13'),
(3, 'Category 3', NULL, 'c_2.png', 1, '2025-05-04 07:56:50', '2025-05-04 08:04:15'),
(4, 'Category 4', NULL, 'c_3.png', 1, '2025-05-04 07:57:00', '2025-05-04 07:57:00'),
(5, 'Category 5', NULL, 'appl.PNG', 1, '2025-05-04 07:57:14', '2025-05-04 07:57:14'),
(6, 'Category 6', NULL, 'header_footer.png', 1, '2025-05-04 07:57:28', '2025-05-04 08:04:26'),
(7, 'Sub category 1', 1, 'ordersreturns.png', 1, '2025-05-05 08:53:13', '2025-05-05 10:55:21'),
(8, 'Sub Sub category 1', 7, 'header_footer.png', 1, '2025-05-05 09:02:35', '2025-05-05 11:01:29'),
(9, 'Sub Sub category 2', 7, 'header.png', 1, '2025-05-05 09:05:54', '2025-05-05 09:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `minimum_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_type` varchar(191) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `total_uses` bigint(20) NOT NULL DEFAULT 0,
  `customer_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '["all"]' CHECK (json_valid(`customer_id`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `minimum_purchase`, `discount`, `coupon_type`, `limit`, `status`, `total_uses`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Dashain Offer', 'DASHAIN20', NULL, NULL, 0.00, 0.00, NULL, NULL, 1, 0, '[\"all\"]', '2025-05-16 07:22:30', '2025-05-16 07:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_book`
--

CREATE TABLE `customer_address_book` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `province_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `zone_id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `default_shipping` varchar(255) DEFAULT NULL,
  `default_billing` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_address_book`
--

INSERT INTO `customer_address_book` (`id`, `customer_id`, `full_name`, `phone`, `province_id`, `city_id`, `zone_id`, `address`, `landmark`, `address_type`, `default_shipping`, `default_billing`, `created_at`, `updated_at`) VALUES
(2, 1, 'Janam Pandey', '+977-9866077949', 3, 10, 44, 'Chowk', 'Aakase Pul', 'H', 'Y', 'Y', '2025-05-18 10:27:49', '2025-05-18 10:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_information`
--

CREATE TABLE `delivery_information` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `invoice_email` varchar(255) DEFAULT NULL,
  `province_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `zone_id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_information`
--

INSERT INTO `delivery_information` (`id`, `customer_id`, `order_id`, `full_name`, `phone`, `invoice_email`, `province_id`, `city_id`, `zone_id`, `address`, `landmark`, `address_type`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, '#ORD202505010001', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-01 08:44:29', '2025-05-01 08:44:29'),
(2, 1, '#ORD202505010001', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-01 08:44:29', '2025-05-01 08:44:29'),
(3, 1, '#ORD202505180001', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 09:06:29', '2025-05-18 09:06:29'),
(4, 1, '#ORD202505180001', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 09:06:29', '2025-05-18 09:06:29'),
(5, 1, '#ORD202505180002', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 09:07:44', '2025-05-18 09:07:44'),
(6, 1, '#ORD202505180002', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 09:07:44', '2025-05-18 09:07:44'),
(9, 1, '#ORD202505180003', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 09:11:18', '2025-05-18 09:11:18'),
(10, 1, '#ORD202505180003', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 09:11:18', '2025-05-18 09:11:18'),
(11, 1, '#ORD202505180004', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 09:13:00', '2025-05-18 09:13:00'),
(12, 1, '#ORD202505180004', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 09:13:00', '2025-05-18 09:13:00'),
(13, 1, '#ORD202505180005', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 09:18:22', '2025-05-18 09:18:22'),
(14, 1, '#ORD202505180005', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 09:18:22', '2025-05-18 09:18:22'),
(15, 1, '#ORD202505180006', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 09:19:06', '2025-05-18 09:19:06'),
(16, 1, '#ORD202505180006', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 09:19:06', '2025-05-18 09:19:06'),
(17, 1, '#ORD202505180007', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'billing', '2025-05-18 10:18:40', '2025-05-18 10:18:40'),
(18, 1, '#ORD202505180007', 'JanamPandey', '9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'chowk', 'chowk', 'H', 'shipping', '2025-05-18 10:18:40', '2025-05-18 10:18:40'),
(19, 1, '9180202505260001', 'Janam Pandey', '+977-9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'Chowk', 'Aakase Pul', 'H', 'billing', '2025-05-26 07:07:38', '2025-05-26 07:07:38'),
(20, 1, '9180202505260001', 'Janam Pandey', '+977-9866077949', 'jananpandey1995@gmail.com', 3, 10, 44, 'Chowk', 'Aakase Pul', 'H', 'shipping', '2025-05-26 07:07:38', '2025-05-26 07:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` int(11) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_verifications`
--

INSERT INTO `email_verifications` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(5, 'nurdde09@gmail.com', '476432', '2025-05-01 11:08:16', '2025-05-01 11:08:16'),
(6, 'nurdrde09@gmail.com', '528648', '2025-05-01 11:08:52', '2025-05-01 11:08:52'),
(7, 'nure0sss9@gmail.com', '802573', '2025-05-01 11:57:13', '2025-05-01 11:57:13'),
(8, 'dhd@gmail.com', '692443', '2025-05-02 09:59:31', '2025-05-02 09:59:31'),
(9, 'bbbhh@gmail.com', '256233', '2025-05-02 10:01:20', '2025-05-02 10:01:20'),
(10, 'email@gmail.com', '105423', '2025-05-02 11:36:57', '2025-05-02 11:36:57'),
(11, 'emaill@gmail.com', '578896', '2025-05-02 11:42:46', '2025-05-02 11:42:46'),
(16, 'email09999@gmail.com', '807341', '2025-05-04 05:12:49', '2025-05-04 05:12:49'),
(17, 'email009@gmail.com', '452057', '2025-05-04 05:14:35', '2025-05-04 05:14:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '07e919b1-0dc2-4a82-8197-f07032a636de', 'database', 'default', '{\"uuid\":\"07e919b1-0dc2-4a82-8197-f07032a636de\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504150001\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1870\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-15 10:01:17'),
(2, 'caed1e06-ada8-483e-9a2b-af2cb04d0f8d', 'database', 'default', '{\"uuid\":\"caed1e06-ada8-483e-9a2b-af2cb04d0f8d\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160001\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"2770\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 05:27:31'),
(3, 'a1219478-262b-4d88-a7f9-844ebe8d3ef6', 'database', 'default', '{\"uuid\":\"a1219478-262b-4d88-a7f9-844ebe8d3ef6\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160002\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1870\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 05:44:16'),
(4, '06949f03-41d0-45ba-8152-f40cb5a13bc2', 'database', 'default', '{\"uuid\":\"06949f03-41d0-45ba-8152-f40cb5a13bc2\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160003\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 05:47:41'),
(5, 'dbe7ae6c-6570-472e-b2e9-02fe28071e5d', 'database', 'default', '{\"uuid\":\"dbe7ae6c-6570-472e-b2e9-02fe28071e5d\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160004\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 05:55:30');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(6, 'b2353ecc-c3c8-4427-b367-7c23776283c3', 'database', 'default', '{\"uuid\":\"b2353ecc-c3c8-4427-b367-7c23776283c3\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160005\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 05:59:19'),
(7, '9cf46e83-4b76-4352-b883-f5fe2fa5ea5f', 'database', 'default', '{\"uuid\":\"9cf46e83-4b76-4352-b883-f5fe2fa5ea5f\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160006\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(61): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 06:01:50'),
(8, 'c34fa7d8-09b0-41ce-9ec4-8648efb5c437', 'database', 'default', '{\"uuid\":\"c34fa7d8-09b0-41ce-9ec4-8648efb5c437\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":9:{s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160007\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'ErrorException: Undefined array key \"company_logo_header\" in C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php:148\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'C:\\\\Projects\\\\oms...\', 148)\n#1 C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php(148): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'C:\\\\Projects\\\\oms...\', 148)\n#2 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'C:\\\\Projects\\\\oms...\')\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(58): Illuminate\\Filesystem\\Filesystem->getRequire(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#7 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#20 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(74): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\View\\ViewException: Undefined array key \"company_logo_header\" (View: C:\\Projects\\omsok\\resources\\views\\frontend\\emails_format\\order_confirmation.blade.php) in C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php:148\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException(Object(ErrorException), 0)\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(60): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException(Object(ErrorException), 0)\n#2 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#17 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(74): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#44 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#52 {main}', '2025-04-16 06:03:48');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(9, '876bfb18-f691-4de9-bc18-815f9f6c2607', 'database', 'default', '{\"uuid\":\"876bfb18-f691-4de9-bc18-815f9f6c2607\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160008\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'ErrorException: Undefined array key \"company_logo_header\" in C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php:148\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(256): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'Undefined array...\', \'C:\\\\Projects\\\\oms...\', 148)\n#1 C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php(148): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}(2, \'Undefined array...\', \'C:\\\\Projects\\\\oms...\', 148)\n#2 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'C:\\\\Projects\\\\oms...\')\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(58): Illuminate\\Filesystem\\Filesystem->getRequire(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#7 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#20 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(74): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\View\\ViewException: Undefined array key \"company_logo_header\" (View: C:\\Projects\\omsok\\resources\\views\\frontend\\emails_format\\order_confirmation.blade.php) in C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php:148\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException(Object(ErrorException), 0)\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(60): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException(Object(ErrorException), 0)\n#2 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#17 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(74): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#44 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#52 {main}', '2025-04-16 06:06:55'),
(10, '09987cd6-040d-4d73-8296-8b56b873df7c', 'database', 'default', '{\"uuid\":\"09987cd6-040d-4d73-8296-8b56b873df7c\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160009\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php(148): dynamicAsset(\'public/system/h...\')\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'C:\\\\Projects\\\\oms...\')\n#2 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(58): Illuminate\\Filesystem\\Filesystem->getRequire(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#19 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(75): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#44 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#54 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" (View: C:\\Projects\\omsok\\resources\\views\\frontend\\emails_format\\order_confirmation.blade.php) in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException(Object(Error), 0)\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(60): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException(Object(Error), 0)\n#2 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#17 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(75): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#44 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#52 {main}', '2025-04-16 06:09:57');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(11, '5e602417-1a5c-4332-990b-f2e30e2fe7b2', 'database', 'default', '{\"uuid\":\"5e602417-1a5c-4332-990b-f2e30e2fe7b2\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160010\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php(148): dynamicAsset(\'system/http://1...\')\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'C:\\\\Projects\\\\oms...\')\n#2 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(58): Illuminate\\Filesystem\\Filesystem->getRequire(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#19 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(75): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#44 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#54 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" (View: C:\\Projects\\omsok\\resources\\views\\frontend\\emails_format\\order_confirmation.blade.php) in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException(Object(Error), 0)\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(60): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException(Object(Error), 0)\n#2 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#17 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(75): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#44 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#52 {main}', '2025-04-16 06:13:16'),
(12, '56a2948c-5896-48a4-84a9-a123544a2eec', 'database', 'default', '{\"uuid\":\"56a2948c-5896-48a4-84a9-a123544a2eec\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:11:\\\"JanamPandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:10:\\\"9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202504160011\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\storage\\framework\\views\\8484de01d7925204dcbb2b854975e41d.php(148): dynamicAsset(\'public/system/h...\')\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(123): require(\'C:\\\\Projects\\\\oms...\')\n#2 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Filesystem\\Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::Illuminate\\Filesystem\\{closure}()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(58): Illuminate\\Filesystem\\Filesystem->getRequire(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#19 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(75): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#44 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#54 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" (View: C:\\Projects\\omsok\\resources\\views\\frontend\\emails_format\\order_confirmation.blade.php) in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException(Object(Error), 0)\n#1 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\PhpEngine.php(60): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException(Object(Error), 0)\n#2 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Engines\\CompilerEngine.php(74): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath(\'C:\\\\Projects\\\\oms...\', Array)\n#4 C:\\Projects\\omsok\\vendor\\livewire\\livewire\\src\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get(\'C:\\\\Projects\\\\oms...\', Array)\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(191): Illuminate\\View\\View->getContents()\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\View\\View.php(160): Illuminate\\View\\View->renderContents()\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(445): Illuminate\\View\\View->render()\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(420): Illuminate\\Mail\\Mailer->renderView(\'frontend.emails...\', Array)\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(313): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'frontend.emails...\', NULL, NULL, Array)\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'frontend.emails...\', Array, Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\OrderConfirmationMail))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\OrderConfirmationMail))\n#17 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrder.php(75): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\OrderConfirmationMail))\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrder->handle()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrder), false)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#29 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrder))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrder))\n#32 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#33 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#36 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#38 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#39 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#40 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#41 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#42 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#43 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#44 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#45 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#52 {main}', '2025-04-16 06:15:56');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(13, 'c4f23d3c-4329-48a1-9614-7a98461a788d', 'database', 'default', '{\"uuid\":\"c4f23d3c-4329-48a1-9614-7a98461a788d\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrderCancel\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrderCancel\",\"command\":\"O:27:\\\"App\\\\Jobs\\\\ProcessOrderCancel\\\":5:{s:16:\\\"\\u0000*\\u0000customer_name\\\";s:11:\\\"JanamPandey\\\";s:17:\\\"\\u0000*\\u0000customer_email\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:14:\\\"\\u0000*\\u0000orderNumber\\\";s:16:\\\"#ORD202504160001\\\";s:12:\\\"\\u0000*\\u0000OrderMail\\\";a:1:{i:0;a:5:{s:12:\\\"product_name\\\";s:19:\\\"Bausch Progress 100\\\";s:3:\\\"sku\\\";s:7:\\\"A500002\\\";s:8:\\\"quantity\\\";i:1;s:9:\\\"unitPrice\\\";s:6:\\\"900.00\\\";s:10:\\\"finalPrice\\\";s:6:\\\"900.00\\\";}}s:10:\\\"\\u0000*\\u0000remarks\\\";s:15:\\\"Duplicate Order\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrderCancel.php(48): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrderCancel->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrderCancel), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrderCancel))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 08:02:16'),
(14, 'c1b586c9-4772-4bcd-a01b-e92cc8ac1aea', 'database', 'default', '{\"uuid\":\"c1b586c9-4772-4bcd-a01b-e92cc8ac1aea\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrderCancel\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrderCancel\",\"command\":\"O:27:\\\"App\\\\Jobs\\\\ProcessOrderCancel\\\":6:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:65:\\\"http:\\/\\/127.0.0.1:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:16:\\\"\\u0000*\\u0000customer_name\\\";s:11:\\\"JanamPandey\\\";s:17:\\\"\\u0000*\\u0000customer_email\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:14:\\\"\\u0000*\\u0000orderNumber\\\";s:16:\\\"#ORD202504160001\\\";s:12:\\\"\\u0000*\\u0000OrderMail\\\";a:1:{i:0;a:5:{s:12:\\\"product_name\\\";s:23:\\\"Fleximeter Strips Green\\\";s:3:\\\"sku\\\";s:7:\\\"A100002\\\";s:8:\\\"quantity\\\";i:1;s:9:\\\"unitPrice\\\";s:6:\\\"900.00\\\";s:10:\\\"finalPrice\\\";s:6:\\\"900.00\\\";}}s:10:\\\"\\u0000*\\u0000remarks\\\";s:25:\\\"Shipping cost is too high\\\";}\"}}', 'Error: Undefined constant \"DOMAIN_POINTED_DIRECTORY\" in C:\\Projects\\omsok\\app\\helpers.php:63\nStack trace:\n#0 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(241): dynamicAsset(\'public/assets/a...\')\n#1 C:\\Projects\\omsok\\app\\CentralLogics\\Helpers.php(296): App\\CentralLogics\\Helpers::get_full_url(\'system\', \'2025-04-11-67f8...\', \'2025-04-11-67f8...\')\n#2 C:\\Projects\\omsok\\app\\Jobs\\ProcessOrderCancel.php(48): App\\CentralLogics\\Helpers::get_landing_data()\n#3 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessOrderCancel->handle()\n#4 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#9 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#10 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#11 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessOrderCancel), false)\n#13 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#14 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessOrderCancel))\n#15 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\ProcessOrderCancel))\n#17 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#29 C:\\Projects\\omsok\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Projects\\omsok\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Projects\\omsok\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Projects\\omsok\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-16 08:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(21, 'Janam Pandey', 'admin@omsok.com', 'For omsok SEO', 'Do you need SEO? We are here to help you. Please contact us at admin@omsok.com.', '2024-11-25 15:47:41', '2024-11-25 15:47:41'),
(34, 'gredgfds', 'hello@gmail.com', 'test', 'sdfgszdfasz', '2025-04-08 17:48:03', '2025-04-08 17:48:03'),
(35, 'Shona', 'replica@shona.luxesource.shop', 'Shona Burnette', 'Good day,\r\n\r\nWe offer 1:1 high-quality replicas of top luxury brands including Louis Vuitton, Rolex, Coach, Burberry, Chanel, Ray-Ban, and many more.\r\n\r\nIf you\'re interested in premium designs at unbeatable prices, feel free to contact me via this link: https://chat.luxesource.shop\r\n\r\nLooking forward to hearing from you!\r\n\r\nShona', '2025-04-09 05:11:10', '2025-04-09 05:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(244, 'default', '{\"uuid\":\"b5fbbaac-32bd-4e7e-b26b-760d63469c3f\",\"displayName\":\"App\\\\Mail\\\\VerificationCodeMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\VerificationCodeMail\\\":6:{s:13:\\\"customer_name\\\";s:8:\\\"djdjddud\\\";s:5:\\\"email\\\";s:17:\\\"email09@gmail.com\\\";s:4:\\\"code\\\";i:724914;s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"email09@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746334737, 1746334737),
(245, 'default', '{\"uuid\":\"f4cd2964-6e84-4a83-a218-98e2b61dbc6e\",\"displayName\":\"App\\\\Mail\\\\RegistrationSuccessMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\RegistrationSuccessMail\\\":3:{s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"email09@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746334776, 1746334776),
(246, 'default', '{\"uuid\":\"2e835c2b-b5d0-41c7-973c-8be6e442c94c\",\"displayName\":\"App\\\\Mail\\\\VerificationCodeMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\VerificationCodeMail\\\":6:{s:13:\\\"customer_name\\\";s:6:\\\"dhddhd\\\";s:5:\\\"email\\\";s:18:\\\"email099@gmail.com\\\";s:4:\\\"code\\\";i:277978;s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"email099@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335017, 1746335017),
(247, 'default', '{\"uuid\":\"03e5d48c-6bb5-4b3f-b7fa-cc58760ff9f5\",\"displayName\":\"App\\\\Mail\\\\RegistrationSuccessMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\RegistrationSuccessMail\\\":3:{s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"email099@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335037, 1746335037),
(248, 'default', '{\"uuid\":\"346ff579-ae50-4087-8cbc-e33987a89cc7\",\"displayName\":\"App\\\\Mail\\\\VerificationCodeMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\VerificationCodeMail\\\":6:{s:13:\\\"customer_name\\\";s:10:\\\"shhsdsyhse\\\";s:5:\\\"email\\\";s:19:\\\"email0999@gmail.com\\\";s:4:\\\"code\\\";i:775817;s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"email0999@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335292, 1746335292),
(249, 'default', '{\"uuid\":\"fc4f259d-58a9-4928-8ad2-31356c613354\",\"displayName\":\"App\\\\Mail\\\\RegistrationSuccessMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\RegistrationSuccessMail\\\":3:{s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"email0999@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335307, 1746335307),
(250, 'default', '{\"uuid\":\"5eb1371b-232d-4e1c-9417-d1c9e2adea15\",\"displayName\":\"App\\\\Mail\\\\VerificationCodeMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\VerificationCodeMail\\\":6:{s:13:\\\"customer_name\\\";s:7:\\\"duuddyd\\\";s:5:\\\"email\\\";s:20:\\\"email09999@gmail.com\\\";s:4:\\\"code\\\";i:807341;s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"email09999@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335569, 1746335569),
(251, 'default', '{\"uuid\":\"9685adda-e65b-4ff8-9b41-398bb1350185\",\"displayName\":\"App\\\\Mail\\\\VerificationCodeMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\VerificationCodeMail\\\":6:{s:13:\\\"customer_name\\\";s:6:\\\"sgsshe\\\";s:5:\\\"email\\\";s:18:\\\"email009@gmail.com\\\";s:4:\\\"code\\\";i:452057;s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"email009@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335675, 1746335675),
(252, 'default', '{\"uuid\":\"e953fae8-fc2d-4756-8076-7a9899a70ecf\",\"displayName\":\"App\\\\Mail\\\\VerificationCodeMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\VerificationCodeMail\\\":6:{s:13:\\\"customer_name\\\";s:5:\\\"dyddh\\\";s:5:\\\"email\\\";s:19:\\\"email0009@gmail.com\\\";s:4:\\\"code\\\";i:578439;s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"email0009@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335769, 1746335769),
(253, 'default', '{\"uuid\":\"f05b0d61-98d9-41e5-a4c2-fb1bd083c448\",\"displayName\":\"App\\\\Mail\\\\RegistrationSuccessMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:32:\\\"App\\\\Mail\\\\RegistrationSuccessMail\\\":3:{s:12:\\\"landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"email0009@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746335823, 1746335823),
(254, 'default', '{\"uuid\":\"42314711-8cfe-485d-81ce-79df3d550f6d\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180001\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:1:\\\"0\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1096.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1096\\\";}\"}}', 0, NULL, 1747559190, 1747559190),
(255, 'default', '{\"uuid\":\"cc3159d8-3b68-4f8f-9402-f92471f109a9\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180002\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:1:\\\"0\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1800\\\";}\"}}', 0, NULL, 1747559264, 1747559264),
(256, 'default', '{\"uuid\":\"4ff7817a-52e8-46d7-84d2-4a90479c37a0\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180003\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:1:\\\"0\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1800\\\";}\"}}', 0, NULL, 1747559479, 1747559479),
(257, 'default', '{\"uuid\":\"450530ba-e7cd-4054-b3b7-3def3df893ef\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180004\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:1:\\\"0\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1800\\\";}\"}}', 0, NULL, 1747559580, 1747559580),
(258, 'default', '{\"uuid\":\"6de51257-55b3-40a8-bead-914f97cb8e4f\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180005\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:1:\\\"0\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1800\\\";}\"}}', 0, NULL, 1747559902, 1747559902),
(259, 'default', '{\"uuid\":\"1c263fcf-cab8-4dd1-a08d-4077938aaeb4\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180006\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 0, NULL, 1747559946, 1747559946),
(260, 'default', '{\"uuid\":\"81e87462-e190-448b-9a45-eb1e2fc8a2a0\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"#ORD202505180007\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:2:\\\"70\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:6:\\\"900.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:3:\\\"970\\\";}\"}}', 0, NULL, 1747563520, 1747563520),
(261, 'default', '{\"uuid\":\"af91abb0-8a87-4216-a8c0-92bc5036788c\",\"displayName\":\"App\\\\Jobs\\\\ProcessOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessOrder\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\ProcessOrder\\\":10:{s:15:\\\"\\u0000*\\u0000landing_data\\\";a:16:{s:12:\\\"company_name\\\";s:11:\\\"Garg Dental\\\";s:19:\\\"company_logo_header\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12c707.png\\\";s:19:\\\"company_logo_footer\\\";s:68:\\\"http:\\/\\/192.168.1.64:8000\\/storage\\/system\\/2025-04-11-67f8daa12e9ac.png\\\";s:18:\\\"header_theme_color\\\";s:7:\\\"#0000a0\\\";s:18:\\\"footer_theme_color\\\";s:7:\\\"#000000\\\";s:16:\\\"text_theme_color\\\";s:7:\\\"#ffffff\\\";s:18:\\\"hover_effect_color\\\";s:7:\\\"#ff0000\\\";s:13:\\\"primary_phone\\\";s:10:\\\"01-4436276\\\";s:15:\\\"secondary_phone\\\";N;s:13:\\\"primary_email\\\";s:19:\\\"info@gargdental.com\\\";s:15:\\\"secondary_email\\\";N;s:7:\\\"address\\\";s:40:\\\"P88H+RFX, Gairidhara Rd, Kathmandu 23690\\\";s:12:\\\"website_link\\\";s:23:\\\"https:\\/\\/gargdental.com\\/\\\";s:7:\\\"map_url\\\";s:279:\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp\\\";s:15:\\\"shipping_option\\\";s:12:\\\"itemwisecost\\\";s:19:\\\"no_category_display\\\";s:1:\\\"7\\\";}s:15:\\\"\\u0000*\\u0000customername\\\";s:12:\\\"Janam Pandey\\\";s:16:\\\"\\u0000*\\u0000customerEmail\\\";s:25:\\\"jananpandey1995@gmail.com\\\";s:16:\\\"\\u0000*\\u0000customerPhone\\\";s:15:\\\"+977-9866077949\\\";s:10:\\\"\\u0000*\\u0000orderId\\\";s:16:\\\"9180202505260001\\\";s:18:\\\"\\u0000*\\u0000shippingDetails\\\";s:71:\\\"Chowk,Chabahil Chowk,Kathmandu Metro 7 - Chabahil Area,Bagmati Province\\\";s:20:\\\"\\u0000*\\u0000paymentmethodName\\\";s:16:\\\"Cash On Delivery\\\";s:15:\\\"\\u0000*\\u0000shippingCost\\\";s:1:\\\"0\\\";s:11:\\\"\\u0000*\\u0000subTotal\\\";s:7:\\\"1800.00\\\";s:13:\\\"\\u0000*\\u0000grandTotal\\\";s:4:\\\"1800\\\";}\"}}', 0, NULL, 1748243259, 1748243259);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '0001_01_01_000001_create_cache_table', 1),
(10, '0001_01_01_000002_create_jobs_table', 1),
(11, '2024_05_28_034358_create_contact_table', 1),
(12, '2024_05_28_051054_create_personal_access_tokens_table', 1),
(13, '2024_05_29_165117_create_users_table', 1),
(14, '2024_06_01_163152_create_website_data_table', 1),
(15, '2024_09_03_081643_create_products_table', 1),
(16, '2024_09_03_113655_create_customers_table', 1),
(17, '2024_09_05_044616_create_cart_table', 2),
(19, '2024_09_05_045401_create_cart_items_table', 3),
(20, '2024_09_05_050349_create_orders_table', 4),
(21, '2024_09_05_053424_create_order_items_table', 5),
(22, '2024_09_05_075519_create_carousel_images_table', 6),
(23, '2024_09_05_094014_create_inquiries_table', 7),
(24, '2024_09_05_095429_create_newsletter_subscribers_list_table', 8),
(25, '2024_09_06_043556_create_api_table', 9),
(26, '2024_09_09_050631_create_set_shipping_table', 10),
(27, '2024_09_11_092834_create_delivery_information_table', 11),
(28, '2024_09_12_081841_create_provinces_table', 12),
(29, '2024_09_13_044221_create_customer_address_book_table', 13),
(30, '2024_09_16_054240_create_product_images_table', 14),
(31, '2024_09_19_160845_create_order_cancel_table', 15),
(32, '2024_09_23_103530_create_order_cancel_reasons_table', 16),
(33, '2024_09_26_170220_create_address_zone_table', 17),
(34, '2025_05_01_153059_create_categories_table', 18),
(35, '2025_05_05_122754_add_soft_deletes_to_users_table', 19),
(36, '2025_05_06_134757_create_recommended_products_table', 20),
(37, '2025_05_13_122331_create_product_variations_table', 21),
(38, '2025_05_16_123430_create_coupons_table', 22),
(39, '2020_01_01_000000_create_nova_media_library_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers_list`
--

CREATE TABLE `newsletter_subscribers_list` (
  `id` bigint(20) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_subscribers_list`
--

INSERT INTO `newsletter_subscribers_list` (`id`, `gender`, `email`, `created_at`, `updated_at`) VALUES
(5, 'M', 'programmingaddicted110@gmail.com', '2024-11-25 15:48:47', '2024-11-25 15:48:47'),
(6, 'M', 'globaltech.nepal@gmail.com', '2024-12-17 18:02:33', '2024-12-17 18:02:33'),
(8, 'F', 'brmmaesisaui@dont-reply.me', '2024-12-23 21:45:52', '2024-12-23 21:45:52'),
(9, 'F', 'lakibrights85@gmail.com', '2025-02-24 00:23:23', '2025-02-24 00:23:23'),
(13, 'F', 'nancy@ryanmarine.com', '2025-02-24 01:18:52', '2025-02-24 01:18:52'),
(106, 'F', 'larsmarkland@gmail.com', '2025-02-24 02:22:00', '2025-02-24 02:22:00'),
(108, 'F', 'joolsreader@gmail.com', '2025-02-24 02:25:19', '2025-02-24 02:25:19'),
(119, 'F', 'denissematthews@gmail.com', '2025-02-24 02:29:09', '2025-02-24 02:29:09'),
(145, 'F', 'maury.amezcua@gmail.com', '2025-02-24 02:34:48', '2025-02-24 02:34:48'),
(149, 'F', 'dorothystebner1@gmail.com', '2025-02-24 02:36:23', '2025-02-24 02:36:23'),
(160, 'F', 'gaiafay12@gmail.com', '2025-02-24 02:41:32', '2025-02-24 02:41:32'),
(165, 'F', 'l-d-johnson@hotmail.co.uk', '2025-02-24 02:41:59', '2025-02-24 02:41:59'),
(188, 'F', 'jdaks@dakslaw.com', '2025-02-24 02:51:41', '2025-02-24 02:51:41'),
(192, 'F', 'tamilong33@gmail.com', '2025-02-24 02:56:29', '2025-02-24 02:56:29'),
(196, 'F', 'kscallwood@gmail.com', '2025-02-24 02:59:51', '2025-02-24 02:59:51'),
(216, 'F', 'alba.baratta@sympatico.ca', '2025-02-24 03:09:23', '2025-02-24 03:09:23'),
(230, 'F', 'jlagru.33@gmail.com', '2025-02-24 03:23:29', '2025-02-24 03:23:29'),
(234, 'F', 'tara@wildricewatershed.org', '2025-02-24 03:24:49', '2025-02-24 03:24:49'),
(242, 'F', 'bryanlopes_8@hotmail.com', '2025-02-24 03:28:52', '2025-02-24 03:28:52'),
(246, 'F', 'rlisandrelli@gmail.com', '2025-02-24 03:32:09', '2025-02-24 03:32:09'),
(258, 'F', 'montyd@live.co.uk', '2025-02-24 03:37:06', '2025-02-24 03:37:06'),
(271, 'F', 'maria.herlihy6@gmail.com', '2025-02-24 03:41:34', '2025-02-24 03:41:34'),
(278, 'F', 'inakapiam@gmail.com', '2025-02-24 03:42:19', '2025-02-24 03:42:19'),
(301, 'F', 'dwagner09@gmail.com', '2025-02-24 03:57:32', '2025-02-24 03:57:32'),
(323, 'F', 'adrien.t.mary@gmail.com', '2025-02-24 04:11:32', '2025-02-24 04:11:32'),
(332, 'F', 'tyler.blaney@gmail.com', '2025-02-24 04:21:36', '2025-02-24 04:21:36'),
(355, 'F', 'richard.yang@antaira.com', '2025-02-24 04:47:51', '2025-02-24 04:47:51'),
(379, 'F', 'amauryagroups@gmail.com', '2025-02-24 05:02:20', '2025-02-24 05:02:20'),
(391, 'F', 'poulouebaace@yahoo.com', '2025-02-24 05:03:34', '2025-02-24 05:03:34'),
(407, 'F', 'troys@videotron.ca', '2025-02-24 05:11:07', '2025-02-24 05:11:07'),
(442, 'F', 'tdxxbeebnjtxipt@yahoo.com', '2025-02-24 05:26:09', '2025-02-24 05:26:09'),
(458, 'F', 'lodovicabiagi@googlemail.com', '2025-02-24 05:47:02', '2025-02-24 05:47:02'),
(466, 'F', 'yoneken.@docomo.ne.jp', '2025-02-24 05:50:52', '2025-02-24 05:50:52'),
(483, 'F', 'samuel.pena8.1@gmail.com', '2025-02-24 06:12:50', '2025-02-24 06:12:50'),
(491, 'F', 'moore.aarona@gmail.com', '2025-02-24 06:15:13', '2025-02-24 06:15:13'),
(499, 'F', 'groznik71@hotmail.com', '2025-02-24 06:16:04', '2025-02-24 06:16:04'),
(542, 'F', 'annamarie109@hotmail.co.uk', '2025-02-24 06:39:08', '2025-02-24 06:39:08'),
(550, 'F', 'dogovor@obmen.us', '2025-02-24 06:45:34', '2025-02-24 06:45:34'),
(562, 'F', 'benklinger02@gmail.com', '2025-02-24 06:52:34', '2025-02-24 06:52:34'),
(569, 'F', 'vikram.kailas@gmail.com', '2025-02-24 07:01:15', '2025-02-24 07:01:15'),
(581, 'F', 'ndellingse.n@gmail.com', '2025-02-24 07:05:08', '2025-02-24 07:05:08'),
(593, 'F', 'ralhenry13@gmail.com', '2025-02-24 07:06:54', '2025-02-24 07:06:54'),
(601, 'F', 'alexis.padget@gmail.com', '2025-02-24 07:11:46', '2025-02-24 07:11:46'),
(621, 'F', 'jaimesnoe.l@gmail.com', '2025-02-24 07:30:37', '2025-02-24 07:30:37'),
(636, 'F', 'costens.c@gmail.com', '2025-02-24 07:36:18', '2025-02-24 07:36:18'),
(640, 'F', 'jklakoff@gmail.com', '2025-02-24 07:36:40', '2025-02-24 07:36:40'),
(663, 'F', 'zhenglettty.dimena@gmail.com', '2025-02-24 09:12:22', '2025-02-24 09:12:22'),
(667, 'F', 'sascha.puetz@t-online.de', '2025-02-24 09:17:05', '2025-02-24 09:17:05'),
(671, 'F', 'yuuto0963@gmail.com', '2025-02-24 10:14:18', '2025-02-24 10:14:18'),
(675, 'F', 'rob.oldenburg23@gmail.com', '2025-02-24 10:29:37', '2025-02-24 10:29:37'),
(681, 'F', 'co.stensc@gmail.com', '2025-02-24 10:36:55', '2025-02-24 10:36:55'),
(689, 'F', 'nd.ellingsen@gmail.com', '2025-02-24 11:18:01', '2025-02-24 11:18:01'),
(693, 'F', 'blushberryllc@gmail.com', '2025-02-24 11:32:01', '2025-02-24 11:32:01'),
(697, 'F', 'ha.llzach1156@gmail.com', '2025-02-24 11:54:40', '2025-02-24 11:54:40'),
(701, 'F', 'sa.muel.pena81@gmail.com', '2025-02-24 11:56:51', '2025-02-24 11:56:51'),
(705, 'F', 's.amuel.pena81@gmail.com', '2025-02-24 11:57:41', '2025-02-24 11:57:41'),
(709, 'F', 'charliebrown5@frontier.com', '2025-02-24 12:13:43', '2025-02-24 12:13:43'),
(713, 'F', 'samuel.pena81@gmail.com', '2025-02-24 12:45:34', '2025-02-24 12:45:34'),
(717, 'F', 'maxwell2040@gmail.com', '2025-02-24 13:05:31', '2025-02-24 13:05:31'),
(721, 'F', 'yp.aulo49@gmail.com', '2025-02-24 13:38:48', '2025-02-24 13:38:48'),
(725, 'F', 'ashley83nl@gmail.com', '2025-02-24 13:53:13', '2025-02-24 13:53:13'),
(729, 'F', 'megank1325@gmail.com', '2025-02-24 13:56:43', '2025-02-24 13:56:43'),
(733, 'F', 'allie.nicole.winters@gmail.com', '2025-02-24 14:29:18', '2025-02-24 14:29:18'),
(745, 'F', 'crystalcchan@gmail.com', '2025-02-24 14:41:12', '2025-02-24 14:41:12'),
(749, 'F', '1506759619@qq.com', '2025-02-24 14:47:19', '2025-02-24 14:47:19'),
(753, 'F', 'cost.ensc@gmail.com', '2025-02-24 14:50:41', '2025-02-24 14:50:41'),
(757, 'F', 'anastasiamensikova454@gmail.com', '2025-02-24 15:01:21', '2025-02-24 15:01:21'),
(761, 'F', 'grohk@sasktel.net', '2025-02-24 15:07:05', '2025-02-24 15:07:05'),
(765, 'F', 'os.ter.eo9877@gmail.com', '2025-02-24 15:21:32', '2025-02-24 15:21:32'),
(769, 'F', 'lee_kanney@goodyear.com', '2025-02-24 15:44:33', '2025-02-24 15:44:33'),
(773, 'F', 'josel.reyes.918@gmail.com', '2025-02-24 15:45:54', '2025-02-24 15:45:54'),
(777, 'F', 'k_brockerville@hotmail.com', '2025-02-24 15:51:30', '2025-02-24 15:51:30'),
(781, 'F', 'aariyahgraham@gmail.com', '2025-02-24 16:01:50', '2025-02-24 16:01:50'),
(785, 'F', 'rbootz@aspirerhs.org', '2025-02-24 16:03:55', '2025-02-24 16:03:55'),
(789, 'F', 'acesfrank1@gmail.com', '2025-02-24 16:11:19', '2025-02-24 16:11:19'),
(790, 'F', 'deangelawhite@outlook.com', '2025-02-24 16:36:03', '2025-02-24 16:36:03'),
(794, 'F', 'manigon232012@hotmail.com', '2025-02-24 16:37:02', '2025-02-24 16:37:02'),
(798, 'F', 'rrob.inson207@gmail.com', '2025-02-24 16:41:47', '2025-02-24 16:41:47'),
(806, 'F', 'baybeedoll14@gmail.com', '2025-02-24 16:45:16', '2025-02-24 16:45:16'),
(810, 'F', 'vandermeulenashley@gmail.com', '2025-02-24 16:56:49', '2025-02-24 16:56:49'),
(818, 'F', 'macrn2003@gmail.com', '2025-02-24 17:18:23', '2025-02-24 17:18:23'),
(821, 'F', 'radoc.janicec@gmail.com', '2025-02-24 17:18:38', '2025-02-24 17:18:38'),
(824, 'F', 'crowcreekexpress@gmail.com', '2025-02-24 17:26:59', '2025-02-24 17:26:59'),
(827, 'F', 'info@markengoller.com', '2025-02-24 17:27:15', '2025-02-24 17:27:15'),
(836, 'F', 'cb3439@gmail.com', '2025-02-24 17:46:22', '2025-02-24 17:46:22'),
(844, 'F', 'levyfamilysk@outlook.com', '2025-02-24 18:13:19', '2025-02-24 18:13:19'),
(848, 'F', 'carineandjared@gmail.com', '2025-02-24 18:25:09', '2025-02-24 18:25:09'),
(852, 'F', 'jennifer_0722@hotmail.com', '2025-02-24 18:31:00', '2025-02-24 18:31:00'),
(856, 'F', 'ssalamon@hotmail.com', '2025-02-24 18:32:30', '2025-02-24 18:32:30'),
(860, 'F', 'podgorodnicenkoanna@gmail.com', '2025-02-24 18:34:35', '2025-02-24 18:34:35'),
(868, 'F', 'mar.ssfo@gmail.com', '2025-02-24 18:46:33', '2025-02-24 18:46:33'),
(872, 'F', 'sivousshannan@yahoo.com', '2025-02-24 18:47:39', '2025-02-24 18:47:39'),
(875, 'F', 'lori.klarquist@gmail.com', '2025-02-24 18:47:46', '2025-02-24 18:47:46'),
(880, 'F', 'ashley.nicole227@gmail.com', '2025-02-24 18:53:29', '2025-02-24 18:53:29'),
(884, 'F', 'bradonb27@gmail.com', '2025-02-24 18:57:42', '2025-02-24 18:57:42'),
(890, 'F', 'jbkmoore05@gmail.com', '2025-02-24 19:00:41', '2025-02-24 19:00:41'),
(894, 'F', 'angelinacardella@gmail.com', '2025-02-24 19:04:29', '2025-02-24 19:04:29'),
(898, 'F', 'mmanninomaria@gmail.com', '2025-02-24 19:05:47', '2025-02-24 19:05:47'),
(902, 'F', 'rebeckaguarino@gmail.com', '2025-02-24 19:08:55', '2025-02-24 19:08:55'),
(906, 'F', 'lara.bollinger@gmail.com', '2025-02-24 19:19:37', '2025-02-24 19:19:37'),
(910, 'F', 'cacirley@uol.com.br', '2025-02-24 19:20:22', '2025-02-24 19:20:22'),
(912, 'F', 'isabellejonesis@gmail.com', '2025-02-24 19:22:24', '2025-02-24 19:22:24'),
(916, 'F', 'moneill000001@gmail.com', '2025-02-24 19:28:46', '2025-02-24 19:28:46'),
(920, 'F', 'jaquaviouswilliams26@gmail.com', '2025-02-24 19:30:48', '2025-02-24 19:30:48'),
(924, 'F', 'tatyana.fedyukina06@mail.ru', '2025-02-24 19:34:41', '2025-02-24 19:34:41'),
(928, 'F', 'jackie.dombr.owski1989@gmail.com', '2025-02-24 19:38:48', '2025-02-24 19:38:48'),
(932, 'F', 'marss.fo@gmail.com', '2025-02-24 19:40:12', '2025-02-24 19:40:12'),
(936, 'F', 'haileysue@gmail.com', '2025-02-24 19:50:39', '2025-02-24 19:50:39'),
(940, 'F', 'babyblue4747@hotmail.com', '2025-02-24 19:53:22', '2025-02-24 19:53:22'),
(944, 'F', 'joselre.yes.918@gmail.com', '2025-02-24 19:55:18', '2025-02-24 19:55:18'),
(948, 'F', 'alyssa.stetson@gmail.com', '2025-02-24 19:56:21', '2025-02-24 19:56:21'),
(952, 'F', 'megcos817@gmail.com', '2025-02-24 20:01:56', '2025-02-24 20:01:56'),
(956, 'F', 'djpauliep@gmail.com', '2025-02-24 20:04:07', '2025-02-24 20:04:07'),
(960, 'F', 'samanthas4394@icloud.com', '2025-02-24 20:04:54', '2025-02-24 20:04:54'),
(963, 'F', 'rrobinso.n207@gmail.com', '2025-02-24 20:05:00', '2025-02-24 20:05:00'),
(968, 'F', 'kassie.thibode@gmail.com', '2025-02-24 20:09:32', '2025-02-24 20:09:32'),
(972, 'F', 'bettyzachary2017@gmail.com', '2025-02-24 20:10:38', '2025-02-24 20:10:38'),
(976, 'F', 'paulleytrolley@gmail.com', '2025-02-24 20:11:12', '2025-02-24 20:11:12'),
(980, 'F', 'mollyanneschmidt@gmail.com', '2025-02-24 20:15:43', '2025-02-24 20:15:43'),
(984, 'F', 'ost.er.eo9877@gmail.com', '2025-02-24 20:16:07', '2025-02-24 20:16:07'),
(988, 'F', 'lydiaprice18@gmail.com', '2025-02-24 20:16:49', '2025-02-24 20:16:49'),
(989, 'F', 'tallen@austinpa.com', '2025-02-24 20:18:32', '2025-02-24 20:18:32'),
(993, 'F', 'marlee.eyre@gmail.com', '2025-02-24 20:18:52', '2025-02-24 20:18:52'),
(997, 'F', 'andrebo99@gmail.com', '2025-02-24 20:21:12', '2025-02-24 20:21:12'),
(1000, 'F', 'jacy.peters@gmail.com', '2025-02-24 20:21:34', '2025-02-24 20:21:34'),
(1004, 'F', 'lamclendenon@gmail.com', '2025-02-24 20:36:08', '2025-02-24 20:36:08'),
(1008, 'F', 'martykelly5@msn.com', '2025-02-24 20:40:00', '2025-02-24 20:40:00'),
(1012, 'F', 'hallza.ch1156@gmail.com', '2025-02-24 20:40:40', '2025-02-24 20:40:40'),
(1016, 'F', 'cpersa76@gmail.com', '2025-02-24 20:41:31', '2025-02-24 20:41:31'),
(1020, 'F', 'hillaryklamb@gmail.com', '2025-02-24 20:42:21', '2025-02-24 20:42:21'),
(1024, 'F', 'kevin@fergusonangusfarms.com', '2025-02-24 20:43:28', '2025-02-24 20:43:28'),
(1028, 'F', 'soledadamen@gmail.com', '2025-02-24 20:45:50', '2025-02-24 20:45:50'),
(1031, 'F', 'namelesscrx@hotmail.com', '2025-02-24 20:46:32', '2025-02-24 20:46:32'),
(1036, 'F', 'kylej@neuco.com', '2025-02-24 20:50:51', '2025-02-24 20:50:51'),
(1040, 'F', 'b_saul@comcast.net', '2025-02-24 20:51:08', '2025-02-24 20:51:08'),
(1043, 'F', 'breckinslayton093@gmail.com', '2025-02-24 21:02:38', '2025-02-24 21:02:38'),
(1047, 'F', 'zoemeginsdavies@gmail.com', '2025-02-24 21:03:23', '2025-02-24 21:03:23'),
(1050, 'F', 'cream.64@hotmail.com', '2025-02-24 21:05:56', '2025-02-24 21:05:56'),
(1054, 'F', 'hafnergin@gmail.com', '2025-02-24 21:07:37', '2025-02-24 21:07:37'),
(1058, 'F', 'katie.lasek@btinternet.com', '2025-02-24 21:10:32', '2025-02-24 21:10:32'),
(1062, 'F', 'meganclimo@gmail.com', '2025-02-24 21:11:36', '2025-02-24 21:11:36'),
(1066, 'F', 'bgiroux7@hotmail.com', '2025-02-24 21:12:06', '2025-02-24 21:12:06'),
(1074, 'F', 'dbowers93@hotmail.com', '2025-02-24 21:21:39', '2025-02-24 21:21:39'),
(1076, 'F', 'tami.doblanko@gmail.com', '2025-02-24 21:21:44', '2025-02-24 21:21:44'),
(1078, 'F', 'lisamrutledge@gmail.com', '2025-02-24 21:22:06', '2025-02-24 21:22:06'),
(1083, 'F', 'jerry.rollinson@googlemail.com', '2025-02-24 21:23:08', '2025-02-24 21:23:08'),
(1087, 'F', 'jrhend270@gmail.com', '2025-02-24 21:23:35', '2025-02-24 21:23:35'),
(1091, 'F', 'khmerkid14@msn.com', '2025-02-24 21:25:07', '2025-02-24 21:25:07'),
(1095, 'F', 'ja.sonraycantu@gmail.com', '2025-02-24 21:26:33', '2025-02-24 21:26:33'),
(1099, 'F', 'samgifford11@gmail.com', '2025-02-24 21:28:40', '2025-02-24 21:28:40'),
(1102, 'F', 'ndellingsen@gmail.com', '2025-02-24 21:30:50', '2025-02-24 21:30:50'),
(1106, 'F', 'ashleyleonetti4@gmail.com', '2025-02-24 21:32:00', '2025-02-24 21:32:00'),
(1110, 'F', 'erikac1090@gmail.com', '2025-02-24 21:37:33', '2025-02-24 21:37:33'),
(1114, 'F', 'ndiknbtqhhauti@yahoo.com', '2025-02-24 21:46:03', '2025-02-24 21:46:03'),
(1121, 'F', 'gogenise@gmail.com', '2025-02-24 21:46:41', '2025-02-24 21:46:41'),
(1125, 'F', 'mike@msdexp.com', '2025-02-24 21:48:52', '2025-02-24 21:48:52'),
(1127, 'F', 'frazorjames159@gmail.com', '2025-02-24 21:49:15', '2025-02-24 21:49:15'),
(1131, 'F', 'harringtonsara66@gmail.com', '2025-02-24 21:49:46', '2025-02-24 21:49:46'),
(1135, 'F', 'dispatch@msdexp.com', '2025-02-24 21:54:29', '2025-02-24 21:54:29'),
(1139, 'F', 'hallzach.1156@gmail.com', '2025-02-24 21:55:02', '2025-02-24 21:55:02'),
(1143, 'F', 'tdc9065@gmail.com', '2025-02-24 21:57:08', '2025-02-24 21:57:08'),
(1147, 'F', 'iodations@gmail.com', '2025-02-24 21:57:26', '2025-02-24 21:57:26'),
(1155, 'F', 'juliedube1997@gmail.com', '2025-02-24 22:00:27', '2025-02-24 22:00:27'),
(1159, 'F', 'kashiamcelwee@gmail.com', '2025-02-24 22:02:26', '2025-02-24 22:02:26'),
(1163, 'F', 'frecordsshock@gmail.com', '2025-02-24 22:04:15', '2025-02-24 22:04:15'),
(1167, 'F', 'nrakich@solvefixedincome.com', '2025-02-24 22:05:58', '2025-02-24 22:05:58'),
(1171, 'F', 'sir10202000@gmail.com', '2025-02-24 22:08:52', '2025-02-24 22:08:52'),
(1175, 'F', 'beckyfoley41@gmail.com', '2025-02-24 22:09:36', '2025-02-24 22:09:36'),
(1179, 'F', 'tiffanyreed551@gmail.com', '2025-02-24 22:09:48', '2025-02-24 22:09:48'),
(1182, 'F', 'davidtan8888@hotmail.com', '2025-02-24 22:14:01', '2025-02-24 22:14:01'),
(1186, 'F', 'fleetcommo@hotmail.com', '2025-02-24 22:17:52', '2025-02-24 22:17:52'),
(1190, 'F', 'tritonfarm@gmail.com', '2025-02-24 22:21:47', '2025-02-24 22:21:47'),
(1194, 'F', 'madeline.l.coble@gmail.com', '2025-02-24 22:26:13', '2025-02-24 22:26:13'),
(1198, 'F', 'lorriecherie@comcast.net', '2025-02-24 22:26:39', '2025-02-24 22:26:39'),
(1202, 'F', 'samue.l.pena81@gmail.com', '2025-02-24 22:30:45', '2025-02-24 22:30:45'),
(1207, 'F', 'kwando@gmail.com', '2025-02-24 22:34:48', '2025-02-24 22:34:48'),
(1211, 'F', 'foleybecky41@gmail.com', '2025-02-24 22:48:24', '2025-02-24 22:48:24'),
(1215, 'F', 'gabrielgamble03@gmail.com', '2025-02-24 22:52:40', '2025-02-24 22:52:40'),
(1219, 'F', 'bill@knoxvilleicebears.com', '2025-02-24 22:54:18', '2025-02-24 22:54:18'),
(1223, 'F', 'georgejorge9@gmail.com', '2025-02-24 22:58:04', '2025-02-24 22:58:04'),
(1224, 'F', 'costensc@gmail.com', '2025-02-24 22:58:51', '2025-02-24 22:58:51'),
(1228, 'F', 'mickey@century21lemac.com', '2025-02-24 22:59:52', '2025-02-24 22:59:52'),
(1232, 'F', 'fatboyrandylane119@gmail.com', '2025-02-24 23:08:53', '2025-02-24 23:08:53'),
(1243, 'F', 'haanhtu711@gmail.com', '2025-02-24 23:19:51', '2025-02-24 23:19:51'),
(1247, 'F', 'rod@kaufmanncpa.com', '2025-02-24 23:22:39', '2025-02-24 23:22:39'),
(1251, 'F', 'hosteriasenoriodebizkaia@gmail.com', '2025-02-24 23:25:43', '2025-02-24 23:25:43'),
(1255, 'F', 'eugene.nash@tyson.com', '2025-02-24 23:26:31', '2025-02-24 23:26:31'),
(1259, 'F', 'librabigred72@gmail.com', '2025-02-24 23:31:07', '2025-02-24 23:31:07'),
(1273, 'F', 'asceneaddiction@gmail.com', '2025-02-24 23:36:24', '2025-02-24 23:36:24'),
(1277, 'F', 'fsnyder5693@gmail.com', '2025-02-24 23:40:37', '2025-02-24 23:40:37'),
(1281, 'F', 'james.miles5@gmail.com', '2025-02-24 23:44:45', '2025-02-24 23:44:45'),
(1285, 'F', 'bosys@btinternet.com', '2025-02-24 23:45:35', '2025-02-24 23:45:35'),
(1288, 'F', 'croe@bmolaw.com', '2025-02-24 23:56:44', '2025-02-24 23:56:44'),
(1291, 'F', 'dmolsen10@gmail.com', '2025-02-25 00:00:16', '2025-02-25 00:00:16'),
(1299, 'F', 'pdrummond@drummondadvisors.com', '2025-02-25 00:09:01', '2025-02-25 00:09:01'),
(1302, 'F', 'ratadj@hotmail.com', '2025-02-25 00:13:16', '2025-02-25 00:13:16'),
(1306, 'F', 'samu.el.pena81@gmail.com', '2025-02-25 00:19:38', '2025-02-25 00:19:38'),
(1310, 'F', 'jodyluscombe@hotmail.co.uk', '2025-02-25 00:19:47', '2025-02-25 00:19:47'),
(1314, 'F', 'rbbancroft@gmail.com', '2025-02-25 00:24:12', '2025-02-25 00:24:12'),
(1318, 'F', 'candice.firouzi@coterra.com', '2025-02-25 00:24:23', '2025-02-25 00:24:23'),
(1322, 'F', 'cindyannslegel@gmail.com', '2025-02-25 00:26:42', '2025-02-25 00:26:42'),
(1329, 'F', 'nahirab11@gmail.com', '2025-02-25 00:31:13', '2025-02-25 00:31:13'),
(1332, 'F', 'tishatbass@me.com', '2025-02-25 00:32:09', '2025-02-25 00:32:09'),
(1336, 'F', 'epinero@cioninvestments.com', '2025-02-25 00:38:14', '2025-02-25 00:38:14'),
(1340, 'F', 'kentmedicalllc@gmail.com', '2025-02-25 00:38:46', '2025-02-25 00:38:46'),
(1344, 'F', 'ahoskiep.aintball1@gmail.com', '2025-02-25 00:40:11', '2025-02-25 00:40:11'),
(1348, 'F', 'betty.wangu@gmail.com', '2025-02-25 00:41:20', '2025-02-25 00:41:20'),
(1355, 'F', 'kcarrico@crosscountry.com', '2025-02-25 00:43:11', '2025-02-25 00:43:11'),
(1359, 'F', 'matthew.b.lowe@gmail.com', '2025-02-25 00:44:20', '2025-02-25 00:44:20'),
(1363, 'F', 'soldbylisab@gmail.com', '2025-02-25 00:46:42', '2025-02-25 00:46:42'),
(1367, 'F', 'lsummerfield@rjobrien.com', '2025-02-25 00:48:08', '2025-02-25 00:48:08'),
(1370, 'F', 'chev53@comcast.net', '2025-02-25 00:48:56', '2025-02-25 00:48:56'),
(1374, 'F', 'yshnic@gmail.com', '2025-02-25 00:54:14', '2025-02-25 00:54:14'),
(1380, 'F', 'benita.land@atlascommodities.com', '2025-02-25 00:58:37', '2025-02-25 00:58:37'),
(1381, 'F', 'stephenmanning@live.co.uk', '2025-02-25 00:58:39', '2025-02-25 00:58:39'),
(1388, 'F', 'claudiahicks11@hotmail.co.uk', '2025-02-25 00:58:51', '2025-02-25 00:58:51'),
(1400, 'F', 'oster.eo.9877@gmail.com', '2025-02-25 01:10:51', '2025-02-25 01:10:51'),
(1404, 'F', 'vwilmink@markcoinc.com', '2025-02-25 01:12:38', '2025-02-25 01:12:38'),
(1408, 'F', 'dginsberg92@gmail.com', '2025-02-25 01:13:38', '2025-02-25 01:13:38'),
(1412, 'F', 'bill.alt2409@gmail.com', '2025-02-25 01:14:05', '2025-02-25 01:14:05'),
(1416, 'F', 'scottybiugrad1971@gmail.com', '2025-02-25 01:15:05', '2025-02-25 01:15:05'),
(1417, 'F', 'sconnorgentile@gmail.com', '2025-02-25 01:15:11', '2025-02-25 01:15:11'),
(1423, 'F', 'barbsarkany08@gmail.com', '2025-02-25 01:23:54', '2025-02-25 01:23:54'),
(1427, 'F', 'vibha9@icloud.com', '2025-02-25 01:25:29', '2025-02-25 01:25:29'),
(1434, 'F', 'aneff-glow@comcast.net', '2025-02-25 01:31:27', '2025-02-25 01:31:27'),
(1437, 'F', 'dianepang@hotmail.com', '2025-02-25 01:35:58', '2025-02-25 01:35:58'),
(1441, 'F', 'samantharbarnett@gmail.com', '2025-02-25 01:45:25', '2025-02-25 01:45:25'),
(1445, 'F', 'playinghamster@gmail.com', '2025-02-25 01:50:04', '2025-02-25 01:50:04'),
(1449, 'F', 'cos.tensc@gmail.com', '2025-02-25 02:01:37', '2025-02-25 02:01:37'),
(1456, 'F', 'luizgvfalcao@hotmail.com', '2025-02-25 02:05:49', '2025-02-25 02:05:49'),
(1464, 'F', 'ahosk.iepaintball1@gmail.com', '2025-02-25 02:22:02', '2025-02-25 02:22:02'),
(1472, 'F', 'amnorris@shaw.ca', '2025-02-25 02:23:05', '2025-02-25 02:23:05'),
(1476, 'F', 'c.guenst@comcast.net', '2025-02-25 02:32:08', '2025-02-25 02:32:08'),
(1484, 'F', 'mdzenowski@live.com', '2025-02-25 02:37:17', '2025-02-25 02:37:17'),
(1488, 'F', 'kqbhlnpfejpv@yahoo.com', '2025-02-25 02:40:30', '2025-02-25 02:40:30'),
(1492, 'F', 'kyrasellslasvegas@gmail.com', '2025-02-25 02:51:33', '2025-02-25 02:51:33'),
(1496, 'F', 'margaretbenhke@gmail.com', '2025-02-25 02:54:13', '2025-02-25 02:54:13'),
(1500, 'F', 'sstuck96@gmail.com', '2025-02-25 02:57:26', '2025-02-25 02:57:26'),
(1508, 'F', 'skelabro1@gmail.com', '2025-02-25 03:02:05', '2025-02-25 03:02:05'),
(1512, 'F', 'amhwebster@gmail.com', '2025-02-25 03:04:12', '2025-02-25 03:04:12'),
(1516, 'F', 'evansms770@gmail.com', '2025-02-25 03:04:45', '2025-02-25 03:04:45'),
(1518, 'F', 'mtuquian@gmail.com', '2025-02-25 03:04:50', '2025-02-25 03:04:50'),
(1524, 'F', 'ypaulo.49@gmail.com', '2025-02-25 03:06:56', '2025-02-25 03:06:56'),
(1528, 'F', 'michaelabrownlee@gmail.com', '2025-02-25 03:09:31', '2025-02-25 03:09:31'),
(1532, 'F', 'warr.iorcc1962@gmail.com', '2025-02-25 03:10:27', '2025-02-25 03:10:27'),
(1536, 'F', 'jacquienagy98@gmail.com', '2025-02-25 03:13:59', '2025-02-25 03:13:59'),
(1539, 'F', 'catrina.stephens93@icloud.com', '2025-02-25 03:16:49', '2025-02-25 03:16:49'),
(1543, 'F', 'dazi0325@hotmail.com', '2025-02-25 03:21:48', '2025-02-25 03:21:48'),
(1547, 'F', 'thalgardenrest@hotmail.com', '2025-02-25 03:24:51', '2025-02-25 03:24:51'),
(1551, 'F', 'xixiku90@gmail.com', '2025-02-25 03:32:05', '2025-02-25 03:32:05'),
(1563, 'F', 'info@perezinsured.com', '2025-02-25 03:42:53', '2025-02-25 03:42:53'),
(1567, 'F', 'aboughazala.acc@gmail.com', '2025-02-25 03:49:01', '2025-02-25 03:49:01'),
(1571, 'F', 'medicho@twc.com', '2025-02-25 03:49:59', '2025-02-25 03:49:59'),
(1575, 'F', 'm.arssfo@gmail.com', '2025-02-25 03:52:43', '2025-02-25 03:52:43'),
(1579, 'F', 'trwp@optonline.net', '2025-02-25 03:53:38', '2025-02-25 03:53:38'),
(1587, 'F', 'mgr@bluewaterpaintingandwallcovering.com', '2025-02-25 03:56:57', '2025-02-25 03:56:57'),
(1591, 'F', 'jimjohnston444@gmail.com', '2025-02-25 03:57:21', '2025-02-25 03:57:21'),
(1594, 'F', 'thecamerongarrison@gmail.com', '2025-02-25 03:59:48', '2025-02-25 03:59:48'),
(1598, 'F', 'ishacosta@gmail.com', '2025-02-25 04:02:00', '2025-02-25 04:02:00'),
(1602, 'F', 'benj.leiser@gmail.com', '2025-02-25 04:02:50', '2025-02-25 04:02:50'),
(1610, 'F', 'cgbartone@gmail.com', '2025-02-25 04:14:55', '2025-02-25 04:14:55'),
(1614, 'F', 'christian.s.hofmann@web.de', '2025-02-25 04:15:24', '2025-02-25 04:15:24'),
(1638, 'F', 'gdemalliard@gm-conseil.fr', '2025-02-25 04:30:04', '2025-02-25 04:30:04'),
(1650, 'F', 'andymotes@msn.com', '2025-02-25 04:42:15', '2025-02-25 04:42:15'),
(1654, 'F', 'macinnml@gmail.com', '2025-02-25 04:46:32', '2025-02-25 04:46:32'),
(1662, 'F', 'llarson3900@gmail.com', '2025-02-25 04:47:09', '2025-02-25 04:47:09'),
(1666, 'F', 'patman510@yahoo.com', '2025-02-25 04:51:46', '2025-02-25 04:51:46'),
(1670, 'F', 'projo198@gmail.com', '2025-02-25 04:55:36', '2025-02-25 04:55:36'),
(1677, 'F', 'toddbenedict@gmail.com', '2025-02-25 05:01:52', '2025-02-25 05:01:52'),
(1685, 'F', 'karl.westphal@comcast.net', '2025-02-25 05:04:37', '2025-02-25 05:04:37'),
(1701, 'F', 'jackie.dombro.wski1989@gmail.com', '2025-02-25 05:23:34', '2025-02-25 05:23:34'),
(1705, 'F', 'none@arvest.com', '2025-02-25 05:23:51', '2025-02-25 05:23:51'),
(1709, 'F', 'nbn408@gmail.com', '2025-02-25 05:25:17', '2025-02-25 05:25:17'),
(1717, 'F', 'maritapeine@aol.com', '2025-02-25 05:32:08', '2025-02-25 05:32:08'),
(1737, 'F', 'angelin.luna@pscincorp.com', '2025-02-25 06:01:06', '2025-02-25 06:01:06'),
(1745, 'F', 'rallisonford@gmail.com', '2025-02-25 06:07:20', '2025-02-25 06:07:20'),
(1749, 'F', 'littleman00711@yahoo.com', '2025-02-25 06:08:39', '2025-02-25 06:08:39'),
(1753, 'F', 'philippe.drevon@wanadoo.fr', '2025-02-25 06:09:09', '2025-02-25 06:09:09'),
(1761, 'F', 'harsensrob@gmail.com', '2025-02-25 06:14:47', '2025-02-25 06:14:47'),
(1765, 'F', 'mic39lab@gmail.com', '2025-02-25 06:18:54', '2025-02-25 06:18:54'),
(1773, 'F', 'poshe1119@gmail.com', '2025-02-25 06:23:50', '2025-02-25 06:23:50'),
(1785, 'F', 'laura@glescoelectric.com', '2025-02-25 06:29:04', '2025-02-25 06:29:04'),
(1791, 'F', 'leahblakelove@gmail.com', '2025-02-25 06:37:14', '2025-02-25 06:37:14'),
(1796, 'F', 'campusvf@gmail.com', '2025-02-25 06:37:36', '2025-02-25 06:37:36'),
(1807, 'F', 'scottdonk@gmail.com', '2025-02-25 06:58:15', '2025-02-25 06:58:15'),
(1811, 'F', 'janice@greenplan.ca', '2025-02-25 07:14:35', '2025-02-25 07:14:35'),
(1813, 'F', 'aminishakib@gmail.com', '2025-02-25 07:18:45', '2025-02-25 07:18:45'),
(1820, 'F', 'keyur.mavani88@gmail.com', '2025-02-25 07:34:07', '2025-02-25 07:34:07'),
(1824, 'F', 'marlon.cepeda@gmail.com', '2025-02-25 07:37:14', '2025-02-25 07:37:14'),
(1840, 'F', 'olivertslee@gmail.com', '2025-02-25 07:44:42', '2025-02-25 07:44:42'),
(1844, 'F', 'airuorz@gmail.com', '2025-02-25 07:51:16', '2025-02-25 07:51:16'),
(1848, 'F', 'dylanski1999@hotmail.com', '2025-02-25 07:52:00', '2025-02-25 07:52:00'),
(1852, 'F', 'jaso.nraycantu@gmail.com', '2025-02-25 08:04:59', '2025-02-25 08:04:59'),
(1859, 'F', 'nekusoba@outlook.jp', '2025-02-25 08:09:04', '2025-02-25 08:09:04'),
(1867, 'F', 'tharding@barrcredit.com', '2025-02-25 08:32:19', '2025-02-25 08:32:19'),
(1871, 'F', 'larr.yd1040@gmail.com', '2025-02-25 08:37:03', '2025-02-25 08:37:03'),
(1879, 'F', 'jodygavin7@gmail.com', '2025-02-25 08:47:51', '2025-02-25 08:47:51'),
(1883, 'F', 'allsmilesnewmarket@gmail.com', '2025-02-25 08:59:58', '2025-02-25 08:59:58'),
(1887, 'F', 'customerservice@reliance-aviation.com', '2025-02-25 09:07:56', '2025-02-25 09:07:56'),
(1891, 'F', 'dusk0111@yahoo.co.jp', '2025-02-25 09:09:59', '2025-02-25 09:09:59'),
(1899, 'F', 'khan6329182@gmail.com', '2025-02-25 09:15:02', '2025-02-25 09:15:02'),
(1903, 'F', 'moserd@mccc.edu', '2025-02-25 09:18:23', '2025-02-25 09:18:23'),
(1907, 'F', 'swiftj540@gmail.com', '2025-02-25 09:19:47', '2025-02-25 09:19:47'),
(1911, 'F', 'el_empery@hotmail.com', '2025-02-25 09:29:57', '2025-02-25 09:29:57'),
(1919, 'F', 'savanna.oeschger@gmail.com', '2025-02-25 09:43:15', '2025-02-25 09:43:15'),
(1927, 'F', 'bucca.browning@gmail.com', '2025-02-25 09:50:44', '2025-02-25 09:50:44'),
(1931, 'F', 'donaldbelik@yahoo.com', '2025-02-25 09:56:31', '2025-02-25 09:56:31'),
(1935, 'F', 'tr.evarhall@gmail.com', '2025-02-25 09:57:20', '2025-02-25 09:57:20'),
(1939, 'F', 'phillip14@cogeco.ca', '2025-02-25 10:01:32', '2025-02-25 10:01:32'),
(1943, 'F', 'cathysalinas72@hotmail.com', '2025-02-25 10:03:27', '2025-02-25 10:03:27'),
(1947, 'F', 'tpdimmock@gmail.com', '2025-02-25 10:24:47', '2025-02-25 10:24:47'),
(1951, 'F', 'vincohelp@gmail.com', '2025-02-25 10:40:18', '2025-02-25 10:40:18'),
(1953, 'F', 'j.aimesnoel@gmail.com', '2025-02-25 10:43:45', '2025-02-25 10:43:45'),
(1957, 'F', 'warriorcc1962@gmail.com', '2025-02-25 10:50:26', '2025-02-25 10:50:26'),
(1964, 'F', 'b.mills0016@gmail.com', '2025-02-25 11:01:42', '2025-02-25 11:01:42'),
(1968, 'F', 'kitpa767@yahoo.com', '2025-02-25 11:03:54', '2025-02-25 11:03:54'),
(1972, 'F', 'williamwmartin1776@gmail.com', '2025-02-25 11:09:16', '2025-02-25 11:09:16'),
(1976, 'F', 'nicolemrusso@gmail.com', '2025-02-25 11:11:32', '2025-02-25 11:11:32'),
(1984, 'F', 'glanton.anthony.m@live.com', '2025-02-25 11:17:52', '2025-02-25 11:17:52'),
(1992, 'F', 'sam.uel.pena81@gmail.com', '2025-02-25 11:25:06', '2025-02-25 11:25:06'),
(2000, 'F', 'yasfdez32@yahoo.com', '2025-02-25 11:34:54', '2025-02-25 11:34:54'),
(2004, 'F', 'kleuberrpf@gmail.com', '2025-02-25 11:37:54', '2025-02-25 11:37:54'),
(2008, 'F', 'rohansix@gmail.com', '2025-02-25 11:39:58', '2025-02-25 11:39:58'),
(2014, 'F', 'shawnpwilkes@gmail.com', '2025-02-25 11:50:33', '2025-02-25 11:50:33'),
(2018, 'F', 'stacypercell@yahoo.com', '2025-02-25 11:51:18', '2025-02-25 11:51:18'),
(2029, 'F', 'ahoskiepaint.ball1@gmail.com', '2025-02-25 12:01:05', '2025-02-25 12:01:05'),
(2037, 'F', 'christopher_w_findlay@yahoo.com', '2025-02-25 12:12:02', '2025-02-25 12:12:02'),
(2049, 'F', '76543tx@gmail.com', '2025-02-25 12:20:51', '2025-02-25 12:20:51'),
(2053, 'F', 'fabfour68@hotmail.com', '2025-02-25 12:25:52', '2025-02-25 12:25:52'),
(2057, 'F', 'nathaliehidalogo7@gmail.com', '2025-02-25 12:27:46', '2025-02-25 12:27:46'),
(2065, 'F', 'joselr.eyes.918@gmail.com', '2025-02-25 12:30:44', '2025-02-25 12:30:44'),
(2069, 'F', 'jaimesnoel@gmail.com', '2025-02-25 12:32:30', '2025-02-25 12:32:30'),
(2073, 'F', 'ymj.amison@gmail.com', '2025-02-25 12:40:04', '2025-02-25 12:40:04'),
(2077, 'F', 'looboo75@inode.at', '2025-02-25 12:47:53', '2025-02-25 12:47:53'),
(2081, 'F', 'ishigaki@bio-biz.jp', '2025-02-25 12:58:21', '2025-02-25 12:58:21'),
(2089, 'F', 'cha.vez.faith.m@gmail.com', '2025-02-25 13:23:30', '2025-02-25 13:23:30'),
(2097, 'F', 'amanda.egner@phminc.com', '2025-02-25 13:26:39', '2025-02-25 13:26:39'),
(2105, 'F', 'wi.lliamwmartin1776@gmail.com', '2025-02-25 13:43:11', '2025-02-25 13:43:11'),
(2109, 'F', 'ymjamison@gmail.com', '2025-02-25 14:02:56', '2025-02-25 14:02:56'),
(2123, 'F', 'monicaliane@live.ca', '2025-02-25 14:40:43', '2025-02-25 14:40:43'),
(2127, 'F', 'arvelle.moore@gmail.com', '2025-02-25 14:43:08', '2025-02-25 14:43:08'),
(2129, 'F', 'ashgarin1@icloud.com', '2025-02-25 14:56:30', '2025-02-25 14:56:30'),
(2133, 'F', 'chavez.faithm@gmail.com', '2025-02-25 15:15:02', '2025-02-25 15:15:02'),
(2137, 'F', 'katcallahan6@gmail.com', '2025-02-25 15:23:31', '2025-02-25 15:23:31'),
(2141, 'F', 'jasonb@jbonline.net', '2025-02-25 15:29:33', '2025-02-25 15:29:33'),
(2145, 'F', 'dennise.maling707@gmail.com', '2025-02-25 15:31:35', '2025-02-25 15:31:35'),
(2149, 'F', 'bmi.lls0016@gmail.com', '2025-02-25 15:39:46', '2025-02-25 15:39:46'),
(2153, 'F', 'm98402002@gmail.com', '2025-02-25 15:41:10', '2025-02-25 15:41:10'),
(2161, 'F', 'bob.cascadestc+ee@gmail.com', '2025-02-25 15:49:53', '2025-02-25 15:49:53'),
(2164, 'F', 'e6mongo@yahoo.com', '2025-02-25 15:52:20', '2025-02-25 15:52:20'),
(2168, 'F', 'asiyavong87@gmail.com', '2025-02-25 15:55:48', '2025-02-25 15:55:48'),
(2176, 'F', 'ashgarin1@fastmail.com', '2025-02-25 15:58:43', '2025-02-25 15:58:43'),
(2180, 'F', 'sarahakopyan.nails@gmail.com', '2025-02-25 16:00:24', '2025-02-25 16:00:24'),
(2184, 'F', 'coltonlalmberg@gmail.com', '2025-02-25 16:01:42', '2025-02-25 16:01:42'),
(2185, 'F', 'ejbowling3@gmail.com', '2025-02-25 16:01:44', '2025-02-25 16:01:44'),
(2192, 'F', 'pamela1@mymts.net', '2025-02-25 16:01:58', '2025-02-25 16:01:58'),
(2196, 'F', 'niki91c30@yahoo.com', '2025-02-25 16:12:50', '2025-02-25 16:12:50'),
(2200, 'F', 'jshbrglnd@gmail.com', '2025-02-25 16:19:23', '2025-02-25 16:19:23'),
(2204, 'F', 'samandnat@shaw.ca', '2025-02-25 16:21:32', '2025-02-25 16:21:32'),
(2211, 'F', 'bobby_johnson58@yahoo.com', '2025-02-25 16:22:34', '2025-02-25 16:22:34'),
(2215, 'F', 'alex.wagnerxx@gmail.com', '2025-02-25 16:23:47', '2025-02-25 16:23:47'),
(2218, 'F', 'gauthier.jessica@gmail.com', '2025-02-25 16:31:35', '2025-02-25 16:31:35'),
(2222, 'F', 'loubay2@gmail.com', '2025-02-25 16:33:36', '2025-02-25 16:33:36'),
(2229, 'F', 'wmyenkevich@wmystudio.com', '2025-02-25 16:35:18', '2025-02-25 16:35:18'),
(2233, 'F', 'mancoskm.ret@uwgb.edu', '2025-02-25 16:42:01', '2025-02-25 16:42:01'),
(2237, 'F', 's.crites21@gmail.com', '2025-02-25 16:46:10', '2025-02-25 16:46:10'),
(2249, 'F', 'stefaniataft@gmail.com', '2025-02-25 17:08:06', '2025-02-25 17:08:06'),
(2252, 'F', 'strongfoundationspm@gmail.com', '2025-02-25 17:17:32', '2025-02-25 17:17:32'),
(2256, 'F', 'masterglobe@rogers.com', '2025-02-25 17:18:32', '2025-02-25 17:18:32'),
(2260, 'F', 'cocoachanel.cr@gmail.com', '2025-02-25 17:22:09', '2025-02-25 17:22:09'),
(2263, 'F', 'kurenai1260@gmail.com', '2025-02-25 17:31:10', '2025-02-25 17:31:10'),
(2271, 'F', 'will.iamwmartin1776@gmail.com', '2025-02-25 17:37:55', '2025-02-25 17:37:55'),
(2275, 'F', 'agrijena@gmail.com', '2025-02-25 17:38:48', '2025-02-25 17:38:48'),
(2279, 'F', 'jaim.snoel@gmail.com', '2025-02-25 17:40:18', '2025-02-25 17:40:18'),
(2283, 'F', 'jessicarichardson207@gmail.com', '2025-02-25 17:40:47', '2025-02-25 17:40:47'),
(2294, 'F', 'xuning121@hotmail.com', '2025-02-25 17:54:20', '2025-02-25 17:54:20'),
(2298, 'F', 'branch.lamaria@gmail.com', '2025-02-25 17:57:08', '2025-02-25 17:57:08'),
(2306, 'F', 'jump.doc36@gmail.com', '2025-02-25 18:03:00', '2025-02-25 18:03:00'),
(2310, 'F', 'contact@alliance-reseau.fr', '2025-02-25 18:05:05', '2025-02-25 18:05:05'),
(2313, 'F', 'bnowaskey7489@gmail.com', '2025-02-25 18:07:25', '2025-02-25 18:07:25'),
(2317, 'F', 'clennon.steele@gmail.com', '2025-02-25 18:19:53', '2025-02-25 18:19:53'),
(2321, 'F', 'rro.binson207@gmail.com', '2025-02-25 18:21:40', '2025-02-25 18:21:40'),
(2329, 'F', 'sameccles@outlook.com', '2025-02-25 18:25:18', '2025-02-25 18:25:18'),
(2333, 'F', 'colleenmcapen@gmail.com', '2025-02-25 18:29:05', '2025-02-25 18:29:05'),
(2337, 'F', 'philipwilliamparker@gmail.com', '2025-02-25 18:30:39', '2025-02-25 18:30:39'),
(2344, 'F', 'ang3licavargas01@aol.com', '2025-02-25 18:35:11', '2025-02-25 18:35:11'),
(2348, 'F', 'silverio.francesca@gmail.com', '2025-02-25 18:37:57', '2025-02-25 18:37:57'),
(2352, 'F', 'jacqthorn@gmail.com', '2025-02-25 18:41:38', '2025-02-25 18:41:38'),
(2356, 'F', 'tabbyercool@gmail.com', '2025-02-25 18:41:47', '2025-02-25 18:41:47'),
(2360, 'F', 'allisonurffer@gmail.com', '2025-02-25 18:43:52', '2025-02-25 18:43:52'),
(2363, 'F', 'lockeegl@aol.com', '2025-02-25 18:45:55', '2025-02-25 18:45:55'),
(2367, 'F', 'socialworker353@gmail.com', '2025-02-25 18:51:41', '2025-02-25 18:51:41'),
(2371, 'F', 'meagski4@gmail.com', '2025-02-25 18:53:52', '2025-02-25 18:53:52'),
(2379, 'F', 'pinkzx14@gmail.com', '2025-02-25 19:06:55', '2025-02-25 19:06:55'),
(2387, 'F', 'sarah.akopyan@hotmail.com', '2025-02-25 19:18:40', '2025-02-25 19:18:40'),
(2391, 'F', 'lawrencese123@gmail.com', '2025-02-25 19:19:01', '2025-02-25 19:19:01'),
(2395, 'F', 'flexxxrad@yahoo.com', '2025-02-25 19:20:31', '2025-02-25 19:20:31'),
(2399, 'F', 'bassett.tr@gmail.com', '2025-02-25 19:21:21', '2025-02-25 19:21:21'),
(2403, 'F', 'laurenanderson016@gmail.com', '2025-02-25 19:22:44', '2025-02-25 19:22:44'),
(2407, 'F', 'lindaobrien@hotmail.ca', '2025-02-25 19:27:02', '2025-02-25 19:27:02'),
(2415, 'F', 'djamnick@jpjeng.com', '2025-02-25 19:40:09', '2025-02-25 19:40:09'),
(2419, 'F', 'beam_me@hotmail.com', '2025-02-25 19:40:42', '2025-02-25 19:40:42'),
(2423, 'F', 'ppsnoozer@yahoo.com', '2025-02-25 19:45:00', '2025-02-25 19:45:00'),
(2427, 'F', 'rspurrier@prosysis.com', '2025-02-25 19:46:54', '2025-02-25 19:46:54'),
(2431, 'F', 'skbasden@yahoo.com', '2025-02-25 19:50:00', '2025-02-25 19:50:00'),
(2435, 'F', 'josh.will.fixitall@gmail.com', '2025-02-25 20:06:09', '2025-02-25 20:06:09'),
(2439, 'F', 'tntbolser@gmail.com', '2025-02-25 20:15:59', '2025-02-25 20:15:59'),
(2443, 'F', 'bonnie@mathesoninsurance.ca', '2025-02-25 20:21:00', '2025-02-25 20:21:00'),
(2447, 'F', 'ireyna0168@gmail.com', '2025-02-25 20:22:38', '2025-02-25 20:22:38'),
(2451, 'F', 'michellefmitchell@gmail.com', '2025-02-25 20:30:26', '2025-02-25 20:30:26'),
(2455, 'F', 'dszabaga@gmail.com', '2025-02-25 20:33:45', '2025-02-25 20:33:45'),
(2459, 'F', 'ortmanshaun@gmail.com', '2025-02-25 20:36:59', '2025-02-25 20:36:59'),
(2469, 'F', 'laurie9884@icloud.com', '2025-02-25 20:39:22', '2025-02-25 20:39:22'),
(2473, 'F', 'tfcattle@hotmail.com', '2025-02-25 20:40:58', '2025-02-25 20:40:58'),
(2477, 'F', 'pgconnell@aol.com', '2025-02-25 20:42:01', '2025-02-25 20:42:01'),
(2481, 'F', 'kmcmasters4@gmail.com', '2025-02-25 20:50:14', '2025-02-25 20:50:14'),
(2485, 'F', 'adam.jay.gilmore@gmail.com', '2025-02-25 20:50:23', '2025-02-25 20:50:23'),
(2489, 'F', 'kmayhall1@cox.net', '2025-02-25 20:52:52', '2025-02-25 20:52:52'),
(2493, 'F', 'jamiefloresarrue@gmail.com', '2025-02-25 20:53:28', '2025-02-25 20:53:28'),
(2501, 'F', 'jhoon2233@gmail.com', '2025-02-25 20:58:42', '2025-02-25 20:58:42'),
(2505, 'F', 'hopedtillman@gmail.com', '2025-02-25 21:00:17', '2025-02-25 21:00:17'),
(2509, 'F', 'patrussell@bellnet.ca', '2025-02-25 21:06:24', '2025-02-25 21:06:24'),
(2513, 'F', 'williyclark04@gmail.com', '2025-02-25 21:10:43', '2025-02-25 21:10:43'),
(2525, 'F', 'a.guidat9@gmail.com', '2025-02-25 21:28:26', '2025-02-25 21:28:26'),
(2529, 'F', 'joegraif@gmail.com', '2025-02-25 21:28:43', '2025-02-25 21:28:43'),
(2533, 'F', 'ksinghk7@gmail.com', '2025-02-25 21:29:57', '2025-02-25 21:29:57'),
(2536, 'F', 'babusconrad55@gmail.com', '2025-02-25 21:34:45', '2025-02-25 21:34:45'),
(2540, 'F', 'ymjam.ison@gmail.com', '2025-02-25 21:44:02', '2025-02-25 21:44:02'),
(2541, 'F', 'samiturki10@gmail.com', '2025-02-25 21:48:21', '2025-02-25 21:48:21'),
(2543, 'F', 'zuhairhalawa215@gmail.com', '2025-02-25 21:48:29', '2025-02-25 21:48:29'),
(2549, 'F', 'drfortner@me.com', '2025-02-25 21:49:16', '2025-02-25 21:49:16'),
(2560, 'F', 'marytyler8@yahoo.co.uk', '2025-02-25 21:56:16', '2025-02-25 21:56:16'),
(2564, 'F', 'rizzaree90111316@gmail.com', '2025-02-25 21:59:03', '2025-02-25 21:59:03'),
(2568, 'F', 'fmjryeats@aol.com', '2025-02-25 22:04:41', '2025-02-25 22:04:41'),
(2569, 'F', 'dispatch@db7company.com', '2025-02-25 22:05:19', '2025-02-25 22:05:19'),
(2571, 'F', 'clara.dodet@gmail.com', '2025-02-25 22:05:46', '2025-02-25 22:05:46'),
(2574, 'F', 'jonathanslawley@gmail.com', '2025-02-25 22:09:47', '2025-02-25 22:09:47'),
(2578, 'F', 'wtflint2@comcast.net', '2025-02-25 22:12:21', '2025-02-25 22:12:21'),
(2582, 'F', 'drewjansky@gmail.com', '2025-02-25 22:14:18', '2025-02-25 22:14:18'),
(2586, 'F', 'rob.mills45@gmail.com', '2025-02-25 22:15:08', '2025-02-25 22:15:08'),
(2594, 'F', 'mehdi_yari@yahoo.com', '2025-02-25 22:16:34', '2025-02-25 22:16:34'),
(2598, 'F', 'mike19foster@yahoo.com', '2025-02-25 22:17:57', '2025-02-25 22:17:57'),
(2604, 'F', 'gstark@midamericainc.com', '2025-02-25 22:21:07', '2025-02-25 22:21:07'),
(2605, 'F', 'rachel.surbaugh@eastgate.vet', '2025-02-25 22:21:12', '2025-02-25 22:21:12'),
(2616, 'F', 'lcefrt2014@gmail.com', '2025-02-25 22:23:46', '2025-02-25 22:23:46'),
(2624, 'F', 'rrobin.son207@gmail.com', '2025-02-25 22:25:19', '2025-02-25 22:25:19'),
(2627, 'F', 'lasette65@yahoo.com', '2025-02-25 22:28:45', '2025-02-25 22:28:45'),
(2631, 'F', 'iris8231@gmail.com', '2025-02-25 22:30:56', '2025-02-25 22:30:56'),
(2638, 'F', 'b.white621@cox.net', '2025-02-25 22:32:50', '2025-02-25 22:32:50'),
(2641, 'F', 'genghis__khan@hotmail.com', '2025-02-25 22:33:57', '2025-02-25 22:33:57'),
(2649, 'F', 'kkirkpatrick@mcewens.ca', '2025-02-25 22:42:34', '2025-02-25 22:42:34'),
(2653, 'F', 'soniao@live.co.uk', '2025-02-25 22:44:57', '2025-02-25 22:44:57'),
(2657, 'F', 'lisahatcher64@gmail.com', '2025-02-25 22:54:33', '2025-02-25 22:54:33'),
(2661, 'F', 'oren-natali@mail.ru', '2025-02-25 22:58:43', '2025-02-25 22:58:43'),
(2664, 'F', 'julio.pasos@loxiatech.com', '2025-02-25 23:00:51', '2025-02-25 23:00:51'),
(2668, 'F', 'rafaelmillasaky@yahoo.com', '2025-02-25 23:01:25', '2025-02-25 23:01:25'),
(2674, 'F', 'amylzq@gmail.com', '2025-02-25 23:04:18', '2025-02-25 23:04:18'),
(2677, 'F', 'fogcityvaporlevittown@gmail.com', '2025-02-25 23:07:36', '2025-02-25 23:07:36'),
(2681, 'F', 'mader9600@gmail.com', '2025-02-25 23:09:07', '2025-02-25 23:09:07'),
(2685, 'F', 'pannaz@libero.it', '2025-02-25 23:10:01', '2025-02-25 23:10:01'),
(2689, 'F', 'cbonfante240@gmail.com', '2025-02-25 23:12:39', '2025-02-25 23:12:39'),
(2694, 'F', 'plvt111@aol.com', '2025-02-25 23:22:20', '2025-02-25 23:22:20'),
(2702, 'F', 'shalynbessler@gmail.com', '2025-02-25 23:27:00', '2025-02-25 23:27:00'),
(2710, 'F', 'heather32052@hotmail.com', '2025-02-25 23:28:33', '2025-02-25 23:28:33'),
(2714, 'F', 'jcoll.ey@gmail.com', '2025-02-25 23:29:15', '2025-02-25 23:29:15'),
(2718, 'F', 'alex1988pam@yahoo.com', '2025-02-25 23:31:00', '2025-02-25 23:31:00'),
(2722, 'F', 'jorged2884@hotmail.com', '2025-02-25 23:34:52', '2025-02-25 23:34:52'),
(2726, 'F', 'jmckinstry47@gmail.com', '2025-02-25 23:36:11', '2025-02-25 23:36:11'),
(2730, 'F', 'travis.lo.est@gmail.com', '2025-02-25 23:36:54', '2025-02-25 23:36:54'),
(2734, 'F', 'fieldsd873@yahoo.com', '2025-02-25 23:37:54', '2025-02-25 23:37:54'),
(2738, 'F', 'chavez.faith.m@gmail.com', '2025-02-25 23:38:44', '2025-02-25 23:38:44'),
(2742, 'F', 'jim@aubuchonhomes.com', '2025-02-25 23:40:37', '2025-02-25 23:40:37'),
(2746, 'F', 'bracey.melvin@icloud.com', '2025-02-25 23:42:48', '2025-02-25 23:42:48'),
(2750, 'F', 'eve@ppmapartments.com', '2025-02-25 23:43:35', '2025-02-25 23:43:35'),
(2758, 'F', 'cguenther@accurisksolutions.com', '2025-02-25 23:48:12', '2025-02-25 23:48:12'),
(2764, 'F', 'weedpuppy04@gmail.com', '2025-02-25 23:48:44', '2025-02-25 23:48:44'),
(2767, 'F', '76.543tx@gmail.com', '2025-02-25 23:50:31', '2025-02-25 23:50:31'),
(2771, 'F', 'celinda.smith@gmail.com', '2025-02-26 00:00:00', '2025-02-26 00:00:00'),
(2775, 'F', 'jcol.ley@gmail.com', '2025-02-26 00:00:43', '2025-02-26 00:00:43'),
(2782, 'F', 'info@greenmommystore.com', '2025-02-26 00:06:05', '2025-02-26 00:06:05'),
(2786, 'F', 'clambert@boazk12.org', '2025-02-26 00:10:51', '2025-02-26 00:10:51'),
(2790, 'F', 'rhughes936@hotmail.com', '2025-02-26 00:18:55', '2025-02-26 00:18:55'),
(2794, 'F', 'desiree.zanghi@gmail.com', '2025-02-26 00:20:08', '2025-02-26 00:20:08'),
(2802, 'F', 'mxr1551431@yahoo.com', '2025-02-26 00:24:20', '2025-02-26 00:24:20'),
(2806, 'F', 'mlg36446@nifty.com', '2025-02-26 00:24:45', '2025-02-26 00:24:45'),
(2814, 'F', 'kristiana.zondervan@yahoo.com', '2025-02-26 00:28:54', '2025-02-26 00:28:54'),
(2821, 'F', 'lulu.lodge@tiscali.co.uk', '2025-02-26 00:33:12', '2025-02-26 00:33:12'),
(2825, 'F', 'roesikey@gmail.com', '2025-02-26 00:34:52', '2025-02-26 00:34:52'),
(2829, 'F', 'taylorannlaw@gmail.com', '2025-02-26 00:38:05', '2025-02-26 00:38:05'),
(2833, 'F', 'jilliangirardeau@gmail.com', '2025-02-26 00:39:08', '2025-02-26 00:39:08'),
(2837, 'F', 'donna.mckellar7@gmail.com', '2025-02-26 00:40:18', '2025-02-26 00:40:18'),
(2841, 'F', 'karan.kawatra@gmail.com', '2025-02-26 00:41:17', '2025-02-26 00:41:17'),
(2849, 'F', 'marjorie206@yahoo.com', '2025-02-26 00:45:25', '2025-02-26 00:45:25'),
(2853, 'F', 'bobbyhash509@gmail.com', '2025-02-26 00:46:29', '2025-02-26 00:46:29'),
(2857, 'F', 'gca718@gmail.com', '2025-02-26 00:49:01', '2025-02-26 00:49:01'),
(2861, 'F', 'ndelli.ngsen@gmail.com', '2025-02-26 00:49:22', '2025-02-26 00:49:22'),
(2865, 'F', 'travis.loe.st@gmail.com', '2025-02-26 00:49:34', '2025-02-26 00:49:34'),
(2868, 'F', 'burd.dave@gmail.com', '2025-02-26 00:50:11', '2025-02-26 00:50:11'),
(2871, 'F', 'traenab@gmail.com', '2025-02-26 00:51:06', '2025-02-26 00:51:06'),
(2875, 'F', 'jaimekraussfoley@gmail.com', '2025-02-26 00:51:33', '2025-02-26 00:51:33'),
(2878, 'F', 'hrios01@yahoo.com', '2025-02-26 00:53:22', '2025-02-26 00:53:22'),
(2882, 'F', 'taishawna@gmail.com', '2025-02-26 00:59:38', '2025-02-26 00:59:38'),
(2886, 'F', 'susjerri@gmail.com', '2025-02-26 01:08:32', '2025-02-26 01:08:32'),
(2890, 'F', 'huichoboy@yahoo.com', '2025-02-26 01:11:11', '2025-02-26 01:11:11'),
(2898, 'F', 'raebeez0624@gmail.com', '2025-02-26 01:18:55', '2025-02-26 01:18:55'),
(2902, 'F', 'apost@franklin-madison.com', '2025-02-26 01:29:49', '2025-02-26 01:29:49'),
(2906, 'F', 'fyffed1@hotmail.com', '2025-02-26 01:30:22', '2025-02-26 01:30:22'),
(2913, 'F', 'doscherm@gmail.com', '2025-02-26 01:32:12', '2025-02-26 01:32:12'),
(2917, 'F', 'traceyandkathy@yahoo.com', '2025-02-26 01:33:30', '2025-02-26 01:33:30'),
(2929, 'F', 'raggamuffin866@gmail.com', '2025-02-26 01:41:08', '2025-02-26 01:41:08'),
(2937, 'F', 'jonathanhollowell@yahoo.fr', '2025-02-26 01:46:43', '2025-02-26 01:46:43'),
(2959, 'F', 'mariano.lopez.jacobo@gmail.com', '2025-02-26 01:56:25', '2025-02-26 01:56:25'),
(2963, 'F', 'tina147777@gmail.com', '2025-02-26 01:58:06', '2025-02-26 01:58:06'),
(2966, 'F', 'gord.mcintosh@oxbow.com', '2025-02-26 01:59:37', '2025-02-26 01:59:37'),
(2974, 'F', 'micholgate@gmail.com', '2025-02-26 02:04:07', '2025-02-26 02:04:07'),
(2980, 'F', 'najia.briki@orange.fr', '2025-02-26 02:10:12', '2025-02-26 02:10:12'),
(2984, 'F', 'alyssa.jeffress@qchi.com', '2025-02-26 02:14:30', '2025-02-26 02:14:30'),
(2988, 'F', 'nickabramczyk@gmail.com', '2025-02-26 02:16:23', '2025-02-26 02:16:23'),
(2992, 'F', 'lyn.saville@me.com', '2025-02-26 02:17:41', '2025-02-26 02:17:41'),
(2996, 'F', 'diaups@aol.com', '2025-02-26 02:19:27', '2025-02-26 02:19:27'),
(3004, 'F', 'keith@attorneygrossman.com', '2025-02-26 02:29:41', '2025-02-26 02:29:41'),
(3012, 'F', 'ezsandusky@gmail.com', '2025-02-26 02:35:36', '2025-02-26 02:35:36'),
(3027, 'F', 'bigmac40422@gmail.com', '2025-02-26 02:44:45', '2025-02-26 02:44:45'),
(3031, 'F', 'lsuter@pharmscript.com', '2025-02-26 02:47:00', '2025-02-26 02:47:00'),
(3035, 'F', 'aar1179@gmail.com', '2025-02-26 02:54:27', '2025-02-26 02:54:27'),
(3043, 'F', 'jungie116@yahoo.com', '2025-02-26 03:11:48', '2025-02-26 03:11:48'),
(3055, 'F', 'angelad1281@gmail.com', '2025-02-26 03:17:35', '2025-02-26 03:17:35'),
(3066, 'F', 'hulkdjq8@gmail.com', '2025-02-26 03:22:03', '2025-02-26 03:22:03'),
(3083, 'F', 'doug2782@gmail.com', '2025-02-26 03:26:12', '2025-02-26 03:26:12'),
(3092, 'F', 'ratcityracing@comcast.net', '2025-02-26 03:28:29', '2025-02-26 03:28:29'),
(3097, 'F', 'mkeene@athenahealth.com', '2025-02-26 03:31:47', '2025-02-26 03:31:47'),
(3101, 'F', 'printmoney@aol.com', '2025-02-26 03:33:44', '2025-02-26 03:33:44'),
(3109, 'F', 'rbozgoz@gmail.com', '2025-02-26 03:36:39', '2025-02-26 03:36:39'),
(3117, 'F', 'ashley.peppard16@gmail.com', '2025-02-26 03:37:57', '2025-02-26 03:37:57'),
(3121, 'F', 'contactmanny67@gmail.com', '2025-02-26 03:40:33', '2025-02-26 03:40:33'),
(3125, 'F', 'zamsian83@gmail.com', '2025-02-26 03:43:25', '2025-02-26 03:43:25'),
(3129, 'F', 'efarley125@gmail.com', '2025-02-26 03:43:38', '2025-02-26 03:43:38'),
(3136, 'F', 'jarettalbrecht@gmail.com', '2025-02-26 03:50:30', '2025-02-26 03:50:30'),
(3140, 'F', 'solutions@perfectionoutdoor.com', '2025-02-26 03:52:21', '2025-02-26 03:52:21'),
(3153, 'F', 'clarrea27@gmail.com', '2025-02-26 03:55:15', '2025-02-26 03:55:15'),
(3160, 'F', 'gse_lim79@yahoo.com', '2025-02-26 03:56:55', '2025-02-26 03:56:55'),
(3164, 'F', 'reticejr@gmail.com', '2025-02-26 03:57:45', '2025-02-26 03:57:45'),
(3168, 'F', 'fredy_09@msn.com', '2025-02-26 03:59:53', '2025-02-26 03:59:53'),
(3172, 'F', 'aberry@lurayimportservice.com', '2025-02-26 04:01:25', '2025-02-26 04:01:25'),
(3179, 'F', 'ronaldnathan@gmail.com', '2025-02-26 04:11:24', '2025-02-26 04:11:24'),
(3195, 'F', 'cjbelt@gmail.com', '2025-02-26 04:20:41', '2025-02-26 04:20:41'),
(3196, 'F', 'russeltyner@gmail.com', '2025-02-26 04:22:03', '2025-02-26 04:22:03'),
(3200, 'F', 'phyljojo966@gmail.com', '2025-02-26 04:24:42', '2025-02-26 04:24:42'),
(3204, 'F', 'billy@orcominc.com', '2025-02-26 04:26:44', '2025-02-26 04:26:44'),
(3212, 'F', 'evetsenots@msn.com', '2025-02-26 04:39:12', '2025-02-26 04:39:12'),
(3216, 'F', 'nguyen77huyhung@gmail.com', '2025-02-26 04:39:46', '2025-02-26 04:39:46'),
(3226, 'F', 'shawn.norris@cox.net', '2025-02-26 04:49:23', '2025-02-26 04:49:23'),
(3230, 'F', 'elliottnatelie@gmail.com', '2025-02-26 04:49:48', '2025-02-26 04:49:48'),
(3246, 'F', 'ben42na@gmail.com', '2025-02-26 05:01:26', '2025-02-26 05:01:26'),
(3254, 'F', 'trevarhall@gmail.com', '2025-02-26 05:03:28', '2025-02-26 05:03:28'),
(3258, 'F', 'brennanaaron11@yahoo.com', '2025-02-26 05:07:01', '2025-02-26 05:07:01'),
(3262, 'F', 'poletti.jm@gmail.com', '2025-02-26 05:07:19', '2025-02-26 05:07:19'),
(3266, 'F', 'quahog@roadrunner.com', '2025-02-26 05:08:45', '2025-02-26 05:08:45'),
(3270, 'F', 'mikemathea16@gmail.com', '2025-02-26 05:09:53', '2025-02-26 05:09:53'),
(3274, 'F', 'bigdaddy1215@comcast.net', '2025-02-26 05:10:10', '2025-02-26 05:10:10'),
(3280, 'F', 'gobblescripps@yahoo.com', '2025-02-26 05:27:37', '2025-02-26 05:27:37'),
(3316, 'F', 'balampakimuskan@gmail.com', '2025-02-26 05:51:19', '2025-02-26 05:51:19'),
(3320, 'F', 'travis.loes.t@gmail.com', '2025-02-26 05:53:07', '2025-02-26 05:53:07'),
(3324, 'F', 'williamwm.artin1776@gmail.com', '2025-02-26 05:54:23', '2025-02-26 05:54:23'),
(3328, 'F', 'eddie.hofmann23@gmail.com', '2025-02-26 05:55:14', '2025-02-26 05:55:14'),
(3332, 'F', 'janalynn76@gmail.com', '2025-02-26 05:55:40', '2025-02-26 05:55:40'),
(3335, 'F', 'chief@dexterareafire.org', '2025-02-26 05:56:53', '2025-02-26 05:56:53'),
(3346, 'F', 'mjill8482@gmail.com', '2025-02-26 06:03:10', '2025-02-26 06:03:10'),
(3347, 'F', 'milan8434@gmail.com', '2025-02-26 06:04:53', '2025-02-26 06:04:53'),
(3360, 'F', 'ohndoejanedoe69@gmail.com', '2025-02-26 06:13:50', '2025-02-26 06:13:50'),
(3376, 'F', 'hugomilitanga@gmail.com', '2025-02-26 06:26:45', '2025-02-26 06:26:45'),
(3380, 'F', 'adrian.e.prentiss@gmail.com', '2025-02-26 06:31:52', '2025-02-26 06:31:52'),
(3384, 'F', 'ethompso@gmail.com', '2025-02-26 06:35:50', '2025-02-26 06:35:50'),
(3392, 'F', 'lrodgers105@gmail.com', '2025-02-26 06:41:02', '2025-02-26 06:41:02'),
(3394, 'F', 'addison.james@gmail.com', '2025-02-26 06:41:06', '2025-02-26 06:41:06'),
(3400, 'F', 'juliebcorp@gmail.com', '2025-02-26 06:43:18', '2025-02-26 06:43:18'),
(3404, 'F', 'xbritbratx@msn.com', '2025-02-26 06:45:59', '2025-02-26 06:45:59'),
(3408, 'F', 'buckster2@cox.net', '2025-02-26 06:46:20', '2025-02-26 06:46:20'),
(3416, 'F', 'claire.saban@yahoo.co.uk', '2025-02-26 06:51:52', '2025-02-26 06:51:52'),
(3423, 'F', 'grahamja@dnr.sc.gov', '2025-02-26 06:54:52', '2025-02-26 06:54:52'),
(3438, 'F', 'nukemrich@yahoo.com', '2025-02-26 07:04:49', '2025-02-26 07:04:49'),
(3446, 'F', 'ivan@milanlogistics.com', '2025-02-26 07:09:28', '2025-02-26 07:09:28'),
(3453, 'F', 'dmills@nrha.us', '2025-02-26 07:13:33', '2025-02-26 07:13:33'),
(3457, 'F', 'robert.jhooks3@gmail.com', '2025-02-26 07:14:11', '2025-02-26 07:14:11'),
(3459, 'F', 'blackh.awk.vet1941@gmail.com', '2025-02-26 07:15:10', '2025-02-26 07:15:10'),
(3467, 'F', 'alastairclifton@gmail.com', '2025-02-26 07:22:44', '2025-02-26 07:22:44'),
(3471, 'F', 'ba.halatri.be@gmail.com', '2025-02-26 07:24:24', '2025-02-26 07:24:24'),
(3475, 'F', 'vic@calbayexpress.com', '2025-02-26 07:27:30', '2025-02-26 07:27:30'),
(3487, 'F', 'joshuadevega15@gmail.com', '2025-02-26 07:36:45', '2025-02-26 07:36:45'),
(3491, 'F', 'joe.mfr.ey@gmail.com', '2025-02-26 07:41:26', '2025-02-26 07:41:26'),
(3498, 'F', 'wyatt5032@gmail.com', '2025-02-26 07:49:17', '2025-02-26 07:49:17'),
(3505, 'F', 'rooms@thenewswanhotel.co.uk', '2025-02-26 07:49:45', '2025-02-26 07:49:45'),
(3509, 'F', 's.darwallsm@gmail.com', '2025-02-26 07:56:44', '2025-02-26 07:56:44'),
(3513, 'F', 'jessicaoyuhas@gmail.com', '2025-02-26 07:59:17', '2025-02-26 07:59:17'),
(3525, 'F', 'cjmad47@gmail.com', '2025-02-26 08:19:42', '2025-02-26 08:19:42'),
(3545, 'F', 'roldan.pablo@yahoo.com', '2025-02-26 09:27:19', '2025-02-26 09:27:19'),
(3550, 'F', 'ndaomstevens@gmail.com', '2025-02-26 10:19:08', '2025-02-26 10:19:08'),
(3558, 'F', 'sasayakianmin55br@yahoo.co.jp', '2025-02-26 10:35:34', '2025-02-26 10:35:34'),
(3566, 'F', 'ndamonstevens@gmail.com', '2025-02-26 10:47:28', '2025-02-26 10:47:28'),
(3570, 'F', 'terrorg410@gmail.com', '2025-02-26 10:56:16', '2025-02-26 10:56:16'),
(3582, 'F', 'qadribasit77@gmail.com', '2025-02-26 11:08:02', '2025-02-26 11:08:02'),
(3586, 'F', 'janet_evans9@aol.com', '2025-02-26 11:25:22', '2025-02-26 11:25:22');
INSERT INTO `newsletter_subscribers_list` (`id`, `gender`, `email`, `created_at`, `updated_at`) VALUES
(3590, 'F', 'mvanhorn3@gmail.com', '2025-02-26 11:26:06', '2025-02-26 11:26:06'),
(3598, 'F', 'fabr.napoli@gmail.com', '2025-02-26 11:50:53', '2025-02-26 11:50:53'),
(3602, 'F', 'ivantoso2211@gmail.com', '2025-02-26 11:55:01', '2025-02-26 11:55:01'),
(3610, 'F', 'info@dutchmill.co.uk', '2025-02-26 12:11:30', '2025-02-26 12:11:30'),
(3622, 'F', 'giavlaz@hotmail.com', '2025-02-26 13:03:58', '2025-02-26 13:03:58'),
(3630, 'F', 'renzce16@gmail.com', '2025-02-26 13:16:14', '2025-02-26 13:16:14'),
(3634, 'F', 'josiahpino@gmail.com', '2025-02-26 13:16:30', '2025-02-26 13:16:30'),
(3638, 'F', 'erynie.25@free.fr', '2025-02-26 13:18:39', '2025-02-26 13:18:39'),
(3646, 'F', 'enderkalender@gmail.com', '2025-02-26 13:36:16', '2025-02-26 13:36:16'),
(3650, 'F', 'derliscarr@hotmail.com', '2025-02-26 13:54:42', '2025-02-26 13:54:42'),
(3654, 'F', 'pajuyo@sbcglobal.net', '2025-02-26 13:57:48', '2025-02-26 13:57:48'),
(3658, 'F', 'danrrusso@gmail.com', '2025-02-26 13:59:09', '2025-02-26 13:59:09'),
(3666, 'F', 'gkweir@sasktel.net', '2025-02-26 14:05:54', '2025-02-26 14:05:54'),
(3674, 'F', 'rdemoor@drivenhealthcare.com', '2025-02-26 14:46:35', '2025-02-26 14:46:35'),
(3678, 'F', 'rjohnson@persona.ca', '2025-02-26 14:48:39', '2025-02-26 14:48:39'),
(3682, 'F', 'oalfaro86@gmail.com', '2025-02-26 15:08:52', '2025-02-26 15:08:52'),
(3686, 'F', 'john.peyton.elliott@gmail.com', '2025-02-26 15:27:31', '2025-02-26 15:27:31'),
(3690, 'F', 'sapphirebeauty_2000@yahoo.com', '2025-02-26 15:31:15', '2025-02-26 15:31:15'),
(3698, 'F', 'luciozezza2000@gmail.com', '2025-02-26 15:46:12', '2025-02-26 15:46:12'),
(3702, 'F', 'da.vid.w.carr16@gmail.com', '2025-02-26 15:48:33', '2025-02-26 15:48:33'),
(3709, 'F', 'tbc208@gmail.com', '2025-02-26 15:56:33', '2025-02-26 15:56:33'),
(3713, 'F', 'jsmith.1350@gmail.com', '2025-02-26 15:58:06', '2025-02-26 15:58:06'),
(3717, 'F', 'sophieturner218@gmail.com', '2025-02-26 16:02:15', '2025-02-26 16:02:15'),
(3721, 'F', 'snelson@all-phasegr.com', '2025-02-26 16:02:37', '2025-02-26 16:02:37'),
(3725, 'F', 'nurse013@hotmail.com', '2025-02-26 16:06:49', '2025-02-26 16:06:49'),
(3729, 'F', 'hestansfield@gmail.com', '2025-02-26 16:19:42', '2025-02-26 16:19:42'),
(3733, 'F', 'mike+qe@sanpedrofish.com', '2025-02-26 16:31:42', '2025-02-26 16:31:42'),
(3737, 'F', 'tlewis2247@gmail.com', '2025-02-26 16:43:56', '2025-02-26 16:43:56'),
(3741, 'F', 'marken.outlet.ffm@gmail.com', '2025-02-26 17:00:11', '2025-02-26 17:00:11'),
(3745, 'F', 'courseygirl70@gmail.com', '2025-02-26 17:33:45', '2025-02-26 17:33:45'),
(3748, 'F', 'deb2015duckworth@gmail.com', '2025-02-26 17:35:11', '2025-02-26 17:35:11'),
(3756, 'F', 'halikilmer@gmail.com', '2025-02-26 17:45:22', '2025-02-26 17:45:22'),
(3760, 'F', 'alfredoarreazola@gmail.com', '2025-02-26 17:58:35', '2025-02-26 17:58:35'),
(3767, 'F', 'nitedreams07@aim.com', '2025-02-26 18:12:42', '2025-02-26 18:12:42'),
(3771, 'F', 'halillama13@gmail.com', '2025-02-26 18:19:42', '2025-02-26 18:19:42'),
(3787, 'F', 'dktstegath@hotmail.com', '2025-02-26 18:31:59', '2025-02-26 18:31:59'),
(3791, 'F', 'monterwright@gmail.com', '2025-02-26 18:32:51', '2025-02-26 18:32:51'),
(3795, 'F', 'aemwiles3@gmail.com', '2025-02-26 18:38:35', '2025-02-26 18:38:35'),
(3797, 'F', 'netpollack@gmail.com', '2025-02-26 18:40:35', '2025-02-26 18:40:35'),
(3801, 'F', 'antrellwright36@gmail.com', '2025-02-26 18:44:18', '2025-02-26 18:44:18'),
(3805, 'F', 'jared2@telus.net', '2025-02-26 18:49:19', '2025-02-26 18:49:19'),
(3809, 'F', 'mosyover.4me@gmail.com', '2025-02-26 19:07:08', '2025-02-26 19:07:08'),
(3812, 'F', 'albethea72@gmail.com', '2025-02-26 19:10:39', '2025-02-26 19:10:39'),
(3816, 'F', 'periodec@comcast.net', '2025-02-26 19:11:24', '2025-02-26 19:11:24'),
(3820, 'F', 'midnightangel1500@gmail.com', '2025-02-26 19:24:11', '2025-02-26 19:24:11'),
(3827, 'F', 'grabenfee@yahoo.com', '2025-02-26 19:29:55', '2025-02-26 19:29:55'),
(3831, 'F', 'donaskey@gmail.com', '2025-02-26 19:35:40', '2025-02-26 19:35:40'),
(3839, 'F', 'wyndhamm@westnet.com.au', '2025-02-26 19:47:09', '2025-02-26 19:47:09'),
(3843, 'F', 'swift_1970@hotmail.com', '2025-02-26 19:54:12', '2025-02-26 19:54:12'),
(3850, 'F', 'dhruvsingh2371@gmail.com', '2025-02-26 20:04:23', '2025-02-26 20:04:23'),
(3854, 'F', 'roberthartoonian@hotmail.com', '2025-02-26 20:05:30', '2025-02-26 20:05:30'),
(3858, 'F', 'hdwkevin@yahoo.com', '2025-02-26 20:14:22', '2025-02-26 20:14:22'),
(3862, 'F', 'barbolah@live.com', '2025-02-26 20:17:38', '2025-02-26 20:17:38'),
(3868, 'F', 'laura.cronshaw@hotmail.com', '2025-02-26 20:24:30', '2025-02-26 20:24:30'),
(3879, 'F', 'christycovarrubias4@yahoo.com', '2025-02-26 20:40:20', '2025-02-26 20:40:20'),
(3883, 'F', 'thewizzray@hotmail.com', '2025-02-26 20:40:45', '2025-02-26 20:40:45'),
(3887, 'F', 'miller.my.s@gmail.com', '2025-02-26 20:41:28', '2025-02-26 20:41:28'),
(3891, 'F', 'asherrod73@gmail.com', '2025-02-26 20:54:03', '2025-02-26 20:54:03'),
(3898, 'F', 'bobbynaps3@rocketmail.com', '2025-02-26 21:04:26', '2025-02-26 21:04:26'),
(3900, 'F', 'w.oehl@gmx.net', '2025-02-26 21:07:25', '2025-02-26 21:07:25'),
(3904, 'F', 'kgforrester1@gmail.com', '2025-02-26 21:13:01', '2025-02-26 21:13:01'),
(3917, 'F', 'honeymayledbetter@gmail.com', '2025-02-26 21:46:13', '2025-02-26 21:46:13'),
(3918, 'F', 'may121985_4@yahoo.com', '2025-02-26 21:58:39', '2025-02-26 21:58:39'),
(3935, 'F', 'davidchese214@gmail.com', '2025-02-26 22:23:00', '2025-02-26 22:23:00'),
(3937, 'F', 'bostanexpressinc@gmail.com', '2025-02-26 22:24:46', '2025-02-26 22:24:46'),
(3941, 'F', 'pnkcoc.krell@gmail.com', '2025-02-26 22:32:50', '2025-02-26 22:32:50'),
(3943, 'F', 'grisselbrandthegreat1@gmail.com', '2025-02-26 22:32:54', '2025-02-26 22:32:54'),
(3949, 'F', 'tpuga@myheritagehealth.org', '2025-02-26 22:37:06', '2025-02-26 22:37:06'),
(3953, 'F', 'laurapogosi@gmail.com', '2025-02-26 22:47:16', '2025-02-26 22:47:16'),
(3957, 'F', 'afnercm03@gmail.com', '2025-02-26 22:50:20', '2025-02-26 22:50:20'),
(3958, 'F', 'cwhite1382@yahoo.com', '2025-02-26 22:56:27', '2025-02-26 22:56:27'),
(3966, 'F', 'mcondon216@gmail.com', '2025-02-26 23:04:35', '2025-02-26 23:04:35'),
(3970, 'F', 'mollyabagayle@gmail.com', '2025-02-26 23:09:14', '2025-02-26 23:09:14'),
(3974, 'F', 'ssweat.49@outlook.com', '2025-02-26 23:09:35', '2025-02-26 23:09:35'),
(3982, 'F', 'atmatkpremarathna@gmail.com', '2025-02-26 23:16:59', '2025-02-26 23:16:59'),
(3985, 'F', 'atp0826@gmail.com', '2025-02-26 23:19:31', '2025-02-26 23:19:31'),
(3989, 'F', '508gonzales@gmail.com', '2025-02-26 23:22:56', '2025-02-26 23:22:56'),
(3993, 'F', 'john@cbdemill.com', '2025-02-26 23:25:11', '2025-02-26 23:25:11'),
(3997, 'F', 'melissa.gruber@renolit.com', '2025-02-26 23:29:20', '2025-02-26 23:29:20'),
(4001, 'F', 'ajordan@intrepidib.com', '2025-02-26 23:31:50', '2025-02-26 23:31:50'),
(4009, 'F', 'ahidalgo@lidoadvisors.com', '2025-02-26 23:33:27', '2025-02-26 23:33:27'),
(4012, 'F', 'll900525@gmail.com', '2025-02-26 23:41:13', '2025-02-26 23:41:13'),
(4015, 'F', 'maliyamorrison192@gmail.com', '2025-02-26 23:48:05', '2025-02-26 23:48:05'),
(4019, 'F', 'torinhoffman@yahoo.com', '2025-02-26 23:49:25', '2025-02-26 23:49:25'),
(4026, 'F', 'melinda@corpcleaning.com', '2025-02-26 23:59:54', '2025-02-26 23:59:54'),
(4037, 'F', 'scottburack@gmail.com', '2025-02-27 00:04:12', '2025-02-27 00:04:12'),
(4041, 'F', 'rnseich@gmail.com', '2025-02-27 00:05:30', '2025-02-27 00:05:30'),
(4048, 'F', 'manouzime@gmail.com', '2025-02-27 00:12:58', '2025-02-27 00:12:58'),
(4052, 'F', 'mafinke@gmx.de', '2025-02-27 00:14:17', '2025-02-27 00:14:17'),
(4064, 'F', 'rphmed@mac.com', '2025-02-27 00:16:45', '2025-02-27 00:16:45'),
(4068, 'F', 'mary@ohiospecialties.com', '2025-02-27 00:17:14', '2025-02-27 00:17:14'),
(4072, 'F', 'kaleevang@gmail.com', '2025-02-27 00:19:36', '2025-02-27 00:19:36'),
(4076, 'F', 'cdubaot@gmail.com', '2025-02-27 00:21:32', '2025-02-27 00:21:32'),
(4084, 'F', 'tcastillo10.69@gmail.com', '2025-02-27 00:29:14', '2025-02-27 00:29:14'),
(4088, 'F', 'farrispopat@gmail.com', '2025-02-27 00:36:27', '2025-02-27 00:36:27'),
(4092, 'F', 'pfamili@ntint.com', '2025-02-27 00:39:48', '2025-02-27 00:39:48'),
(4096, 'F', 't2tsqd@gmail.com', '2025-02-27 00:42:53', '2025-02-27 00:42:53'),
(4100, 'F', 'william@qisinspection.com', '2025-02-27 00:44:28', '2025-02-27 00:44:28'),
(4104, 'F', 'jmcclure@rh.com', '2025-02-27 00:45:44', '2025-02-27 00:45:44'),
(4108, 'F', 'candikisses1004@gmail.com', '2025-02-27 00:48:36', '2025-02-27 00:48:36'),
(4112, 'F', 'je.filson@gmail.com', '2025-02-27 00:50:37', '2025-02-27 00:50:37'),
(4116, 'F', 'serenam@hotmail.com', '2025-02-27 00:56:56', '2025-02-27 00:56:56'),
(4120, 'F', 'kboman@kbomanmd.com', '2025-02-27 00:57:33', '2025-02-27 00:57:33'),
(4124, 'F', 'dtownsley8@gmail.com', '2025-02-27 01:00:56', '2025-02-27 01:00:56'),
(4131, 'F', 'amber.bieda@gmail.com', '2025-02-27 01:09:02', '2025-02-27 01:09:02'),
(4135, 'F', 'deanunit2010@gmail.com', '2025-02-27 01:09:23', '2025-02-27 01:09:23'),
(4142, 'F', 'sndvazquez1222@gmail.com', '2025-02-27 01:12:09', '2025-02-27 01:12:09'),
(4146, 'F', 'fotoferrarini@gmail.com', '2025-02-27 01:17:18', '2025-02-27 01:17:18'),
(4150, 'F', 'brendatambc@gmail.com', '2025-02-27 01:22:21', '2025-02-27 01:22:21'),
(4154, 'F', 'redrockspacific@gmail.com', '2025-02-27 01:24:55', '2025-02-27 01:24:55'),
(4158, 'F', 'nicstout@gmail.com', '2025-02-27 01:28:52', '2025-02-27 01:28:52'),
(4162, 'F', 'cbohrer@palmtreellc.com', '2025-02-27 01:35:45', '2025-02-27 01:35:45'),
(4166, 'F', 'kbyer@saedacco.com', '2025-02-27 01:37:45', '2025-02-27 01:37:45'),
(4174, 'F', 'kondratkosean@gmail.com', '2025-02-27 01:52:48', '2025-02-27 01:52:48'),
(4178, 'F', 'rowena.sierra1@yahoo.com', '2025-02-27 02:01:15', '2025-02-27 02:01:15'),
(4181, 'F', 'scouseian@gmail.com', '2025-02-27 02:01:38', '2025-02-27 02:01:38'),
(4191, 'F', 'daveafolalu@gmail.com', '2025-02-27 02:13:13', '2025-02-27 02:13:13'),
(4195, 'F', 'mallie_w@yahoo.com', '2025-02-27 02:18:09', '2025-02-27 02:18:09'),
(4199, 'F', 'mustangrider123@aol.com', '2025-02-27 02:28:20', '2025-02-27 02:28:20'),
(4211, 'F', 'victoria.quinn39@law.ac.uk', '2025-02-27 02:32:03', '2025-02-27 02:32:03'),
(4215, 'F', 'jeremiahcullen@gmail.com', '2025-02-27 02:55:22', '2025-02-27 02:55:22'),
(4219, 'F', 'keithplong@hotmail.com', '2025-02-27 02:58:28', '2025-02-27 02:58:28'),
(4223, 'F', 'alaskanat@gmail.com', '2025-02-27 03:21:18', '2025-02-27 03:21:18'),
(4227, 'F', 'cherieharris@yahoo.com', '2025-02-27 03:21:46', '2025-02-27 03:21:46'),
(4230, 'F', 'dispatch@kurtexlogistics.net', '2025-02-27 03:26:59', '2025-02-27 03:26:59'),
(4234, 'F', 'kenyann.dumont22@gmail.com', '2025-02-27 03:34:23', '2025-02-27 03:34:23'),
(4238, 'F', 'lemireanthony2002@gmail.com', '2025-02-27 03:39:42', '2025-02-27 03:39:42'),
(4239, 'F', 'nwhite1586@aol.com', '2025-02-27 03:40:02', '2025-02-27 03:40:02'),
(4246, 'F', 'alisonjevans40@gmail.com', '2025-02-27 03:43:07', '2025-02-27 03:43:07'),
(4250, 'F', 'anita.induaromatherapy@gmail.com', '2025-02-27 03:45:47', '2025-02-27 03:45:47'),
(4254, 'F', 'tbeadel@gmail.com', '2025-02-27 03:46:57', '2025-02-27 03:46:57'),
(4262, 'F', 'marcelamorenoleon@prodigy.net.mx', '2025-02-27 03:59:20', '2025-02-27 03:59:20'),
(4274, 'F', 'mrkarthikchokkapu@gmail.com', '2025-02-27 04:06:27', '2025-02-27 04:06:27'),
(4278, 'F', 'tashadav1985@gmail.com', '2025-02-27 04:08:39', '2025-02-27 04:08:39'),
(4282, 'F', 'zucchilam@gmail.com', '2025-02-27 04:09:09', '2025-02-27 04:09:09'),
(4289, 'F', 'vickylee0212@gmail.com', '2025-02-27 04:15:55', '2025-02-27 04:15:55'),
(4293, 'F', 'lphu1035@gmail.com', '2025-02-27 04:29:07', '2025-02-27 04:29:07'),
(4308, 'F', 'paulamc10379@gmail.com', '2025-02-27 04:55:00', '2025-02-27 04:55:00'),
(4312, 'F', 'doti97@gmail.com', '2025-02-27 04:56:54', '2025-02-27 04:56:54'),
(4320, 'F', 'pearce.nicola@hotmail.co.uk', '2025-02-27 04:59:40', '2025-02-27 04:59:40'),
(4328, 'F', 'haleypickett@hotmail.co.uk', '2025-02-27 05:05:10', '2025-02-27 05:05:10'),
(4336, 'F', 'jacqueline.hulbert1999@hotmail.co.uk', '2025-02-27 05:05:43', '2025-02-27 05:05:43'),
(4337, 'F', 'salyer812@gmail.com', '2025-02-27 05:10:56', '2025-02-27 05:10:56'),
(4345, 'F', 'varsha.parmar1@gmail.com', '2025-02-27 05:21:29', '2025-02-27 05:21:29'),
(4353, 'F', 'todd@tknet.us', '2025-02-27 05:24:18', '2025-02-27 05:24:18'),
(4361, 'F', 'lvfranklin41@gmail.com', '2025-02-27 05:35:11', '2025-02-27 05:35:11'),
(4365, 'F', 'sarahkrygowski@gmail.com', '2025-02-27 05:38:06', '2025-02-27 05:38:06'),
(4384, 'F', 'kstein@miassistedliving.org', '2025-02-27 06:04:31', '2025-02-27 06:04:31'),
(4391, 'F', 'hapkidopool@yahoo.com', '2025-02-27 06:08:54', '2025-02-27 06:08:54'),
(4395, 'F', 'admin@cosmicdental.ca', '2025-02-27 06:10:18', '2025-02-27 06:10:18'),
(4399, 'F', 'rileyrutland@bellsouth.net', '2025-02-27 06:11:56', '2025-02-27 06:11:56'),
(4407, 'F', 'al.khald.111k@gmail.com', '2025-02-27 06:14:57', '2025-02-27 06:14:57'),
(4411, 'F', 'shellie@actiform.co.uk', '2025-02-27 06:34:12', '2025-02-27 06:34:12'),
(4419, 'F', 'vkmrdh@yahoo.com', '2025-02-27 06:36:02', '2025-02-27 06:36:02'),
(4431, 'F', 'mjolly9@outlook.com', '2025-02-27 06:46:51', '2025-02-27 06:46:51'),
(4435, 'F', 'kierangmcdonald@yahoo.co.uk', '2025-02-27 06:51:46', '2025-02-27 06:51:46'),
(4451, 'F', 'mebvadiya@gmail.com', '2025-02-27 07:10:25', '2025-02-27 07:10:25'),
(4455, 'F', 'jonhohle@gmail.com', '2025-02-27 07:23:19', '2025-02-27 07:23:19'),
(4465, 'F', 'darzellnewman@gmail.com', '2025-02-27 07:39:01', '2025-02-27 07:39:01'),
(4469, 'F', 'inchworm31415@gmail.com', '2025-02-27 07:44:49', '2025-02-27 07:44:49'),
(4472, 'F', 'sochelrogers@gmail.com', '2025-02-27 07:46:54', '2025-02-27 07:46:54'),
(4476, 'F', 'swhoric@gmail.com', '2025-02-27 07:52:09', '2025-02-27 07:52:09'),
(4480, 'F', 'jlhilton@live.co.uk', '2025-02-27 08:01:33', '2025-02-27 08:01:33'),
(4484, 'F', 'aisling.reid@live.ie', '2025-02-27 08:09:49', '2025-02-27 08:09:49'),
(4492, 'F', 'yorkmedrehab@gmail.com', '2025-02-27 08:27:09', '2025-02-27 08:27:09'),
(4496, 'F', 'daniyal.memon146@gmail.com', '2025-02-27 08:56:32', '2025-02-27 08:56:32'),
(4500, 'F', 'browjm@gmail.com', '2025-02-27 09:31:48', '2025-02-27 09:31:48'),
(4504, 'F', 'parts@vectoryacht.com', '2025-02-27 09:42:10', '2025-02-27 09:42:10'),
(4512, 'F', 'kabbottarmy@gmail.com', '2025-02-27 09:56:09', '2025-02-27 09:56:09'),
(4516, 'F', 'aliandkaitlyn@yahoo.com', '2025-02-27 09:57:07', '2025-02-27 09:57:07'),
(4520, 'F', 'wadimbauer27@gmail.com', '2025-02-27 10:12:33', '2025-02-27 10:12:33'),
(4524, 'F', 'mountviewdc@gmail.com', '2025-02-27 10:12:43', '2025-02-27 10:12:43'),
(4536, 'F', 'gigabelly@gmail.com', '2025-02-27 13:50:51', '2025-02-27 13:50:51'),
(4548, 'F', 'mike+ll@sanpedrofish.com', '2025-02-27 14:17:33', '2025-02-27 14:17:33'),
(4551, 'F', 'wayne.griner@gmail.com', '2025-02-27 14:20:12', '2025-02-27 14:20:12'),
(4559, 'F', 'mark.gilbert22@ntlworld.com', '2025-02-27 14:29:25', '2025-02-27 14:29:25'),
(4563, 'F', 'rmfaula@gmail.com', '2025-02-27 14:52:51', '2025-02-27 14:52:51'),
(4567, 'F', 'ivanbarboza0301@gmail.com', '2025-02-27 15:23:30', '2025-02-27 15:23:30'),
(4571, 'F', 'emile.vrooyen@gmail.com', '2025-02-27 15:27:56', '2025-02-27 15:27:56'),
(4575, 'F', 'fivekurlanders@gmail.com', '2025-02-27 16:05:08', '2025-02-27 16:05:08'),
(4579, 'F', 'lawleyching@gmail.com', '2025-02-27 16:05:42', '2025-02-27 16:05:42'),
(4581, 'F', 'cdreineri@gmail.com', '2025-02-27 16:09:39', '2025-02-27 16:09:39'),
(4589, 'F', 'h.f1118@hotmail.com', '2025-02-27 16:27:22', '2025-02-27 16:27:22'),
(4591, 'F', 'caleb@avenuewheelshop.com', '2025-02-27 17:01:33', '2025-02-27 17:01:33'),
(4595, 'F', 'sharon.attaway@gmail.com', '2025-02-27 17:09:30', '2025-02-27 17:09:30'),
(4599, 'F', 'gfwcfloridahq@gmail.com', '2025-02-27 17:13:25', '2025-02-27 17:13:25'),
(4603, 'F', 'nickhoskinsrn@gmail.com', '2025-02-27 17:26:22', '2025-02-27 17:26:22'),
(4607, 'F', 'dmilt@hotmail.com', '2025-02-27 17:48:36', '2025-02-27 17:48:36'),
(4611, 'F', 'chrisyvang@gmail.com', '2025-02-27 17:53:54', '2025-02-27 17:53:54'),
(4615, 'F', 'glasstc@gmail.com', '2025-02-27 17:57:39', '2025-02-27 17:57:39'),
(4619, 'F', 'alexandernb0421@gmail.com', '2025-02-27 17:58:06', '2025-02-27 17:58:06'),
(4621, 'F', 'rcarrion@bellnet.ca', '2025-02-27 18:27:51', '2025-02-27 18:27:51'),
(4629, 'F', 'cnewbolt@hotmail.co.uk', '2025-02-27 18:54:47', '2025-02-27 18:54:47'),
(4639, 'F', 'santi31277@gmail.com', '2025-02-27 19:13:08', '2025-02-27 19:13:08'),
(4647, 'F', 'abarkie@hotmail.com', '2025-02-27 19:14:26', '2025-02-27 19:14:26'),
(4650, 'F', 'reservation@hotel.unp.ac.id', '2025-02-27 19:20:41', '2025-02-27 19:20:41'),
(4657, 'F', 'jim.g.britt@gmail.com', '2025-02-27 19:29:06', '2025-02-27 19:29:06'),
(4669, 'F', 'jondbfarms@gmail.com', '2025-02-27 19:47:56', '2025-02-27 19:47:56'),
(4673, 'F', 'jskelley562@comcast.net', '2025-02-27 19:49:24', '2025-02-27 19:49:24'),
(4681, 'F', 'gmraines@ten-o.com', '2025-02-27 20:02:09', '2025-02-27 20:02:09'),
(4684, 'F', 'natwalker1683@gmail.com', '2025-02-27 20:03:17', '2025-02-27 20:03:17'),
(4688, 'F', 'krekm41@gmail.com', '2025-02-27 20:09:52', '2025-02-27 20:09:52'),
(4696, 'F', 'macsshop@outlook.com', '2025-02-27 20:13:39', '2025-02-27 20:13:39'),
(4699, 'F', 'talleresvgn@gmail.com', '2025-02-27 20:15:15', '2025-02-27 20:15:15'),
(4703, 'F', 'abaez0490@gmail.com', '2025-02-27 20:17:07', '2025-02-27 20:17:07'),
(4707, 'F', 'carolinecricket@hotmail.com', '2025-02-27 20:17:23', '2025-02-27 20:17:23'),
(4711, 'F', 'ina.collier1@gmail.com', '2025-02-27 20:20:29', '2025-02-27 20:20:29'),
(4717, 'F', 'dispatch@vgtransport.com', '2025-02-27 20:27:24', '2025-02-27 20:27:24'),
(4721, 'F', 'jconyers.werko@gmail.com', '2025-02-27 20:27:54', '2025-02-27 20:27:54'),
(4725, 'F', 'kaylagrieve23@gmail.com', '2025-02-27 20:29:52', '2025-02-27 20:29:52'),
(4729, 'F', 'bugsleaves@gmail.com', '2025-02-27 20:33:56', '2025-02-27 20:33:56'),
(4733, 'F', 'chasabug@gmail.com', '2025-02-27 20:36:53', '2025-02-27 20:36:53'),
(4740, 'F', 'marysharp.cpa@gmail.com', '2025-02-27 20:44:50', '2025-02-27 20:44:50'),
(4742, 'F', 'gramamj75@gmail.com', '2025-02-27 20:51:35', '2025-02-27 20:51:35'),
(4754, 'F', 'stelaavram326@yahoo.com', '2025-02-27 21:03:47', '2025-02-27 21:03:47'),
(4758, 'F', 'bsscott19@icloud.com', '2025-02-27 21:05:27', '2025-02-27 21:05:27'),
(4766, 'F', 'allancarelli@hotmail.com', '2025-02-27 21:07:52', '2025-02-27 21:07:52'),
(4770, 'F', 'ap.erservicesinc@gmail.com', '2025-02-27 21:11:55', '2025-02-27 21:11:55'),
(4774, 'F', 'daytonplumb287@gmail.com', '2025-02-27 21:14:16', '2025-02-27 21:14:16'),
(4778, 'F', 'kdudley@ferman.com', '2025-02-27 21:14:49', '2025-02-27 21:14:49'),
(4786, 'F', 'tkelso@kelsoburgess.com', '2025-02-27 21:17:43', '2025-02-27 21:17:43'),
(4788, 'F', 'rroman@mtopros.com', '2025-02-27 21:17:50', '2025-02-27 21:17:50'),
(4798, 'F', 'charles_picard@yahoo.com', '2025-02-27 21:24:20', '2025-02-27 21:24:20'),
(4802, 'F', 'amar.jobanputra1@gmail.com', '2025-02-27 21:31:13', '2025-02-27 21:31:13'),
(4806, 'F', 'gwmarshall19@gmail.com', '2025-02-27 21:33:44', '2025-02-27 21:33:44'),
(4810, 'F', 'k_kanitthasangkad@hotmail.com', '2025-02-27 21:37:27', '2025-02-27 21:37:27'),
(4818, 'F', 'axexpressinc@gmail.com', '2025-02-27 21:49:33', '2025-02-27 21:49:33'),
(4826, 'F', 'lajones@oswaldfinancial.com', '2025-02-27 21:56:40', '2025-02-27 21:56:40'),
(4831, 'F', 'marianna.utin@attorneyprotective.com', '2025-02-27 21:57:43', '2025-02-27 21:57:43'),
(4839, 'F', 'jodylkarazsia@gmail.com', '2025-02-27 21:59:34', '2025-02-27 21:59:34'),
(4843, 'F', 'lauren.fleck@yahoo.com', '2025-02-27 22:01:39', '2025-02-27 22:01:39'),
(4847, 'F', 'ixmattmorganxi@yahoo.com', '2025-02-27 22:05:50', '2025-02-27 22:05:50'),
(4851, 'F', 'jmb7587@gmail.com', '2025-02-27 22:09:40', '2025-02-27 22:09:40'),
(4854, 'F', 'itbeerik@gmail.com', '2025-02-27 22:11:32', '2025-02-27 22:11:32'),
(4860, 'F', 'la.rryd1040@gmail.com', '2025-02-27 22:14:23', '2025-02-27 22:14:23'),
(4864, 'F', 'thomaskearney442@gmail.com', '2025-02-27 22:18:20', '2025-02-27 22:18:20'),
(4873, 'F', 'austin.a.smyth@gmail.com', '2025-02-27 22:26:16', '2025-02-27 22:26:16'),
(4898, 'F', 'filiproegies@gmail.com', '2025-02-27 22:54:52', '2025-02-27 22:54:52'),
(4906, 'F', 'meris413@yahoo.com', '2025-02-27 23:05:56', '2025-02-27 23:05:56'),
(4910, 'F', 'almando011@gmail.com', '2025-02-27 23:06:21', '2025-02-27 23:06:21'),
(4922, 'F', 'wanda@michianaautopros.com', '2025-02-27 23:27:46', '2025-02-27 23:27:46'),
(4926, 'F', 'sarah.bernardino@sobeys.com', '2025-02-27 23:29:49', '2025-02-27 23:29:49'),
(4930, 'F', 'jessannraa@hotmail.com', '2025-02-27 23:37:27', '2025-02-27 23:37:27'),
(4934, 'F', 'alinajervis@yahoo.com', '2025-02-27 23:41:34', '2025-02-27 23:41:34'),
(4938, 'F', 'victor.roy@sobeys.com', '2025-02-27 23:53:14', '2025-02-27 23:53:14'),
(4942, 'F', 'jose.lreyes.918@gmail.com', '2025-02-27 23:55:37', '2025-02-27 23:55:37'),
(4948, 'F', 'burdj@yahoo.com', '2025-02-28 00:03:12', '2025-02-28 00:03:12'),
(4952, 'F', 'bama_45_2000@yahoo.com', '2025-02-28 00:09:18', '2025-02-28 00:09:18'),
(4964, 'F', 'walshfamily4304@att.net', '2025-02-28 00:40:34', '2025-02-28 00:40:34'),
(4968, 'F', 'jessgegg@yahoo.com', '2025-02-28 00:40:42', '2025-02-28 00:40:42'),
(4976, 'F', 'smithtroy209@gmail.com', '2025-02-28 00:49:48', '2025-02-28 00:49:48'),
(4980, 'F', 'info@slk-shop.de', '2025-02-28 00:59:36', '2025-02-28 00:59:36'),
(4984, 'F', 'susiejervis@gmail.com', '2025-02-28 01:02:57', '2025-02-28 01:02:57'),
(4987, 'F', 'donaverilltrucking@gmail.com', '2025-02-28 01:08:02', '2025-02-28 01:08:02'),
(4991, 'F', 'jasatwal54@gmail.com', '2025-02-28 01:10:13', '2025-02-28 01:10:13'),
(4995, 'F', 'myeshiagray20@gmail.com', '2025-02-28 01:13:17', '2025-02-28 01:13:17'),
(4999, 'F', 'timothyyeager1969@gmail.com', '2025-02-28 01:16:12', '2025-02-28 01:16:12'),
(5003, 'F', 'dacihel99@gmail.com', '2025-02-28 01:17:11', '2025-02-28 01:17:11'),
(5007, 'F', 'steph.26.26@gmail.com', '2025-02-28 01:24:03', '2025-02-28 01:24:03'),
(5010, 'F', 'stevenwordell@gmail.com', '2025-02-28 01:25:08', '2025-02-28 01:25:08'),
(5011, 'F', 'darnell.lamont.anderson@hotmail.com', '2025-02-28 01:29:23', '2025-02-28 01:29:23'),
(5019, 'F', 'imamtsb@gmail.com', '2025-02-28 01:34:56', '2025-02-28 01:34:56'),
(5026, 'F', 'jfox3737@gmail.com', '2025-02-28 01:49:49', '2025-02-28 01:49:49'),
(5030, 'F', 'kried21@gmail.com', '2025-02-28 01:55:39', '2025-02-28 01:55:39'),
(5033, 'F', 'galinalopez4@gmail.com', '2025-02-28 02:10:14', '2025-02-28 02:10:14'),
(5037, 'F', 'carolinestella71@gmail.com', '2025-02-28 02:19:00', '2025-02-28 02:19:00'),
(5049, 'F', 'shudh@aol.com', '2025-02-28 02:47:13', '2025-02-28 02:47:13'),
(5055, 'F', 'hauserfred15@gmail.com', '2025-02-28 02:47:22', '2025-02-28 02:47:22'),
(5061, 'F', 'tomasz63@gmx.de', '2025-02-28 02:48:10', '2025-02-28 02:48:10'),
(5065, 'F', 'jeffhyatt2005@gmail.com', '2025-02-28 03:04:38', '2025-02-28 03:04:38'),
(5069, 'F', 'staceyalvarez06@yahoo.com', '2025-02-28 03:11:41', '2025-02-28 03:11:41'),
(5070, 'F', 'mjmorton2714@gmail.com', '2025-02-28 03:11:46', '2025-02-28 03:11:46'),
(5074, 'F', 'jdimoulas@verizon.net', '2025-02-28 03:13:07', '2025-02-28 03:13:07'),
(5078, 'F', 'emilylouiseclarke22@gmail.com', '2025-02-28 03:20:06', '2025-02-28 03:20:06'),
(5088, 'F', 'miss.m.daley@gmail.com', '2025-02-28 03:30:50', '2025-02-28 03:30:50'),
(5090, 'F', 'ar10a4@cox.net', '2025-02-28 03:40:25', '2025-02-28 03:40:25'),
(5094, 'F', 'olsontacoma@gmail.com', '2025-02-28 03:46:26', '2025-02-28 03:46:26'),
(5099, 'F', 'ciarancahill96@gmail.com', '2025-02-28 03:49:43', '2025-02-28 03:49:43'),
(5107, 'F', 'hillcrestconcretepumping@gmail.com', '2025-02-28 04:09:46', '2025-02-28 04:09:46'),
(5111, 'F', 'lola.etann@yahoo.com', '2025-02-28 04:12:14', '2025-02-28 04:12:14'),
(5124, 'F', 'chrellie@hotmail.co.uk', '2025-02-28 04:20:49', '2025-02-28 04:20:49'),
(5140, 'F', 'annarbarnhart@gmail.com', '2025-02-28 04:38:09', '2025-02-28 04:38:09'),
(5144, 'F', 'amandagarrett1987@yahoo.com', '2025-02-28 04:39:10', '2025-02-28 04:39:10'),
(5152, 'F', 'weth137@hotmail.com', '2025-02-28 04:46:28', '2025-02-28 04:46:28'),
(5160, 'F', 'kgiddings@premierws.net', '2025-02-28 04:55:04', '2025-02-28 04:55:04'),
(5163, 'F', 'shichijoe@gmail.com', '2025-02-28 05:01:26', '2025-02-28 05:01:26'),
(5175, 'F', 'wildierichter@yahoo.com', '2025-02-28 05:08:19', '2025-02-28 05:08:19'),
(5179, 'F', 'robertc@weleski.com', '2025-02-28 05:11:15', '2025-02-28 05:11:15'),
(5187, 'F', 'chevalier@sasktel.net', '2025-02-28 05:27:22', '2025-02-28 05:27:22'),
(5199, 'F', 'kateebutler97@gmail.com', '2025-02-28 05:32:00', '2025-02-28 05:32:00'),
(5201, 'F', 'higginson.claire@gmail.com', '2025-02-28 05:33:24', '2025-02-28 05:33:24'),
(5205, 'F', 'conortierney9188@gmail.com', '2025-02-28 05:37:44', '2025-02-28 05:37:44'),
(5207, 'F', 'bwinwood@comcast.net', '2025-02-28 05:37:51', '2025-02-28 05:37:51'),
(5216, 'F', 'jaack.richardson@gmail.com', '2025-02-28 05:44:16', '2025-02-28 05:44:16'),
(5220, 'F', 'rvandame@zoominternet.net', '2025-02-28 05:54:41', '2025-02-28 05:54:41'),
(5228, 'F', 'justinmayfield@me.com', '2025-02-28 06:02:26', '2025-02-28 06:02:26'),
(5236, 'F', 'mike@gergtoolanddie.com', '2025-02-28 06:07:43', '2025-02-28 06:07:43'),
(5248, 'F', 'ella@kenion.co.uk', '2025-02-28 06:34:31', '2025-02-28 06:34:31'),
(5252, 'F', 'cawelte@gmail.com', '2025-02-28 06:40:07', '2025-02-28 06:40:07'),
(5253, 'F', 'stevedunhoff@gmail.com', '2025-02-28 06:40:07', '2025-02-28 06:40:07'),
(5263, 'F', 'oscar@eyrsal.es', '2025-02-28 06:53:44', '2025-02-28 06:53:44'),
(5279, 'F', 'msreodica@aol.com', '2025-02-28 07:02:00', '2025-02-28 07:02:00'),
(5283, 'F', 'coelhofatima20@hotmail.com', '2025-02-28 07:03:01', '2025-02-28 07:03:01'),
(5289, 'F', 'mhutchinson@artelia.work', '2025-02-28 07:09:39', '2025-02-28 07:09:39'),
(5300, 'F', 'sandysouthwick@yahoo.com', '2025-02-28 07:41:33', '2025-02-28 07:41:33'),
(5304, 'F', 'crcook84@gmail.com', '2025-02-28 07:42:07', '2025-02-28 07:42:07'),
(5325, 'F', 'loubless45@hotmail.com', '2025-02-28 08:35:59', '2025-02-28 08:35:59'),
(5329, 'F', 'kvolkan2001@gmail.com', '2025-02-28 08:53:00', '2025-02-28 08:53:00'),
(5333, 'F', 'griselg52@gmail.com', '2025-02-28 09:11:32', '2025-02-28 09:11:32'),
(5337, 'F', 'twalck1021@gmail.com', '2025-02-28 09:19:50', '2025-02-28 09:19:50'),
(5341, 'F', 'cullen.moya@stonergroup.com', '2025-02-28 09:21:32', '2025-02-28 09:21:32'),
(5345, 'F', 'edcrowston+nye@gmail.com', '2025-02-28 09:33:35', '2025-02-28 09:33:35'),
(5353, 'F', 'rudy@prspipe.com', '2025-02-28 10:11:48', '2025-02-28 10:11:48'),
(5361, 'F', 'brotherbobby@gmail.com', '2025-02-28 11:29:28', '2025-02-28 11:29:28'),
(5365, 'F', 'gxedwin@gmail.com', '2025-02-28 11:32:09', '2025-02-28 11:32:09'),
(5369, 'F', 'steven.barker@comcast.net', '2025-02-28 14:04:36', '2025-02-28 14:04:36'),
(5370, 'F', 'naitomea396@gmail.com', '2025-02-28 14:29:35', '2025-02-28 14:29:35'),
(5377, 'F', 'dhnguyen0708@gmail.com', '2025-02-28 15:19:41', '2025-02-28 15:19:41'),
(5381, 'F', 'niyahbaby0805@icloud.com', '2025-02-28 16:02:30', '2025-02-28 16:02:30'),
(5388, 'F', 'tankpeacock@gmail.com', '2025-02-28 16:14:06', '2025-02-28 16:14:06'),
(5392, 'F', 'marlyjeanmary92@gmail.com', '2025-02-28 16:21:23', '2025-02-28 16:21:23'),
(5396, 'F', 'jljordan1301@gmail.com', '2025-02-28 16:35:30', '2025-02-28 16:35:30'),
(5400, 'F', 'firnmosesdn70@gmail.com', '2025-02-28 16:53:32', '2025-02-28 16:53:32'),
(5408, 'F', 'tahsinbadriyyah@gmail.com', '2025-02-28 18:59:16', '2025-02-28 18:59:16'),
(5415, 'F', 'rocketjhb@hotmail.com', '2025-02-28 21:11:36', '2025-02-28 21:11:36'),
(5419, 'F', 'r.zaknutrition@gmail.com', '2025-02-28 22:55:03', '2025-02-28 22:55:03'),
(5422, 'F', 'malittl@gmail.com', '2025-02-28 23:03:38', '2025-02-28 23:03:38'),
(5426, 'F', 'soumia.bentouila@gmail.com', '2025-02-28 23:08:57', '2025-02-28 23:08:57'),
(5428, 'F', 'azandyzundel@gmail.com', '2025-02-28 23:12:09', '2025-02-28 23:12:09'),
(5430, 'F', 'ctnmachining@att.net', '2025-02-28 23:13:34', '2025-02-28 23:13:34'),
(5434, 'F', 'davidrdoerr@gmail.com', '2025-02-28 23:28:41', '2025-02-28 23:28:41'),
(5436, 'F', 'anovotny1983@gmail.com', '2025-02-28 23:37:45', '2025-02-28 23:37:45'),
(5440, 'F', 'anitavena711@gmail.com', '2025-03-01 00:07:42', '2025-03-01 00:07:42'),
(5448, 'F', 'andreasanf@gmail.com', '2025-03-01 00:23:17', '2025-03-01 00:23:17'),
(5452, 'F', 'dave@magarient.com', '2025-03-01 00:28:20', '2025-03-01 00:28:20'),
(5456, 'F', 'amkirschner23@gmail.com', '2025-03-01 00:34:36', '2025-03-01 00:34:36'),
(5460, 'F', 'rtslates@comcast.net', '2025-03-01 00:41:43', '2025-03-01 00:41:43'),
(5480, 'F', 'twoodham77@gmail.com', '2025-03-01 01:19:04', '2025-03-01 01:19:04'),
(5484, 'F', 'jessicakane712@gmail.com', '2025-03-01 01:42:58', '2025-03-01 01:42:58'),
(5488, 'F', 'nelsonjhendrikse@gmail.com', '2025-03-01 01:43:28', '2025-03-01 01:43:28'),
(5491, 'F', 'dpscholes@gmail.com', '2025-03-01 03:00:02', '2025-03-01 03:00:02'),
(5495, 'F', 'randalljake45@gmail.com', '2025-03-01 03:01:36', '2025-03-01 03:01:36'),
(5499, 'F', 'jennamollan@hotmail.com', '2025-03-01 03:08:42', '2025-03-01 03:08:42'),
(5507, 'F', 'victoria7876@yahoo.co.uk', '2025-03-01 05:19:53', '2025-03-01 05:19:53'),
(5511, 'F', 'reonel.rafols@gmail.com', '2025-03-01 05:37:29', '2025-03-01 05:37:29'),
(5519, 'F', 'tuckeramy9@gmail.com', '2025-03-01 06:59:08', '2025-03-01 06:59:08'),
(5523, 'F', 'truesmiledd@gmail.com', '2025-03-01 08:09:19', '2025-03-01 08:09:19'),
(5526, 'F', 'chartampilae@gmail.com', '2025-03-01 10:07:49', '2025-03-01 10:07:49'),
(5528, 'F', 'ernstw@yahoo.com', '2025-03-01 11:56:32', '2025-03-01 11:56:32'),
(5532, 'F', 'kazuki08920@gmail.com', '2025-03-01 13:05:28', '2025-03-01 13:05:28'),
(5536, 'F', 'nika19823@yahoo.com', '2025-03-01 18:48:32', '2025-03-01 18:48:32'),
(5540, 'F', 'joshua.f148814@gmail.com', '2025-03-01 18:49:32', '2025-03-01 18:49:32'),
(5544, 'F', 'bobbycagle@ymail.com', '2025-03-01 19:55:08', '2025-03-01 19:55:08'),
(5547, 'F', 'tomiglasscock123@gmail.com', '2025-03-01 19:59:09', '2025-03-01 19:59:09'),
(5551, 'F', 'shawna.withers5504@gmail.com', '2025-03-01 20:06:17', '2025-03-01 20:06:17'),
(5555, 'F', 'lucy.lightbown@ocdsb.ca', '2025-03-02 00:16:19', '2025-03-02 00:16:19'),
(5559, 'F', 'christ.frot@gmail.com', '2025-03-02 00:42:37', '2025-03-02 00:42:37'),
(5563, 'F', 'hanora44@yahoo.co.uk', '2025-03-02 00:58:09', '2025-03-02 00:58:09'),
(5571, 'F', 'lucapio.canfora78@gmail.com', '2025-03-02 01:43:41', '2025-03-02 01:43:41'),
(5575, 'F', 'thelongbunch@verizon.net', '2025-03-02 02:03:01', '2025-03-02 02:03:01'),
(5579, 'F', 'masoudparsa3453@gmail.com', '2025-03-02 03:47:51', '2025-03-02 03:47:51'),
(5583, 'F', 'c.hanns@hotmail.com', '2025-03-02 04:17:58', '2025-03-02 04:17:58'),
(5587, 'F', 'jabyk2@gmail.com', '2025-03-02 04:18:27', '2025-03-02 04:18:27'),
(5591, 'F', 'w.s.lazar@gmail.com', '2025-03-02 04:33:16', '2025-03-02 04:33:16'),
(5603, 'F', 'kglosli@yahoo.ca', '2025-03-02 05:12:21', '2025-03-02 05:12:21'),
(5607, 'F', 'zarate_yesenia21@yahoo.com', '2025-03-02 05:13:19', '2025-03-02 05:13:19'),
(5610, 'F', 'jennkaaikala6@gmail.com', '2025-03-02 06:32:22', '2025-03-02 06:32:22'),
(5614, 'F', 'trevsprice@hotmail.com', '2025-03-02 06:33:45', '2025-03-02 06:33:45'),
(5618, 'F', 'freddeutsch1975@gmail.com', '2025-03-02 07:38:41', '2025-03-02 07:38:41'),
(5626, 'F', 'lynnwelch7@gmail.com', '2025-03-02 08:52:54', '2025-03-02 08:52:54'),
(5630, 'F', 'snowdrop2608@gmail.com', '2025-03-02 08:59:01', '2025-03-02 08:59:01'),
(5634, 'F', 'cocking13@yahoo.com', '2025-03-02 08:59:45', '2025-03-02 08:59:45'),
(5641, 'F', 'malocup@comcast.net', '2025-03-02 09:10:47', '2025-03-02 09:10:47'),
(5645, 'F', 'julie_krawczyk@comcast.net', '2025-03-02 09:55:51', '2025-03-02 09:55:51'),
(5649, 'F', 'ray92108@gmail.com', '2025-03-02 10:25:14', '2025-03-02 10:25:14'),
(5653, 'F', 'meirzwieb@gmail.com', '2025-03-02 13:42:45', '2025-03-02 13:42:45'),
(5657, 'F', 'gcrouch@cs3technology.com', '2025-03-02 14:07:13', '2025-03-02 14:07:13'),
(5661, 'F', 'usnav8tor@msn.com', '2025-03-02 14:35:01', '2025-03-02 14:35:01'),
(5666, 'F', 'jasminhamulic@gmail.com', '2025-03-02 16:23:20', '2025-03-02 16:23:20'),
(5670, 'F', 'emmador@cox.net', '2025-03-02 17:05:06', '2025-03-02 17:05:06'),
(5673, 'F', 'sjwhit77@gmail.com', '2025-03-02 17:27:51', '2025-03-02 17:27:51'),
(5681, 'F', 'robinsontornando@gmail.com', '2025-03-02 19:51:43', '2025-03-02 19:51:43'),
(5685, 'F', 'tejedajuan19@gmail.com', '2025-03-02 20:07:02', '2025-03-02 20:07:02'),
(5689, 'F', 'francis.vigneux.blais@csdessommets.qc.ca', '2025-03-02 20:21:45', '2025-03-02 20:21:45'),
(5693, 'F', 'liliancik55@gmail.com', '2025-03-02 21:47:49', '2025-03-02 21:47:49'),
(5697, 'F', 'mariejoseevigneault@globetrotter.net', '2025-03-02 22:06:25', '2025-03-02 22:06:25'),
(5701, 'F', 'deyanaris_16@hotmail.es', '2025-03-02 22:44:12', '2025-03-02 22:44:12'),
(5705, 'F', 'mad.martian.marching.band@gmail.com', '2025-03-02 23:04:14', '2025-03-02 23:04:14'),
(5709, 'F', 'kdrobbins4@gmail.com', '2025-03-02 23:04:58', '2025-03-02 23:04:58'),
(5713, 'F', 'tiftales73@hotmail.com', '2025-03-02 23:14:13', '2025-03-02 23:14:13'),
(5716, 'F', 'e.v.temminck.08@aberdeen.ac.uk', '2025-03-03 00:22:47', '2025-03-03 00:22:47'),
(5720, 'F', 'sophiesparkes1708@gmail.com', '2025-03-03 01:29:29', '2025-03-03 01:29:29'),
(5724, 'F', 'butterfieldkatherine@gmail.com', '2025-03-03 01:56:40', '2025-03-03 01:56:40'),
(5728, 'F', 'megandbright1@gmail.com', '2025-03-03 02:43:33', '2025-03-03 02:43:33'),
(5732, 'F', 'marco.reis@dcdsb.ca', '2025-03-03 03:44:19', '2025-03-03 03:44:19'),
(5736, 'F', 'arrowsmith500@gmail.com', '2025-03-03 04:03:19', '2025-03-03 04:03:19'),
(5744, 'F', 'scragg2603@hotmail.co.uk', '2025-03-03 05:00:36', '2025-03-03 05:00:36'),
(5747, 'F', 'paulfantonic@gmail.com', '2025-03-03 05:49:48', '2025-03-03 05:49:48'),
(5751, 'F', 'hitmanvideo2004@yahoo.com', '2025-03-03 08:10:52', '2025-03-03 08:10:52'),
(5755, 'F', 's93007727600713@gmail.com', '2025-03-03 09:22:48', '2025-03-03 09:22:48'),
(5759, 'F', 'k1n1ji@gmail.com', '2025-03-03 09:40:11', '2025-03-03 09:40:11'),
(5763, 'F', 'mallorystudebaker@yahoo.com', '2025-03-03 12:03:20', '2025-03-03 12:03:20'),
(5767, 'F', 'elizabeth.gray@yolocounty.org', '2025-03-03 13:01:28', '2025-03-03 13:01:28'),
(5771, 'F', 'nigarash@yahoo.com', '2025-03-03 15:56:04', '2025-03-03 15:56:04'),
(5775, 'F', 'atashi_basu@yahoo.com', '2025-03-03 18:37:52', '2025-03-03 18:37:52'),
(5779, 'F', 'scotlmccabe@yahoo.com', '2025-03-03 19:34:53', '2025-03-03 19:34:53'),
(5783, 'F', 'ajay.mistry_home@yahoo.co.uk', '2025-03-03 19:44:42', '2025-03-03 19:44:42'),
(5787, 'F', 'zzzenko@aol.com', '2025-03-03 19:50:41', '2025-03-03 19:50:41'),
(5791, 'F', 'lizwheatland@yahoo.co.uk', '2025-03-03 20:32:18', '2025-03-03 20:32:18'),
(5794, 'F', 'jbplumbingandrooter@yahoo.com', '2025-03-03 21:17:08', '2025-03-03 21:17:08'),
(5798, 'F', 'ksfinklea@yahoo.com', '2025-03-03 22:19:45', '2025-03-03 22:19:45'),
(5802, 'F', 'saharberjis@yahoo.com', '2025-03-03 22:59:38', '2025-03-03 22:59:38'),
(5806, 'F', 'sarina0104@yahoo.com', '2025-03-04 00:12:12', '2025-03-04 00:12:12'),
(5810, 'F', 'lenagfrench@yahoo.com', '2025-03-04 01:29:51', '2025-03-04 01:29:51'),
(5814, 'F', 'scottandlindaf@yahoo.com', '2025-03-04 03:11:42', '2025-03-04 03:11:42'),
(5818, 'F', 'mandy.seegers@yahoo.com', '2025-03-04 04:15:31', '2025-03-04 04:15:31'),
(5820, 'F', 'mcvwvsdkn@yahoo.com', '2025-03-04 10:03:28', '2025-03-04 10:03:28'),
(5824, 'F', 'dewsnampusi@yahoo.com', '2025-03-04 11:15:33', '2025-03-04 11:15:33'),
(5828, 'F', 'sqcdscn2ihc@yahoo.com', '2025-03-04 15:00:04', '2025-03-04 15:00:04'),
(5829, 'F', 'kollymcamacho51@gmail.com', '2025-03-05 01:28:04', '2025-03-05 01:28:04'),
(5832, 'F', 'hanskihuaso@yahoo.com', '2025-03-05 03:11:12', '2025-03-05 03:11:12'),
(5836, 'F', 'sxkvvo0sa7h@yahoo.com', '2025-03-05 06:43:08', '2025-03-05 06:43:08'),
(5839, 'F', 'mcknightfrimenwi12@gmail.com', '2025-03-05 08:56:18', '2025-03-05 08:56:18'),
(5843, 'F', 'tcnw4bqs1k@yahoo.com', '2025-03-05 10:58:04', '2025-03-05 10:58:04'),
(5844, 'F', 'ysvsqvmgnt@yahoo.com', '2025-03-05 15:49:55', '2025-03-05 15:49:55'),
(5848, 'F', 'frueaigliatur@yahoo.com', '2025-03-05 17:20:04', '2025-03-05 17:20:04'),
(5852, 'F', 'shvbdtccudhu@yahoo.com', '2025-03-05 19:28:04', '2025-03-05 19:28:04'),
(5856, 'F', 'xparudytvbnic@yahoo.com', '2025-03-05 20:20:48', '2025-03-05 20:20:48'),
(5860, 'F', 'sr9pqpehmcy1uunxf@yahoo.com', '2025-03-05 21:03:45', '2025-03-05 21:03:45'),
(5864, 'F', 'daimondvargas2001@gmail.com', '2025-03-06 04:45:32', '2025-03-06 04:45:32'),
(5868, 'F', 'rdexcmbwqlchpu@yahoo.com', '2025-03-06 05:16:05', '2025-03-06 05:16:05'),
(5872, 'F', 'lrhfovkxvez@yahoo.com', '2025-03-06 06:06:03', '2025-03-06 06:06:03'),
(5876, 'F', 'udxvvqjtqk@yahoo.com', '2025-03-06 08:43:07', '2025-03-06 08:43:07'),
(5880, 'F', 'iammrbjxladhp@yahoo.com', '2025-03-06 13:20:05', '2025-03-06 13:20:05'),
(5884, 'F', 'almiagattadahalli@yahoo.com', '2025-03-06 18:28:09', '2025-03-06 18:28:09'),
(5887, 'F', 'pmiriamp2001@gmail.com', '2025-03-06 22:06:01', '2025-03-06 22:06:01'),
(5894, 'F', 'wbqdganjbtnp@yahoo.com', '2025-03-07 14:13:44', '2025-03-07 14:13:44'),
(5901, 'F', 'djinnihobbs@gmail.com', '2025-03-07 19:27:25', '2025-03-07 19:27:25'),
(5905, 'F', 'aunseenoui23iris5@gmail.com', '2025-03-08 04:37:55', '2025-03-08 04:37:55'),
(5913, 'F', 'nqntwkftogrymuxwy@yahoo.com', '2025-03-08 06:32:10', '2025-03-08 06:32:10'),
(5918, 'F', 'arerangut@yahoo.com', '2025-03-08 22:02:01', '2025-03-08 22:02:01'),
(5922, 'F', 'bcultakpij9q@yahoo.com', '2025-03-09 02:46:33', '2025-03-09 02:46:33'),
(5925, 'F', 'gidelchambre@yahoo.com', '2025-03-09 06:35:05', '2025-03-09 06:35:05'),
(5929, 'F', 'browningleksiyaos4@gmail.com', '2025-03-09 09:45:06', '2025-03-09 09:45:06'),
(5933, 'F', 'herrybreick@yahoo.com', '2025-03-09 13:59:02', '2025-03-09 13:59:02'),
(5937, 'F', 'marshletti3@gmail.com', '2025-03-09 22:34:49', '2025-03-09 22:34:49'),
(5941, 'F', 'gzhwnaaquqvycj@yahoo.com', '2025-03-11 02:02:06', '2025-03-11 02:02:06'),
(5945, 'F', 'lfryjq24@gmail.com', '2025-03-11 04:17:11', '2025-03-11 04:17:11'),
(5949, 'F', 'ykworwpkvzj@yahoo.com', '2025-03-11 09:09:11', '2025-03-11 09:09:11'),
(5956, 'F', 'cauliffepaoletto@yahoo.com', '2025-03-11 16:27:01', '2025-03-11 16:27:01'),
(5960, 'F', 'alisandrd25@gmail.com', '2025-03-11 18:44:48', '2025-03-11 18:44:48'),
(5964, 'F', 'kbernardwh2006@gmail.com', '2025-03-11 20:20:04', '2025-03-11 20:20:04'),
(5968, 'F', 'craneshonabn@gmail.com', '2025-03-12 01:23:10', '2025-03-12 01:23:10'),
(5972, 'F', 'sutherlystrdvent@yahoo.com', '2025-03-12 01:56:08', '2025-03-12 01:56:08'),
(5976, 'F', 'x5mcnw9dbg@yahoo.com', '2025-03-12 13:43:06', '2025-03-12 13:43:06'),
(5980, 'F', 'kmiyaon55@gmail.com', '2025-03-12 15:57:04', '2025-03-12 15:57:04'),
(5986, 'F', 'tunikcollinridge@yahoo.com', '2025-03-13 05:39:05', '2025-03-13 05:39:05'),
(5990, 'F', 'cunnsedaraw33@gmail.com', '2025-03-13 09:14:05', '2025-03-13 09:14:05'),
(5992, 'F', 'fajttlarek@yahoo.com', '2025-03-13 13:13:13', '2025-03-13 13:13:13'),
(5993, 'F', 'brinnamaynard7@gmail.com', '2025-03-13 15:10:22', '2025-03-13 15:10:22'),
(5997, 'F', 'saundizza54@gmail.com', '2025-03-13 18:43:15', '2025-03-13 18:43:15'),
(6013, 'F', 'arossiroks@yahoo.com', '2025-03-14 11:03:03', '2025-03-14 11:03:03'),
(6017, 'F', 'teiths17@gmail.com', '2025-03-14 13:39:07', '2025-03-14 13:39:07'),
(6019, 'F', 'eqzldcxtc5@yahoo.com', '2025-03-14 15:16:04', '2025-03-14 15:16:04'),
(6023, 'F', 'j1glnifg8pyotjh@yahoo.com', '2025-03-14 16:29:41', '2025-03-14 16:29:41'),
(6032, 'F', 'colleen.ptashinskaya627723@yahoo.com', '2025-03-15 01:30:44', '2025-03-15 01:30:44'),
(6036, 'F', 'beylafe47@gmail.com', '2025-03-15 02:56:28', '2025-03-15 02:56:28'),
(6037, 'F', 'kenhines270089@yahoo.com', '2025-03-15 11:39:36', '2025-03-15 11:39:36'),
(6041, 'F', 'michelle.salazar21686@yahoo.com', '2025-03-15 14:10:02', '2025-03-15 14:10:02'),
(6049, 'F', 'zitokenneth431135@yahoo.com', '2025-03-16 03:12:15', '2025-03-16 03:12:15'),
(6051, 'F', 'cordon_colin269146@yahoo.com', '2025-03-16 21:27:14', '2025-03-16 21:27:14'),
(6055, 'F', 'bmaciasu@gmail.com', '2025-03-17 00:08:04', '2025-03-17 00:08:04'),
(6059, 'F', 'bettywright106624@yahoo.com', '2025-03-17 02:02:06', '2025-03-17 02:02:06'),
(6064, 'F', 'brown_leah876124@yahoo.com', '2025-03-17 13:09:46', '2025-03-17 13:09:46'),
(6070, 'F', 'laladjfloreshh4@gmail.com', '2025-03-17 23:34:14', '2025-03-17 23:34:14'),
(6074, 'F', 'amywilliams873290@yahoo.com', '2025-03-17 23:44:41', '2025-03-17 23:44:41'),
(6077, 'F', 'garcia.angel712868@yahoo.com', '2025-03-18 06:15:09', '2025-03-18 06:15:09'),
(6081, 'F', 'park_claire1987@yahoo.com', '2025-03-18 06:18:01', '2025-03-18 06:18:01'),
(6085, 'F', 'megan_brown932604@yahoo.com', '2025-03-18 10:33:04', '2025-03-18 10:33:04'),
(6087, 'F', 'mar18+341737@gay.email', '2025-03-18 11:19:49', '2025-03-18 11:19:49'),
(6088, 'F', 'mar18+341741@gay.email', '2025-03-18 11:19:49', '2025-03-18 11:19:49'),
(6089, 'F', 'mar18+341739@gay.email', '2025-03-18 11:19:49', '2025-03-18 11:19:49'),
(6090, 'F', 'mar18+341736@gay.email', '2025-03-18 11:19:49', '2025-03-18 11:19:49'),
(6092, 'F', 'justin.kramer291290@yahoo.com', '2025-03-18 19:12:04', '2025-03-18 19:12:04'),
(6098, 'F', 'byrdkathy235654@yahoo.com', '2025-03-19 00:52:27', '2025-03-19 00:52:27'),
(6101, 'F', 'denahgl45@gmail.com', '2025-03-19 01:26:08', '2025-03-19 01:26:08'),
(6105, 'F', 'oldoshann2@gmail.com', '2025-03-19 05:23:05', '2025-03-19 05:23:05'),
(6109, 'F', 'mejiajeff402245@yahoo.com', '2025-03-19 09:38:03', '2025-03-19 09:38:03'),
(6113, 'F', 'walter_gary1993@yahoo.com', '2025-03-19 12:18:03', '2025-03-19 12:18:03'),
(6116, 'F', 'jeremy.ellison41203@yahoo.com', '2025-03-19 18:05:05', '2025-03-19 18:05:05'),
(6120, 'F', 'wilkerluks@gmail.com', '2025-03-19 22:00:35', '2025-03-19 22:00:35'),
(6122, 'F', 'amy_snyder740042@yahoo.com', '2025-03-19 22:32:03', '2025-03-19 22:32:03'),
(6126, 'F', 'sarah_harris185761@yahoo.com', '2025-03-20 01:03:04', '2025-03-20 01:03:04'),
(6130, 'F', 'dillon_anna627235@yahoo.com', '2025-03-20 04:57:04', '2025-03-20 04:57:04'),
(6134, 'F', 'smitherin404193@yahoo.com', '2025-03-20 12:05:06', '2025-03-20 12:05:06'),
(6140, 'F', 'stacy_yazzie714996@yahoo.com', '2025-03-20 14:27:11', '2025-03-20 14:27:11'),
(6144, 'F', 'parra.derrick658967@yahoo.com', '2025-03-20 17:27:08', '2025-03-20 17:27:08'),
(6148, 'F', 'kimberly_harris33805@yahoo.com', '2025-03-21 10:52:02', '2025-03-21 10:52:02'),
(6152, 'F', 'rosedawn1995@yahoo.com', '2025-03-21 14:58:03', '2025-03-21 14:58:03'),
(6156, 'F', 'earnestmarquise324224@yahoo.com', '2025-03-21 19:49:03', '2025-03-21 19:49:03'),
(6160, 'F', 'andjelamerrittp@gmail.com', '2025-03-21 19:57:02', '2025-03-21 19:57:02'),
(6164, 'F', 'acogregnb@gmail.com', '2025-03-21 21:18:10', '2025-03-21 21:18:10'),
(6168, 'F', 'kevincarpenter1993@yahoo.com', '2025-03-22 00:06:02', '2025-03-22 00:06:02'),
(6176, 'F', 'djenwolfehr46@gmail.com', '2025-03-22 10:20:22', '2025-03-22 10:20:22'),
(6179, 'F', 'izabelladoughertykx@gmail.com', '2025-03-22 11:04:39', '2025-03-22 11:04:39'),
(6181, 'F', 'lindsaysmith436448@yahoo.com', '2025-03-22 15:30:34', '2025-03-22 15:30:34'),
(6185, 'F', 'marissasanchez288755@yahoo.com', '2025-03-22 21:03:24', '2025-03-22 21:03:24'),
(6189, 'F', 'megan_williams994113@yahoo.com', '2025-03-22 23:08:19', '2025-03-22 23:08:19'),
(6190, 'F', 'djenarnj18@gmail.com', '2025-03-23 02:09:24', '2025-03-23 02:09:24'),
(6194, 'F', 'walkermichael723832@yahoo.com', '2025-03-23 02:16:33', '2025-03-23 02:16:33'),
(6198, 'F', 'marivonnmm52@gmail.com', '2025-03-23 13:07:04', '2025-03-23 13:07:04'),
(6202, 'F', 'palmer.jonathan62254@yahoo.com', '2025-03-23 16:02:05', '2025-03-23 16:02:05'),
(6206, 'F', 'jones.angel646335@yahoo.com', '2025-03-24 01:37:28', '2025-03-24 01:37:28'),
(6210, 'F', 'stevenpearson903827@yahoo.com', '2025-03-24 14:30:29', '2025-03-24 14:30:29'),
(6214, 'F', 'selestabranch29@gmail.com', '2025-03-24 17:10:11', '2025-03-24 17:10:11'),
(6218, 'F', 'lorie.franklin74417@yahoo.com', '2025-03-24 17:23:04', '2025-03-24 17:23:04'),
(6221, 'F', 'juarezderriky2@gmail.com', '2025-03-24 20:23:29', '2025-03-24 20:23:29'),
(6223, 'F', 'sullivan_julio439442@yahoo.com', '2025-03-24 21:15:13', '2025-03-24 21:15:13'),
(6227, 'F', 'patrickshamburger415480@yahoo.com', '2025-03-26 03:01:37', '2025-03-26 03:01:37'),
(6231, 'F', 'chance.jamie180877@yahoo.com', '2025-03-26 20:58:48', '2025-03-26 20:58:48'),
(6234, 'F', 'derevasqut3@gmail.com', '2025-03-26 21:38:29', '2025-03-26 21:38:29'),
(6238, 'F', 'mistywalker699643@yahoo.com', '2025-03-27 07:19:03', '2025-03-27 07:19:03'),
(6241, 'F', 'ross.cathy1994@yahoo.com', '2025-03-27 16:37:09', '2025-03-27 16:37:09'),
(6249, 'F', 'hyeireillya82@gmail.com', '2025-03-27 21:26:06', '2025-03-27 21:26:06'),
(6253, 'F', 'mar28+479333@gay.email', '2025-03-27 22:01:38', '2025-03-27 22:01:38'),
(6254, 'F', 'mharperh55@gmail.com', '2025-03-27 23:47:06', '2025-03-27 23:47:06'),
(6256, 'F', 'turner_megan919479@yahoo.com', '2025-03-28 07:59:55', '2025-03-28 07:59:55'),
(6260, 'F', 'candy.willis306390@yahoo.com', '2025-03-28 18:06:03', '2025-03-28 18:06:03'),
(6264, 'F', 'lewishelen138588@yahoo.com', '2025-03-28 19:54:14', '2025-03-28 19:54:14'),
(6267, 'F', 'hettip17@gmail.com', '2025-03-28 19:57:17', '2025-03-28 19:57:17'),
(6269, 'F', 'hpadjetx1990@gmail.com', '2025-03-29 02:03:28', '2025-03-29 02:03:28'),
(6273, 'F', 'imodjenm3@gmail.com', '2025-03-29 03:57:56', '2025-03-29 03:57:56'),
(6276, 'F', 'jim_archer130198@yahoo.com', '2025-03-29 06:37:55', '2025-03-29 06:37:55'),
(6279, 'F', 'smith.anna835946@yahoo.com', '2025-03-29 08:51:13', '2025-03-29 08:51:13'),
(6280, 'F', 'destinefitzgeraldk@gmail.com', '2025-03-29 11:40:06', '2025-03-29 11:40:06'),
(6283, 'F', 'bindervernon654307@yahoo.com', '2025-03-29 21:05:15', '2025-03-29 21:05:15'),
(6285, 'F', 'greflosr1992@gmail.com', '2025-03-30 10:09:44', '2025-03-30 10:09:44'),
(6288, 'F', 'kristainbxl18@gmail.com', '2025-03-31 03:45:58', '2025-03-31 03:45:58'),
(6292, 'F', 'ocharantimothy227479@yahoo.com', '2025-03-31 19:50:05', '2025-03-31 19:50:05'),
(6296, 'F', 'howard_scott627176@yahoo.com', '2025-04-01 03:26:03', '2025-04-01 03:26:03'),
(6300, 'F', 'jennifer.johnson990020@yahoo.com', '2025-04-01 06:07:48', '2025-04-01 06:07:48'),
(6304, 'F', 'jennifer.phelps925201@yahoo.com', '2025-04-01 15:12:06', '2025-04-01 15:12:06'),
(6308, 'F', 'plesantsantiagoux46@gmail.com', '2025-04-01 18:39:19', '2025-04-01 18:39:19'),
(6312, 'F', 'kelvinbcz84@gmail.com', '2025-04-01 21:50:44', '2025-04-01 21:50:44'),
(6316, 'F', 'rgrantcu1983@gmail.com', '2025-04-03 00:10:17', '2025-04-03 00:10:17'),
(6319, 'F', 'stroman_marcos759717@yahoo.com', '2025-04-03 02:05:46', '2025-04-03 02:05:46'),
(6320, 'F', 'gnormanoq1989@gmail.com', '2025-04-03 06:25:30', '2025-04-03 06:25:30'),
(6323, 'F', 'jessica.johnson684550@yahoo.com', '2025-04-03 12:50:16', '2025-04-03 12:50:16'),
(6325, 'F', 'bowkristita48@gmail.com', '2025-04-03 23:49:07', '2025-04-03 23:49:07'),
(6329, 'F', 'mccormickkyinnua24@gmail.com', '2025-04-04 03:21:43', '2025-04-04 03:21:43'),
(6333, 'F', 'boniliren3@gmail.com', '2025-04-04 17:38:06', '2025-04-04 17:38:06'),
(6337, 'F', 'mirandakazandra50@gmail.com', '2025-04-05 00:10:30', '2025-04-05 00:10:30'),
(6338, 'F', 'rondataylor384640@yahoo.com', '2025-04-05 16:53:28', '2025-04-05 16:53:28'),
(6342, 'F', 'brewilkiu@gmail.com', '2025-04-05 19:31:40', '2025-04-05 19:31:40'),
(6345, 'F', 'cristalgauthier359561@yahoo.com', '2025-04-06 00:47:35', '2025-04-06 00:47:35'),
(6349, 'F', 'thompson.kimberly507864@yahoo.com', '2025-04-06 05:50:16', '2025-04-06 05:50:16'),
(6352, 'F', 'sinhelmm@gmail.com', '2025-04-06 23:24:02', '2025-04-06 23:24:02'),
(6356, 'F', 'dodiburch2003@gmail.com', '2025-04-07 05:07:44', '2025-04-07 05:07:44'),
(6360, 'F', 'dknightq1998@gmail.com', '2025-04-07 14:47:49', '2025-04-07 14:47:49'),
(6364, 'F', 'bbrewerq44@gmail.com', '2025-04-07 23:16:28', '2025-04-07 23:16:28'),
(6368, 'F', 'ortega.elizabeth879974@yahoo.com', '2025-04-08 06:03:02', '2025-04-08 06:03:02'),
(6372, 'F', 'donna_anderson729599@yahoo.com', '2025-04-08 13:17:48', '2025-04-08 13:17:48'),
(6373, 'F', 'ramseymerfiz7@gmail.com', '2025-04-08 17:24:13', '2025-04-08 17:24:13'),
(6377, 'F', 'quiceno.steven831616@yahoo.com', '2025-04-08 22:02:09', '2025-04-08 22:02:09'),
(6381, 'F', 'rlethaef@gmail.com', '2025-04-08 22:04:05', '2025-04-08 22:04:05'),
(6383, 'F', 'johnson.lisa335284@yahoo.com', '2025-04-09 03:23:13', '2025-04-09 03:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `nova_media_library`
--

CREATE TABLE `nova_media_library` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `lp` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0945659df2a74e5b19beaad83934b44b25c1299613b9a48973cf05f956481177b855928b80819994', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 07:27:23', '2025-05-04 07:27:23', '2026-05-04 13:12:23'),
('0aa51c38713403c92503d012c61524fa23822d0c35689d85030843e36893c54aed90e799cfe27170', 1, 1, 'UserAuth', '[]', 1, '2025-05-04 10:00:28', '2025-05-05 06:59:22', '2026-05-04 15:45:28'),
('19c4313c11b2630a9745afd5b64e7df9827376b3a09d35f6983e2a7c1a24e9a263b1c3f168052740', 1, 1, 'UserAuth', '[]', 0, '2025-05-04 08:34:02', '2025-05-04 08:34:02', '2026-05-04 14:19:02'),
('349f7e58cb7ae739dfeeca6a248fa1d558ca55ab8c7693067f516adad1618d0a5d0b80f4cb314d5d', 2, 1, 'UserAuth', '[]', 0, '2025-05-02 08:51:45', '2025-05-02 08:51:45', '2026-05-02 14:36:45'),
('3573813d54df71148b0b8c817fa21bb8c7965aac3b5bbda7d85ffa8e75629d284d32c1ffeefb2cf1', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:47:35', '2025-05-01 10:47:35', '2026-05-01 16:32:35'),
('468f34af609e43c4175499802760f0156e06c1d1eca34391f53dbde50cbdff3ba8544c691271722a', 2, 1, 'UserAuth', '[]', 0, '2025-05-15 06:41:45', '2025-05-15 06:41:45', '2026-05-15 12:26:45'),
('46b7cb3961a66301aab49b25aeb969db76e57f39f1f6ab1528b36ffe1ce903ba9d25bc76e3501e50', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 06:10:29', '2025-05-04 06:10:29', '2026-05-04 11:55:29'),
('4deb01b5201ecd9f6c7a04c05809d651b50398e485245b4a55273ccf4adb4c719526aa8a633da32a', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 10:53:42', '2025-05-04 10:53:42', '2026-05-04 16:38:42'),
('512115724e924901de5a270882e078efa7e9fa844c7a571de340cb093e22f39ee05fb4b25c6a6b60', 1, 1, 'UserAuth', '[]', 0, '2025-05-04 04:50:36', '2025-05-04 04:50:37', '2026-05-04 10:35:36'),
('58a069f7fb7859aeca3ec5e98fbd01ab1edd94d2a700e0841e8c7c4bc44b70233d01a269a607a495', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 11:06:36', '2025-05-01 11:06:36', '2026-05-01 16:51:36'),
('62eaed1349fa1c832562690fa845188486346e69879aedfd7fbf48bb620c73fb0990d73518b6ca23', 1, 1, 'UserAuth', '[]', 0, '2025-05-01 08:11:08', '2025-05-01 08:11:08', '2026-05-01 13:56:08'),
('6419ddd279c4323449d0783f3610e9dc85f3387cdc80cc36bbe725f5f1b0289cfccabd037c16e149', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:36:40', '2025-05-01 10:36:40', '2026-05-01 16:21:40'),
('6c855e56db57cf4c21489e4f869823db268fe940ec7d7acbb180337fff74aa913e4470285a536f41', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 07:34:57', '2025-05-04 07:34:57', '2026-05-04 13:19:57'),
('7ceb90704478b9f6b1f6ef14c0bfe702da4bac53fd483fbd25bb5027a4ec70d775dc011743dad379', 1, 1, 'UserAuth', '[]', 0, '2025-05-05 07:28:56', '2025-05-05 07:28:56', '2026-05-05 13:13:56'),
('85b0af2c4b9717441952a9bda13d2fdc6a6be6e52faa252fbae0b9c92c255ca2961561b7ccd815d1', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:29:43', '2025-05-01 10:29:43', '2026-05-01 16:14:43'),
('8a99494ccab98b17638a2592915c0a17e717d710f2960881401f005825890622a6ef674c49d35d01', 1, 1, 'UserAuth', '[]', 0, '2025-05-15 04:30:50', '2025-05-15 04:30:50', '2026-05-15 10:15:50'),
('8f066aad58a38fe4813ded3007e696e88eb5a2a7656103f76e98bfd237f64ee8a352e5b7313e5730', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 08:01:53', '2025-05-04 08:01:53', '2026-05-04 13:46:53'),
('90d8c260bf4d67685eddc480c337e305ed55f73cc406579c8413ee54d0fc9d06f68b06b7d52ac337', 1, 1, 'UserAuth', '[]', 0, '2025-05-13 09:33:35', '2025-05-13 09:33:36', '2026-05-13 15:18:35'),
('9c48e29aacba47ebadcea91628bdd51906525507601b7f4d179e07fa4d129e95f3e01435a8d52ca8', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:35:28', '2025-05-01 10:35:28', '2026-05-01 16:20:28'),
('a057be1ed47d7c65bc294871e33b009250d2aa164d35ede9bcaf154dd7fdcde3325361019d9e09c5', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 09:42:27', '2025-05-01 09:42:28', '2026-05-01 15:27:27'),
('a0f37d147cea7d85ca74ce6440d98abf6c24119e8812eab23e088ae31d3f0975a0f754962328f468', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 05:26:22', '2025-05-04 05:26:22', '2026-05-04 11:11:22'),
('a4e087b4d19019b5a62dbc8f3897cd22277ba61f450402b096546c8e1c2787d69d04f13e363cbba3', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 09:57:47', '2025-05-04 09:57:47', '2026-05-04 15:42:47'),
('a6c029cf0b59932c276471e4ca91842417daaa23099c9b34c0d1765b49b8262d89284573d0e14ef3', 1, 1, 'UserAuth', '[]', 0, '2025-05-01 08:14:16', '2025-05-01 08:14:16', '2026-05-01 13:59:16'),
('ad8d9f588bbeb14a658eee9c62276d53880d64d4c7c355a32e287e0409acd0b1cedb067c3e9b51de', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:39:52', '2025-05-01 10:39:52', '2026-05-01 16:24:52'),
('b59907f13a9dd2770d9f7c17b34236beadf82f6ffe727ca2416594cda2b0924c60d0989c225a710c', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 07:32:02', '2025-05-04 07:32:02', '2026-05-04 13:17:02'),
('bddbe4e29ed31c408aeb885572a7c154593370aabaf1b3a3f01d43f295cf4ecc3a36d1e3f14c1c94', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:22:36', '2025-05-01 10:22:36', '2026-05-01 16:07:36'),
('c9ef24da744eb9c155b8462d2c6a14f429726611dc97264ba8a5eb82be57578759e2773ef03b8b2d', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:29:07', '2025-05-01 10:29:07', '2026-05-01 16:14:07'),
('cc0911d9ef068ca2b57a78b42c9b14da2a3b35f83f8b65b64c02ef51f82f8740c45710ffb8c439c6', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 07:26:40', '2025-05-04 07:26:41', '2026-05-04 13:11:40'),
('cdb32ad963105f61806c6bb9d1e75eb7ef64db7fe9056950ee8e52abad2e9327f3a1acf9d5c6e4fa', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 07:33:00', '2025-05-04 07:33:00', '2026-05-04 13:18:00'),
('cdf0ae7e1467fb8fc98ec1cae0f1e1a72d4689b0525abb0722892e66e4220cb8e89565238124205f', 2, 1, 'UserAuth', '[]', 0, '2025-05-02 06:20:42', '2025-05-02 06:20:43', '2026-05-02 12:05:42'),
('d20ba106057a04729082e8d19d434d78aaa1d451d419df7ad474cd2b9e2e217e6fc5fc7178ed8195', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 10:20:51', '2025-05-04 10:20:51', '2026-05-04 16:05:51'),
('d62ec95cd6433d6913dff371ec56d292264c83426f2080d5d567ba1f9bb1172ce4407ea5234fadaa', 1, 1, 'UserAuth', '[]', 0, '2025-05-13 10:51:19', '2025-05-13 10:51:19', '2026-05-13 16:36:19'),
('d6f91c03a61f4eb82111691d7835ef1823ee5ea4160349ce1ebf59614043caf350ecdc706b6bad14', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 06:09:50', '2025-05-04 06:09:50', '2026-05-04 11:54:50'),
('d7c44492f6179939bde53b4a8e88fb935fea2d6dbadec72e60ad91653e1dddd3b08d3bb4a403099b', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 06:40:47', '2025-05-04 06:40:47', '2026-05-04 12:25:47'),
('d88ee782d7ab6c2f71160915be03306975cc33bcf0f087bfcf50a0fa5a65c4ad49db98489b0114d4', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:28:50', '2025-05-01 10:28:50', '2026-05-01 16:13:50'),
('e33f7e25b39bfd3a1095665aae6f4244a40710a2da4c3ac31924528f8fb486a78dbd6b55f3e382b6', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 05:29:18', '2025-05-04 05:29:18', '2026-05-04 11:14:18'),
('e409f20c0ec1f174f9ab5513ce38568a13546fefc97bd4ec609da7e7f26c57ceb663285af5541b56', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:48:32', '2025-05-01 10:48:32', '2026-05-01 16:33:32'),
('f1bd79b94383caed524ac4f208b45a86a851fd6ccd8de7c97dc0a30a1747349a36efe91d59b8b5eb', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:55:52', '2025-05-01 10:55:52', '2026-05-01 16:40:52'),
('f3135bc1b1c8c6dbb3f7a49fb2d296e7b7b2a385a552434697208d4596a47dc7df6200ccb9a5e9f2', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 06:11:24', '2025-05-04 06:11:24', '2026-05-04 11:56:24'),
('f367b97e8c728b8c78a9efed9db5d2ef1122021d11511ce63a8e3219255e8c6e3c2819762c783a9c', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 06:42:23', '2025-05-04 06:42:23', '2026-05-04 12:27:23'),
('f4481db8da32f12b76c97bde3ace5828aa0d9a9e536b4bf70d2bc4dbe9507ad25e57dfa17f3c5ec3', 2, 1, 'UserAuth', '[]', 0, '2025-05-01 10:34:04', '2025-05-01 10:34:04', '2026-05-01 16:19:04'),
('f7f97357c7b44270bfb61efa095866f5b3c03abc26f67f3a04ac0c66c274ece1a03ce79ee39b1f25', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 06:25:24', '2025-05-04 06:25:24', '2026-05-04 12:10:24'),
('fcc6651047a8109092b6d3d6f8d07602538402608302a726fff1ff49b20c2c80a0abb2dd441368a7', 2, 1, 'UserAuth', '[]', 0, '2025-05-04 07:59:18', '2025-05-04 07:59:18', '2026-05-04 13:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'GargDental Ecommerce', '8nYXhI9SAybwQaxPAwzt8bHCu8p2Y4z8nauNpcr2', NULL, 'http://localhost', 1, 0, 0, '2025-05-01 07:48:54', '2025-05-01 07:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-05-01 07:48:54', '2025-05-01 07:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `shipping_delivery_information_id` bigint(20) NOT NULL,
  `billing_delivery_information_id` bigint(20) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`shipping_snapshot`)),
  `coupon_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`coupon_snapshot`)),
  `discount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `order_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `customer_id`, `shipping_delivery_information_id`, `billing_delivery_information_id`, `payment_method`, `shipping_method`, `subtotal`, `tax`, `shipping_cost`, `shipping_snapshot`, `coupon_snapshot`, `discount`, `total_amount`, `order_status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 9180202505260001, 1, 20, 19, 'C', NULL, 1800.00, 0.00, 0.00, '{\"free_shipping_option\":\"free_threshold\",\"free_shipping_threshold\":\"1000\"}', NULL, 0.00, 1800.00, 'processing', 'unpaid', '2025-05-26 07:07:38', '2025-05-26 07:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel`
--

CREATE TABLE `order_cancel` (
  `id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `cancel_reason` bigint(20) NOT NULL,
  `reason_description` varchar(255) NOT NULL,
  `policy_checked` varchar(255) DEFAULT NULL,
  `cancelled_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel_reasons`
--

CREATE TABLE `order_cancel_reasons` (
  `id` bigint(20) NOT NULL,
  `reason_name` varchar(512) NOT NULL,
  `reason_for` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_cancel_reasons`
--

INSERT INTO `order_cancel_reasons` (`id`, `reason_name`, `reason_for`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Want to place a new order with more items', 'customer', 1, '2024-09-23 05:32:23', '2025-05-25 05:40:37'),
(4, 'Duplicate Order', 'customer', 1, '2024-09-23 05:32:36', '2025-05-25 05:40:35'),
(5, 'Change in Delivery Address', 'customer', 1, '2024-09-23 05:32:54', '2025-05-25 05:40:33'),
(6, 'Not needed item anymore', 'customer', 1, '2024-09-23 05:33:10', '2025-05-25 05:40:32'),
(7, 'Shipping cost is too high', 'customer', 1, '2024-09-23 05:33:38', '2025-05-25 05:40:30'),
(8, 'Change Payment method', 'customer', 1, '2024-09-23 05:33:54', '2025-05-25 05:40:29'),
(9, 'Found cheaper in other place', 'customer', 1, '2024-09-23 05:34:13', '2025-05-25 05:40:27'),
(10, 'Delivery time is too long', 'customer', 1, '2024-09-23 05:34:36', '2025-05-25 05:40:23'),
(11, 'Decided for alternative product', 'customer', 1, '2024-09-23 05:34:56', '2025-05-25 05:40:02'),
(13, 'Requested by Customer', 'supplier', 1, '2025-05-23 11:51:36', '2025-05-25 05:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `mr_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_code`, `quantity`, `price`, `mr_price`, `subtotal`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 9180202505260001, 'A200001', 2, 900.00, 1100.00, 1800.00, 70.00, '2025-05-26 07:07:38', '2025-05-26 07:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('jananpandey1995@gmail.com', '4405', '2025-05-01 06:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poster_cards`
--

CREATE TABLE `poster_cards` (
  `id` bigint(20) NOT NULL,
  `card_1` varchar(255) DEFAULT NULL,
  `card_2` varchar(255) DEFAULT NULL,
  `card_3` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `poster_cards`
--

INSERT INTO `poster_cards` (`id`, `card_1`, `card_2`, `card_3`, `created_at`, `updated_at`) VALUES
(1, '2025-04-10-67f7645abf9c6.png', '2025-04-10-67f7645ac080c.png', '2025-04-10-67f7645ac1593.png', NULL, '2025-04-10 06:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `product_description` varchar(512) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `delivery_target_days` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `actual_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `sell_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `mr_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `unit_info` varchar(255) DEFAULT NULL,
  `available_quantity` decimal(10,2) DEFAULT NULL,
  `stock_quantity` decimal(8,2) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `product_location` varchar(255) DEFAULT NULL,
  `has_variations` int(11) NOT NULL,
  `flash_sale` char(1) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `slug`, `product_description`, `category_id`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `mr_price`, `unit_info`, `available_quantity`, `stock_quantity`, `brand_id`, `product_location`, `has_variations`, `flash_sale`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HE00005', 'Articulating Paper 200 strips', 'articulating-paper-200-strips', 'Articulating Paper 200 strips', 1, NULL, NULL, 0.00, 600.00, 900.00, 'PCS', 100.00, 150.00, 1, NULL, 0, '1', 1, '2025-04-11 06:26:40', '2025-05-18 10:00:36'),
(2, 'A300001', 'Articulating Paper Forceps', 'articulating-paper-forceps', 'Articulating Paper Forceps', 2, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-05-04 08:09:23'),
(3, 'A500002', 'Bausch Progress 100', 'bausch-progress-100', 'Bausch Progress 100', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(4, 'A200001', 'Fleximeter Strips BK 253', 'fleximeter-strips-bk-253', 'Fleximeter Strips BK 253', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(5, 'A200002', 'Bausch articulating paper BK 81', 'bausch-articulating-paper-bk-81', 'Bausch articulating paper BK 81', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(6, 'A500003', 'Arti Spot 2', 'arti-spot-2', 'Arti Spot 2', 8, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(7, 'A800001', 'Arti Spot', 'arti-spot', 'Arti Spot', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(8, 'A700001', 'Bio-Ink-Flow', 'bio-ink-flow', 'Bio-Ink-Flow', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(9, 'A100001', 'Fleximeter Strips Blue', 'fleximeter-strips-blue', 'Fleximeter Strips Blue', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(10, 'A100002', 'Fleximeter Strips Green', 'fleximeter-strips-green', 'Fleximeter Strips Green', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(11, 'A600001', 'Arti check', 'arti-check', 'Arti check', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(12, 'M300001', 'Fleximeter Strips', 'fleximeter-strips', 'Fleximeter Strips', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(13, 'S700001', 'Bausch articulating paper BK 17', 'bausch-articulating-paper-bk-17', 'Bausch articulating paper BK 17', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(14, 'NO00001', 'OccluSense', 'occlusense', 'OccluSense', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(15, 'M200001', 'Teeth Maintain', 'teeth-maintain', 'Teeth Maintain', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(16, 'J500002', 'Arti Brux', 'arti-brux', 'Arti Brux', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(17, 'G300001', 'Bausch BK 01', 'bausch-bk-01', 'Bausch BK 01', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(18, 'J100001', 'Bausch-1', 'bausch-1', 'Bausch-1', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(19, 'J100002', 'Articulating paper', 'articulating-paper', 'Articulating paper', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(20, 'J100003', 'Arti-Fol', 'arti-fol', 'Arti-Fol', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(21, 'J700001', 'Bausch', 'bausch', 'Bausch', 1, NULL, NULL, 1000.00, 900.00, 1100.00, NULL, 50.00, 100.00, NULL, NULL, 0, NULL, 1, '2025-04-11 06:26:40', '2025-04-11 06:26:40'),
(22, 'werfas', 'Janam', 'janam', 'aEDSAZD', 1, '3', NULL, 100.00, 900.00, 1100.00, 'PCS', 100.00, 150.00, 1, NULL, 0, '0', 1, '2025-05-04 09:27:08', '2025-05-18 09:59:13'),
(23, 'P00001', 'Hello World', 'hello-world', 'Hello World', 1, '2', NULL, 500.00, 400.00, 450.00, 'PCS', 100.00, 120.00, NULL, NULL, 0, '0', 1, '2025-05-06 10:59:39', '2025-05-06 10:59:39'),
(29, 'P00002', 'test', 'test', 'hello product testing', 3, '2', NULL, 0.00, 0.00, 0.00, 'PCS', 0.00, 0.00, 1, NULL, 1, '0', 1, '2025-05-13 07:27:44', '2025-05-15 06:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `image_path` varchar(512) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_code`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'HE00005', 'articulating_paper_200_strips.jpeg', '2025-04-11 06:38:41', '2025-04-11 06:38:41'),
(2, 'A300001', 'articulating_paper_forceps.jpeg', '2025-04-11 06:39:14', '2025-04-11 06:39:14'),
(3, 'A500002', 'bausch_progress_100.jpeg', '2025-04-11 06:39:22', '2025-04-11 06:39:22'),
(4, 'A200001', 'fleximeter_strips_bk_253.jpeg', '2025-04-11 06:39:31', '2025-04-11 06:39:31'),
(5, 'A200002', 'bausch_articulating_paper_bk_81.jpeg', '2025-04-11 06:39:41', '2025-04-11 06:39:41'),
(6, 'A500003', 'arti_spot_2.jpeg', '2025-04-11 06:39:53', '2025-04-11 06:39:53'),
(7, 'A800001', 'arti_spot.jpeg', '2025-04-11 06:40:05', '2025-04-11 06:40:05'),
(8, 'A700001', 'bio_ink_flow.jpeg', '2025-04-11 06:40:15', '2025-04-11 06:40:15'),
(9, 'A100001', 'fleximeter_strips_blue.jpeg', '2025-04-11 06:40:38', '2025-04-11 06:40:38'),
(10, 'A100002', 'fleximeter_strips_green.jpeg', '2025-04-11 06:40:47', '2025-04-11 06:40:47'),
(11, 'A600001', 'arti_check.jpeg', '2025-04-11 06:41:00', '2025-04-11 06:41:00'),
(12, 'M300001', 'fleximeter_strips.jpeg', '2025-04-11 06:41:12', '2025-04-11 06:41:12'),
(13, 'S700001', 'bausch_articulating_paper_bk_17.jpeg', '2025-04-11 06:41:27', '2025-04-11 06:41:27'),
(14, 'NO00001', 'occlusense.jpeg', '2025-04-11 06:41:37', '2025-04-11 06:41:37'),
(15, 'M200001', 'teeth_maintain.jpeg', '2025-04-11 06:41:47', '2025-04-11 06:41:47'),
(16, 'J500002', 'arti_brux.jpeg', '2025-04-11 06:41:59', '2025-04-11 06:41:59'),
(17, 'G300001', 'bausch_bk_01.jpeg', '2025-04-11 06:42:12', '2025-04-11 06:42:12'),
(18, 'J100001', 'bausch_1.jpeg', '2025-04-11 06:42:25', '2025-04-11 06:42:25'),
(19, 'J100002', 'articulating_paper.jpeg', '2025-04-11 06:42:35', '2025-04-11 06:42:35'),
(20, 'J100003', 'arti_fol.jpeg', '2025-04-11 06:42:50', '2025-04-11 06:42:50'),
(21, 'J700001', 'bausch.jpeg', '2025-04-11 06:43:00', '2025-04-11 06:43:00'),
(22, 'werfas', '2025_04_09_67f642c43e68d_removebg_preview_1.png', '2025-05-04 09:27:49', '2025-05-04 09:27:49'),
(23, 'HE00005', 'prosthodontics.jpg', '2025-05-11 05:54:32', '2025-05-11 05:54:32'),
(24, 'HE00005', 'xiaomi_3d_product_animation2.mp4', '2025-05-11 05:59:49', '2025-05-11 05:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_code` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `review_detail` varchar(500) NOT NULL,
  `rating` bigint(20) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `customer_id`, `product_code`, `order_id`, `name`, `email`, `review_detail`, `rating`, `image_path`, `created_at`, `updated_at`) VALUES
(2, 1, 'A200001', '#ORD202505010001', 'Janam Pandey', 'jananpandey1995@gmail.com', 'Best Product', 4, '2025-05-11-68205bfbf0370.png', '2025-05-11 08:12:43', '2025-05-11 08:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`attributes`)),
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_code`, `attributes`, `price`, `stock`, `sku`, `created_at`, `updated_at`) VALUES
(1, 'P00002', '{\"size\":\"S\",\"color\":\"Red\",\"material\":\"Polyester\"}', 100.00, 100, 'null', '2025-05-15 06:36:29', '2025-05-15 06:37:21'),
(2, 'P00002', '{\"size\":\"M\",\"color\":\"Red\",\"material\":\"Polyester\"}', 50.00, 50, NULL, '2025-05-15 06:37:21', '2025-05-15 06:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) NOT NULL,
  `province_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `province_name`, `created_at`, `updated_at`) VALUES
(1, 'Koshi Province', '2024-09-12 03:02:42', '2024-09-16 11:20:13'),
(2, 'Madhesh Province', '2024-09-12 03:07:03', '2024-09-16 11:20:22'),
(3, 'Bagmati Province', '2024-09-12 03:07:11', '2024-09-16 11:20:34'),
(4, 'Gandaki Province', '2024-09-12 03:07:21', '2024-09-16 11:20:43'),
(5, 'Lumbini Province', '2024-09-12 03:07:28', '2024-09-16 11:20:51'),
(6, 'Karnali Province', '2024-09-12 03:07:37', '2024-09-16 11:20:59'),
(7, 'Sudurpaschim Province', '2024-09-12 03:07:47', '2024-09-16 11:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `recommended_products`
--

CREATE TABLE `recommended_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recommended_products`
--

INSERT INTO `recommended_products` (`id`, `customer_id`, `product_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'A300001', '2025-05-06 08:19:39', '2025-05-06 08:19:39'),
(6, 2, 'M200001', '2025-05-15 07:45:58', '2025-05-15 07:45:58'),
(8, 2, 'A500003', '2025-05-15 07:59:44', '2025-05-15 07:59:44'),
(9, 2, 'A800001', '2025-05-15 07:59:58', '2025-05-15 07:59:58'),
(10, 2, 'A200001', '2025-05-15 08:00:20', '2025-05-15 08:00:20'),
(12, 2, 'A200002', '2025-05-15 08:00:52', '2025-05-15 08:00:52'),
(13, 2, 'P00001', '2025-05-15 08:01:30', '2025-05-15 08:01:30'),
(16, 2, 'A700001', '2025-05-15 08:02:32', '2025-05-15 08:02:32'),
(17, 2, 'A100001', '2025-05-15 08:02:36', '2025-05-15 08:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rLWKaqokOqTMk0hbuIPhYzv2NeXGWhWERbXeZhjk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVm82cDJWSFhGaW45dU5RVmpjWTZuUW5hNUpEelhjbkt1cmdydG9OZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50Ijt9fQ==', 1725883856),
('xh83V75RiQKfWnOsqCETEkw3W3MNnH1KSPs0Tlaw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYm45NVZaUEd1VENGdXR2bEJ4T0RobHRTT2VjTE45U0gzVW9KUXQwOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoiY2FydCI7YToyOntpOjMzO3M6MToiMiI7aToyNDtzOjE6IjIiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO319', 1725879230);

-- --------------------------------------------------------

--
-- Table structure for table `set_shipping`
--

CREATE TABLE `set_shipping` (
  `id` bigint(20) NOT NULL,
  `province_id` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `set_shipping`
--

INSERT INTO `set_shipping` (`id`, `province_id`, `city`, `shipping_cost`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kathmandu Metro 1 - Naxal Area', 70.00, NULL, '2024-09-08 23:55:39', '2024-09-16 10:37:43'),
(5, 3, 'Kathmandu Metro 2 - Lazimpat Area', 70.00, NULL, '2024-09-16 10:42:12', '2024-09-16 10:42:12'),
(6, 3, 'Kathmandu Metro 3 - Maharajgunj Area', 70.00, NULL, '2024-09-16 10:42:41', '2024-09-16 10:42:41'),
(7, 3, 'Kathmandu Metro 4 - Bishalnagar Area', 70.00, NULL, '2024-09-16 10:42:58', '2024-09-16 10:42:58'),
(8, 3, 'Kathmandu Metro 5 - Tangal Area', 70.00, NULL, '2024-09-16 10:43:17', '2024-09-16 10:43:17'),
(10, 3, 'Kathmandu Metro 7 - Chabahil Area', 70.00, NULL, '2024-09-16 10:47:52', '2024-09-16 10:47:52'),
(11, 3, 'Kathmandu Metro 8 - Gaushala Area', 70.00, NULL, '2024-09-16 10:48:11', '2024-09-16 10:48:11'),
(12, 3, 'Kathmandu Metro 9 - Sinamangal Area', 70.00, NULL, '2024-09-16 10:48:57', '2024-09-16 10:48:57'),
(13, 3, 'Kathmandu Metro 10 - New Baneshwor Area', 70.00, NULL, '2024-09-16 10:49:59', '2024-09-16 10:49:59'),
(14, 3, 'Kathmandu Metro 11 - Maitighar Area', 70.00, NULL, '2024-09-16 10:50:14', '2024-09-16 10:50:14'),
(15, 3, 'Kathmandu Metro 12 - Teku Area', 70.00, NULL, '2024-09-16 10:50:32', '2024-09-16 10:50:32'),
(16, 3, 'Kathmandu Metro 13 - Kalimati Area', 70.00, NULL, '2024-09-16 10:50:48', '2024-09-16 10:50:48'),
(17, 3, 'Kathmandu Metro 14 - Kuleshwor Area', 70.00, NULL, '2024-09-16 10:51:04', '2024-09-16 10:51:04'),
(18, 3, 'Kathmandu Metro 15 - Swayambhu Area', 70.00, NULL, '2024-09-16 10:51:36', '2024-09-16 10:51:36'),
(19, 3, 'Kathmandu Metro 16 - Nayabazar Area', 70.00, NULL, '2024-09-16 10:52:09', '2024-09-16 10:52:09'),
(20, 3, 'Kathmandu Metro 17 - Chhetrapati Area', 70.00, NULL, '2024-09-16 10:52:26', '2024-09-16 10:52:26'),
(21, 3, 'Kathmandu Metro 18 - Raktakali Area', 70.00, NULL, '2024-09-16 10:52:41', '2024-09-16 10:52:41'),
(22, 3, 'Kathmandu Metro 19 - Hanumandhoka Area', 70.00, NULL, '2024-09-16 10:52:56', '2024-09-16 10:52:56'),
(23, 3, 'Kathmandu Metro 20 - Marutol Area', 70.00, NULL, '2024-09-16 10:53:19', '2024-09-16 10:53:19'),
(24, 3, 'Kathmandu Metro 21 - Lagantole Area', 70.00, NULL, '2024-09-16 10:53:46', '2024-09-16 10:53:46'),
(25, 3, 'Kathmandu Metro 22 - Newroad Area', 70.00, NULL, '2024-09-16 10:54:01', '2024-09-16 10:54:01'),
(26, 3, 'Kathmandu Metro 23 - Basantapur Area', 70.00, NULL, '2024-09-16 10:54:18', '2024-09-16 10:54:18'),
(27, 3, 'Kathmandu Metro 24 - Indrachowk Area', 70.00, NULL, '2024-09-16 10:54:34', '2024-09-16 10:54:34'),
(28, 3, 'Kathmandu Metro 25 - Ason Area', 70.00, NULL, '2024-09-16 10:54:50', '2024-09-16 10:54:50'),
(29, 3, 'Kathmandu Metro 26 - Samakhusi Area', 70.00, NULL, '2024-09-16 10:55:04', '2024-09-16 10:55:04'),
(30, 3, 'Kathmandu Metro 26 - Thamel Area', 70.00, NULL, '2024-09-16 10:55:21', '2024-09-16 10:55:21'),
(31, 3, 'Kathmandu Metro 27 - Bhotahiti Area', 70.00, NULL, '2024-09-16 10:55:39', '2024-09-16 10:55:39'),
(32, 3, 'Kathmandu Metro 28 - Bagbazar Area', 70.00, NULL, '2024-09-16 10:55:53', '2024-09-16 10:55:53'),
(33, 3, 'Kathmandu Metro 28 - Kamaladi Area', 70.00, NULL, '2024-09-16 10:56:12', '2024-09-16 10:56:12'),
(34, 3, 'Kathmandu Metro 29 - Anamnagar Area', 70.00, NULL, '2024-09-16 10:56:28', '2024-09-16 10:56:28'),
(35, 3, 'Kathmandu Metro 29 - Putalisadak Area', 70.00, NULL, '2024-09-16 10:56:44', '2024-09-16 10:56:44'),
(36, 3, 'Kathmandu Metro 30 - Maitidevi Area', 70.00, NULL, '2024-09-16 10:56:59', '2024-09-16 10:56:59'),
(37, 3, 'Kathmandu Metro 31 - Min Bhawan Area', 70.00, NULL, '2024-09-16 10:57:17', '2024-09-16 10:57:17'),
(38, 3, 'Kathmandu Metro 32 - Koteshwor Area', 70.00, NULL, '2024-09-16 10:57:34', '2024-09-16 10:57:34'),
(39, 3, 'Kathmandu Metro 32 - Tinkune Area', 70.00, NULL, '2024-09-16 10:57:51', '2024-09-16 10:57:51'),
(40, 3, 'Kathmandu Metro 3 - Baluwatar Area', 70.00, NULL, '2024-09-16 10:58:21', '2024-09-16 10:58:21'),
(41, 3, 'Kathmandu Outside Ring Road', 70.00, NULL, '2024-09-16 11:11:06', '2024-09-16 11:11:06'),
(42, 3, 'Bhaktapur', 100.00, NULL, '2024-09-16 11:11:46', '2024-09-16 11:11:46'),
(43, 3, 'Lalitpur Inside Ring Road', 70.00, NULL, '2024-09-16 11:12:08', '2024-09-16 11:12:08'),
(44, 3, 'Lalitpur Outside Ring Road', 70.00, NULL, '2024-09-16 11:12:22', '2024-09-16 11:12:22'),
(48, 3, 'Kathmandu', 70.00, NULL, '2025-02-05 17:19:04', '2025-02-05 17:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` bigint(20) NOT NULL,
  `data_type` varchar(255) NOT NULL,
  `data_id` varchar(100) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storages`
--

INSERT INTO `storages` (`id`, `data_type`, `data_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(12, 'App\\Models\\PosterCard', '1', 'card_1', 'public', '2025-04-10 12:10:30', '2025-04-10 12:10:30'),
(13, 'App\\Models\\PosterCard', '1', 'card_2', 'public', '2025-04-10 12:10:30', '2025-04-10 12:10:30'),
(14, 'App\\Models\\PosterCard', '1', 'card_3', 'public', '2025-04-10 12:10:30', '2025-04-10 12:10:30'),
(19, 'App\\Models\\ProductImages', '824', 'file', 'public', '2025-04-10 15:59:43', '2025-04-10 15:59:43'),
(23, 'App\\Models\\ProductImages', '826', 'file', 'public', '2025-04-10 16:00:07', '2025-04-10 16:00:07'),
(24, 'App\\Models\\Carousel', '9', 'file', 'public', '2025-05-26 13:03:30', '2025-05-26 13:03:30'),
(25, 'App\\Models\\Carousel', '10', 'file', 'public', '2025-05-26 13:03:30', '2025-05-26 13:03:30'),
(26, 'App\\Models\\Carousel', '11', 'file', 'public', '2025-05-26 13:03:30', '2025-05-26 13:03:30'),
(27, 'App\\Models\\ProductImages', '1', 'file', 'public', '2025-04-11 12:23:41', '2025-04-11 12:23:41'),
(28, 'App\\Models\\ProductImages', '2', 'file', 'public', '2025-04-11 12:24:14', '2025-04-11 12:24:14'),
(29, 'App\\Models\\ProductImages', '3', 'file', 'public', '2025-04-11 12:24:22', '2025-04-11 12:24:22'),
(30, 'App\\Models\\ProductImages', '4', 'file', 'public', '2025-04-11 12:24:31', '2025-04-11 12:24:31'),
(31, 'App\\Models\\ProductImages', '5', 'file', 'public', '2025-04-11 12:24:41', '2025-04-11 12:24:41'),
(32, 'App\\Models\\ProductImages', '6', 'file', 'public', '2025-04-11 12:24:53', '2025-04-11 12:24:53'),
(33, 'App\\Models\\ProductImages', '7', 'file', 'public', '2025-04-11 12:25:05', '2025-04-11 12:25:05'),
(34, 'App\\Models\\ProductImages', '8', 'file', 'public', '2025-04-11 12:25:15', '2025-04-11 12:25:15'),
(35, 'App\\Models\\ProductImages', '9', 'file', 'public', '2025-04-11 12:25:38', '2025-04-11 12:25:38'),
(36, 'App\\Models\\ProductImages', '10', 'file', 'public', '2025-04-11 12:25:47', '2025-04-11 12:25:47'),
(37, 'App\\Models\\ProductImages', '11', 'file', 'public', '2025-04-11 12:26:00', '2025-04-11 12:26:00'),
(38, 'App\\Models\\ProductImages', '12', 'file', 'public', '2025-04-11 12:26:12', '2025-04-11 12:26:12'),
(39, 'App\\Models\\ProductImages', '13', 'file', 'public', '2025-04-11 12:26:27', '2025-04-11 12:26:27'),
(40, 'App\\Models\\ProductImages', '14', 'file', 'public', '2025-04-11 12:26:37', '2025-04-11 12:26:37'),
(41, 'App\\Models\\ProductImages', '15', 'file', 'public', '2025-04-11 12:26:47', '2025-04-11 12:26:47'),
(42, 'App\\Models\\ProductImages', '16', 'file', 'public', '2025-04-11 12:26:59', '2025-04-11 12:26:59'),
(43, 'App\\Models\\ProductImages', '17', 'file', 'public', '2025-04-11 12:27:12', '2025-04-11 12:27:12'),
(44, 'App\\Models\\ProductImages', '18', 'file', 'public', '2025-04-11 12:27:25', '2025-04-11 12:27:25'),
(45, 'App\\Models\\ProductImages', '19', 'file', 'public', '2025-04-11 12:27:35', '2025-04-11 12:27:35'),
(46, 'App\\Models\\ProductImages', '20', 'file', 'public', '2025-04-11 12:27:50', '2025-04-11 12:27:50'),
(47, 'App\\Models\\ProductImages', '21', 'file', 'public', '2025-04-11 12:28:00', '2025-04-11 12:28:00'),
(48, 'App\\Models\\Admin', '1', 'image', 'public', '2025-04-13 13:03:42', '2025-04-13 13:03:42'),
(49, 'App\\Models\\Category', '1', 'image', 'public', '2025-05-01 16:21:50', '2025-05-01 16:21:50'),
(50, 'App\\Models\\Category', '2', 'image', 'public', '2025-05-04 13:41:34', '2025-05-04 13:41:34'),
(51, 'App\\Models\\Category', '3', 'image', 'public', '2025-05-04 13:41:50', '2025-05-04 13:41:50'),
(52, 'App\\Models\\Category', '4', 'image', 'public', '2025-05-04 13:42:00', '2025-05-04 13:42:00'),
(53, 'App\\Models\\Category', '5', 'image', 'public', '2025-05-04 13:42:14', '2025-05-04 13:42:14'),
(54, 'App\\Models\\Category', '6', 'image', 'public', '2025-05-04 13:42:28', '2025-05-04 13:42:28'),
(55, 'App\\Models\\ProductImages', '22', 'file', 'public', '2025-05-04 15:12:49', '2025-05-04 15:12:49'),
(56, 'App\\Models\\Category', '7', 'image', 'public', '2025-05-05 14:38:13', '2025-05-05 14:38:13'),
(57, 'App\\Models\\Category', '8', 'image', 'public', '2025-05-05 14:47:35', '2025-05-05 14:47:35'),
(58, 'App\\Models\\Category', '9', 'image', 'public', '2025-05-05 14:50:54', '2025-05-05 14:50:54'),
(59, 'App\\Models\\ProductImages', '23', 'file', 'public', '2025-05-11 11:39:32', '2025-05-11 11:39:32'),
(60, 'App\\Models\\ProductImages', '24', 'file', 'public', '2025-05-11 11:44:49', '2025-05-11 11:44:49'),
(61, 'App\\Models\\Carousel', '12', 'file', 'public', '2025-05-26 13:03:30', '2025-05-26 13:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'company_name', 'Garg Dental', '2025-04-09 14:54:33', '2025-04-09 14:54:33'),
(2, 'timezone', NULL, '2025-04-09 14:54:33', '2025-04-09 14:54:33'),
(3, 'company_logo_header', '2025-04-11-67f8daa12c707.png', '2025-04-09 15:07:27', '2025-04-09 15:07:27'),
(4, 'company_logo_footer', '2025-04-11-67f8daa12e9ac.png', '2025-04-09 15:07:36', '2025-04-09 15:07:36'),
(5, 'header_theme_color', '#0000a0', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(6, 'footer_theme_color', '#000000', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(7, 'text_theme_color', '#ffffff', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(8, 'hover_effect_color', '#ff0000', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(9, 'primary_phone', '01-4436276', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(10, 'secondary_phone', NULL, '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(11, 'primary_email', 'info@gargdental.com', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(12, 'secondary_email', NULL, '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(13, 'address', 'P88H+RFX, Gairidhara Rd, Kathmandu 23690', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(14, 'website_link', 'https://gargdental.com/', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(15, 'shipping_option', 'itemwisecost', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(16, 'no_category_display', '7', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(17, 'map_url', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3564.1948458140423!2d85.32617477546776!3d27.7172208761769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190df99e408b%3A0xfab3f149268497e5!2sGARG%20DENTAL%20PVT.%20LTD.!5e1!3m2!1sen!2snp!4v1744277077910!5m2!1sen!2snp', '2025-04-09 15:07:45', '2025-04-09 15:07:45'),
(18, 'language', '[\"en\",\"ne\"]', '2025-04-09 15:15:44', '2025-04-09 15:15:44'),
(19, 'local_storage', '1', '2025-04-09 15:19:50', '2025-04-09 15:19:50'),
(20, 'free_shipping_option', 'free_threshold', '2025-05-18 11:55:39', '2025-05-18 11:55:39'),
(21, 'free_shipping_threshold', '1000', '2025-05-18 11:55:39', '2025-05-18 11:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `gender`, `is_phone_verified`, `is_email_verified`, `email_verified_at`, `status`, `order_count`, `login_medium`, `social_id`, `password`, `remember_token`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Janam Pandey', 'jananpandey1995@gmail.com', '+977-9866077949', NULL, 0, 1, '2025-05-05 07:28:19', 0, 0, NULL, NULL, '$2y$12$FN/1wHqM0Q2c6b2GBQjQk.SkeLj9bIwyBG/aG6PpE.URwspBHcPv2', NULL, NULL, '2025-05-05 07:26:57', '2025-05-15 04:41:50'),
(2, 'nure', 'nure09@gmail.com', '132123', NULL, 0, 1, NULL, 0, 0, NULL, NULL, '$2y$12$FN/1wHqM0Q2c6b2GBQjQk.SkeLj9bIwyBG/aG6PpE.URwspBHcPv2', NULL, NULL, '2025-05-01 06:08:54', '2025-05-15 07:27:43'),
(7, 'fff', 'nurdde09@gmail.com', '33333', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$2yQfFel4a4/h29vNC.ONK.Tz2n95wYd9KkfVE/qLSh9iMcv6riWqS', NULL, NULL, '2025-05-01 11:08:16', '2025-05-01 11:08:16'),
(9, 'fff', 'nurdrde09@gmail.com', '333433', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$11z1tn442W2B31DVtHzsDOODMN0gX5wlIzYQ0mWc7stKsw8mHIAE6', NULL, NULL, '2025-05-01 11:08:52', '2025-05-01 11:08:52'),
(10, 'shhssgs', 'nure0sss9@gmail.com', '252552363637', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$bnWZBti0TKHs17GVFSrecu3D8/SmVVox7xSo7DXAr35n8gD6RoqIG', NULL, NULL, '2025-05-01 11:57:13', '2025-05-01 11:57:13'),
(11, 'usuddjd', 'dhd@gmail.com', '2222333', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$Ury.swLm3ri6n44DddKu.OWxq9lJByx41sHmJ.nNXUxEBfjOmem9W', NULL, NULL, '2025-05-02 09:59:31', '2025-05-02 09:59:31'),
(12, 'yhgg', 'bbbhh@gmail.com', '2334', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$p.GI9qd0BaRmh3h602vWxORnp/yY0SCY8XkQzG4ujP1EzqUjbAgd.', NULL, NULL, '2025-05-02 10:01:20', '2025-05-02 10:01:20'),
(13, 'jhhjj', 'email@gmail.com', '234566', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$k494zi5w2ue3TIib.gQo3eNRMzIQ574rWNFFx6SpNoXfRwSmQ.k7S', NULL, NULL, '2025-05-02 11:36:57', '2025-05-02 11:36:57'),
(14, 'uugg', 'emaill@gmail.com', '12343455', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$xJONzimUHqIpjEuJSyaO5.cRzoU1qs.cAQwh.zmcQ4ilyESUS8j6u', NULL, NULL, '2025-05-02 11:42:46', '2025-05-02 11:42:46'),
(15, 'ghgg', 'emailll@gmail.com', '12345', NULL, 0, 1, '2025-05-02 11:49:02', 0, 0, NULL, NULL, '$2y$12$N6v9JI2cWWNqFrpbvbVpYeDyvIumBouNCs7u0m6s1uJWGtajIvpaO', NULL, NULL, '2025-05-02 11:48:38', '2025-05-02 11:49:02'),
(18, 'djdjddud', 'email09@gmail.com', '1234567654', NULL, 0, 1, '2025-05-04 04:59:36', 0, 0, NULL, NULL, '$2y$12$oqAumQRTbqXGd/Z8fMPedOBpDIIq6ogbRSou/J0hRo9GGA5MviS9.', NULL, NULL, '2025-05-04 04:58:56', '2025-05-04 04:59:36'),
(19, 'dhddhd', 'email099@gmail.com', '1234567976', NULL, 0, 1, '2025-05-04 05:03:57', 0, 0, NULL, NULL, '$2y$12$KAePid45NOdKappZg/ybOefkkB13xK08/a6F90iwuBD4XpP.X1jOG', NULL, NULL, '2025-05-04 05:03:37', '2025-05-04 05:03:57'),
(21, 'shhsdsyhse', 'email0999@gmail.com', '1234554321', NULL, 0, 1, '2025-05-04 05:08:27', 0, 0, NULL, NULL, '$2y$12$riFHrKuy7lyJeskrwGzFTe078/uy.h2.BAcJ9yMQD57xfH2gFqPC.', NULL, NULL, '2025-05-04 05:08:12', '2025-05-04 05:08:27'),
(22, 'duuddyd', 'email09999@gmail.com', '1234532464', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$clZ0SwyKO.IGx6kM2LUlnOWHccAfzvIAibLBKVqx4MR5klIrKhFnC', NULL, NULL, '2025-05-04 05:12:49', '2025-05-04 05:12:49'),
(23, 'sgsshe', 'email009@gmail.com', '1212123432', NULL, 0, 0, NULL, 0, 0, NULL, NULL, '$2y$12$8N35ciAEx/RLmPP7kL/z0O9M6bgnbO51Tn62KUpRssqtfDAu6kfnu', NULL, NULL, '2025-05-04 05:14:35', '2025-05-04 05:14:35'),
(24, 'dyddh', 'email0009@gmail.com', '123321234', NULL, 0, 1, '2025-05-04 05:17:03', 0, 0, NULL, NULL, '$2y$12$///qSXPJY4bNBbJ/V1xGZ.Rver4MBEQ8FUt/NcwtRmN3.WSdK2.vO', NULL, NULL, '2025-05-04 05:16:09', '2025-05-04 05:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_zone`
--
ALTER TABLE `address_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carousel_images`
--
ALTER TABLE `carousel_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address_book`
--
ALTER TABLE `customer_address_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `province` (`province_id`),
  ADD KEY `city` (`city_id`),
  ADD KEY `zone_id` (`zone_id`);

--
-- Indexes for table `delivery_information`
--
ALTER TABLE `delivery_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`,`token`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers_list`
--
ALTER TABLE `newsletter_subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletter_subscribers_list_email_unique` (`email`);

--
-- Indexes for table `nova_media_library`
--
ALTER TABLE `nova_media_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nova_media_library_title_index` (`title`),
  ADD KEY `nova_media_library_created_index` (`created`),
  ADD KEY `nova_media_library_type_index` (`type`),
  ADD KEY `nova_media_library_folder_index` (`folder`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_cancel`
--
ALTER TABLE `order_cancel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_cancel_fk_1` (`order_item_id`),
  ADD KEY `order_cancel_fk_2` (`cancel_reason`);

--
-- Indexes for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `poster_cards`
--
ALTER TABLE `poster_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommended_products`
--
ALTER TABLE `recommended_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_product_unique` (`customer_id`,`product_code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `set_shipping`
--
ALTER TABLE `set_shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province` (`province_id`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_id` (`data_id`,`value`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_zone`
--
ALTER TABLE `address_zone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carousel_images`
--
ALTER TABLE `carousel_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_address_book`
--
ALTER TABLE `customer_address_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_information`
--
ALTER TABLE `delivery_information`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `newsletter_subscribers_list`
--
ALTER TABLE `newsletter_subscribers_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6385;

--
-- AUTO_INCREMENT for table `nova_media_library`
--
ALTER TABLE `nova_media_library`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_cancel`
--
ALTER TABLE `order_cancel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poster_cards`
--
ALTER TABLE `poster_cards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recommended_products`
--
ALTER TABLE `recommended_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `set_shipping`
--
ALTER TABLE `set_shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_fk_1` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`);

--
-- Constraints for table `customer_address_book`
--
ALTER TABLE `customer_address_book`
  ADD CONSTRAINT `customer_address_book_fk_2` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `customer_address_book_fk_3` FOREIGN KEY (`city_id`) REFERENCES `set_shipping` (`id`),
  ADD CONSTRAINT `customer_address_book_fk_4` FOREIGN KEY (`zone_id`) REFERENCES `address_zone` (`id`);

--
-- Constraints for table `order_cancel`
--
ALTER TABLE `order_cancel`
  ADD CONSTRAINT `order_cancel_fk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`),
  ADD CONSTRAINT `order_cancel_fk_2` FOREIGN KEY (`cancel_reason`) REFERENCES `order_cancel_reasons` (`id`);

--
-- Constraints for table `set_shipping`
--
ALTER TABLE `set_shipping`
  ADD CONSTRAINT `set_shipping_fk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
