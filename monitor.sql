-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2022 at 06:45 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_06_02_182856_create_posts_table', 1),
(4, '2017_06_03_144733_add_user_id_to_posts', 1),
(5, '2017_06_03_211549_add_cover_image_to_posts', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `power_station`
--

DROP TABLE IF EXISTS `power_station`;
CREATE TABLE IF NOT EXISTS `power_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(100) DEFAULT NULL,
  `UpsSttp` tinyint(1) DEFAULT NULL,
  `UpsRadar` tinyint(1) DEFAULT NULL,
  `ContractUPS` varchar(100) DEFAULT NULL,
  `UpslInstallation` varchar(100) DEFAULT NULL,
  `PreDeliveryUPS` varchar(100) DEFAULT NULL,
  `FinalDeliveryUPS` varchar(100) DEFAULT NULL,
  `StatusRatioRadar` varchar(50) DEFAULT NULL,
  `StatusRatioSTTB` varchar(50) DEFAULT NULL,
  `LastMessage` varchar(100) DEFAULT NULL,
  `Desil` varchar(100) DEFAULT NULL,
  `DeisilInstallation` varchar(45) DEFAULT NULL,
  `ContractDesil` varchar(100) DEFAULT NULL,
  `PreDeliveryDesil` varchar(100) DEFAULT NULL,
  `FinalDeliveryDesil` varchar(100) DEFAULT NULL,
  `ATS1Transit` varchar(100) DEFAULT NULL,
  `IsolationTransformer` varchar(100) DEFAULT NULL,
  `ATS2VTMS` varchar(100) DEFAULT NULL,
  `AvrRadar` varchar(100) DEFAULT NULL,
  `SurgeRadar` varchar(100) DEFAULT NULL,
  `TawkitatSurgeProtect` varchar(100) DEFAULT NULL,
  `RadarSurgeProtect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `power_station`
--

INSERT INTO `power_station` (`id`, `station_name`, `UpsSttp`, `UpsRadar`, `ContractUPS`, `UpslInstallation`, `PreDeliveryUPS`, `FinalDeliveryUPS`, `StatusRatioRadar`, `StatusRatioSTTB`, `LastMessage`, `Desil`, `DeisilInstallation`, `ContractDesil`, `PreDeliveryDesil`, `FinalDeliveryDesil`, `ATS1Transit`, `IsolationTransformer`, `ATS2VTMS`, `AvrRadar`, `SurgeRadar`, `TawkitatSurgeProtect`, `RadarSurgeProtect`) VALUES
(1, 'الجونة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '-', '-', '30 KVA', '2014', '2019', 'لم يتم', '2016', 'لايوجد', '2022', '2019', 'لايوجد', 'لايوجد', 'قيد التوريد', ''),
(2, 'القبة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لدى شركة جيت للإصلاح', '−', '−', '100 KVA', '2014', '2019', 'لم يتم', '2016', 'لايوجد', '2022', '2019', 'لايوجد', 'تم الاستلام  وجارى التركيب)', 'لم يتم', 'لم يتم'),
(3, 'الرسوة', 0, 0, '√', '√', '√', '√', '√', '√', '√', 'قيد التوريد (امر توريد بتاريخ 3-3-2022)مدة التوريد 5 شخور)', '−', '−', '−', '−', 'لايوجد', 'تم استلامه ولكن يركب بعد توريد المولد', 'جاى التوريد', 'لايوجد', 'لايوجد', 'جارى التوريد', 'جارى التركيب'),
(4, 'راس العش', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لدى شركة جيت للإصلاح', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2022', 'جارى التوريد', 'جارى التركيب'),
(5, 'التينة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2015', '2020', 'جارى التركيب', '2015', '2021', '2022', 'تم التركيب', 'جارى التركيب'),
(6, 'الكاب', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', '2020', 'تم التركيب', '2012', '2021', '2022', 'جارى التوريد', 'جارى التركيب'),
(7, 'القنطرة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لدى شركة جيت للإصلاح', '−', '−', '(تم طلب تغيره في اللميزانية30 KVA', '1994', '1994', 'لم يتم', '1995', '2020', 'تم التركيب', '1994', '2021', '2021', 'جارى التوريد', 'جارى التركيب'),
(8, 'البلاح', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لدى شركة جيت للإصلاح', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2021', 'جارى التوريد', 'جارى التركيب'),
(9, 'الفردان', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'جارى التركيب', '2015', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(10, 'المارينا', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '−', '−', '−', 'لم يتم', '−', '2020', 'تم التركيب', '−', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(11, 'طوسون', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2022', 'جارى التوريد', 'جارى التركيب'),
(12, 'الدفرسوار', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'جارى التركيب', '2015', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(13, 'كبريت', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'جارى التركيب', '2015', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(14, 'جنيفة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', '2020', 'تم التركيب', '2013', '2021', '2022', 'تم التركيب', 'جارى التركيب'),
(15, 'الشلوفة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2021', 'جارى التوريد', 'جارى التركيب'),
(16, 'بورتوفيق', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لايعمل', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', 'لايوجد', 'تم التركيب', '2013', '2021', '2021', '−', '−'),
(17, 'فنارة', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لدى شركة جيت للإصلاح', '−', '−', '100 KVA', '2016', '2018', 'لم يتم', '2019', 'لايوجد', 'تم التركيب', '2018', '2021', '2021', 'لايوجد', 'لايوجد'),
(18, 'شرق الفردان', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '100 KVA', '2016', '2018', 'لم يتم', '2019', 'لايوجد', 'تم التركيب', '2018', 'لايحتاج تم تريب نظام الطاقة المتجددة', 'جارى التركيب', 'لايوجد', 'لايوجد'),
(19, 'الارسال', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '1996 مطلوب تغييره', '1996', 'لم يتم', '1996', 'لايوجد', 'تم التركيب', '1996', '2021', '2022', 'لايوجد', 'لايوجد'),
(20, 'بورفؤاد', 0, 0, '−', '−', 'لم يتم', 'لم يتم', 'لم يتم', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', 'لايوجد', 'تم التركيب', '2012', '2022', '2021', 'لايوجد', 'لايوجد');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
