-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 07, 2022 at 11:37 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--
CREATE DATABASE IF NOT EXISTS `crm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crm`;

-- --------------------------------------------------------

--
-- Table structure for table `anexos`
--

DROP TABLE IF EXISTS `anexos`;
CREATE TABLE IF NOT EXISTS `anexos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimeType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processo_id` int(10) UNSIGNED DEFAULT NULL,
  `documentotipo_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anexos_processo_id_foreign` (`processo_id`),
  KEY `anexos_documentotipo_id_foreign` (`documentotipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `rg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_empresarial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `im` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personalidade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_endereco_id_foreign` (`endereco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentos_tipos`
--

DROP TABLE IF EXISTS `documentos_tipos`;
CREATE TABLE IF NOT EXISTS `documentos_tipos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
CREATE TABLE IF NOT EXISTS `enderecos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_06_20_190642_create_enderecos_table', 1),
(4, '2017_06_20_190643_create_clientes_table', 1),
(5, '2017_06_20_191318_create_documentos_tipos_table', 1),
(6, '2017_06_20_192150_create_processos_table', 1),
(7, '2017_06_20_192151_create_anexos_table', 1),
(8, '2018_02_07_204120_add_fields_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `processos`
--

DROP TABLE IF EXISTS `processos`;
CREATE TABLE IF NOT EXISTS `processos` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `processos_cliente_id_foreign` (`cliente_id`),
  KEY `processos_usuario_id_foreign` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_usuario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `tipo_usuario`, `path_foto`) VALUES
(1, 'Elshaymaa Nassar', 'elshaymaa_nassar@yahoo.com', '$2y$10$J9pGK4WJdV95QOm95tWKQOkxSItTYk.XIPaCosVs7/rRIYqubpUkK', NULL, '2022-02-28 08:11:13', '2022-02-28 08:11:13', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anexos`
--
ALTER TABLE `anexos`
  ADD CONSTRAINT `anexos_documentotipo_id_foreign` FOREIGN KEY (`documentotipo_id`) REFERENCES `documentos_tipos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anexos_processo_id_foreign` FOREIGN KEY (`processo_id`) REFERENCES `processos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`);

--
-- Constraints for table `processos`
--
ALTER TABLE `processos`
  ADD CONSTRAINT `processos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `processos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `dms`
--
CREATE DATABASE IF NOT EXISTS `dms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dms`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Default', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(2, 'Instrument & Control', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(3, 'Electrical', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(4, 'Mechanical', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(5, 'Process', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(6, 'Inspection & Safety', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(7, 'Quality Control', '2022-02-28 08:41:36', '2022-02-28 08:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `locker_id` bigint(20) UNSIGNED NOT NULL,
  `plant_id` bigint(20) UNSIGNED NOT NULL,
  `equipment_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_slug_unique` (`slug`),
  KEY `documents_department_id_foreign` (`department_id`),
  KEY `documents_category_id_foreign` (`category_id`),
  KEY `documents_user_id_foreign` (`user_id`),
  KEY `documents_locker_id_foreign` (`locker_id`),
  KEY `documents_plant_id_foreign` (`plant_id`),
  KEY `documents_equipment_id_foreign` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipment_name_unique` (`name`),
  KEY `equipment_plant_id_foreign` (`plant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lockers`
--

DROP TABLE IF EXISTS `lockers`;
CREATE TABLE IF NOT EXISTS `lockers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lockers_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_10_10_060336_create_roles_table', 1),
(9, '2019_10_10_060830_create_departments_table', 1),
(10, '2019_10_10_061201_create_lockers_table', 1),
(11, '2019_10_10_061247_create_categories_table', 1),
(12, '2019_10_30_161842_create_plants_table', 1),
(13, '2019_10_30_162024_create_equipment_table', 1),
(14, '2019_10_31_122039_create_users_table', 1),
(15, '2019_10_31_122349_create_documents_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DMS Personal Access Client', 'stDpmjiemI4encFtL79MOwl3PypZis2olMMEnpGS', 'http://localhost', 1, 0, 0, '2022-02-28 08:42:01', '2022-02-28 08:42:01'),
(2, NULL, 'DMS Password Grant Client', 'c1MjA0tCYphkpUDspO49pF15Sx9huINrmTBiCdTy', 'http://localhost', 0, 1, 0, '2022-02-28 08:42:01', '2022-02-28 08:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-02-28 08:42:01', '2022-02-28 08:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plants_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(2, 'User', '2022-02-28 08:41:36', '2022-02-28 08:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_department_id_foreign` (`department_id`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `department_id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Admin', 'nassarelshaymaa@gmail.com', '2022-02-28 08:41:36', 'Al@@2909', 'gs6GamvCcc', '2022-02-28 08:41:36', '2022-02-28 08:41:36'),
(2, 1, 2, 'User', 'user@splerp.com', '2022-02-28 08:41:36', '$2y$10$QP/SwRlT9BtxVJSw2ZkuRuiFwHIC70X36QpKJMB0EbeknUu4hF7b.', 'Cvvewf99Pf', '2022-02-28 08:41:36', '2022-02-28 08:41:36');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `documents_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `documents_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `documents_locker_id_foreign` FOREIGN KEY (`locker_id`) REFERENCES `lockers` (`id`),
  ADD CONSTRAINT `documents_plant_id_foreign` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`),
  ADD CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_plant_id_foreign` FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
--
-- Database: `laravel`
--
CREATE DATABASE IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel`;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `task` varchar(100) NOT NULL,
  `manager` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `task`, `manager`, `created_at`, `updated_at`) VALUES
(1, 'vtms', 'vtms', 'waleed', '2022-03-01 12:16:43', '2022-03-01 12:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `contents` varchar(100) NOT NULL,
  `geha` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `contents`, `geha`, `created_at`, `updated_at`) VALUES
(1, '675', 'reply', NULL, '2022-03-01 12:30:30', '2022-03-01 10:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(4) DEFAULT NULL,
  `name_ar` varchar(100) NOT NULL,
  `details_ar` varchar(11) NOT NULL,
  `details_en` varchar(110) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name_en`, `price`, `photo`, `created_at`, `updated_at`, `status`, `name_ar`, `details_ar`, `details_en`) VALUES
(1, 'perfume', '100', '', '2022-03-01', '2022-03-01', 'a', 'عطر', '0', ''),
(2, 'watch', '200', '', '2022-03-01', '2022-03-01', 'i', 'ساعة', '0', ''),
(3, 'POWER', '1000', '1646118917.jpg', '2022-03-01', '2022-03-01', NULL, 'قوى', 'تخفيض', 'discount'),
(4, 'POWER', '1000', '1646138695.jpg', '2022-03-01', '2022-03-01', NULL, 'قوى', 'تخفيض', 'discount'),
(5, 'POWER', '1000', '1646205906.jpg', '2022-03-02', '2022-03-02', NULL, 'قوى', 'تخفيض', 'discount'),
(6, 'POWER', '1000', '1646648527.jpg', '2022-03-07', '2022-03-07', NULL, 'قوى', 'تخفيض', '50% discount');

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Elshaymaa Nassar', 1015685693, 'elshaymaa_nassar@yahoo.com', NULL, '$2y$10$0lh9tfJc8rh7kIa7ABsfVuOIhf1igk80QBS6ptPSMxsW3QRLwJXV.', NULL, '2022-03-01 04:55:00', '2022-03-01 04:55:00');
--
-- Database: `laravel1`
--
CREATE DATABASE IF NOT EXISTS `laravel1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel1`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Database: `monitor`
--
CREATE DATABASE IF NOT EXISTS `monitor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `monitor`;

-- --------------------------------------------------------

--
-- Table structure for table `bussinessaffairs`
--

DROP TABLE IF EXISTS `bussinessaffairs`;
CREATE TABLE IF NOT EXISTS `bussinessaffairs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` int(11) DEFAULT NULL,
  `SectionID` int(11) DEFAULT NULL,
  `bussinessid` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `Actions` char(100) DEFAULT NULL,
  `remarks` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bussinessaffairs`
--

INSERT INTO `bussinessaffairs` (`ID`, `SubjectID`, `SectionID`, `bussinessid`, `date`, `Actions`, `remarks`) VALUES
(1, 1, 1, 1, 'أغسطس 2011', 'توريد عدد 7 محطات رادار(بورفؤاد - القبة - الكاب - الارسال - فنارة - جنيفة -بورتوفيق)', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(2, 1, 1, 1, 'أغسطس 2014', 'توريد عدد 7 محطات رادار(بورفؤاد - القبة - الكاب - الارسال - فنارة - جنيفة -بورتوفيق)', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(3, 1, 1, 1, 'أغسطس 2015', 'توريد عدد 7 محطات رادار(بورفؤاد - القبة - الكاب - الارسال - فنارة - جنيفة -بورتوفيق)', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(4, 1, 1, 2, 'ابريل 2015', 'تركيب عدد 6 محطات (بورفؤاد - القبة - الكاب - الارسال - جنيفة - بورتوفيق)', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(5, 1, 1, 3, 'يوليو 2017', 'توريد عدد 5 محطات رادار (راس العش - البلاح - شرق الفردان - طوسون - الشلوفة )', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(6, 1, 1, 4, 'أغسطس 2017', 'تركيب عدد 3 محطات رادار(البلاج - طوسون - الشلوفة)', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(7, 1, 1, 5, 'فبراير 2020', 'تركيب رادار  ( فنارة - رأس العش - شرق الفردان)', 'تواريخ التوريد و التركيب لكل محطةواسم الشركة الموردة وشروط التوريد بنود التوريد'),
(8, 1, 1, 6, 'خلال 2020/2021', 'مع مندوب GET  وكيل الهيئة الاقتصادية للمشروعات تم عمل اختبارات (فنارة - شرق الفردان -راس العش) باقى', 'إشارة للشركة رقم 883 بتاريخ /9/12/2021'),
(9, 1, 1, 7, 'نوفمبر 2021', 'عدد 2 امر توريد من شركات (TERMA- SPERRY MARINE) و في انتظار توريدهم هي قطع غيار مطلوبة لعمل الصيانات', 'استثناء كارتة CPRD تعمل التموين على توفيرها'),
(10, 2, 1, 1, 'أغسطس 2012', 'قامت الشركة الفرنسية (الهيئة الاقتصادية للمشروعات بالمخابرات العامة) بعمل :', 'المحطات الأساسية والمضافة وتاريخ التعاقد على ال 5 محطات'),
(11, 2, 1, 1, 'أغسطس 2012', '1- مسح ودراسة ميدانية للتغطية الردارية لقناة السوسي بالكامل', 'المحطات الأساسية والمضافة وتاريخ التعاقد على ال 5 محطات'),
(12, 2, 1, 1, 'أغسطس 2012', '2- نتج عنها 5 مناطق عمياء للشبكة الردارية المكونة من :', 'المحطات الأساسية والمضافة وتاريخ التعاقد على ال 5 محطات'),
(13, 2, 1, 1, 'أغسطس 2012', 'عدد 8 محطات رادار وبالتالي تم تعديل التعاقد بإضافة عدد  5 محطات ردارية إضافية وأصبحت عدد المحطات 13', 'المحطات الأساسية والمضافة وتاريخ التعاقد على ال 5 محطات');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `task` varchar(100) NOT NULL,
  `manager` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `task`, `manager`, `created_at`, `updated_at`) VALUES
(1, 'vtms', 'vtms', 'waleed', '2022-03-01 12:16:43', '2022-03-01 12:16:43'),
(2, 'vtms', 'vtms', 'waleed', '2022-03-02 08:53:18', '2022-03-02 08:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `contents` varchar(100) NOT NULL,
  `geha` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `contents`, `geha`, `created_at`, `updated_at`, `photo`) VALUES
(1, '675', 'reply', NULL, '2022-03-01 12:30:30', '2022-03-01 10:30:30', ''),
(2, '657', 'reply', NULL, '2022-03-02 06:53:39', '2022-03-02 04:53:39', ''),
(3, '658', 'store', NULL, '2022-03-02 07:00:45', '2022-03-02 05:00:45', ''),
(4, '659', 'store2', NULL, '2022-03-02 07:02:51', '2022-03-02 05:02:51', ''),
(5, '660', 'store3', NULL, '2022-03-02 07:03:26', '2022-03-02 05:03:26', ''),
(6, '660', 'store3', NULL, '2022-03-02 07:05:43', '2022-03-02 05:05:43', '');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `details_en` varchar(1000) DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `details_ar` varchar(1000) DEFAULT NULL,
  `directory` varchar(100) NOT NULL DEFAULT 'offers',
  `input` varchar(100) DEFAULT NULL,
  `output` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name_en`, `price`, `photo`, `created_at`, `updated_at`, `details_en`, `name_ar`, `details_ar`, `directory`, `input`, `output`, `type`, `status`) VALUES
(1, '2017', 'عدد/5 محطات (راس العش - البلاح - شرق الفردان - طوسون - الشلوفة)', 'vtms-2017.pdf', '2022-04-03 12:14:58', '2022-03-01 08:09:53', 'طباقا لمحضر فحص ظاهري', 'تشوينات  محطات الرادرار ( مخزن المواصلات)', 'مرفق ب التعاقد بين هيئة قناة السويس و مجلس الدفاع الوطني إتفاق 28/6/2009 إتفاق 15/3/2016 ملحق إتفاق 7/3/2019', 'vtms', NULL, NULL, NULL, 'done'),
(2, 'يوليو - أغسطس (2017)', 'تركيب عدد 3 محطات رادار(البلاج - طوسون - الشلوفة)', 'vtms-يوليو - أغسطس (2017).pdf', '2022-04-04 11:44:19', '2022-03-01 06:24:45', NULL, 'تركيبات  محطات الرادار', NULL, 'vtms', NULL, NULL, NULL, 'done'),
(3, 'فبراير 2020', 'تركيب عدد 3 محطات  ( فنارة - رأس العش - شرق الفردان)', '', '2022-03-08 08:30:09', '2022-03-01 08:29:16', NULL, 'تركيبات  محطات الرادار', NULL, 'offers', '', '', '', NULL),
(4, 'ابريل - مايو - يونيو (2015)', 'لا توجد ملاحظات عند التركيب المحطات (بورفؤاد - القبة - الكاب - الارسال - جنيفة - بورتوفيق-القنطرة) وبداية التشغيل تعمل بكفاءة 100%', '', '2022-03-15 07:50:37', '2022-03-01 08:49:09', NULL, 'المشاكل الفنية للرادار', NULL, 'offers', '', '', '', NULL),
(5, 'أغسطس 2011', 'عدد/7 محطات (بورفؤاد - القبة - الكاب -القنطرة -الإرسال - جنيفة - بورتوفيق)', 'vtms-أغسطس 2011.pdf', '2022-04-05 07:27:06', '2022-03-01 08:49:44', 'طباقا لمحضر فحص ظاهري', 'تشوينات  محطات الرادرار ( مخزن المواصلات)', 'مرفق ب التعاقد بين هيئة قناة السويس و مجلس الدفاع الوطني إتفاق 28/6/2009 إتفاق 15/3/2016 ملحق إتفاق 7/3/2019', 'vtms', NULL, NULL, NULL, 'done'),
(6, 'فبراير 2022', 'عدد 5 محطات تعمل بنسبة 50% (بورفؤاد - الكاب - البلاح - الارسال - جنيفة )', 'vtms-فبراير 2022.pdf', '2022-04-03 12:21:37', '2022-03-01 08:49:51', 'أخر مخاطبة الهيئة الإقتصادية  للمشروعات رقم883/ج بتاريخ 9/12/2021', 'المشاكل الفنية للرادار', 'رقم 433/ج بتاريخ 12/7/2016', 'vtms', NULL, NULL, NULL, 'done'),
(7, '06-02-2020', 'أمر توريد رقم 26-1026/1106 بخصوص ماجنترونات محطات رادار موديل terma', 'vtms-06-02-2020.pdf', '2022-04-05 11:57:32', '2022-03-01 09:26:17', NULL, 'أوامر التوريد', NULL, 'vtms', NULL, NULL, 'أمر توريد', 'done'),
(8, '17-11-2021', 'أمر توريد رقم 26-1088/824 بخصوص قطع غيار رادار من نوع sperry marine', 'vtms-3683-17-11-2021.pdf', '2022-04-05 11:57:59', '2022-03-01 11:14:26', NULL, 'أوامر التوريد', NULL, 'vtms', '3683', NULL, 'أمر توريد', 'done'),
(9, '23/11/2020', 'أمر توريد رقم 26-1016/706 بخصوص مواتير  لهوائي رادار CHL', '1647330499.pdf', '2022-03-15 07:48:19', '2022-03-01 11:15:49', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(10, '17-11-2021', 'أمر توريد رقم 26-1088/823 بخصوص توفير قطع غيار ciberd', 'vtms-17-11-2021.pdf', '2022-04-05 12:20:37', '2022-03-01 11:21:01', NULL, 'أوامر التوريد', NULL, 'vtms', NULL, NULL, NULL, 'done'),
(11, '23/11/2020', 'أمر توريد رقم 26-1016/08 بخصوص قطع غيار هوائي رادار من نوع chl', '1647330524.pdf', '2022-03-15 07:48:44', '2022-03-01 11:27:35', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(12, '05-09-2010', 'أمر توريد رقم 1528/670-26 بخصوص توفير قطع غيار بخصوص كبائن GEM', '1647331891.pdf', '2022-03-15 08:11:32', '2022-03-07 10:40:07', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(13, 'فبراير 2022', 'عدد 6 محطات متوقفة لأسباب فنية (القبة - رأس العش - القنطرة - شرق الفردان - فنارة -بورتوفيق)', '1647331572.png', '2022-03-15 08:06:12', '2022-03-07 10:47:40', 'أخر مخاطبة الهيئة الإقتصادية  للمشروعات رقم883/ج بتاريخ 9/12/2021', 'المشاكل الفنية للرادار', 'أول مخاطبة لهيئة الدفاع الوطني', 'offers', '', '', '', NULL),
(14, '05-09-2010', 'أمر توريد رقم 1529/670-26 بخصوص توفير قطع غيار بخصوص كبائن GEM', '1647331714.pdf', '2022-03-15 08:08:34', '2022-03-07 10:53:06', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(15, '16/4/2013', 'أمر توريد رقم 26-670/1398 بخصوص توفير قطع غيار بخصوص كبائن GEM', '', '2022-03-15 08:15:00', '2022-03-07 12:42:57', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(16, '02-05-2020', 'أمر توريد رقم 26-1026/1106 بخصوص ماجنترونات محطات رادار موديل terma', 'vtms-02-05-2020.pdf', '2022-04-05 12:03:07', '2022-03-15 07:37:13', NULL, 'أوامر التوريد', NULL, 'vtms', NULL, NULL, NULL, 'done'),
(17, '09-01-2014', 'أمر توريد رقم 263/870-26 بخصوص توفير قطع غيار بخصوص كبائن GEM', '', '2022-04-05 12:20:53', '2022-03-15 08:16:15', 'غير متوفر', 'أوامر التوريد', NULL, 'vtms', NULL, NULL, NULL, 'done'),
(18, '02-12-2017', 'أمر توريد رقم 997/945-26 بخصوص توفير قطع غيار بخصوص كبائن GEM', '', '2022-03-15 08:17:03', '2022-03-15 08:17:03', 'غير متوفر', 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(19, '22/11/2020', 'أمر توريد رقم 708/1016-26 بخصوص توفير قطع غيار بخصوص كبائن GEM', '1647332289.pdf', '2022-03-15 08:18:09', '2022-03-15 08:18:09', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(20, '14/7/2020', 'أمر توريد رقم997/945-26 بخصوص توفير قطع غيار بخصوص كبائن GEM', '', '2022-03-15 08:21:31', '2022-03-15 08:21:31', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(21, '23-11-2020', 'أمر توريد رقم 26-1016/707 بخصوص توفير قطع غيار هوائي لمحطات رادار chl', 'vtms-23-11-2020.pdf', '2022-04-05 12:21:25', '2022-03-15 08:22:25', NULL, 'أوامر التوريد', NULL, 'vtms', NULL, NULL, NULL, 'done'),
(22, '25/8/2019', 'أمر توريد 26-927/213 بخصوص توفير زيوت جير بوكس للهوائيات', '', '2022-03-15 08:23:21', '2022-03-15 08:23:21', NULL, 'أوامر التوريد', NULL, 'offers', '', '', '', NULL),
(23, 'بدون', 'عدم إمكانية الشبكة الرادارية الحالية من عند تغطية قناة السويس الجديدة من 65 حتي 90 كم بسبب إرتفاعات التلال الردم علي ضفتي قناة السويس و قد تصل إرتفاعها إلي منسوب 40 متر', '', '2022-03-15 08:29:58', '2022-03-15 08:28:01', 'بعد إجراءات إستلام مشروع الـVTMS الحالي من الهيئة الإقتصادية  للمشروعات بالمخابرات العامة', 'الرؤية المستقبلية', 'يجب أن تقوم الشركة المكلف لها رسميا بتحديث مشروع الـ VTMS  بعمل دراسة ميدانيا للتغطية الرادارية للقناة الجديدة لتحدد عدد و أحداثيات  لمواقع الرادار الجديدة المقُترحة من طرفهم طبقا لنوعية الموصفات الفنية  للرادارات حتي تنفذ التغطية الرادارية بالكامل وهو الهدف الأساسي من التحديث.', 'offers', '', '', '', NULL),
(24, 'بدون', 'رفع كفاءة التغطية الرادارية للمنطقة الشمالية للقناة بمنطقة شرق التفريعة', '', '2022-03-15 08:29:42', '2022-03-15 08:29:42', 'بعد إجراءات إستلام مشروع الـVTMS الحالي من الهيئة الإقتصادية  للمشروعات بالمخابرات العامة', 'الرؤية المستقبلية', 'يجب أن تقوم الشركة المكلف لها رسميا بتحديث مشروع الـ VTMS  بعمل دراسة ميدانيا للتغطية الرادارية للمنطقة الشمالية لتحدد مدي فاعلية  تركيب محطة رادار جديدة بالبرج الجديد بمحطة الجونة البحرية طبقا لنوعية  الموصفات الفنية للرادارحتي تنفذ التغطية الرادارية بالكامل وهو الهدف الأساسب من التحديث وعدم الإعتماد الكلي علي رادار بورفؤاد.', 'offers', '', '', '', NULL),
(25, 'بدون', 'رفع كفاءة التغطية الرادارية للمنطقة الجنوبية للقناة بعد التفريعة الجديدة التي جاري تنفيذها  من ترقيم 122 كم إلي 162 كم', '', '2022-03-15 08:31:25', '2022-03-15 08:31:25', 'بعد إجراءات إستلام مشروع الـVTMS الحالي من الهيئة الإقتصادية  للمشروعات بالمخابرات العامة', 'الرؤية المستقبلية', 'من المحتمل تكون تلال ناتج الردم علي ضفتي القناة الناتجة من الحفر و  التوسعة بالقطاع الجنوبي، مما ينتج عنه مناطق عمياء راداريا  ، مثلما مع حدث من حفر قناة السويس الجديدة و الإضطرار للإحتياج  إلي تركيب محطات رادار جديدة.', 'offers', '', '', '', NULL),
(26, '06-11-2020', 'وصيات اللجنة المشكلة 258/2020 بتحديد أعمال الصيانة  عدد/9 أبراج و أخذ برأي إستشاري بإحلال برجي (الإرسال  و الكاب)', '1647333270.pdf', '2022-03-15 08:34:30', '2022-03-15 08:34:30', 'عملية رقم 1/2011  أخر عملية صيانة للأبراج مع شركة يونيكونت', 'صيانة أبراج رادار', 'تقرير اللجنة المشكلة', 'offers', '', '', '', NULL),
(27, '30/11/2020', 'موافقة رئيس هيئة قناة السويس علي توصيات لجنة المشروعات بإسناد العملية إلي إدارة التحركات', '1647333411.pdf', '2022-03-15 08:36:51', '2022-03-15 08:36:51', NULL, 'صيانة أبراج رادار', 'لجنة المشروعات', 'offers', '', '', '', NULL),
(28, '31/1/2022', 'تم مخاطبة الإدارة الهندسية نحو إسناد العملية لأحد الشركات الهيئة المتخصصة  في هذا المجال بمعرفتكم', '1647333544.pdf', '2022-03-15 08:39:04', '2022-03-15 08:39:04', 'عملية رقم 1/2011  أخر عملية صيانة للأبراج مع شركة يونيكونت', 'صيانة أبراج رادار', NULL, 'offers', '', '', '', NULL),
(29, '23/5/2017', 'أفادات الشئون الفنية بإدارة التحركات لقسم المراقبة الإلكترونية بموافقة علي بند مصعد كل  من برجي رادار بورفؤاد و بورتوفيق بمشروع الموازنة الإستثمارييية 2017/2018', '1647333641.pdf', '2022-03-15 08:40:41', '2022-03-15 08:40:41', NULL, 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(30, '09-07-2017', 'أفادات الشئون الفنية بإدارة التحركات لقسم المراقبة الإلكترونية بموافقة علي بند مصعد كل  من برجي رادار بورفؤاد و بورتوفيق بمشروع الموازنة الإستثمارييية 2017/2018', '1647333712.pdf', '2022-03-15 08:41:52', '2022-03-15 08:41:52', NULL, 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(31, '25-02-2018', 'أفادات إدارة التموين بأن تم تحويل طلب توفير المصاعد  إلي الإدارة الأشغال و الهندسية  برقم 299 بتاريخ 25/2/2018', '1647334753.pdf', '2022-03-15 08:59:13', '2022-03-15 08:43:23', NULL, 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(32, '09-07-2017', 'إفادة إلي إدارة التموين بالمواصفات الفنية للمصعدين المطلوبة و أسماء مندوبين قسم المراقبة الإلكترونية  للإنضمام لجنة الدراسة والبت رقم 1496/ب بتاريخ 7/9/2017', 'vtms-4329-09-07-2017.pdf', '2022-04-05 07:35:05', '2022-03-15 08:45:26', NULL, 'مصاعد الابراج', NULL, 'vtms', '4329', NULL, 'مذكرة فريق', 'done'),
(33, '25/2/2018', 'أفادات إدارة التموين بأن تم تحويل طلب توفير المصاعد  إلي الإدارة الأشغال و الهندسية  برقم 299 بتاريخ 25/2/2018', '1647335172.pdf', '2022-03-15 09:06:12', '2022-03-15 08:50:29', NULL, 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(34, '18/4/2018', 'أفادة إلي الإدارة الهندسية بإشارة رقم رقم 652 بناريخ 18/4/2018  بالمواصفات الفنية للمصاعد و أسماء المندوبين للتنسيق', '1647334850.pdf', '2022-03-15 09:00:50', '2022-03-15 08:51:42', NULL, 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(35, '02-11-2020', 'تشكيل أمر إداري رقم 18 لسنة 2020 بتاريخ 11/2/2020 لممارسة شركة قناة السويس للاستثمار', '1647335008.pdf', '2022-03-15 09:03:28', '2022-03-15 08:53:05', NULL, 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(36, '08-08-2021', 'مذكرة إدارة الرئاسة رقم 3836 و 3837 بتاريخ 8/8/2021 بخصوص إسناد  شركة ترسانة السويس البحرية بالتنفيذ بمبلغ 12.5 مليون جنية', '1647335068.pdf', '2022-03-15 09:04:28', '2022-03-15 08:54:39', 'أوصي رئيس الهيئة بأن المبلغ  المعروض مبالغ فيه', 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(37, '09-07-2021', 'مذكرة رقم 4329 بتاريخ 7/9/2021 بعادة طرح مناقصة توريد وتركيب المصاعد', '1647334596.pdf', '2022-03-15 08:56:36', '2022-03-15 08:56:36', 'حتي سعه و تاريخه لم يتم إتخاذ  أي إجراء', 'مصاعد الابراج', NULL, 'offers', '', '', '', NULL),
(38, '2/3/22', 'اصلاح عدد جهاز واحد', '1648452740.pdf', '2022-03-28 07:32:21', '2022-03-28 07:32:21', NULL, 'صيانة جهاز AIS ترسانة بورسعيد', 'اشارة بتلف الجهاز تماما وعدم صلاحيته للعمل', 'offers', '', '', '', NULL),
(39, '2/3/2022', 'صيانة ال ups خاص بجهاز ال ais بالترسانة', 'power-2022-03-28.png', '2022-03-28 12:02:05', '2022-03-28 07:41:26', NULL, 'صيانة وحدات كهربية', NULL, 'power', '', '', '', NULL),
(40, '15-3-2022', NULL, 'security-2022455-15-3-2022.pdf', '2022-03-30 12:11:57', '2022-03-28 07:48:38', NULL, 'مشروع البصمة', 'بخصوص نظام التوقيع بالبصمة كامل مشتملاتة ( كاميرات + سيرفر + كابلات )', 'security', '2022455', NULL, 'إشاره كتابيه', NULL),
(41, 'مارس-2022', 'موافاتهم بخطة التعبئة العامة لعام 2023/2022 وكتابة البيانات على الحاسب الآلى على برنامج إكسيل (نسخة ورقية) + إسطوانة CD فى موعد أقصاه 2022/3/24', 'technical_office-2022457-مارس-2022.png', '2022-03-29 11:27:17', '2022-03-28 07:51:36', NULL, 'تعبئة للشئون الفنية', 'تم اجراء اللازم', 'technical_office', '2022457', NULL, 'إشاره كتابيه', NULL),
(42, '2022-03-17', 'شركة الانظمة ciss', 'hospital_centers-2022460-2022-03-17.PDF', '2022-03-29 11:40:33', '2022-03-28 07:55:35', 'بداية مشروع', 'أوامر التوريد', 'امر توريد رقم 109-474/1/1250 فى 26/1/2022 بخصوص تركيب وتوريد وتشغيل نظام مراقبة بالكاميرات للمراكز الطبية للهيئة ببورسعيد والسويس', 'hospital_centers', '2022460', NULL, 'إشاره كتابيه', NULL),
(43, '17-3-2022', 'مطلوب متابعة الشاشات المعطلة بعد المرور وما تم بشأنها', 'tawkitat-2022466-17-3-2022.pdf', '2022-03-29 11:37:32', '2022-03-28 08:03:41', 'انتظار الرد', 'المرور على المحطات البحرية بقطاع الاسماعيليه(البلاح- الفردان- طوسون- الدفرسوار)', NULL, 'tawkitat', '2022466', NULL, 'تقرير', NULL),
(44, '20/3/2022', 'اسماء مندوبينا هم م/ على محمد عادل على راغب رقم 10950 و م/ محمد ماجد حسين العروسى رقم 10589 للجنة فحص تجهيزات قاعة الاحتفالات بمبنى المارينا الجديدة', '1648454841.pdf', '2022-03-28 08:07:21', '2022-03-28 08:07:21', 'منتهى', 'فحص أجهزة', NULL, 'offers', '', '', '', NULL),
(45, '20/3/2022', 'تجهيز قاعة الاحتفالات بمبنى المارينا الجديد بالكم 76 والتنسيق الذى تم مع السيد/مدير ادارة الرئاسة بشان تشكيل لجنه للفحص والاستلام للمنظومات وتحديد اسماء المندوبيين للاشتراك فى اللجنه', '1648454984.pdf', '2022-03-28 08:09:44', '2022-03-28 08:09:44', NULL, 'تجهيز قاعة الاحتفالات', NULL, 'offers', '', '', '', NULL),
(46, '20/03/2022', 'عقد اجتماع يوم الثلاثاء الموافق 22/3/2022 صباحا بمكتب المهندس/ابراهيم جمال عبد الناصر بخصوص تنسيق الاعمال المطلوب تنفيذها من كل قسم لتطوير محطة الشلوفه', '1648455274.pdf', '2022-03-28 08:14:34', '2022-03-28 08:11:52', 'سيتم التنسيق لحضور مندوب من القسم وافاده اشغال بورتوفيق باى ملاحظات ان وجدت', 'اجتماع', 'تطوير محطة الشلوفة', 'offers', '', '', '', NULL),
(47, '16/3/2022', 'تم التنسيق مع مديريه الصحه على تواجد مركز لتلقى الجرعه التنشيطيه لفيرس كورونا', 'hospital_centers-2022-03-28.pdf', '2022-03-28 12:05:36', '2022-03-28 08:21:02', 'المتابعة حين الطلب', 'اجراءات صحية', 'تتم بجدول منتظم', 'hospital_centers', '', '', '', NULL),
(48, '20/3/2022', 'موافاتهم بالبيانات المذكورة باشاره الخدمات بخصوص مشروع التامين على سيارات هيئة قناه السويس للعام المالى 2022/2023', 'security-2022-03-28.pdf', '2022-03-28 11:26:27', '2022-03-28 08:23:55', NULL, 'تامين سيارات', NULL, 'security', '', '', '', NULL),
(49, '23/03/22', 'مخاطبه ادارة الخدمات للتامين الشامل على السياره طبقا لاشارتهم رقم 768 بتاريخ 13/3/2022', 'security-2022-03-29.png', '2022-03-29 06:21:24', '2022-03-29 06:21:24', NULL, 'تامين سيارات', NULL, 'security', '', '', '', NULL),
(50, '13-9-2021', 'أمر توريد رقم 384/1911-455', 'power-2981-13-9-2021.png', '2022-03-31 09:45:01', '2022-03-31 08:43:21', NULL, 'أمر توريد', 'توريد وتركيب 3kva ups', 'power', '2981', NULL, 'أمر توريد', 'canceled'),
(51, '28-2-2022', 'توريد وتركيب', 'power-1993-28-2-2022.png', '2022-03-31 09:44:19', '2022-03-31 08:50:18', NULL, 'أوامر التوريد', '912/1860-55 توريد عدد/18 كارتة ريموت لزوم شبكات UPS', 'power', '1993', NULL, 'أمر توريد', 'progress'),
(52, '6-3-22', 'امر توريد رقم 1890-55-1428', 'power-706-6-3-22.png', '2022-03-31 09:51:56', '2022-03-31 09:51:56', NULL, 'أوامر التوريد', 'امر توري', 'power', '706', NULL, 'أمر توريد', 'transferred'),
(53, '20-03-22', NULL, 'security-2022250-20-03-22.pdf', '2022-04-05 09:57:44', '2022-04-05 09:57:44', NULL, 'تركيب كاميرات محطات الماية', 'التنبيه بعمل ما يلزم نحو الرد على إستفسارات من الشركات (جيزة للأنظمة - إنتركوم - إنتراكت - NETC - ساميت) بخصوص المناقصة رقم 109-3572/501 جلسة يوم الأربعاء 2022/4/6 لتوريد وتركيب وتشغيل كاميرات مراقبة لمحطات المياه بمدن القناة الثلاث', 'security', NULL, '2022250', 'تحويل مستندات', 'done'),
(55, '28-03-22', NULL, 'power-2022531-28-03-22.pdf', '2022-04-05 10:27:23', '2022-04-05 10:27:23', NULL, 'فحص واستلام', 'إيفاد مندوبينا لفحص وإستلام عدد/ 1 جهاز Lab DC Power Supply الخاص بأمر توريد رقم 55-952/1898 بتاريخ 2021/12/7 الصادر لشركة سينا للمشروعات الهندسية', 'power', '2022531', NULL, 'إشاره كتابيه', 'progress'),
(56, '29-03-22', NULL, 'vtms-2022539-29-03-22.pdf', '2022-04-05 10:28:40', '2022-04-05 10:28:40', NULL, 'تعليمات داخلية', 'الإلتزام بما جاء بكتاب إدارة الخدمات رقم 850 بتاريخ 2022/3/21 بضرورة عدم مخالفة القواعد والتعليمات المتبعة أثناء التردد على المستشفيات والمراكز الطبية التابعة للهيئة', 'vtms', '2022539', NULL, 'إشاره كتابيه', 'progress'),
(57, '29-03-22', NULL, 'security-2022539-29-03-22.pdf', '2022-04-05 10:29:52', '2022-04-05 10:29:52', NULL, 'تعليمات داخلية', 'الإلتزام بما جاء بكتاب إدارة الخدمات رقم 850 بتاريخ 2022/3/21 بضرورة عدم مخالفة القواعد والتعليمات المتبعة أثناء التردد على المستشفيات والمراكز الطبية التابعة للهيئة', 'security', '2022539', NULL, 'أمر توريد', 'done'),
(58, '31-03-22', NULL, 'vtms-2022244-31-03-22.pdf', '2022-04-05 11:20:48', '2022-04-05 11:20:48', NULL, 'تركيبات  محطات الرادار', 'موافاتنا بموعد قدوم الشركة الفرنسية لإستكمال أعمال التركيبات لعدد/ 13 محطة رادار وإنهاء التسليم لمنظومة (VTMS)', 'vtms', NULL, '2022244', 'إشاره كتابيه', 'progress'),
(59, '31-03-22', NULL, 'vtms-2022521-31-03-22.pdf', '2022-04-05 11:23:54', '2022-04-05 11:23:54', NULL, 'توسيع طريق مرشدين', 'بشأن أعمال تطوير وتوسعة طريق المرشدين القطاع الرابع (جبل مريم - الدفرسوار) ودراسة التعارض مع كابلات هيئة قناة السويس.', 'vtms', NULL, '2022521', 'إشاره كتابيه', 'done'),
(60, '28-03-22', NULL, 'power-2022531-28-03-22.pdf', '2022-04-05 11:25:20', '2022-04-05 11:25:20', NULL, 'فحص أجهزة', 'إيفاد مندوبينا لفحص وإستلام عدد/ 1 جهاز Lab DC Power Supply الخاص بأمر توريد رقم 55-952/1898 بتاريخ 2021/12/7 الصادر لشركة سينا للمشروعات الهندسية', 'power', '2022531', NULL, 'إشاره كتابيه', 'progress'),
(61, '4-04-22', NULL, 'security-2022250-4-04-22.pdf', '2022-04-05 11:28:13', '2022-04-05 11:28:13', NULL, 'رد على استفسار التموين', 'رد على استفسارات الشركات فى المناقصة رقم109 -3572/501 جلسة الاربعاء 6/4/2022 لتوريد وتركيب كاميرات مراقبه لمحطات المياه بمدن القناه', 'security', NULL, '2022250', 'إشاره كتابيه', 'done'),
(62, '30-03-22', NULL, 'security-2022542-30-03-22.pdf', '2022-04-05 11:30:51', '2022-04-05 11:30:51', NULL, 'استلام تطوير الاستاد ابتدائى', 'الأمر الإدارى رقم 152 لسنة 2022 بخصوص الإستلام الإبتدائى لعملية تطوير وإنشاء استاد هيئة قناة السويس الجديد والحضور يوم الاربعاء من كل اسبوع ولحين نهو إجراءات اللجنة المذكورة', 'security', '2022542', NULL, 'أمر ادارى', 'done'),
(63, '3-04-22', NULL, 'security-2022553-3-04-22.pdf', '2022-04-05 11:33:01', '2022-04-05 11:33:01', NULL, 'تطوير كبرى الفردان', 'اعمال تطوير انشاء كوبرى الفردان الحديد', 'security', '2022553', NULL, 'إشاره كتابيه', 'done'),
(64, '30-03-22', NULL, 'vtms-2022548-30-03-22.pdf', '2022-04-05 11:34:52', '2022-04-05 11:34:52', NULL, 'قطع كابل فايبر', 'الإحاطة بأنه تم قطع كابل الفيبر بكل من القطاع الشمالى والقطاع الجنوبى', 'vtms', '2022548', NULL, 'إشاره كتابيه', 'done'),
(65, '29-03-22', NULL, 'security-2022545-29-03-22.pdf', '2022-04-05 11:43:47', '2022-04-05 11:43:47', NULL, 'مواصفات كاميرات', 'وارد رئاسه 1551 بتاريخ 29/3/2022 بخصوص وضع المواصفات الفنيه لكاميرات مراقبة اجهزة تسجيل الحضور والانصراف من قبل ادارة التحركات وقيام ادارة الاتصالات ونظم المعلومات باتخاذ اجراءات الفحص والاستلام', 'security', '2022545', NULL, 'إشاره كتابيه', 'done'),
(66, '22-03-22', NULL, 'hospital_centers-2022539-22-03-22.pdf', '2022-04-06 08:38:29', '2022-04-06 08:38:29', NULL, 'تامين مستشفيات', 'الإلتزام بما جاء بكتاب إدارة الخدمات رقم 850 بتاريخ 2022/3/21 بضرورة عدم مخالفة القواعد والتعليمات المتبعة أثناء التردد على المستشفيات والمراكز الطبية التابعة للهيئة', 'hospital_centers', '2022539', NULL, 'إشاره كتابيه', 'done'),
(67, '24-03-22', NULL, 'vtms-2022213-24-03-22.pdf', '2022-04-06 08:41:01', '2022-04-06 08:40:18', NULL, 'مد كابلات فايبر', 'تنفيذ المسارات المطلوبة حتى يتسنى سحب ومد الكابلات الخاصة بالنظام عند الحاجه دون إتلاف المسطح الأخضر بمحطة الفردان', 'vtms', NULL, '2022213', 'إشاره كتابيه', 'done'),
(68, '24-03-22', NULL, 'power-2022212-24-03-22.pdf', '2022-04-06 09:08:16', '2022-04-06 08:45:39', NULL, 'الطاقة المتجددة', 'تجهيز المواقع للبدء فى تركيب أنظمة الطاقة المتجددة(الرياح+ الشمس) بمحطات القطاع الشمالى وعمل مسار عبارة عن عدد/3 ماسوره 4 بوصة من غرفة الفيبر أسفل البرج إلى موقع برج التربينة', 'power', NULL, '2022212', 'إشاره كتابيه', 'done'),
(69, '6-04-22', NULL, '', '2022-04-07 08:19:47', '2022-04-07 08:19:47', NULL, 'تطوير محطات', 'سرعة توفير التكييفات المذكورة حيث أن درجة حرارة الغرفة الحالية تخطت درجة حرارة التشغيل المناسبة لأجهزة الكنترول والبطاريات الخاصة بمنظومة التغذية الكهربية لمحطة رادار شرق الفردان', 'vtms', NULL, '2022258', 'إشاره كتابيه', 'done'),
(70, '5-04-22', NULL, '', '2022-04-07 08:22:13', '2022-04-07 08:22:13', NULL, 'تطوير محطة الدفرسوار وكبريت', 'إقرار حالة برج الإشارة بمحطنى دفرسوار وكبريت وتحديد أعمال الصيانة المطلوبة', 'power', NULL, '2022252', 'إشاره كتابيه', 'done'),
(71, '4-04-22', NULL, '', '2022-04-07 08:24:31', '2022-04-07 08:24:31', NULL, 'كاميرات محطة القنطرة', 'التنبيه بوجود صدأ وتآكل شديد بقواعد الإضاءة التحذيرية المثبتة أعلى بلكونة الكاميرا الملاحية أعلى برج الإشارة بمحطة القنطرة', 'security', NULL, '2022251', 'إشاره كتابيه', 'done'),
(72, '03-04-22', NULL, '', '2022-04-07 08:27:04', '2022-04-07 08:27:04', NULL, 'امر التوريد رقم55- 887/1923', 'مخاطبه الشركه الموردة لسرعه توفير الاجهزة مشمول امر التوريد (عدد/16 جهاز منظم جهد) وذلك لتامين انظمة التوقيتات والارصاد ضد التغيرات فى الجهد', 'vtms', NULL, '2022247', 'إشاره كتابيه', 'progress'),
(73, '6-04-22', NULL, 'tawkitat-1671-6-04-22.pdf', '2022-04-07 08:34:25', '2022-04-07 08:34:25', NULL, 'تقرير عرض على الرئاسة', 'تقرير للعرض على السيد/ مدير ادارة الرئاسه برقم وارد1671 بتاريخ 5/4/2022 لمرور على المحطات البحريه بقطاع بورسعيد الجونه -الرسوه- راس العش- التينه-الكاب- القنطره', 'tawkitat', '1671', NULL, 'تقرير', 'done'),
(75, '5-04-22', NULL, 'Electorinc Archive-561-5-04-22.pdf', '2022-04-07 08:45:40', '2022-04-07 08:45:40', NULL, 'تشكيل لجنة', 'امر ادارى بتشكل لجنة للدراسة والبت فى عطاءات المناقصة المحدودة رقم 108-3562/1568 لتوريد نظام أرشيف إلكترونى مطلوب لإدارة التحركات والمحدد لها جلسة يوم 2022/2/7', 'Electorinc Archive', '561', NULL, 'أمر ادارى', 'done'),
(76, '5-04-22', NULL, 'power-2022559-5-04-22.pdf', '2022-04-07 10:28:49', '2022-04-07 10:28:04', NULL, 'صيانة تكييف راس العش', 'خطاب لشركة القناه للانشاءات البحرية لسرعه عمل اللازم نحو صيانه التكييف الخاص بشلتر برج الرادار بمحطة راس العش وكذا نظام الاضاءة التحذيرية واخطارنا فور نهو الاعمال المطلوبه', 'power', '2022559', NULL, 'إشاره كتابيه', 'done'),
(77, '5-04-22', NULL, 'vtms-2022562-5-04-22.pdf', '2022-04-07 10:30:43', '2022-04-07 10:30:43', NULL, 'غرف كابلات المحطات المكشوفة', 'مراجعة وإنهاء وعمل اللازم نحو غرف الكابلات المكشوفة بجميع محطات القطاع الشمالى', 'vtms', '2022562', NULL, 'إشاره كتابيه', 'done'),
(78, '5-04-22', NULL, 'technical_office-2022566-5-04-22.pdf', '2022-04-07 11:29:07', '2022-04-07 11:28:11', NULL, 'سيارة مجهزة للنقل', 'تواجد عدد/1 سياره نقل مجهزة بسلم هيدروليكى بمشتملاتها بقسم المراقبة الالكترونيه بالاسماعيليه للتامين عليها', 'technical_office', '2022566', NULL, 'إشاره كتابيه', 'done');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('elshaymaa_nassar@yahoo.com', '$2y$10$Re1r9jzFrO5iClrlRw.umOSg6sxlkl.nutH.raKHXnwOjPsWeNONS', '2022-03-10 06:53:25'),
('nassarelshaymaa@gmail.com', '$2y$10$eSEjKxmiolx1H/Vu8L1fjuh6JGScHXLttbfIgC3Gg60uFvjAvusMm', '2022-03-22 07:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `power_stations`
--

DROP TABLE IF EXISTS `power_stations`;
CREATE TABLE IF NOT EXISTS `power_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(100) DEFAULT NULL,
  `UpsSttp` varchar(100) DEFAULT NULL,
  `UpsRadar` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `power_stations`
--

INSERT INTO `power_stations` (`id`, `station_name`, `UpsSttp`, `UpsRadar`, `ContractUPS`, `UpslInstallation`, `PreDeliveryUPS`, `FinalDeliveryUPS`, `StatusRatioRadar`, `StatusRatioSTTB`, `LastMessage`, `Desil`, `DeisilInstallation`, `ContractDesil`, `PreDeliveryDesil`, `FinalDeliveryDesil`, `ATS1Transit`, `IsolationTransformer`, `ATS2VTMS`, `AvrRadar`, `SurgeRadar`, `TawkitatSurgeProtect`, `RadarSurgeProtect`) VALUES
(1, 'الجونة', '√', '-', '−', '−', '-', '-', NULL, '-', '-', '30 KVA', '2014', '2019', 'لم يتم', '2016', 'لايوجد', '2022', '2019', 'لايوجد', 'لايوجد', 'قيد التوريد', ''),
(2, 'القبة', '-', '√', '−', '−', '-', '-', NULL, '−', '−', '100 KVA', '2014', '2019', 'لم يتم', '2016', 'لايوجد', '2022', '2019', 'لايوجد', 'تم الاستلام  وجارى التركيب)', 'لم يتم', 'لم يتم'),
(3, 'الرسوة', '√', '-', '√', '√', '√', '√', NULL, '√', '-', 'قيد التوريد (امر توريد بتاريخ 3-3-2022)مدة التوريد 5 شخور)', '−', '−', '−', '−', 'لايوجد', 'تم استلامه ولكن يركب بعد توريد المولد', 'جاى التوريد', 'لايوجد', 'لايوجد', 'جارى التوريد', 'جارى التركيب'),
(4, 'راس العش', '√', '√', '−', '−', '-', '-', 'لدى شركة جيت للإصلاح', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2022', 'جارى التوريد', 'جارى التركيب'),
(5, 'التينة', '√', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2015', '2020', 'جارى التركيب', '2015', '2021', '2022', 'تم التركيب', 'جارى التركيب'),
(6, 'الكاب', '√', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', '2020', 'تم التركيب', '2012', '2021', '2022', 'جارى التوريد', 'جارى التركيب'),
(7, 'القنطرة', '√', '√', '−', '−', '-', '-', 'لدى شركة جيت للإصلاح', '−', '−', '(تم طلب تغيره في اللميزانية30 KVA', '1994', '1994', 'لم يتم', '1995', '2020', 'تم التركيب', '1994', '2021', '2021', 'جارى التوريد', 'جارى التركيب'),
(8, 'البلاح', '√', '√', '−', '−', '-', '-', 'لدى شركة جيت للإصلاح', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2021', 'جارى التوريد', 'جارى التركيب'),
(9, 'الفردان', '√', '-', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'جارى التركيب', '2015', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(10, 'المارينا', '√', '-', '−', '−', '-', '-', '-', '−', '−', '−', '−', '−', 'لم يتم', '−', '2020', 'تم التركيب', '−', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(11, 'طوسون', '√', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2022', 'جارى التوريد', 'جارى التركيب'),
(12, 'الدفرسوار', '√', '-', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'جارى التركيب', '2015', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(13, 'كبريت', '√', '-', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'جارى التركيب', '2015', '−', '−', 'جارى التوريد', 'جارى التركيب'),
(14, 'جنيفة', '√', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', '2020', 'تم التركيب', '2013', '2021', '2022', 'تم التركيب', 'جارى التركيب'),
(15, 'الشلوفة', '√', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2014', '2015', 'لم يتم', '2016', '2020', 'تم التركيب', '2015', '2021', '2021', 'جارى التوريد', 'جارى التركيب'),
(16, 'بورتوفيق', '√', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '2012', '2012', 'لم يتم', '2013', 'لايوجد', 'تم التركيب', '2013', '2021', '2021', '−', '−'),
(17, 'فنارة', '√', '√', '−', '−', '-', '-', 'لدى شركة جيت للإصلاح', '−', '−', '100 KVA', '2016', '2018', 'لم يتم', '2019', 'لايوجد', 'تم التركيب', '2018', '2021', '2021', 'لايوجد', 'لايوجد'),
(18, 'شرق الفردان', '-', '√', '−', '−', '-', '-', '-', '−', '−', '100 KVA', '2016', '2018', 'لم يتم', '2019', 'لايوجد', 'تم التركيب', '2018', 'لايحتاج تم تريب نظام الطاقة المتجددة', 'جارى التركيب', 'لايوجد', 'لايوجد'),
(19, 'الارسال', '-', '√', '−', '−', '-', '-', '-', '−', '−', '30 KVA', '1996 مطلوب تغييره', '1996', 'لم يتم', '1996', 'لايوجد', 'تم التركيب', '1996', '2021', '2022', 'لايوجد', 'لايوجد'),
(20, 'بورفؤاد', '-', '√', '−', '−', '-', '-', '-', '−', '', '30 KVA', '2012', '2012', 'لم يتم', '2013', 'لايوجد', 'تم التركيب', '2012', '2022', '2021', 'لايوجد', 'لايوجد');

-- --------------------------------------------------------

--
-- Table structure for table `problemstate`
--

DROP TABLE IF EXISTS `problemstate`;
CREATE TABLE IF NOT EXISTS `problemstate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectID` int(11) DEFAULT NULL,
  `SectionID` int(11) DEFAULT NULL,
  `ProblemID` int(11) DEFAULT NULL,
  `Description` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `problemstate`
--

INSERT INTO `problemstate` (`ID`, `SubjectID`, `SectionID`, `ProblemID`, `Description`) VALUES
(1, 1, 1, 1, 'عدد 2 محطة تعمل بنسبة 100% (طوسون - الشلوفة)'),
(2, 1, 1, 2, 'عدد 5 محطات تعمل بنسبة 50% (بورفؤاد - الكاب - البلاح - الارسال - جنيفة )'),
(3, 1, 1, 3, 'عدد 6 محطات رادار متوقفة لأسباب فنية (القبة - رأس العش - القنطرة - شرق الفردان - فنارة -بورتوفيق)'),
(4, 2, 1, 1, 'عدم وجود دراسة رسمية للتغطية الردارية بالقناة الجدية'),
(5, 3, 1, 1, 'تكون تلال ناتج الردم على ضفتى القناة الناتجة عن الحفر والتوسعة بالقطاع الجنوبى مما ينتج عنه مناطق عمياء راداريا مثلما حدث من حفر قناة السويس الجديدة واضطر الاحتياج الى تركيب محطات ردارية جديدة'),
(6, 4, 1, 1, 'كثرة حركة السفن من المناطق المذكورة عاليه'),
(7, 4, 1, 2, 'الرادارات الحديثة تتميز بتمييز الأهداف القريبة من بعضها ولكن يعيب عليها أن التغطية الرادارية لها قصيرة'),
(8, 4, 1, 3, 'لا يوجد محطة احتياطية أو تعمل تغطية راداربة متكاملة مع محطة رادار الترسانة وبالتالي عند توقف الرادار لظروف طارئة يتوقف بالكامل تتبع السفن الكثيرة في هذه المنطقة'),
(9, 5, 1, 1, 'برج محطة القبة - الكاب - القنطرة - الارسال - جنيفة أبراج متهالكة وعند صيانتها دوريا باستخدام الرمالة والمرشمة تشكل خطورة علىوصلات ال WAVE GUIDE  وكابلات المعلومات بين الهوائى أعلى البرج  وشلتر الأجهزة أسفل البرج'),
(10, 5, 1, 2, 'برج الترسانة - بورفؤاد - شرق البحيرات بورتوفيق أبراج غير متهالكة نظرا لأنها مصنعة من الحديد المجلفن الغير قابل للصدأ لا تشكل خطورة على وصلات وكابلات الرادار'),
(11, 6, 1, 1, 'عدم تحديد إجراءات إعادة طرح مناقصة لتوريد وتركيب المصاعد للحصول على اقل الأسعار'),
(12, 7, 1, 1, 'يوجد بقطاع الرادار عدد/2 مهندس مكلفين بأعمال الصيانة والإصلاح والإجراءات الإدارية وذلك للحفاظ على الكفاءة التشغيلية لعدد/13 محطة رادار بطول القناة بالإضافة الى زيادة عدد مجطات الرادار مستقبلا في القطاع الجنوبى والقناة الجديدة وشرق التفريعة شمالا ، مما يبي');

-- --------------------------------------------------------

--
-- Table structure for table `radars`
--

DROP TABLE IF EXISTS `radars`;
CREATE TABLE IF NOT EXISTS `radars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(200) DEFAULT NULL,
  `location` varchar(6) DEFAULT NULL,
  `photo` varchar(100) NOT NULL,
  `supply_date` varchar(120) DEFAULT NULL,
  `installation` varchar(100) DEFAULT NULL,
  `operation_date` varchar(100) DEFAULT NULL,
  `delivery` varchar(100) DEFAULT NULL,
  `status_of_tower` varchar(255) DEFAULT NULL,
  `LetterDate` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `radars`
--

INSERT INTO `radars` (`id`, `station_name`, `location`, `photo`, `supply_date`, `installation`, `operation_date`, `delivery`, `status_of_tower`, `LetterDate`, `Remarks`, `created_at`, `updated_at`) VALUES
(1, 'بورفؤاد', '0.5', '', '2011', '(ابريل - مايو - يونيو )2015', '(ابريل - مايو - يونيو )2015', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(2, 'القبة', '1.1', '', '2011', '(ابريل - مايو - يونيو )2015', '(ابريل - مايو - يونيو )2015', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(3, 'رأس العش', '14.3', '', '2017', 'فبراير 2020', NULL, 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(4, 'الكاب', '35.4', '', '2011', NULL, '(ابريل - مايو - يونيو )2015', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(5, 'القنطرة', '45.1', '', '2011', '(ابريل - مايو - يونيو )2015', '(ابريل - مايو - يونيو )2015', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(6, 'البلاح', '54.8', '', '2017', 'يوليو - أغسطس (2017)', 'يوليو - أغسطس (2017)', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(7, 'شرق الفردان', '62.9', '', '2017', 'فبراير 2020', NULL, 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(8, 'الارسال', '76.1', '', '2011', '(ابريل - مايو - يونيو )2015', '(ابريل - مايو - يونيو )2015', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(9, 'طوسون', '54', '', '2017', 'يوليو - أغسطس (2017)', 'يوليو - أغسطس (2017)', 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', NULL, NULL, NULL, NULL, NULL),
(10, 'فنارة', '111.3', '', '2011', 'فبراير 2020', NULL, 'لم يتم عمل الإستلام  الإبتدائي حتي الأن', 'إنشاء 2019 من الحديد المجلفن غير قابل للصدأ', 'أخر مخاطبة صادرة إلي الهيئة الإقتصادية و المشروعات بالمخابرات العامة \r\nبرقم 651/ ج بتاريخ 5/9/2021', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sectionsubjects`
--

DROP TABLE IF EXISTS `sectionsubjects`;
CREATE TABLE IF NOT EXISTS `sectionsubjects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SectionID` int(11) DEFAULT NULL,
  `Subjects` char(255) DEFAULT NULL,
  `summary` char(255) DEFAULT NULL,
  `Objectives` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sectionsubjects`
--

INSERT INTO `sectionsubjects` (`ID`, `SectionID`, `Subjects`, `summary`, `Objectives`) VALUES
(1, 1, 'الشبكة الردارية لمشروع ال VTMS (عدد /13 محطة رادار)', 'إصلاح الأعطال واستبدال بعض الوحدات طبقا لإجراءات جدول الصيانة الدورية والوقائية لمحطات الرادار من قبل الهيئة الاقتصادية للمشروعات بالمخابرات العامة', 'الاستلام (الابتدائى / النهائي ) للمشروع (في أقرب وقت)'),
(2, 1, 'التغطية الردارية لقناة السوي للجديدة (من ترقيم 60 كم إلى 95 كم)', 'الشبكة الردارية الحالية عدم إمكانية التغطية لقناة السويس الجديدة بسبب ارتفاعات تلال الردم على ضفتى القناة التي تصل الى منسوب 40  متر', 'استكمال التغطية وتتبع السفن لمشوع ال VTMS'),
(3, 1, 'التغطية الردارية للتفريعة الجديدة والتوسعة من الترقيم 122 كم ل 162 كم', 'عمل تغطية ردارية للتفريعة الجديدة بطول 10 كم', 'استكمال التغطية وتتبع السفن لمشوع ال VTMS'),
(4, 1, 'التغطية الردارية لمنطقة ميناء شرق التفريعة', 'وجود محطة رادار وحيدة (محطة رادار الترسانة) لتغطية منطقة شمال القناة و منطقة االانتظار ببورسعيد و شمال التفريعة ومنطقة الانتظار الخاص بها', 'زيادة كفاءة التغطية الرادارية للمنطقة الشمالية للقناة'),
(5, 1, 'صيانة عدد 9 أبراج رادار', 'تهالك أبراج الرادار', 'زيادة الكفاءة الفنية  للأبراج المعدنية');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `mobile`) VALUES
(10, 'Elshaymaa Nassar', 'elshaymaa_nassar@yahoo.com', NULL, 'hassnaa86', NULL, '2022-03-22 07:06:40', '2022-03-22 07:06:40', NULL),
(11, 'Elshaymaa Nassar mohamed', 'nassarelshaymaa@gmail.com', NULL, 'hassnaa86', NULL, '2022-03-22 07:06:40', '2022-03-22 07:06:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vtms_sections`
--

DROP TABLE IF EXISTS `vtms_sections`;
CREATE TABLE IF NOT EXISTS `vtms_sections` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SectionName` char(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SectionManagerName` char(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `RepresentativePerson` char(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CountOfProjects` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=cp1257;

--
-- Dumping data for table `vtms_sections`
--

INSERT INTO `vtms_sections` (`ID`, `SectionName`, `SectionManagerName`, `RepresentativePerson`, `CountOfProjects`) VALUES
(1, 'قطاع الرادارات', 'دكتور مهندس أيمن موسى', 'مهندس أحمد عمر', 13);
--
-- Database: `monitor1`
--
CREATE DATABASE IF NOT EXISTS `monitor1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `monitor1`;

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
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

DROP TABLE IF EXISTS `pma__bookmark`;
CREATE TABLE IF NOT EXISTS `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

DROP TABLE IF EXISTS `pma__central_columns`;
CREATE TABLE IF NOT EXISTS `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`db_name`,`col_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

DROP TABLE IF EXISTS `pma__column_info`;
CREATE TABLE IF NOT EXISTS `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

DROP TABLE IF EXISTS `pma__designer_settings`;
CREATE TABLE IF NOT EXISTS `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

DROP TABLE IF EXISTS `pma__export_templates`;
CREATE TABLE IF NOT EXISTS `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'monitor', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"bussinessaffairs\",\"departments\",\"documents\",\"failed_jobs\",\"migrations\",\"offers\",\"password_resets\",\"problemstate\",\"radars\",\"sectionsubjects\",\"users\",\"vtms_sections\"],\"table_structure[]\":[\"bussinessaffairs\",\"departments\",\"documents\",\"failed_jobs\",\"migrations\",\"offers\",\"password_resets\",\"problemstate\",\"radars\",\"sectionsubjects\",\"users\",\"vtms_sections\"],\"table_data[]\":[\"bussinessaffairs\",\"departments\",\"documents\",\"failed_jobs\",\"migrations\",\"offers\",\"password_resets\",\"problemstate\",\"radars\",\"sectionsubjects\",\"users\",\"vtms_sections\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_drop_table\":\"something\",\"sql_create_table\":\"something\",\"sql_if_not_exists\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

DROP TABLE IF EXISTS `pma__favorite`;
CREATE TABLE IF NOT EXISTS `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

DROP TABLE IF EXISTS `pma__history`;
CREATE TABLE IF NOT EXISTS `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

DROP TABLE IF EXISTS `pma__navigationhiding`;
CREATE TABLE IF NOT EXISTS `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

DROP TABLE IF EXISTS `pma__pdf_pages`;
CREATE TABLE IF NOT EXISTS `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

DROP TABLE IF EXISTS `pma__recent`;
CREATE TABLE IF NOT EXISTS `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('', '[{\"db\":\"monitor\",\"table\":\"power_station\"},{\"db\":\"monitor\",\"table\":\"offers\"},{\"db\":\"monitor\",\"table\":\"users\"},{\"db\":\"laravel\",\"table\":\"offers\"},{\"db\":\"monitor\",\"table\":\"documents\"},{\"db\":\"dms\",\"table\":\"documents\"},{\"db\":\"dms\",\"table\":\"equipment\"},{\"db\":\"dms\",\"table\":\"departments\"},{\"db\":\"monitor\",\"table\":\"departments\"},{\"db\":\"laravel\",\"table\":\"users\"}]'),
('root', '[{\"db\":\"monitor\",\"table\":\"offers\"},{\"db\":\"monitor\",\"table\":\"documents\"},{\"db\":\"monitor\",\"table\":\"departments\"},{\"db\":\"monitor\",\"table\":\"users\"},{\"db\":\"monitor\",\"table\":\"power_stations\"},{\"db\":\"monitor\",\"table\":\"power_station\"},{\"db\":\"monitor\",\"table\":\"radars\"},{\"db\":\"laravel\",\"table\":\"offers\"},{\"db\":\"dms\",\"table\":\"documents\"},{\"db\":\"dms\",\"table\":\"equipment\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

DROP TABLE IF EXISTS `pma__relation`;
CREATE TABLE IF NOT EXISTS `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

DROP TABLE IF EXISTS `pma__savedsearches`;
CREATE TABLE IF NOT EXISTS `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

DROP TABLE IF EXISTS `pma__table_coords`;
CREATE TABLE IF NOT EXISTS `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

DROP TABLE IF EXISTS `pma__table_info`;
CREATE TABLE IF NOT EXISTS `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

DROP TABLE IF EXISTS `pma__table_uiprefs`;
CREATE TABLE IF NOT EXISTS `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`username`,`db_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'monitor', 'offers', '{\"sorted_col\":\"`offers`.`directory`  DESC\"}', '2022-04-05 11:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

DROP TABLE IF EXISTS `pma__tracking`;
CREATE TABLE IF NOT EXISTS `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`db_name`,`table_name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

DROP TABLE IF EXISTS `pma__userconfig`;
CREATE TABLE IF NOT EXISTS `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-04-07 07:19:17', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

DROP TABLE IF EXISTS `pma__usergroups`;
CREATE TABLE IF NOT EXISTS `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (`usergroup`,`tab`,`allowed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

DROP TABLE IF EXISTS `pma__users`;
CREATE TABLE IF NOT EXISTS `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`usergroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';
--
-- Database: `suezapp`
--
CREATE DATABASE IF NOT EXISTS `suezapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `suezapp`;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `link`) VALUES
(1, 'https://www.eng-elshaymaa.com/');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages_info`
--

DROP TABLE IF EXISTS `pages_info`;
CREATE TABLE IF NOT EXISTS `pages_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `my_key` varchar(191) NOT NULL,
  `my_value` text NOT NULL,
  `value_ar` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `my_key` (`my_key`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages_info`
--

INSERT INTO `pages_info` (`id`, `my_key`, `my_value`, `value_ar`) VALUES
(1, 'ho_title', 'Hello', 'مرحبا بكم'),
(2, 'ho_are', 'We Are', 'نحن'),
(3, 'ho_choose', 'Why Choose Us', 'لماذا اخترت سوليد؟'),
(4, 'company', 'Solid Solutions Software Company is a top provider of expert software products , We will\r\n        be glade to provide additional references upon request.', 'شركه سوليد للحلول البرمجيه اولى الشركات فى مجال برمجه تطبيقات الويب وهاتف المحمول والانظمه المدمجه '),
(5, 'ho_web', 'Web Design', 'تصميم صفحات الويب'),
(6, 'ho_mob', 'Mobile APPS', 'تطبيقات المحمول'),
(7, 'ho_embedded', 'Embedded system', 'الانظمه المضمنه'),
(8, 'ho_erp', 'Erp system', 'تخطيط موارد المؤسسه'),
(9, 'ho_design', 'Graphic design', 'تصميم الجرافيك'),
(10, 'ho_iot', 'IOT system', 'نظام انترنت الاشياء'),
(11, 'ho_sta', 'strategy', 'استراتيجيه شركه سوليد'),
(12, 'ho_tog', 'we get you , lets get together', 'نحن نبدء  من خلالك'),
(13, 'ho_title1', 'We keep a pulse on the market so you don’t have to. We study markets, aggregate data, and synthesize\r\n            information to connect your brand to your users. By analyzing market behavior, we craft a presence for you\r\n            that wins customers and creates loyalty to keep you on top.', 'نحن نقوم فى البدايه بدراسه بيئه العمل أولا وتحديد سلوكه ومن خلال ذلك يبقى بالنسبه لنا العميل رقم واحد وذلك بالتعاون مع شركتنا تكون على القمه'),
(14, 'ho_title2', 'Better online experience , happier customers', 'الخبره هى ما تميزنا'),
(15, 'number1', '90%', '90%'),
(16, 'ho_first2', 'Web Design', 'تصميم صفحات الويب'),
(17, 'ho_content', 'Great design can change the way users interact. Let’s start with your web design. Our web design\r\n                            team focuses on user experience.', 'اتصميم هو اول من يجذب لك العميل ولذلك نحن نهتم باتصميم لذلك لنبدء بتصميم موقعك في البدايه '),
(18, 'ho_number2', '95%', '95%'),
(19, 'ho_app', 'Mobile Apps', 'تطبيقات المحمول'),
(20, 'ho_title3', 'A complete integration between mobile app and online website can give your business the boost\r\n                            needed to go beyond reaching clients barriers.', 'عمل تطبيق المحمول له نفس الشكل العام للموقع الالكترونى ذلك يمنح لعميلك التعرف عليك بسهوله'),
(23, 'ho_services', 'Our marketing services help you design, develop, and implement the right content on the best\r\n                            channels for your brand.', 'خطه التسويق الخاصه بنا تبدء من التصميم واتطوير ودراسه بيئه العمل ثم بعد ذلك كتابه المحتوى الخاص بك ونشره على وسائل التواصل المختلفه'),
(24, 'ho_connect', 'Connect With Us', 'تواصل معنا'),
(25, 'ho_content3', 'We are here for you , feel free to contact us', 'نحن هنا من اجلك , فى انتظار مكالمتك'),
(26, 'ho_message', 'Send Message', 'ارسل رسالتك'),
(27, 'f_contetnt', 'Solid Solutions Software Company is pleased to submit a proposal company regarding to your system.', 'شركه سوليد متخصصه لوضع الحلول المختلفه لنظامك وذلك من خلال وضع الخطه المناسبه والجدول الزمنى لتنفيذها '),
(28, 'f_second_title', 'This proposal describes the program elements, services, terms, and schedule for it.', 'شركه سوليد هى شركه متخصصه فى مجال تطبيقات الويب والهاتف المحمول ولوجود حلول للانظمه المختلفه'),
(29, 'f_post', 'latest posts', 'اخر الاخبار'),
(30, 'ab_more', 'Know More', 'لمعرفه المزيد'),
(31, 'ab_view', 'Overview', 'نظره عامه'),
(32, 'ab_content_site', 'Solid Solutions Software Company is pleased to submit a proposal\r\n						for your company regarding to your system.\r\n						This proposal describes the program elements, services, terms, and schedule for it.', 'شركه سوليد متخصصه لوضع الحلول المختلفه لنظامك وذلك من خلال وضع الخطه المناسبه والجدول الزمنى لتنفيذها '),
(33, 'ab_about_solid', 'Why Solid?', 'لماذا نحن؟'),
(34, 'ab_content_page', 'Solid Solutions Software Company is a top provider of expert software products.\r\n						We will be glade to provide additional references upon request.', 'شركه سوليد للحلول البرمجيه اولى الشركات فى مجال برمجه تطبيقات الويب وهاتف المحمول والانظمه المدمجه '),
(35, 'ab_solid', 'Who we are?', 'من نحن؟'),
(36, 'ab_content_section', 'We understand that business is all about change and that the\r\n						competitive environment is always intense, so we work with you in a practical and flexible way to set the\r\n						right software systems, digital and branding strategies & software solutions that would provide the right\r\n						keys to your success, your glory is our glory.', 'نحن نتفهم أن العمل يدور حول التغيير وأن البيئة التنافسية مكثفة دائمًا ، لذلك نحن نعمل معك بطريقة عملية ومرنة لتعيين أنظمة البرمجيات المناسبة والاستراتيجيات الرقمية والعلامات التجارية وحلول البرمجيات التي من شأنها توفير المفاتيح المناسبة النجاح ، مجدك هو مجدنا.'),
(39, 'ab_software_house', 'As a software house, Solid was established in 2017 and supported\r\n					by a wealth of knowledge and experience brought together by its team and founders making Solid the local\r\n					creative software house that speaks the language and understands the software market and its uniqueness.', 'تم تأسيس شركة Solid في عام 2017 كدعم برمجيات ودعمتها ثروة من المعرفة والخبرة التي جمعها فريقها ومؤسساها ، مما يجعل Solid من دار البرمجيات الإبداعية المحلية التي تتحدث اللغة وتفهم سوق البرمجيات وتفرده.\r\n'),
(40, 'ab_experience', 'Since 2017, Solid has been growing and expanding to provide its multiple Software Products\r\n					in Whole Middle East & Indonesia & Turkey.', 'منذ عام 2017 ، بدأت Solid في النمو والتوسع لتوفير منتجات برامجها المتعددة في كل الشرق الأوسط وإندونيسيا وتركيا.\r\n'),
(41, 'ab_design', 'Our skills coupled with expertise span the advertising space from UI/UX design & Graphic design through\r\n					branding and software solutions And business development & social media marketing. Our strategies combine\r\n					creative concepts,\r\n					media- knowledge along with in- depth industry understanding in order to achieve qualitative and quantitative\r\n					results.', 'تمتد مهاراتنا إلى جانب الخبرة المكتسبة في مساحة الإعلان من تصميم UI / UX وتصميم الجرافيك من خلال حلول العلامات التجارية والبرامج وتطوير الأعمال والتسويق عبر وسائل التواصل الاجتماعي. تجمع استراتيجياتنا بين المفاهيم الإبداعية والمعرفة الإعلامية إلى جانب فهم الصناعة المتعمق من أجل تحقيق النتائج النوعية والكمية.\r\n'),
(42, 'ho_title4', 'DEGITAL MARKETING\r\n', 'التسويق الالكترونى'),
(44, 'ab_history', 'Our History', 'تاريخنا'),
(45, 'co_solid', 'About Us', 'عن الشركه'),
(46, 'co_connect', 'Connect with us', 'تواص معنا'),
(47, 'co_free', 'We are here for you , feel free to contact us', 'نحن هنا لخدمتك , لا تتردد فى التواصل معنا'),
(48, 'co_message', 'Send Message', 'ارسل رسالتك'),
(49, 'co_contact', 'contact us ', 'تواصل معنا'),
(50, 'p_title', 'Our Work', 'سابقه الأعمال'),
(51, 'p_content', 'We take user experience seriously, and our portfolio of work proves that it takes a lot of time, effort and creativity to create apps we are proud of.', 'نحن نتعامل عى الخبره السابقه لدى العميل وعلى ذلك تم بناء أعمالنا السابقه , ونحن فخورين بذلك'),
(52, 'p_all', 'All', 'كل الأعمال'),
(53, 'p_web', 'WEB Development', 'تطبيقات الويب'),
(54, 'p_phone', 'Mobile APPS', 'تطبيقات الهاتف');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL,
  `perm_key` varchar(30) NOT NULL,
  `perm_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permKey` (`perm_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `username` varchar(100) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=976 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `mac`, `role`, `username`, `token`, `link`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', NULL, 'admin', 'adminsuez', NULL, 'https://www.eng-elshaymaa.com/', '$2y$10$ZOSU9l4JuSAf8VN4bLANQO0WxeDtWSnvcYsmvyDPHDOQoodIvN/mW', '', 'adminsuez', '', NULL, NULL, 'IXeSIA1RDGllz.1F9PJNr.', 1268889823, 1633950916, 1, 'Admin', 'istrator', '1', '0'),
(4, '127.1.1', '02:15:B2:00:00:00', 'user', 'Gamal', 'eZo18-64S3ykLHCxAeSS8l:APA91bFaCHooJT8YGkYu8SKqjZvVEwTXf-3ZMR8wa0Ru9tEQ99a8KqPdYnttM2a0ZKz0lJw6XfpCqn0buq8ii3y4NcThFHdU_mm2rK6ocUK457jf7dXcETtRlnBRoWpPlE0l3Yeb3Lu7', 'https://www.eng-elshaymaa.com/', '$2y$10$I71ax7z7X6mn/xiLLJz1JuXXriiFacw3R.pQMlrMw9Y.a1gos2.56', NULL, 'Gamal', NULL, NULL, NULL, NULL, 1607584718, 1608119964, 1, NULL, NULL, NULL, NULL),
(6, '127.1.1', '02:15:B2:00:00:00', 'user', 'ahmed', NULL, 'https://www.eng-elshaymaa.com/uploads/6', '$2y$08$8naQUaTlPnXTrVMyA3.Jse6dv6M5gK7QNl/YNeIic8vkNrKnG8TO2', NULL, 'ahmed', NULL, NULL, NULL, NULL, 1608641189, NULL, 1, NULL, NULL, NULL, NULL),
(8, '127.1.1', '02:15:B2:00:00:00', 'user', 'anas', 'eK_jb40mQci-Jdp5T28X37:APA91bGYSaodFzwT38eRVcYZSzkiRuue2kXgg9aii6nwNsLh-VxSoOwdCtQD313J0siJJbjS2Uu7_aql8xbHoMWf3JtyBFJAWOIbALhwtdfBVsiV6Mjlpu0rGuvN2Wm7x3b6Zjr2lKeg', 'https://www.engelshaymaa.com/8', '$2y$10$0EtBBwCMIB9eqUyKMQFfv.c2KfcmfEFw1gWJUxTIm9K.Ss9GDSHi2', NULL, 'anas', NULL, NULL, NULL, NULL, 1608635638, 1615361540, 1, NULL, NULL, NULL, NULL),
(9, '127.1.1', '02:15:B2:00:00:00', 'user', 'test', 'eykRzesuSOy3Lad3acxY45:APA91bGJmGXDolBZpNgJADGS-QtLMFQehg45VRdNRKTm0_s2j4xcrxs75wTSDbHxVik_nGgQRDplKqxVhcz9-LCiAJtdV1GcSfb99eznqzcZkn8T305XJi8O1pw1atm6_h9UCyYh3dQn', 'https://www.engelshaymaa.com/9', '$2y$10$zQFnNTkO3.wWRXqyVa9BmepePd.DHo773GSRzpK2THTmfGjAgEkLK', NULL, 'test', NULL, NULL, NULL, NULL, 1608803951, 1613899801, 1, NULL, NULL, NULL, NULL),
(141, '127.1.1', '04:D6:AA:1C:77:B8', 'user', 'EL RAFEI', NULL, 'https://www.engelshaymaa.com/141', '$2y$08$Akudy.4QVBXK2T.GnymDG.v3kWKJ8cwkEr8KjCOxrHdDOxigtq6sa', NULL, 'EL RAFEI', NULL, NULL, NULL, NULL, 1614772495, NULL, 1, NULL, NULL, NULL, NULL),
(142, '127.1.1', '04:D6:AA:1C:77:B9', 'user', 'EL RASHIDY', NULL, 'https://www.engelshaymaa.com/142', '$2y$08$ZTZFe/XBJqfduzBMeHMzFO3XTO4jGAGutWBhRn6mUlDayu986XOW2', NULL, 'EL RASHIDY', NULL, NULL, NULL, NULL, 1614772568, NULL, 1, NULL, NULL, NULL, NULL),
(201, '127.1.1', '04:D6:AA:1C:77:B9', 'user', 'WAHID', 'fRPNBz_eQCKUOVp9iaQGzA:APA91bHOlha4BMhgp8xUH9hfdasCU2prloXttj1nFtz91CWG1igls4MBbyj07mWV9jQbOEDbI3GxhYDZzL3putc5dLmaNuLjBlXPhbsQIm79Tr1XR64kvkzGYQk0Sm1yUi4u4AwZajXU', 'https://www.cmms-site.com.com/201/order_safer.html', '$2y$10$9blfCLQpu9NMR2jYSQH3ledTuYFC61bQTr76PwSXpI8Bzn.YOtDeq', NULL, 'WAHID', NULL, NULL, NULL, NULL, 1614852139, 1614857157, 1, NULL, NULL, NULL, NULL),
(215, '127.1.1', '04:D6:AA:1C:77:B9', 'user', 'RAOF M', 'cHOgqtThT4ifN-bwM1ixPA:APA91bH5n36ecSLRYrrbG2TIXd_n61JKtPWUQ2GPrh4Ghbdbb1LLVLjfJtBQDHrWc_JuL-VTsGiU73SmHjxR_yl5XFjS8c7Ni7qqGWcKtTwNJiUMtPlUFJqx2sdIcRIBHhAd37drY1OX', 'https://www.cmms-site.com/215/order_safer.html', '$2y$10$fOqxq4AD4eGLmSHOsQMEm.80OsOIr4noArPvbuyfG2nOiL5RBWDdy', NULL, 'RAOF M', NULL, NULL, NULL, NULL, 1616312905, 1616418687, 1, NULL, NULL, NULL, NULL),
(271, '127.1.1', '04:D6:AA:1C:77:B9', 'user', 'EL SAWAF', 'fRPNBz_eQCKUOVp9iaQGzA:APA91bHOlha4BMhgp8xUH9hfdasCU2prloXttj1nFtz91CWG1igls4MBbyj07mWV9jQbOEDbI3GxhYDZzL3putc5dLmaNuLjBlXPhbsQIm79Tr1XR64kvkzGYQk0Sm1yUi4u4AwZajXU', 'https://www.engelshaymaa.com/271/order_safer.html', '$2y$10$8Et3I4KwS5gcipvqbePCw.p0iib1WUsf1MxIq84xxzK9lx2RWKjg2', NULL, 'EL SAWAF', NULL, NULL, NULL, NULL, 1614852039, 1614857129, 1, NULL, NULL, NULL, NULL),
(753, '127.1.1', '04:D6:AA:1C:77:B9', 'user', 'AHMED REDA', NULL, 'https://www.engelshaymaa.com/753', '$2y$08$vIc7XaMN09kPSIieniYXFuvXW0218b699p.fQONPd/L5hFHp7LWTO', NULL, 'AHMED REDA', NULL, NULL, NULL, NULL, 1615284033, NULL, 1, NULL, NULL, NULL, NULL),
(832, '127.1.1', '04:D6:AA:1C:77:B9', 'user', 'EL GHANNAM', 'fRPNBz_eQCKUOVp9iaQGzA:APA91bHOlha4BMhgp8xUH9hfdasCU2prloXttj1nFtz91CWG1igls4MBbyj07mWV9jQbOEDbI3GxhYDZzL3putc5dLmaNuLjBlXPhbsQIm79Tr1XR64kvkzGYQk0Sm1yUi4u4AwZajXU', 'https://www.engelshaymaa.com/832/order_safer.html', '$2y$10$Yakrk6N0mne5oePbw56dRuU7.AY/GGxO5NmB5xZi4ZMxlRktjuUvC', NULL, 'EL GHANNAM', NULL, NULL, NULL, NULL, 1614838325, 1614851997, 1, NULL, NULL, NULL, NULL),
(975, '127.1.1', '02:15:B2:00:00:00', 'user', 'AMR FAYEZ', 'eK_jb40mQci-Jdp5T28X37:APA91bGYSaodFzwT38eRVcYZSzkiRuue2kXgg9aii6nwNsLh-VxSoOwdCtQD313J0siJJbjS2Uu7_aql8xbHoMWf3JtyBFJAWOIbALhwtdfBVsiV6Mjlpu0rGuvN2Wm7x3b6Zjr2lKeg', 'https://www.engelshaymaa.com/975/order_safer.html', '$2y$10$qyQRnEUUM6uP7BN7Bztw5eDeyJyP7RKOYKr.lCAosTV.uG.1iB4uG', NULL, 'AMR FAYEZ', NULL, NULL, NULL, NULL, 1615207253, 1615365305, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(0, 3, 2),
(0, 4, 2),
(0, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_permissions`
--

DROP TABLE IF EXISTS `users_permissions`;
CREATE TABLE IF NOT EXISTS `users_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
