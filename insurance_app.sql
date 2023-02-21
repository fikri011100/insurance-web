-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2023 at 04:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_bill` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor` tinyint(1) NOT NULL,
  `medicine` tinyint(1) NOT NULL,
  `implant` tinyint(1) NOT NULL,
  `base_discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `insurance`, `episode`, `total_bill`, `doctor`, `medicine`, `implant`, `base_discount`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'ABDA Insurance', '', NULL, 1, 1, 0, '4', '', '2022-11-22 20:12:02', '2022-11-22 20:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_va` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insurances`
--

INSERT INTO `insurances` (`id`, `no_va`, `name`, `status`, `alamat`, `description`, `created_at`, `updated_at`) VALUES
(1, '8210-02-0001', 'Mondial Assistance (S\'pore)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(2, '8210-02-0002', 'Vanbreda', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(3, '8210-01-0001', 'ABDA Insurance', '0', 'JL JENDRAL SUDIRMAN KAV 59 JAKARTA SELATAN, PLAZA ABDA LT 27', NULL, '2022-08-22 00:08:20', '2022-08-22 00:10:23'),
(4, '8210-01-0002', 'ACE Life Assurance, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(5, '8210-01-0003', 'AIA Financial', '0', 'AIA CENTRAL (GCS-CLAIM), JL.JEND SUDIRMAN KAV 48A JAKARTA SELATAN', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(6, '8210-01-0004', 'AIA Insurance', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(7, '8210-01-0005', 'AIG Lippo', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(8, '8210-01-0006', 'Allianz Insurance', '0', 'JL HR RASUNA SAID KAWASAN KUNINGAN, ALLIANZ TOWER', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(9, '8210-01-0007', 'Alstom Power Energy System Ind', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(10, '8210-01-0008', 'Angkasa Pura I, PT(Persero)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(11, '8210-01-0009', 'Arta Boga', '0', 'JL PANJANG JIWO NO 48-50 SURABAYA 60292', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(12, '8210-01-0010', 'Assistance Alliance International', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(13, '8210-01-0011', 'Astra Buana Asuransi', '0', 'JL TB SIMATUPANG KAV 15 CILANDAK BARAT - JKT SELATAN, GRAHA ASURANSI ASTRA 3 TH FLOOR', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(14, '8210-01-0012', 'Astra Credit Companies, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(15, '8210-01-0013', 'Astra Graphia Tbk.PT.Documen', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(16, '8210-01-0014', 'Asuransi Central Asia, PT (ACA)', '0', 'JL PROF DR SATRIO JKT 12940, MAL AMBASADOR RUKO 2 DAN 3, BUSINESS DEVELOPMENT DEVISION I', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(17, '8210-01-0015', 'P.T Chubb General Insurance Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(18, '8210-01-0016', 'Asuransi Jiwa Mayapada Life, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(19, '8210-01-0017', 'Asuransi Jiwa Sinarmas', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(20, '8210-01-0018', 'Asuransi Jiwa Tugu Mandiri, PT', '0', 'JL RADEN SALEH NO 44 , WISMA TUGU RADEN SALEH LT 1-2', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(21, '8210-01-0019', 'Avrist Insurance, PT', '0', 'JL JENDRAL SUDIRMAN KAV 29-31 JAKARTA 102920, GEDUNG WTC 2 LT 8', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(22, '8210-01-0020', 'AXA Assistance', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(23, '8210-01-0021', 'Astra International,Tbk - Kertajaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(24, '8210-01-0022', 'Astra International,Tbk - HR. Muhammad', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(25, '8210-01-0023', 'Astra International,Tbk - Waru SSC', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(26, '8210-01-0024', 'Astra International,Tbk - Waru ', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(27, '8210-01-0025', 'Astra International,Tbk - Hasanudin Kediri', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(28, '8210-01-0026', 'Astra International,Tbk - Sunter Jakarta', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(29, '8210-01-0027', 'Astra International,Tbk - Diponegoro', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(30, '8210-01-0028', 'Astra International,Tbk - Jemursari', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(31, '8210-01-0029', 'Astra International,Tbk - Pecindilan', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(32, '8210-01-0030', 'Astra International,Tbk - Kenjeran', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(33, '8210-01-0031', 'P.T Astra International , Tbk. - IZUSU', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(34, '8210-01-0032', 'ASSA RENT CAR', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(35, '8210-01-0033', 'ASKES', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(36, '8210-01-0034', 'Astra International , Tbk , P.T - Peugeot', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(37, '8210-01-0035', 'MEDICILLIN', '0', 'JL.PROF. SOEPOMO NO.78 A-B, KELURAHAN METENG DALAM, KECAMATAN TEBET , JAKARTA SELATAN 12870', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(38, '8210-01-0036', 'Astra International , Tbk , P.T - Toyota - Basuki Rachmad Branch', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(39, '8210-01-0037', 'Astra International , Tbk , P.T - Toyota - A.Yani Branch', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(40, '8210-01-0038', 'Ajinomoto Indonesia , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(41, '8210-01-0039', 'Astra International , Tbk , P.T - Toyota - Madiun Branch', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(42, '8210-01-0040', 'Chubb Life', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(43, '8210-01-0041', 'BNI Syariah', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(44, '8210-01-0042', 'RS.Mitra Keluarga Kenjeran', '0', 'JL. KENJERAN NO, 506  SURABAYA ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(45, '8210-01-0043', 'RS.Mitra Keluarga Waru', '0', 'JL.JEND.S.PARMAN NO 8 WARU', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(46, '8210-01-0044', 'P.T PLN (Persero) Kaltim & Utara', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(47, '8210-01-0045', 'P.T MEINDO ELANG INDAH', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(48, '8210-01-0046', 'Badak NGL', '0', 'BONTANG  75324 , KALIMANTAN TIMUR', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(49, '8210-01-0047', 'Bakrie Jiwa ', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(50, '8210-01-0048', 'Bakrie Telecom', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(51, '8210-01-0049', 'Bali International Air Service, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(52, '8210-01-0050', 'Bank Indonesia', '0', 'JL PAHLAWAN NO 105 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(53, '8210-01-0051', 'Bank Niaga Group / Bank CIMB Niaga', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(54, '8210-01-0052', 'Blue Dot / P.T Intensive Medicare', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(55, '8210-01-0053', 'BNI Life', '0', 'JL. GATOT SUBROTO KAV 24-25 , JAKARTA, 12930, CENTENNIAL TOWER LANTAI 9 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(56, '8210-01-0054', 'BP Indonesia (ARCO)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(57, '8210-01-0055', 'BRIngin Life', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(58, '8210-01-0056', 'Bumida - AKDHK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(59, '8210-01-0057', 'Bank Rakyat Indonesia - kaliasin', '0', 'JL BASUKI RACHMAT NO 122-138 , PLAZA BRI LANTAI 20-21-22-23', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(60, '8210-01-0058', 'BRI - A.Yani Waru', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(61, '8210-01-0059', 'BRI - Kanwil Surabaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(62, '8210-01-0060', 'Bank Tabungan Neg.-Cab.Sby.', '0', 'JL.PEMUDA NO 50 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(63, '8210-01-0061', 'BCA - Veteran', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(64, '8210-01-0062', 'Bank Mandiri - Pemuda', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(65, '8210-01-0063', 'Bank Mandiri - Sidoarjo A.Yani', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(66, '8210-01-0064', 'Bank Mandiri Cab Rungkut Megah Raya/RMR', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(67, '8210-01-0065', 'Bank Mandiri Cab Surabaya Basuki Rachmat ', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(68, '8210-01-0066', 'Bank Mandiri Cab Surabaya Gentengkali', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(69, '8210-01-0067', 'Bank Mandiri Cab Surabaya Rungkut SIER ', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(70, '8210-01-0068', 'Bank Mandiri Cab Surabaya Sungkono', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(71, '8210-01-0069', 'Bank Mandiri Co Darmo Permai', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(72, '8210-01-0070', 'Bank Mandiri RCO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(73, '8210-01-0071', 'Bank Mandiri SBDC', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(74, '8210-01-0072', 'Bank Mandiri Sby Kertajaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(75, '8210-01-0073', 'Bank Mandiri - Mulyosari', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(76, '8210-01-0074', 'Bank Mandiri - Kusuma Bangsa', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(77, '8210-01-0075', 'Bank Mandiri - Jembatan Merah', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(78, '8210-01-0076', 'Bank Mandiri -  HR. Muhammad', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(79, '8210-01-0077', 'Bank Mandiri - Bandara Juanda', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(80, '8210-01-0078', 'Bank Mandiri - Micro Business Cluster Surabaya Niaga', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(81, '8210-01-0079', 'Bank Mandiri - Tanah Abang Jakarta', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(82, '8210-01-0080', 'Bank Mandiri - KH Wahid Malang', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(83, '8210-01-0081', 'Bank Mandiri - Basuki Rachmad Wilayah 8', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(84, '8210-01-0082', 'Bank Mandiri - Basuki Rachmad General Affair', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(85, '8210-01-0083', 'Bank Mandiri Cabang Surabaya Indragiri', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(86, '8210-01-0084', 'Bank Mandiri Regional Risk Management VIII (Commercial Risk Group)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(87, '8210-01-0085', 'Bank Mandiri Cabang Surabaya Niaga', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(88, '8210-01-0086', 'Bank Mandiri Cabang Surabaya Tanjung Perak', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(89, '8210-01-0087', 'Bayer Indonesia , P T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(90, '8210-01-0088', 'Bank Mandiri Business Banking Center - Surabaya HR Muhammad', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(91, '8210-01-0089', 'Bank Mandiri ,P.T (Commercial Banking Center Surabaya Basuki Rahmat)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(92, '8210-01-0090', 'Bank Mandiri, P.T (Bills Processing Center Semarang)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(93, '8210-01-0091', 'Bank Pembangunan Daerah Kalimantan Selatan', '0', 'JL LAMBUNG MANGKURAT NO 7 LT.6 ( DIV. SDM ), BANJARMASIH 70111 KALSEL', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(94, '8210-01-0092', 'Bank Mandiri , P.T (Retail Risk & Collection Center Surabaya)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(95, '8210-01-0093', 'Bank Mandiri , P.T - Surabaya Pahlawan', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(96, '8210-01-0094', 'AJB Bumiputera 1912', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(97, '8210-01-0095', 'BUPA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(98, '8210-01-0096', 'CAR ', '0', 'WISMA CAR LIFE JL.GELONG BARU UTARA NO 5-8 , JAKARTA BARAT 11440', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(99, '8210-01-0097', 'Chevron Pacific Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(100, '8210-01-0097', 'Chevron Indonesia Company', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(101, '8210-01-0097', 'CHEVRON MAKASSAR . LTD', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(102, '8210-01-0097', 'CHEVRON GEOTHERMAL SALAK, LTD', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(103, '8210-01-0097', 'CHEVRON GEOTHERMAL INDONESIA, LTD', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(104, '8210-01-0098', 'CLP Surabaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(105, '8210-01-0099', 'Commonwealth Life', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(106, '8210-01-0100', 'P.T ECCO INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(107, '8210-01-0101', 'P.T Cipta Krida Bahari', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(108, '8210-01-0102', 'P.T Cipta Kridatama', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(109, '8210-01-0103', 'Century Dinamik Drilling', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(110, '8210-01-0104', 'Citra International Underwriters (CIU)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(111, '8210-01-0105', 'ConocoPhilips Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(112, '8210-01-0106', 'P.T Dinamika Energitama Nusantara', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(113, '8210-01-0107', 'Cathay Pacific Airways Ltd.', '0', 'Jl. Jend. Basuki Rachmat no.122 , SUITE 700, 7/F   Plaza BRI Lt. 7           ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(114, '8210-01-0108', 'BIRO KLASIFIKASI INDONESIA,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(115, '8210-01-0109', 'MEDIKA JASA UTAMA , P.T (GLOBAL DOCTOR)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(116, '8210-01-0110', 'RS Orthopedi & Traumatologi', '0', 'Jl. Emerald Mansion TX 10 CitraLand , Surabaya', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(117, '8210-01-0111', 'Easco Medical', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(118, '8210-01-0112', 'English First', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(119, '8210-01-0113', 'Equity Financial Solution', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(120, '8210-01-0114', 'Fajar Mas Murni , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(121, '8210-01-0115', 'PT. Famon Awal Bros Medika qq 24 Medicare', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(122, '8210-01-0116', 'Eastern Logistics', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(123, '8210-01-0117', 'Euro - Center Indonesia c/o. Smailing Tour Bali', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(124, '8210-01-0118', 'SUPRIMA MITRA ADIHUSADA,P.T - TPA ASO TIRTA (P.T TIRTA MEDICA UTAMA)', '0', 'Kawasan Mega Kuningan Barat Kav. E4.3 JAKARTA SELATAN 15810, Bellagio Mall Lt. OUG 21-24', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(125, '8210-01-0119', 'AIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(126, '8210-01-0120', 'Assistama Indonesia, P.T / 221assist', '0', ' Jl. Anyelir No. 8, Denpasar - Bali', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(127, '8210-01-0121', 'Gas Negara, PN', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(128, '8210-01-0122', 'Generali Indonesia', '0', 'JL.HR RASUNA SAID KAVLING C-22 JAKARTA 12940, GRAN RUBINA BUSINESS PARK KAWASAN RANUSA EPICENTRUM, GENERALI TOWER 7 TH FLOOR ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(129, '8210-01-0123', 'Gesa Assistance', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(130, '8210-01-0124', 'Medilum', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(131, '8210-01-0125', 'Global Assistance & Healthcare (GAH)', '0', 'Jl. Raya Cilandak KKO, Jakarta 12560 , 5th Floor, CIBIS Nine Tower (CIBIS Business Park)', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(132, '8210-01-0126', 'GoodHealth', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(133, '8210-01-0127', 'GARAM , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(134, '8210-01-0128', 'Agasam , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(135, '8210-01-0129', 'Agincourt Recources', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(136, '8210-01-0130', 'PERKEBUNAN NUSANTARA X , P.T', '0', 'JL.RAJAWALI 44 SURABAYA 60175', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(137, '8210-01-0131', 'BANK NEGARA INDONESIA TBK. , P.T (SENTRA KREDIT KONSUMEN SURABAYA)', '0', 'Jl. Jendral A yani 286 Surabaya 60234 Indonesia, Gedung Graha Pangeran Lantai 5, Sentra Kredit Konsumer Surabaya', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(138, '8210-01-0132', 'Antar Surya Jaya , P.T (Kompas Gramedia)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(139, '8210-01-0133', 'AJB Bumiputera 1912', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(140, '8210-01-0134', 'Bukit Asam , P.T', '0', 'JL. HR RASUNA SAID BLOK X - 5 KAV. 2-3 Kuningan, MENARA KADIN INDONESIA LT. 15, JAKARTA SELATAN 12950 INDONESIA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(141, '8210-01-0135', 'Bank Pembangunan Daerah Jawa Barat dan Banten,Tbk. , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(142, '8210-01-0136', 'Hexindo Adiperkasa, PT', '0', 'JL.RUNGKUT INDUSTRI II NO 59 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(143, '8210-01-0137', 'HM Sampoerna', '0', 'JL. RUNGKUT INDUSTRI RAYA 18 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(144, '8210-01-0138', 'Hotel Bumi Surabaya. PT', '0', 'JL JENDRAL BASUKI RACHMAD 106-128, SURABAYA 60271', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(145, '8210-01-0139', 'Hotel Majapahit Surabaya (P.T Sekwan Wisata)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(146, '8210-01-0140', 'Hotel Inna Simpang', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(147, '8210-01-0141', 'Asuransi MSIG Indonesia ,P.T', '0', 'JL. JEND. SUDIRMAN KAV . 61 - 62 JAKARTA 12190, SUMMITMAS II BUILDING , LT. 15', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(148, '8210-01-0142', 'YAYASAN  KESEJAHTERAAN KARYAWAN DAN KELUARGA P.T PAL INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(149, '8210-01-0143', 'ASURANSI BOSOWA PERISKOP,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(150, '8210-01-0144', 'Supra Usadhatama , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(151, '8210-01-0145', 'RS.PETROKIMIA GRESIK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(152, '8210-01-0146', 'INCO,PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(153, '8210-01-0147', 'Indofood Sukses Makmur Tbk', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(154, '8210-01-0148', 'InHealth Ass Jiwa', '0', 'Jln. A.YANI NO 88 SURABAYA, GRAHA PENA EXT LT 9 ROOM 902 KANTOR PEMASARAN SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(155, '8210-01-0149', 'Intan Permata Hati (IPH) ', '0', 'NGINDEN INTAN SELATAN NO 49, SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(156, '8210-01-0150', 'Indosat ', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(157, '8210-01-0151', 'P.T IPMOMI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(158, '8210-01-0152', 'INDONESIA BULK TERMINAL , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(159, '8210-01-0153', 'INAMCO VARIA JASA, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(160, '8210-01-0154', 'Coca-Cola Distribution Indonesia,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(161, '8210-01-0155', 'Jasa Marga (Persero), Tbk. , P.T (Cabang Surabaya - Gempol)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(162, '8210-01-0156', 'Jamsostek', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(163, '8210-01-0157', 'Jasindo Health Care', '0', 'JL MT HARYONO KAV 23 JAKARTA 12820, MENARA MTH LT 15 SUITE 1502-1505', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(164, '8210-01-0158', 'Jasa Tania , Asuransi P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(165, '8210-01-0159', 'P.T Japfa Comfeed Indonesia Tbk.', '0', 'GEDUNG J.C.I LT 4JL HR MOCH. MANGUNDIPROJO KM 3.5 ,  BUDURAN SIDOARJO 61252', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(166, '8210-01-0160', 'P.T Jawa Pos Media Televisi', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(167, '8210-01-0161', 'Asuransi Jiwasraya (Persero),P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(168, '8210-01-0162', 'P.T SC JOHNSON MANUFACTURING SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(169, '8210-01-0163', 'Jakarta International Container Terminal , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(170, '8210-01-0165', 'SUMBER CIPTA MULTINIAGA.P.T', '0', 'JL KEDUNGDORO NO 34 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(171, '8210-01-0166', 'Kangean Energy Indonesia Ltd', '0', 'JL JENDRAL GATOT SUBROTO NO 42 JAKARTA 12710, WISMA MULIA LT 26', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(172, '8210-01-0167', 'Kaltim Pasifik Amoniak , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(173, '8210-01-0168', 'EMP Kondur Petroleum S.A, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(174, '8210-01-0169', 'EMP Energi Indonesia , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(175, '8210-01-0170', 'Insani Mitrasani Gelam , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(176, '8210-01-0171', 'Sembrani Persada Oil,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(177, '8210-01-0172', 'Mosesa Petroleum , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(178, '8210-01-0173', 'Kalila (Bantu & Korinci Baru) Limeted , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(179, '8210-01-0174', 'Kasoem Hearing, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(180, '8210-01-0175', 'Kompas Media Nusantara, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(181, '8210-01-0176', 'Manulife Indonesia & Inti', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(182, '8210-01-0177', 'Medex Visi Medika', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(183, '8210-01-0178', 'Medicare Lippo ', '0', 'KARAWACHI OFFICE PARK BLOK I NO.30-35 , KARAWACHI TANGERANG', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(184, '8210-01-0179', 'Medika Plaza International Clinic', '0', 'JL.TB.SIMATUPANG KAV.41 , BELTWAY OFFICE PARK TOWER C LANTAI 2', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(185, '8210-01-0180', 'Medipro', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(186, '8210-01-0181', 'Mega Insurance', '0', 'JL . PROF. DR. SOEPOMO NO. 231 JAKARTA SELATAN 12810, KOMPLEK PERKANTORAN CROWNE PALACE BLOK C-3, MEGA HEALTH CENTRE', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(187, '8210-01-0182', 'Mitsui Sumitomo Ind Ass ', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(188, '8210-01-0183', 'Multibreeder Adirama Indonesia, PT.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(189, '8210-01-0184', 'Monsanto Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(190, '8210-01-0185', 'Merck, Tbk , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(191, '8210-01-0186', 'Multi Artha Guna , P.T Asuransi', '0', 'JL. TENTARA PELAJAR KEBAYORAN LAMA , KOMP. PERMATA SENAYAN RUKAN E / 59-60 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(192, '8210-01-0187', 'MITSUI & CO.LTD', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(193, '8210-01-0188', 'Media Health Care', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(194, '8210-01-0189', 'Meratus Line ,Shipowners & Operators,P.T', '0', 'JL. ALOON - ALOON PRIOK 27 SURABAYA 60177 INDONESIA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(195, '8210-01-0190', 'Novell Pharmaceutical Laboratories , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(196, '8210-01-0191', 'NESTLE', '0', 'JL RAYA PASURUAN - MALANG KM 9.5, DESA TANGGULANGIN, KEJAYAN PASURUAN 67172', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(197, '8210-01-0192', 'Nayaka Era Husada , P.T Cab Surabaya', '0', 'JL.GAYUNGSARI Timur VII MGM 05/06 No.10 , Kelurahan Menanggal Kota Surabaya ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(198, '8210-01-0193', 'Laboratorium & Klinik Spesialis Terpadu Optima', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(199, '8210-01-0194', 'Bank OCBC NISP, Tbk.,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(200, '8210-01-0195', 'Asuransi Jiwa Nusantara , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(201, '8210-01-0195', 'Asuransi Jiwa Nusantara , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(202, '8210-01-0196', 'Pacific International / Indrapura Pacific Cross , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(203, '8210-01-0197', 'Patra Drilling', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(204, '8210-01-0198', 'Pembangkitan Jawa Bali, PT.', '0', 'JL. KETINTANG BARU NO. 11 SURABAYA ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(205, '8210-01-0199', 'kosong', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(206, '8210-01-0200', 'Pertamedika', '0', 'JL KYAI MAJA NO 43 , GEDUNG H LANTAI VI', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(207, '8210-01-0201', 'Pertamina Petrochina East Java', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(208, '8210-01-0202', 'PHE ONWJ Ltd.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(209, '8210-01-0203', 'PJB Unit Bisnis Pemeliharaan Gresik', '0', 'JL.HARUN TOHIR 1 GRESIK    61112', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(210, '8210-01-0204', 'PLN Distribusi Jawa Timur / P.T PLN (PERSERO) UNIT INDUK DISTRIBUSI JAWA TIMUR/PERUSAHAAN LISTRIK NEGARA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(211, '8210-01-0205', 'PLN Kalinusa, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(212, '8210-01-0206', 'Pos Indonesia, PT (Persero) - Kantor Pos Surabaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(213, '8210-01-0207', 'Powergen JATIM', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(214, '8210-01-0208', 'Premier Oil', '0', 'NATUNA SEA BV CIBIS NINE BUILDING LT.19, CIBIS BUSINESS PARK JL.TB.SIMATUPANG NO.2 JKT 12560', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(215, '8210-01-0209', 'Propan Raya, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(216, '8210-01-0210', 'Pan Pacific Insurance, PT', '0', 'GEDUNG GRAHA PACIFIC JL.DEWI SARTIKA NO 238 A , JAKARTA TIMUR 12810', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(217, '8210-01-0211', 'P.T Procter & Gamble', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(218, '8210-01-0212', 'PT.Panasonic Gobel Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(219, '8210-01-0213', 'Prestige International', '0', 'JL.HR.RASUNA SAID KAV 62 JAKARTA , SETIABUDI ATRIUM BUILDING 7TH FLOOR SUITE 701C', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(220, '8210-01-0214', 'Pasien - Liem Le Tjiauw MR 233274 Episode I066860', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(221, '8210-01-0215', 'P.T PJB UNIT PEMBANGKITAN GRESIK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(222, '8210-01-0216', 'Ready Indah', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(223, '8210-01-0217', 'Reliance Ind Asuransi', '0', 'JL. PLUIT KENCANA NO 37 LANTAI 2-3 PENJARINGAN -JAKARTA UTARA 14450', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(224, '8210-01-0218', 'Relife Insurace', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(225, '8210-01-0219', 'RS. Darmo', '0', 'JL. RAYA DARMO 90 SURABAYA BAGIAN KEUANGAN, PATHOLOGY KLINIK', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(226, '8210-01-0220', 'RS. Mitra Internasional / RS.Premier Jatinegara', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(227, '8210-01-0221', 'Rumah Sakit Islam (JEMURSARI)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(228, '8210-01-0221', 'Rumah Sakit Islam', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(229, '8210-01-0222', 'RSUD Dr.Sutomo (IDIK)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(230, '8210-01-0223', 'RS.Panti Nirmala Malang', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(231, '8210-01-0224', 'RS.MITRA KELUARGA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(232, '8210-01-0225', 'RS.BEDAH SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(233, '8210-01-0226', 'Samudera Indonesia', '0', 'JL.PERAK TIMUR 400 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(234, '8210-01-0227', 'OPHIR INDONESIA (SAMPANG) PTY LTD', '0', 'JL.JEND.SUDIRMAN KAV 52-53 JAKARTA 12190, THE ENERGY 53RD FLOOR SCBD LOT 11 A', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(235, '8210-01-0228', 'Semen Gresik, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(236, '8210-01-0229', 'Sinar Mas Insurance', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(237, '8210-01-0230', 'Smelting, PT', '0', 'DESA ROOMO KECAMATAN MANYAR GRESIK 61151', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(238, '8210-01-0231', 'SOS/AEA Internasional / PRIMA SARANA JASA', '0', 'JL.TB.SIMATUPANG NO 5 RAGUNAN , PASAR MINGGU, GEDUNG AD PREMIER LANTAI 16', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(239, '8210-01-0232', 'Surabaya International School (SIS)', '0', 'JL SEKOLAH INTERNATIONAL , CITRA RAYA VILLAGE - LAKARSANTRI SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(240, '8210-01-0233', 'Surveyor Indonesia (Surabaya)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(241, '8210-01-0234', 'Surya Multi Indopack, PT', '0', 'JL RUNGKUT INDUSTRI 14 NO 4, SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(242, '8210-01-0235', 'Siloam Hospital', '0', 'JL.RAYA GUBENG  NO 70 , SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(243, '8210-01-0236', 'SO GOOD FOOD , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(244, '8210-01-0237', 'Krakatau Bandar Samudra,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(245, '8210-01-0238', 'Surabaya Wire , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(246, '8210-01-0239', 'kosong', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(247, '8210-01-0240', 'Prasadha Pamunah Limbah Industri ,P.T (PPLi)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(248, '8210-01-0241', 'THIESS CONTRACTORS INDONESIA,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(249, '8210-01-0242', 'Asuransi Rama', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(250, '8210-01-0243', 'ASIA TEMBAKAU,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(251, '8210-01-0244', 'ASURANSI JIWA BERSAMA BUMIPUTERA 1912 - CAB. BANDUNG', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(252, '8210-01-0245', 'SANOFI - AVENTIS INDONESIA,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(253, '8210-01-0246', 'Takaful Asuransi', '0', 'JL MAMPANG PRAPATAN NO 100, JAKARTA SELATAN, GRAHA TAKAFUL INDONESIA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(254, '8210-01-0247', 'TELKOMSEL', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(255, '8210-01-0248', 'Tokio Marine Asuransi', '0', 'Jl. Asia Afrika No. 8, Jakarta 10270, Sentral Senayan I, 3rd  Floor', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(256, '8210-01-0249', 'Total E&P Indonesie', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(257, '8210-01-0250', 'Toyota Astra Financial S', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(258, '8210-01-0251', 'TRAKINDO', '0', 'JL RUNGKUT INDUSTRI RAYA NO 2 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(259, '8210-01-0252', 'Tritunggal Mandiri Solusindo,P.T', '0', 'Jl. Ciputat Raya no.9E, RT. 011 RW. 05 Pondok Pinang', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(260, '8210-01-0253', 'Total Bangun Persada , Tbk , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(261, '8210-01-0254', 'Trans-Pacific Petrochemical Indotama,P.T', '0', 'JL. TG. AWAR- AWAR Ds. REMEN , TASIKHARJO , JENU, PO. BOX 05 - TUBAN 62352 , JAWA TIMUR - INDONESIA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(262, '8210-01-0255', 'TIGARAKSA SATRIA, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(263, '8210-01-0256', 'PG Rajawali I , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(264, '8210-01-0257', 'Asuransi Bintang , P.T tbk', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(265, '8210-01-0258', 'Rumah Sakit Mata Undaan', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(266, '8210-01-0259', 'P.T Petronika', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(267, '8210-01-0260', 'P.T Agincourt Resources', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(268, '8210-01-0261', 'Unilever Indonesia Tbk,PT', '0', 'JL. JEND GATOT SUBROTO KAV 15, JAKARTA 12930, GRAHA UNILEVER', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(269, '8210-01-0262', 'VICO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(270, '8210-01-0263', 'PJB UBJ O & M PLTU PAITON, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(271, '8210-01-0264', 'Personel Alih Daya ,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(272, '8210-01-0265', 'PT ENERTA PRIMA SOLUSINDO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(273, '8210-01-0266', 'PAITON OPERATION AND MAINTENANCE INDONESIA , P.T (POMI)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(274, '8210-01-0267', 'TPA - ASO TIRTA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(275, '8210-01-0268', 'Graha Amerta', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(276, '8210-01-0269', 'QSMART ASSISTANCE , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(277, '8210-01-0270', 'RASAPALA,P.T (Sarana Usaha Sejahtera Insanpalapa,P.T)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(278, '8210-01-0271', 'Wana Artha', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(279, '8210-01-0272', 'Waskita Karya', '0', 'JL.JEMUR SARI SELATAN II / 2A-2B SURABAYA, INFRASTRUCTURE 3 DIVISION', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(280, '8210-01-0273', 'P.T ASTRA AVIVA LIFE', '0', 'JL.SULTAN ISKANDAR MUDA KAV V - TA PONDOK INDAH, Jakarta Selatan , PONDOK INDAH OFFICE TOWER 3 , 1 FLOOR', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(281, '8210-01-0274', 'Petronas Carigali Ltd. (West Glagah Kambuna)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(282, '8210-01-0275', 'Petronas Carigali Ltd. (PC Muriah LTD)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(283, '8210-01-0276', 'Petro Graha Medika', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(284, '8210-01-0277', 'CNOOC SES Ltd.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(285, '8210-01-0278', 'Indocement Tunggal Prakarsa , Tbk , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(286, '8210-01-0279', 'Graha Pena Jawa Pos, P.T', '0', 'Jl. Ahmad Yani no 88 (Lantai Basement), SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(287, '8210-01-0280', 'CIOMAS ADISATWA.P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(288, '8210-01-0281', 'Yayasan Budha Tzu-Chi', '0', 'Jl. JAGIR WONOKROMO No. 100, MANGGA DUA CENTRE BLOK B10 NO 1-2, AREA BIG SQUARE', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(289, '8210-01-0282', 'Yayasan Citra Baru', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(290, '8210-01-0283', 'YKKBI/Yakes BI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(291, '8210-01-0284', 'YKP BTN', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(292, '8210-01-0285', 'YTL Jawa Timur,PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(293, '8210-01-0287', 'Elizabet Klinik', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(294, '8210-01-0288', 'SALAM PACIFIC INDONESIA LINES , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(295, '8210-01-0289', 'BANK PEMBANGUNAN DAERAH JAWA TIMUR , P.T ', '0', 'PERAK TIMUR NO 262-264  SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(296, '8210-01-0290', 'Zakirah Health Care, PT', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(297, '8210-01-0291', 'Zurich Topas Life , P.T', '0', 'P.T ZURICH TOPAS LIFE GRAHA ZURICH MT HARYONO KAV 42 JKT SEL 12780', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(298, '8210-01-0292', 'Perum Jasa Tirta 1 Malang', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(299, '8210-01-0293', 'MNC Life', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(300, '8210-01-0294', 'P.T Astra  International - gabungan', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(301, '8210-01-0295', 'YAYASAN KESEHATAN GARUDA INDONESIA (YANKESGA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(302, '8210-01-0296', 'REA KALTIM PLANTATION , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(303, '8210-01-0297', 'GREAT EASTERN LIFE INDONESIA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(304, '8210-01-0298', 'BANK QNB KESAWAN , TBK , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(305, '8210-01-0299', 'PAMAPERSADA NUSANTARA , P.T', '0', 'Jl. Rawagelam I No.9 , Kawasan Industri Pulogadung, Jakarta Timur 13930', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(306, '8210-01-0300', 'ENERGI MEGA PERSADA,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(307, '8210-01-0301', 'FILTRONA INDONESIA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(308, '8210-01-0302', 'FEDERAL INTERNATIONAL FINANCE , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(309, '8210-01-0303', 'NUSANTARA REGAS , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(310, '8210-01-0304', 'UNITED TRACTORS TBK. P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(311, '8210-01-0305', 'TATAARTHA SWABUANA PRATAMA,P.T (Advanced Medical Center)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(312, '8210-01-0306', 'ANDRITZ HYDRO,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(313, '8210-01-0307', 'PETRO OXO NUSANTARA GRESIK , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(314, '8210-01-0308', 'PERUM PERHUTANI UNIT II JAWA TIMUR', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(315, '8210-01-0309', 'PETROKIMIA KAYAKU , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(316, '8210-01-0310', 'RUMAH SAKIT TNI AL DR.RAMELAN SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(317, '8210-01-0311', 'ESPI SWINSTAD PACIFIC , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(318, '8210-01-0312', 'P.T Jawa Pos Koran', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(319, '8210-01-0313', 'P.T Media Nusantara Informasi', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(320, '8210-01-0314', 'Pertamina PHE WMO (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(321, '8210-01-0315', 'MANDAU CIPTA TENAGA NUSANTARA,P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(322, '8210-01-0316', 'MARITIM KENCANA SAKTI , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(323, '8210-01-0317', 'SINAR KENCANA INTERMODA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(324, '8210-01-0318', 'SINAR JATIMITRA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(325, '8210-01-0319', 'ASAHIMAS FLAT GLASS , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(326, '8210-01-0320', 'STARS INTERNATIONAL,P.T', '0', 'JL RAYA MANUKAN TAMA BLOK H -33  NO 18-19, SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(327, '8210-01-0321', 'PJB SERVICES , P.T', '0', ' Jl.Raya Juanda No 17 Sidoarjo', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(328, '8210-01-0322', 'UNICEF (UNITED NATIONS CHILDREN\'S FUND INDONESIA COUNTRY  OFFICE)', '0', 'JL.JEND.SUDIRMAN KAV 31 JKT 12920, WORLD TRADE CENTRE (WTC) 2 LANTAI 22', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(329, '8210-01-0323', 'ENERGI MINERAL LANGGENG,P.T', '0', 'JL.HR.RASUNA SAID BLOK X - 1 KAV. 8-9 , KUNINGAN JAKARTA 12950, GEDUNG GRANADI LANTAI 10 TYPICAL BAGIAN UTARA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(330, '8210-01-0324', 'ZURICH INSURANCE INDONESIA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(331, '8210-01-0325', 'P.T LEIGHTON CONTRACTORS INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(332, '8210-01-0326', 'STAR ENERGY (KAKAP) LTD.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(333, '8210-01-0327', 'P.T Tritama Opsi Prima', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(334, '8210-01-0328', 'P.T DHARMA SATYA NUSANTARA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(335, '8210-01-0329', 'P.T SINAR JATIMITRA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(336, '8210-01-0330', 'RS Gotong Royong', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(337, '8210-01-0331', 'P.T JLT GESA - MEDILUM', '0', 'JL. TB SIMATUPANG NO. 2 RT 001 RW 05, KEL. CILANDAK TIMUR KEC. PASAR MINGGU, CIBIS NINE (CIBIS BUSINESS PARK) BULDING, LANTAI 5', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(338, '8210-01-0332', 'ASURANSI MITRA MAPARYA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(339, '8210-01-0333', 'HD FINANCE P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(340, '8210-01-0334', 'RUMAH SAKIT HUSADA UTAMA', '0', 'JL.PROF DR MOESTOPO NO. 31-35 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(341, '8210-01-0335', 'GEARINDO PRAKARSA , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(342, '8210-01-0336', 'CHAROEN POKPHAND INDONESIA , TBK , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(343, '8210-01-0337', 'PRIMAFOOD INTERNATIONAL , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(344, '8210-01-0338', 'CHAROEN POKPHAND JAYA FARM  , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(345, '8210-01-0339', 'AGRICO INTERNATIONAL , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(346, '8210-01-0340', 'SHS INTERNATIONAL , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(347, '8210-01-0341', 'BISI INTERNATIONAL , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(348, '8210-01-0342', 'PROSPEK , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(349, '8210-01-0343', 'JASARAHARJA PUTERA, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(350, '8210-01-0344', 'CAMERON SYSTEM , P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(351, '8210-01-0345', 'ALFA TRANS JAYA, P.T', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(352, '8210-01-0346', 'JPA - MAHASISWA MALAYSIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(353, '8210-01-0347', 'AXA - AXA HEALTHCARE MANAGEMENT (AHM)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(354, '8210-01-0348', 'AXA - AXA GENERAL INDONESIA (AGI) / ASURANSI AXA INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(355, '8210-01-0349', 'Karyawan Admedika', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(356, '8210-01-0350', 'IOM - SURABAYA', '0', 'JL GAYUNGSARI MGM NO 21 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(357, '8210-01-0351', 'P.T GOODYEAR INDONESIA , TBK.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(358, '8210-01-0352', 'P.T Asuransi Rama Satria Wibawa', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(359, '8210-01-0353', 'P.T KEBON AGUNG', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(360, '8210-01-0354', 'SHANGRILA HOTEL', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(361, '8210-01-0355', 'P.T ISPAT INDO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(362, '8210-01-0356', 'P.T ERES REVCO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(363, '8210-01-0357', 'P.T McDermott Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(364, '8210-01-0358', 'AXA Financial Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(365, '8210-01-0359', 'P.T MediExpress', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(366, '8210-01-0360', 'P.T Sanggar Sarana Baja', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(367, '8210-01-0361', 'P.T.TASPEN (Persero)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(368, '8210-01-0362', 'P.T Surabaya Media Televisi', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(369, '8210-01-0363', 'BANK PEMBANGUNAN DAERAH JAWA TIMUR , P.T / GABUNGAN', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(370, '8210-01-0364', 'P.T Global Sarana Sukses', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(371, '8210-01-0365', 'RS.Premier Bintaro', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(372, '8210-01-0366', 'P.T VAN OORD INDONESIA', '0', 'JL KUNINGAN MULIA LOT 9B GUNTUR - SETIABUDI, MULTIVISION TOWER BUILDING - MEZZANINE FLOOR, JAKARTA SELATAN 12980', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(373, '8210-01-0367', 'P.T BLUE DOT ASSISTANCE', '0', 'JL.LETJEND S.PARMAN KAV 106 A JAKARTA 11440, TOTAL BUILDING 8TH FLOOR', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(374, '8210-01-0368', 'P.T DOKTER KAMI INDONESIA (PLATINUM HEALTH)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(375, '8210-01-0369', 'P.T SERBA MULIA AUTO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(376, '8210-01-0370', 'P.T ROMOS INTI COSMETICS', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(377, '8210-01-0371', 'P.T TEMPO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(378, '8210-01-0372', 'P.T BUWANA ARTHA NUSANTARA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(379, '8210-01-0373', 'ASURANSI JIWA SEQUIS LIFE', '0', ' Jl. Jendral Sudirman No.71, Jakarta 12190', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(380, '8210-01-0374', 'PT Sun Life Financial Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(381, '8210-01-0375', 'P.T TIRTA INVESTAMA', '0', 'JL. RUNGKUT INDUSTRI III/9', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(382, '8210-01-0376', 'P.T BANK RAKYAT INDONESIA - CAB SBY PAHLAWAN', '0', 'JL. PAHLAWAN NO 39-41 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(383, '8210-01-0377', 'P.T VALE INDONESIA TBK.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(384, '8210-01-0378', 'P.T ADARO INDONESIA', '0', 'JL. HR RASUNA SAID BLOK X5 KAV 1-2 JAKARTA 12950, GEDUNG MENARA KARYA LT.11', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(385, '8210-01-0379', 'P.T AXA SERVICES INDONESIA', '0', 'JL.PROF. DR. SATRIO KAV 18 , KUNINGAN CITY JAKARTA SELATAN , AXA TOWER LANTAI 12', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(386, '8210-01-0380', 'P.T MEDIKA HARAPAN CEMERLANG', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(387, '8210-01-0381', 'TOKIO MARINE LIFE', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(388, '8210-01-0382', 'P.T KERRY INGREDIENTS INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(389, '8210-01-0383', 'P.T BERAUCOAL', '0', 'Jl Jendral Sudirman Kav-21 Kel. Karet Kec.Setiabudi Jakarta Selatan 12920, Sinarmas MISG Tower Lt 8', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(390, '8210-01-0384', 'P.T KAI COMMUTER JABODETABEK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20');
INSERT INTO `insurances` (`id`, `no_va`, `name`, `status`, `alamat`, `description`, `created_at`, `updated_at`) VALUES
(391, '8210-01-0385', 'P.T BANK RAKYAT INDONESIA - CAB SBY JEMURSARI', '0', 'JL. JEMUR ANDAYANI NO. 69 A-B SURABAYA, KANTOR CABANG SBY JEMURSARI', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(392, '8210-01-0386', 'P.T SYNTECH MITRA INTEGRASI', '0', 'JL. TANAH ABANG III NO 23-25-27 JAKARTA PUSAT, GEDUNG PAKARTI CENTRE LT . 6', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(393, '8210-01-0387', 'P.T KERETA API INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(394, '8210-01-0388', 'EMBASSY OF LIBYA JAKARTA (KEDUTAAN LYBIYA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(395, '8210-01-0389', 'RS.Onkologi', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(396, '8210-01-0390', 'RUMAH SAKIT ROYAL SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(397, '8210-01-0391', 'P.T BINASAWIT ABADIPRATAMA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(398, '8210-01-0392', 'KLINIK UBAYA (UNIVERSITAS SURABAYA)', '0', 'JL.NGAGEL JAYA SELATAN 169 SURABAYA 60284', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(399, '8210-01-0393', 'NATIONAL HOSPITAL', '0', 'JL. BOULEVARD  FAMILI SELATAN KAV 1, SURABAYA 60228', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(400, '8210-01-0394', 'P.T HANWHALIFE INSURANCE INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(401, '8210-01-0395', 'P.T BANK RAKYAT INDONESIA (PERSERO) TBK.', '0', 'JL. PERAK BARAT NO. 357 -375 SURABAYA 60165, KANTOR CABANG SURABAYA TANJUNG PERAK', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(402, '8210-01-0396', 'PT. Kaltim Medika Utama', '0', 'JL.OXYGEN NO 1 KOMP.PUPUK KALTIM BONTANG , KALIMANTAN TIMUR 75313', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(403, '8210-01-0397', 'PT. CJ KOREA EXPRESS INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(404, '8210-01-0398', 'ICON PLUS', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(405, '8210-01-0399', 'FWD Life Indonesia (P.T Finansial Wiramitra Danadyaksa)', '0', 'Jl. Jendral Sudirman kav. 52-53 Jakarta Selatan, Pasific Century Place, lantai 20 SCBD Lot 10', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(406, '8210-01-0400', 'P.T Bank Syariah Mandiri', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(407, '8210-01-0401', 'Henner - GMC', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(408, '8210-01-0402', 'PT. JAKARTA KYOAI MEDICAL CENTER', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(409, '8210-01-0403', 'P.T AMERTA INDAH OTSUKA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(410, '8210-01-0404', 'P.T MEDIA CO. (ASTRA ZENECA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(411, '8210-01-0405', 'P.T M3 KETAPANG SEJAHTERA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(412, '8210-01-0406', 'P.T Aplikanusa Lintasarta', '0', 'Jl. M.H. Thamrin Kav.3 JAKARTA 10250, Menara Thamrin Lt.18 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(413, '8210-01-0407', 'P.T CIGNA INTERNATIONAL', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(414, '8210-01-0408', 'P.T SURI TANI PEMUKA , GRESIK', '0', 'JL.RAYA MANYAR GRESIK KM 10,3 , KELURAHAN MANYAR REJO, KECAMATAN MANYAR,GRESIK 61151', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(415, '8210-01-0409', 'JOB PERTAMINA TALISMAN', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(416, '8210-01-0410', 'PT. Asuransi Ramayana Tbk', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(417, '8210-01-0411', 'GOOD HEALTH', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(418, '8210-01-0412', 'P.T AXA MANDIRI FINANCIAL SERVICES', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(419, '8210-01-0413', 'PT. Kopelindo Yabinstra', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(420, '8210-01-0414', 'BANK DKI - KANTOR CABANG RAYA DARMO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(421, '8210-01-0415', 'P.T ESSENTRA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(422, '8210-01-0416', 'HUSKY - CNOOC MADURA LIMITED', '0', 'JL. JEND SUDIRMAN KAV 52-53 JAKARTA 12190, INDONESIA STOCK EXCHANGE BUILDING TOWER I 18 th, 24th , 25 th FLOOR', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(423, '8210-01-0417', 'P.T BINA PERTIWI', '0', 'JL RUNGKUT INDUSTRI III NO 46, SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(424, '8210-01-0418', 'P.T Unilever Oleochemical Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(425, '8210-01-0419', 'P.T GAWIH JAYA SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(426, '8210-01-0420', 'PT NTT Data Indonesia', '0', 'Jl. Jend.Sudirman Kav. 1, Wisma 46 Kota BNI Lt. 4', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(427, '8210-01-0421', 'P.T COSL INDO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(428, '8210-01-0422', 'PT. SWARNA BHUMI ENERGI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(429, '8210-01-0423', 'PT. PELINDO HUSADA CITRA', '0', 'JL. PRAPAT KURUNG SELATAN NO.1, TANJUNG PERAK SURABAYA 60165 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(430, '8210-01-0424', 'Asuransi Sompo Japan Nipponkoa', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(431, '8210-01-0425', 'P.T PERUSAHAAN PELAYARAN NUSANTARA PANURJWAN CAB SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(432, '8210-01-0426', 'PERTAMINA GEOTERMAL', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(433, '8210-01-0427', 'PT. Orica Mining Services', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(434, '8210-01-0428', 'PT. Kaltim Nitrate Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(435, '8210-01-0429', 'P.T TUGU PRATAMA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(436, '8210-01-0430', 'Yakes Pertamina', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(437, '8210-01-0431', 'kosong', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(438, '8210-01-0432', 'PT Patra SK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(439, '8210-01-0433', 'PT Nusantara Regas', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(440, '8210-01-0434', 'Infomedia Solusi Humanika ( ISH )', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(441, '8210-01-0435', 'Indosurya Life', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(442, '8210-01-0436', 'HDI Family Companies Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(443, '8210-01-0437', 'PT Asuransi Bumiputera Muda 1967', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(444, '8210-01-0438', 'PT JASAMARGA PANDAAN TOL', '0', ' Plaza Tol Singosari Malang - 65153', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(445, '8210-01-0439', 'PT. PERTAMINA DRILLING SERVICES INDONESIA (PDSI)', '0', 'GRAHA PDSI  LANTAI 9 JL. MATRAMAN RAYA NO 87 , JAKARTA TIMUR 13140 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(446, '8210-01-0440', 'PT. H.B. Fuller Adhesive Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(447, '8210-01-0441', 'P.T PANCURAN KARYA MUKTI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(448, '8210-01-0442', 'PETROCHINA INTERNATIONAL JABUNG LTD.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(449, '8210-01-0443', 'P.T STEP OIL TOOLS', '0', 'JL.BUNCIT RAYA NO. 22 JAKARTA SELATAN 12510, INDONESIA , GRAHA INTI FAUZI 12 TH FLOOR ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(450, '8210-01-0444', 'P.T DARMA HENWA TBK. - HEAD OFFICE', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(451, '8210-01-0445', 'PT. INDONESIA ASSIST CARD', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(452, '8210-01-0446', 'P.T SAMSUNG ELECTRONICS / ASURANSI SAMSUNG TUGU', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(453, '8210-01-0447', 'P.T FUJI SEAL PACKAGING INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(454, '8210-01-0448', 'P.T TAKEDA INDONESIA / P.T APEX PHARMA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(455, '8210-01-0449', 'PT. ALTUS LOGISTICS SERVICES INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(456, '8210-01-0450', 'RS ADI HUSADA UNDAAN WETAN SURABAYA', '0', 'JL. UNDAAN WETAN 40-44 SURABAYA 60272', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(457, '8210-01-0451', 'P.T PERTAMINA HULU ENERGI (PHE) NSB - NSO', '0', 'JL TB SIMATUPANG KAV 88, TOWER D LT 6-12, PERKANTORAN HIJAU ARKADIA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(458, '8210-01-0452', 'YKP Bank Exim', '0', 'JL. LOKA INDAH NO. 4, WARUNG BUNCIT RAYA JAKARTA SELATAN 12740, GRAHA YKP BANK EXIM ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(459, '8210-01-0453', 'P.T SUCOFINDO (PERSERO) CAB . Surabaya', '0', 'JL. KALIBUTUH NO 215 SURABAYA 60173', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(460, '8210-01-0454', 'NEURON CLINIC', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(461, '8210-01-0455', 'Yayasan Kesejateraan Pegawai OJK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(462, '8210-01-0456', 'BPJS Ketenagakerjaan ', '0', 'Jl. Karimunjawa No. 06    Surabaya - 60281   ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(463, '8210-01-0457', 'ASKRIDA ( Admedika )', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(464, '8210-01-0458', 'Kedutaan Amerika ( Admedika )', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(465, '8210-01-0459', 'Pro Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(466, '8210-01-0460', 'GSM', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(467, '8210-01-0461', 'Bumida (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(468, '8210-01-0462', 'Bumida Syariah (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(469, '8210-01-0463', 'AHM / AXA SERVICES INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(470, '8210-01-0464', 'Pertamina PHE Nunukan Company (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(471, '8210-01-0465', 'Pertamina International EP (Admedika)', '0', 'JL. JEND. GATOT SUBROTO KAV. 32 - 34 , JAKARTA SELATAN 12950, PATRA JASA OFFICE TOWER, LANTA 12', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(472, '8210-01-0466', 'Peace Corps Indonesia', '0', 'Jl. Citra Raya Niaga No.2, Sambikerep, Kota Surabaya, Jawa Timur 60217 Indonesia', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(473, '8210-01-0467', 'LPK REKATAMA', '0', 'PERUM ALAM PESONA 1 BLOK E2-01 SIDOREJO, LPK REKADAYA KARYA UTAMA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(474, '8210-01-0468', 'P.T AMMAN MINERAL NUSA TENGGARA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(475, '8210-01-0469', 'RUMAH SAKIT BAKTI TIMAH', '0', 'JL. JENDRAL SUDIRMAN 51B  PANGKAL PINANG , PROV. KEPULAUAN BANGKA BELITUNG 33121 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(476, '8210-01-0470', 'P.T ASURANSI UMUM BUMIPUTERA MUDA 1967 - CAB BANDUNG', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(477, '8210-01-0471', 'P.T OSCT INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(478, '8210-01-0472', 'P.T NUSANTARA SEBELAS MEDIKA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(479, '8210-01-0473', 'Ramsay Health Corporate Indonesia / RHCI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(480, '8210-01-0474', 'Baskhara Futsal Arena', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(481, '8210-01-0475', 'Petrogas (Admedika Full TPA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(482, '8210-01-0476', 'Intra Asia (Admedika Full TPA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(483, '8210-01-0477', 'RS Dr.Soetomo Surabaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(484, '8210-01-0478', 'RS Universitas Airlangga Surabaya', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(485, '8210-01-0479', 'Asuransi Intra Asia  ( Admedika )', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(486, '8210-01-0480', 'BPJS Kesehatan', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(487, '8210-01-0481', 'PT MEINDO ELANG INDAH', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(488, '8210-01-0482', 'P.T Catur Elang Perkasa', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(489, '8210-01-0483', 'P.T PJB Investasi', '0', 'JL.TB SIMATUPANG NO 18 RT 2 RW 1 KEBAGUSAN KEC. PS MINGGU, JKT SELATAN , DAERAH KHUSUS IBUKOTA JKT 12520', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(490, '8210-01-0484', 'FULLERTON HEALTH INDONESIA', '0', 'JL. TB SIMATUPANG NO. 2 RT 001 RW 05 , CIBIS NINE (CIBIS BUSINESS PARK) BULDING, LANTAI 5', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(491, '8210-01-0485', 'LTD STAR ENERGY GEOTHERMAL (WAYANG WINDU) LTD.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(492, '8210-01-0486', 'Perum Lembaga Penyelenggara Pelayanan Navigasi Penerangan', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(493, '8210-01-0487', 'P.T Trans Retail Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(494, '8210-01-0488', 'JOB PTJM (JOB P.T Jambi Merang)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(495, '8210-01-0489', 'P.T Ajinomoto Sales Indonesia', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(496, '8210-01-0490', 'BUMITAMA GUNAJAYA ARGO GROUP (P.T GUNAJAYA KARYA GEMILANG)', '0', 'Jl. S.Parman GG Pepaya No 03, Kel.Sukaharja Kec. Delta Pawan Kab Ketapang ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(497, '8210-01-0491', 'PERTAMINA LUBRICANT (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(498, '8210-01-0492', 'Asuransi Prudential (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(499, '8210-01-0493', 'BCA LIFE (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(500, '8210-01-0494', 'DANA PENSIUN PEGAWAI BANK JATIM', '0', 'JL. NGAGEL JAYA NO 18 SURABAYA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(501, '8210-01-0495', 'P.T PERTAMINA MARKETING OPERATION REGION V UP : DR.TRI LUDIARINI (HEALTH AND MEDICAL MANAGEMENT)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(502, '8210-01-0496', 'PGN Gagas (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(503, '8210-01-0497', 'RS.SEMEN GRESIK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(504, '8210-01-0498', 'Ramsay Sime Darby Health Care', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(505, '8210-01-0499', 'P.T Sunindo Pratama', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(506, '8210-01-0500', 'Pertamina Petrochina Salawati (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(507, '8210-01-0501', 'TELKOM (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(508, '8210-01-0502', 'PHE HO (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(509, '8210-01-0503', 'P.T PP (Persero) Tbk.', '0', 'Jl.TB Simatupang No 57 Jakarta Timur, Plaza PP Lt 5', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(510, '8210-01-0504', 'P.T Gunung Sejahtera Dua Indah', '0', 'DESA SEI BENGKUANG KEC. PANGKALAN BANTENG , KABUPATEN KOBAR KALIMANTAN TENGAH', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(511, '8210-01-0505', 'Australia Awards Indonesia', '0', 'Jl. HR.RASUNA SAID KAV.C5 JKT - SEL 12940, Gedung Wirausaha Lt 7 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(512, '8210-01-0506', 'P.T Nissan Financial Indonesia', '0', 'JL.RA KARTINI III-5 KAV 6 SEKTOR II JAKARTA SELATAN 12310, PALMA TOWER 8TH FLOOR', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(513, '8210-01-0507', 'P.T Armada Gema Nusantara', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(514, '8210-01-0508', 'EMCL-EXXON MOBIL CEPU LIMITED (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(515, '8210-01-0509', 'P.T Asuransi BRI Life', '0', 'Jl.H.R Rasuna Said Blok X-1 Kav 1-2 ,  Jakarta Selatan 12950, Gedung Graha Irama Lt 2 ', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(516, '8210-01-0510', 'P.T Swadaya Sarana Berlian', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(517, '8210-01-0511', 'P.T Pertamina Patra Niaga', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(518, '8210-01-0512', 'ADMEDIKA - PETROCHINA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(519, '8210-01-0513', 'P.T Pertamina Internasional Eksplorasi dan Produksi', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(520, '8210-01-0514', 'P.T PHE Ogan Komering (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(521, '8210-01-0515', 'Taman Dayu & Taman Dayu Golf', '0', 'JL.SURABAYA  - MALANG KM 48 PANDAAN', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(522, '8210-01-0516', 'P.T Lativi Mediakarya (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(523, '8210-01-0517', 'P.T PHE TUBAN (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(524, '8210-01-0518', 'ADMEDIKA - NICI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(525, '8210-01-0519', 'PHE OSES (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(526, '8210-01-0520', 'RUMAH SAKIT IBU DAN ANAK KENDANGSARI MERR', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(527, '8210-01-0521', 'P.T TIMAH (PERSERO) TBK.', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(528, '8210-01-0522', 'Pertamina Hulu Kalimantan Timur (Admedika)', '0', 'Klinik PT Pertamina Hulu Sanga Sanga JL.CENDRAWASIH NO 1', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(529, '8210-01-0523', 'P.T Media Dokter Investama (HALODOC)', '0', 'JL.HR RASUNA SAID KAV BI  B KAV 32-33 SETIABUDI , JAKARTA SELATAN 12950', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(530, '8210-01-0524', 'BANK KALSEL', '0', 'JL.LAMBUNG MANGKURAT NO 7 LANTAI 6, BANJARMASIN , KALIMANTAN SELATAN 70111', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(531, '8210-01-0525', 'ADMEDIKA TPI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(532, '8210-01-0526', 'ADMEDIKA - TUGU KRESNA', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(533, '8210-01-0527', 'P.T PJB UNIT PJB ACADEMY', '0', 'Jl. Raya Jemursari No 185 Surabaya 60292', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(534, '8210-01-0528', 'ADMEDIKA PHE - OK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(535, '8210-01-0529', 'P.T PERSEBAYA INDONESIA / P.T DBL INDONESIA', '0', 'JL.KARANGGAYAM 1 TAMBAKSARI, SURABAYA 60136', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(536, '8210-01-0530', 'P.T GUNUNG SEJAHTERA YOLI MAKMUR', '0', 'DESA SERI BENGKUANG - KEC. PANGKALAN BANTENG KAB. KOBAR - KALIMANTAN TENGAH', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(537, '8210-01-0531', 'P.T DONGGI SENORO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(538, '8210-01-0532', 'ADMEDIKA EMLI', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(539, '8210-01-0533', 'P.T IFORTESOLUSI INFOTEK', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(540, '8210-01-0534', 'PERTAMINA HULU MAHAKAM', '0', 'JL.YOS SUDARSO BALIKPAPAN, KALIMANTAN TIMUR 76123, KLINIK PERTAMINA HULU MAHAKAM', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(541, '8210-01-0535', 'P.T TOYOTA ASTRA MOTOR', '0', 'JL.LAKS. YOS SUDARSO , SUNTER II, JAKARTA UTARA', NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(542, '8210-01-0536', 'ADMEDIKA PHE - KO', '0', NULL, NULL, '2022-08-22 00:08:20', '2022-08-22 00:08:20'),
(543, '8210-01-0537', 'P.T BLUE DOT SERVICES', '0', 'JL.LETJEND S.PARMAN KAV 106 A JAKARTA 11440, TOTAL BUILDING 8TH FLOOR', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(544, '8210-01-0538', 'ADMEDIKA ANGKASA PURA II', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(545, '8210-01-0539', 'ADMEDIKA EMPLOYEE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(546, '8210-01-0540', 'ADMEDIKA PHE-TBN', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(547, '8210-01-0541', 'ADMEDIKA SEQUIS FINANCIAL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(548, '8210-01-0542', 'P.T SARANA SOLUSI AMANAH', '0', 'JL.BUNCIT RAYA NO 108 RT 1 / RW 1 , DUREN TIGA PANCORAN JAKARTA SELATAN, RUKAN BUNCIT MAS CC-6', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(549, '8210-01-0543', 'BANK BJB', '0', 'JL RAYA DARMO NO 87 SURABAYA', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(550, '8210-01-0544', 'ADMEDIKA EMCL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(551, '8210-01-0545', 'ADMEDIKA PERTAL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(552, '8210-01-0546', 'P.T DRAEGERINDO JAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(553, '8210-01-0547', 'ADMEDIKA - PERTAMINA HULU INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(554, '8210-01-0548', 'P.T SIEMENS INDONESIA', '0', 'Jl.Jend.Ahmad Yani KAV B 67-68 , Pulomas Jakarta Timur', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(555, '8210-01-0549', 'P.T FEDERAL KARYATAMA', '0', 'JL. Jalur Sutera Barat Kav 15 Alam Sutera, The Prominence Office Tower 29th Floor ', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(556, '8210-01-0550', 'ADMEDIKA - P.T GEOFORCE INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(557, '8210-01-0551', 'P.T SURVEYOR INDONESIA CABANG JAKARTA - BAGIAN SDM', '0', 'Jl.Gatot Subroto Kav 56 Jakarta Selatan 12950, Gedung Adhi Graha Lantai 5', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(558, '8210-01-0552', 'GEREJA KATOLIK SANTA MARIA TAK BERCELA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(559, '8210-01-0553', 'P.T AUSTASIA FOOD', '0', 'JL.DAAN MOGOT KM 12 NO 9 CENGKARENG, JAKARTA BARAT, GRAHA PRABA SAMANTA GD. JAPFA COMFEED I', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(560, '8210-01-0554', 'BANK MUAMALAT INDONESIA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(561, '8210-01-0555', 'P.T APLIKASI PESAN INDONESIA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(562, '8210-01-0556', 'kosong', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(563, '8210-01-0557', 'P.T BANK TABUNGAN NEGARA (PERSERO) TBK. - CAB. BANGKALAN', '0', 'JL. TEUKU UMAR NO. 16 BANGKALAN', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(564, '8210-01-0558', 'JMAS (JASA MITRA ABADI JIWA SYARIAH) - ADMEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(565, '8210-01-0559', 'ISPC (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(566, '8210-01-0560', 'ASURANSI CIGNA INDONESIA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(567, '8210-01-0561', 'P.T PEMBANGKITAN JAWA - BALI UBIOM LUAR JAWA-2', '0', ':Jl.Raya Jemursari No 216-218 - Tenggilis Mejoyo - Surabaya', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(568, '8210-01-0562', 'RS ISLAM SURABAYA (A.YANI)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(569, '8210-01-0563', 'YKP BANK BJB', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(570, '8210-01-0564', 'TUGU KRESNA PRATAMA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(571, '8210-01-0565', 'P.T PERURI WIRA TIMUR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(572, '8210-01-0566', 'AXA Financial Indonesia - Fullerton Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(573, '8210-01-0567', 'AXA General Indonesia - Fullerton Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(574, '8210-01-0568', 'Avrist - Fullerton Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(575, '8210-01-0569', 'Reliance - Fullerton Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(576, '8210-01-0570', 'P.T Chevron Pasific Indonesia - Fullerton Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(577, '8210-01-0571', 'KONI Provinsi Jawa Timur', '0', ' Jl.Kertajaya Indah Timur IV no 5 Surabaya ', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(578, '8210-01-0572', 'P.T JASAMARGA PANDAAN MALANG', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(579, '8210-01-0572', 'P.T GOOD DOCTOR TECHNOLOGY', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(580, '8210-01-0573', 'PERTAMINA HULU INDONESIA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(581, '8210-01-0574', 'ADMEDIKA - TELKOM', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(582, '8210-01-0575', 'P.T Pusaka Mulia Insani (PMI)', '0', ' Jl.Raya Siwalanpanji No.89 Buduran - Sidoarjo', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(583, '8210-01-0576', 'Mandiri InHealth (Mi Care)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(584, '8210-01-0577', 'P.T SARANA SOLUSI AMANAH (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(585, '8210-01-0578', 'ADMEDIKA - HARTA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(586, '8210-01-0579', 'ADMEDIKA - CIGNA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(587, '8210-01-0580', 'P.T KORINA KEMILAU BAROKAH', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(588, '8210-01-0581', 'EQUITY - LIFE (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(589, '8210-01-0582', 'P.T TRILINK', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(590, '8210-01-0583', 'BP Berau (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(591, '8210-01-0584', 'ADMEDIKA - LPS (LEMBAGA PENJAMIN SIMPANAN)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(592, '8210-01-0585', 'ADMEDIKA-RAMA INSURANCE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(593, '8210-01-0586', 'PRUDENTIAL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(594, '8210-01-0587', 'PRUDENTIAL SYARIAH', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(595, '8210-01-0588', 'ADMEDIKA - PGN SOLUTION', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(596, '8210-01-0589', 'ASURANSI JASA INDO (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(597, '8210-01-0590', 'HD GROUP', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(598, '8210-01-0591', 'P.T CIOMAS ADISATWA (JAPFA GROUP)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(599, '8210-01-0592', 'ADMEDIKA - CIKAL (P.T CIKARANG LESTRINDO ENERGY)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(600, '8210-01-0593', 'MEGA INSURANCE - FULLERTON HEALTH INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(601, '8210-01-0594', 'P.T PELAYARAN NASIONAL EKALAYA PUNAMASARI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(602, '8210-01-0595', 'DINAS KESEHATAN PEMERINTAH KOTA SURABAYA', '0', 'Jl. Raya Jemursari No.197, Sidosermo, Kec. Wonocolo, Kota SBY, Jawa Timur 60239', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(603, '8210-01-0596', 'MIDTRANS', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(604, '8210-01-0597', 'RUMAH SAKIT VINCENTIUS A PAULO / RKZ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(605, '8210-01-0598', 'P.T MEDCO ENERGY', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(606, '8210-01-0599', 'RSUD DR. M . SOEWANDHIE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(607, '8210-01-0600', 'P.T ULTRA PRIMA ABADI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(608, '8210-01-0601', 'DANA PENSIUN UNIVERSITAS SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(609, '8210-01-0602', 'RS Ibu dan Anak PUTRI Surabaya', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(610, '8210-01-0603', 'BCA  PSDM KANWIL III', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(611, '8210-01-0604', 'ROYAL THAI CONSULATE SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(612, '8210-01-0605', 'P.T SHAFTINDO ENERGI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(613, '8210-01-0606', 'RUMAH SAKIT JIWA MENUR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(614, '8210-01-0607', 'P.T PERTAMINA TRAINING AND CONSULTING', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(615, '8210-01-0608', 'GLENEAGLES DIAGNOSTIC CENTRE SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(616, '8210-01-0609', 'RS.PETROKIMIA DRIYOREJO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(617, '8210-01-0610', 'Parahita Diagnostik Center - Gresik', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(618, '8210-01-0611', 'E-CLAIM BPJS / BPJS Kesehatan', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(619, '8210-01-0612', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR - JL GATOR SUBROTO NO 8 NGANJUK', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(620, '8210-01-0613', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR - JL.PANGLIMA SUDIRMAN NO 145 TRENGGALEK', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(621, '8210-01-0613', 'RSU ANWAR MEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(622, '8210-01-0614', 'Mandiri InHealth (Telemedicine) Mi Care', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(623, '8210-01-0615', 'P.T SCHLUMBERGER GN', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(624, '8210-01-0616', 'PETRONAS LTD.', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(625, '8210-01-0617', 'RSU JASEM', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(626, '8210-01-0618', 'Parahita Diagnostik Center - Sidoarjo', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(627, '8210-01-0619', 'Parahita Diagnostik Center - Cabang Dharmawangsa', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(628, '8210-01-0620', 'P.T OPHIR INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(629, '8210-01-0621', 'P.T LINTAS NIAGA JAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(630, '8210-01-0622', 'RSU ANWAR MEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(631, '8210-01-0623', 'PADMA BAHTERA MEDICAL CENTRE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(632, '8210-01-0624', 'PT. Mediva Digital Inovasi, Check Lab.id', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(633, '8210-01-0625', 'RS. BHAYANGKARA H.S. SAMSOERI MERTOJOSO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(634, '8210-01-0626', 'P.T ROLAS NUSANTARA TAMBANG ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(635, '8210-01-0627', 'P.T BUREAU VERITAS INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(636, '8210-01-0628', 'P.T WIJAYA ENGINDO NUSA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(637, '8210-01-0629', 'P.T SANTOS PREMIUM KRIMER', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(638, '8210-01-0630', 'PETRONAS CARIGALI KETAPANG II LTD', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(639, '8210-01-0631', 'P.T BANK DBS INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(640, '8210-01-0632', 'RS REKSA WALUYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(641, '8210-01-0633', 'RSIA LOMBOK DUA DUA LONTAR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(642, '8210-01-0634', 'RSU DR. WAHIDIN SUDIRO HUSODO MOJOKERTO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(643, '8210-01-0635', 'ADIRA FINANCE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(644, '8210-01-0636', 'P.T PLN UIT JBTB', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(645, '8210-01-0637', 'RS.AISYIYAH SITI FATIMAH TULANGAN SIDOARJO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(646, '8210-01-0638', 'RSU.DR.MOEDJITO DWIDJOSISWONO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(647, '8210-01-0639', 'YAKES TELKOM', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(648, '8210-01-0640', 'PT. Bank Negara Indonesia Tbk / KANTOR CABANG GRAHA PANGERAN SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(649, '8210-01-0641', 'P.T PLN (PERSERO) UNIT INDUK TRANSMISI JAWA BAGIAN TIMUR DAN BALI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(650, '8210-01-0642', 'BFI FINANCE INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(651, '8210-01-0643', 'P.T SHICHIYO MERGONOTO MAKMUR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(652, '8210-01-0644', 'P.T AGAPE BIOMEDI INVESTAMA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(653, '8210-01-0645', 'P.T SHARP ELECTRONIC INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(654, '8210-01-0646', 'ZEST HOTEL INTERNATIONAL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(655, '8210-01-0647', 'P.T RADIO SUARA SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(656, '8210-01-0648', 'RSIA LOMBOK DUA DUA FLORES', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(657, '8210-01-0649', 'P.T Integra Indocabinet', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(658, '8210-01-0650', 'P.T Yale Woodpellet Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(659, '8210-01-0651', 'PT. Mandiri Utama Finance ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(660, '8210-01-0652', 'CV.LITERA JANNATA PERKASA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(661, '8210-01-0653', 'P.T MEDQUEST JAYA GLOBAL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(662, '8210-01-0654', 'PLN PUSERTIF', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(663, '8210-01-0655', 'YAYASAN INTAN EDUKA', '0', 'Jl. Raya Kedung Baruk No. 112 – 114 Surabaya.', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(664, '8210-01-0656', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR - JL.MASTRIP NO 70 BOJONEGORO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(665, '8210-01-0657', 'IPAY88', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(666, '8210-01-0658', 'P.T KALIMANTAN PRIMA PERSADA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(667, '8210-01-0659', 'P.T SURABAYA INDUSTRIAL ESTATE RUNGKUR / SIER', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(668, '8210-01-0660', 'P.T CIPTA SAMUDRA SHIPPING LINE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(669, '8210-01-0661', 'PLN KANTOR PUSAT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(670, '8210-01-0662', 'P.T MITRA PINASTHIKA MULIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(671, '8210-01-0663', 'LABORATORIUM KLINIK WESTERINDO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(672, '8210-01-0664', 'PT Mandiri AXA General Insurance - FULLERTON HEALTH INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(673, '8210-01-0665', 'PLN UIW NTT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(674, '8210-01-0666', 'PT.PLN UNIT INDUK PEMBANGUNAN JAWA BAGIAN TIMUR DAN BALI 1/ PLN UIP JBTB 1', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(675, '8210-01-0667', 'PT.PLN UNIT INDUK PEMBANGUNAN JAWA BAGIAN TIMUR DAN BALI 2/PLN UIP JBTB 2', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(676, '8210-01-0668', 'RS.PRIMA HUSADA SUKOREJO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(677, '8210-01-0669', 'P.T YAMAHA INDONESIA MOTOR MANUFACTURING', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(678, '8210-01-0670', 'P.T PLN (PERSERO) UNIT INDUK DISTRIBUSI JAWA TIMUR - ADMEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(679, '8210-01-0671', 'P.T CIPTA WIRA TIRTA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(680, '8210-01-0672', 'RS CITRA MEDIKA SIDOARJO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(681, '8210-01-0673', 'COLLINSON', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(682, '8210-01-0674', 'RS WILLIAM BOOTH SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(683, '8210-01-0675', 'KLINIK MITRA PRIMA CARE ( MPC )', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(684, '8210-01-0676', 'PLN UID JATENG & DIY', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(685, '8210-01-0677', 'PLN UIT JBT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(686, '8210-01-0678', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR - CABANG SIDOARJO', '0', 'JL.A.YANI NO 29 SIDOARJO', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(687, '8210-01-0679', 'Bank Pembangunan Daerah JATIM Devisi Human Capital', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(688, '8210-01-0680', 'Bank Pembangunan Daerah Jawa Timur Tbk Cab. Jember', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(689, '8210-01-0681', 'RS.PRIMA HUSADA SUKOREJO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(690, '8210-01-0682', 'Implora Sukses Abadi', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(691, '8210-01-0683', 'ATMORA TEKNIK MAKMUR , P.T', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(692, '8210-01-0684', 'ALLIANZ (HALODOC)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(693, '8210-01-0685', 'PT Kresna Insurance- DIH Asuransi Mitra Maparya ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(694, '8210-01-0686', 'SAMUDRA MAHKOTA BEACH', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(695, '8210-01-0687', 'RS. RIZANI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(696, '8210-01-0688', 'DUTABUDI TELUSUREJO GROUP', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(697, '8210-01-0689', 'KLINIK SENTRA MEDIKA SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(698, '8210-01-0690', 'KRESNA INSURANCE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(699, '8210-01-0691', 'PLN PUSHARLIS', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(700, '8210-01-0692', 'CAHAYA DIAGNOSTIC CENTRE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(701, '8210-01-0693', 'PLN Pusat Manajemen Proyek, PT (PLN PUSMANPRO)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(702, '8210-01-0694', 'KLINIK TIRTA MEDICAL CENTRE SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(703, '8210-01-0695', 'GREAT EASTERN LIFE INDONESIA , P.T - Fullerton Health Indonesia', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(704, '8210-01-0696', 'GLOBAL GENETIKA INDONESIA,P.T', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(705, '8210-01-0697', 'Bank Tabungan Negara Cabang Panglima Sudirman Kantor Wilayah 3 Surabaya', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(706, '8210-01-0698', 'P.T INDOFOOD CBP SUKSES MAKMUR TBK. DIVISI MI CAB.JAWA TIMUR', '0', 'JL. RAYA CANGKRINGMALANG KM 32 BEJI-PASURUAN', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(707, '8210-01-0699', 'PLN UIT JBB', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(708, '8210-01-0700', 'BINA NUSANTARA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(709, '8210-01-0701', 'P.T SASA INTI GENDING', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(710, '8210-01-0702', 'PLN UP3 PASURUAN', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(711, '8210-01-0703', 'P.T MUSTIKA SEMBULUH', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(712, '8210-01-0704', 'P.T KERRY SAWIT INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(713, '8210-01-0705', 'P.T SARANA TITIAN PERMATA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(714, '8210-01-0706', 'P.T BUMI SAWIT KENCANA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(715, '8210-01-0707', 'P.T MENTAYA SAWIT MAS', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(716, '8210-01-0708', 'P.T KARUNIA KENCANA PERMAISEJATI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(717, '8210-01-0709', 'P.T RIMBA HARAPAN SAKTI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(718, '8210-01-0710', 'MANULIFE', '0', 'JL JEND. SUDIRMAN KAV 45-46 JKT 12930, SOUTH TOWER 3RD - 17 TH FLOOR, SAMPOERNA STRATEGIC SQUARE', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(719, '8210-01-0711', 'AUSTRALIA EMBASSY (KEDUTAAN AUSTRALIA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(720, '8210-01-0712', 'PANIN DAI-ICHILIFE (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(721, '8210-01-0713', 'P.T MATAHARI PUTRA MAKMUR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(722, '8210-01-0714', 'RUMAH SAKIT IBU DAN ANAK KENDANGSARI SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(723, '8210-01-0715', 'P.T PERSADA UTAMA GLOBALINDO (TRILLIUN GROUP)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(724, '8210-01-0716', 'P.T ADIWISESA MANDIRI BUILDING PRODUCTS INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(725, '8210-01-0717', 'P.T INDOMARCO ADI PRIMA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(726, '8210-01-0718', 'PLN UID BALI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(727, '8210-01-0719', 'PLN PUSDIKLAT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(728, '8210-01-0720', 'Group Wilmar International Plantation', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(729, '8210-01-0721', 'Kita Bisa', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(730, '8210-01-0722', 'PLN UIW NTB', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(731, '8210-01-0723', 'P.T PELINDO PROPERTI INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(732, '8210-01-0724', 'PHE TBN', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(733, '8210-01-0725', 'P.T INDONESIA POWER SEMARANG', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(734, '8210-01-0726', 'P.T JASAMARGA GEMPOL PASURUAN', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(735, '8210-01-0727', 'PLN UIW KALTIMRA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(736, '8210-01-0728', 'P.T JAWA POWER', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(737, '8210-01-0729', 'PT. Fuse Internasional Teknologi', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(738, '8210-01-0730', 'PT. HSE Intertek', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(739, '8210-01-0731', 'Greenfields Dairy Indonesia, PT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(740, '8210-01-0732', 'PLN UIP2B', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(741, '8210-01-0733', 'SKK MIGAS PERWAKILAN JABANUSA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(742, '8210-01-0734', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR , TBK UNIT USAHA SYARIAH', '0', 'JL.BASUKI RAKHMAD NO 57 SURABAYA', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(743, '8210-01-0735', 'PLN UIP JBTB ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(744, '8210-01-0736', 'BANK TABUNGAN NEGARA CABANG MULYOSARI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(745, '8210-01-0737', 'KLINIK MEDSA (P.T MEDIKA PRAKARSA INDONESIA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(746, '8210-01-0738', 'P.T ANUGERAH ARGON MEDICA (AAM)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(747, '8210-01-0739', 'P.T BPD KALTIM KALTARA KANTOR CABANG TANJUNG SELOR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(748, '8210-01-0740', 'YAKES PERTAMINA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(749, '8210-01-0741', 'P.T PLN (PERSERO) UNIT INDUK DISTRIBUSI JAWA BARAT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(750, '8210-01-0742', 'P.T MERGONOTO INVESTAMA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(751, '8210-01-0743', 'P.T JIREH MAKMUR PERSADA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(752, '8210-01-0744', 'SWISS-BELINN TUNJUNGAN SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(753, '8210-01-0745', 'PT. SADHANA ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(754, '8210-01-0746', 'PT. ESA SARWAGUNA ADINATA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(755, '8210-01-0747', 'PT. SADHANA ARIFNUSA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(756, '8210-01-0748', 'PT. ESA SAMPOERNA ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(757, '8210-01-0749', 'P.T SINAR UNIGRAIN INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(758, '8210-01-0750', 'P.T SINAR PANGAN ABADI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(759, '8210-01-0751', 'P.T WIDYA KENCANA LESTARI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(760, '8210-01-0752', 'P.T SURABAYA PELLETING COMPANY', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(761, '8210-01-0753', 'P.T INTI SEMESTA LESTARI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(762, '8210-01-0754', 'P.T ANEKAKARYA YUNDARZAH', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(763, '8210-01-0755', 'P.T SINAR AGRO GEMILANG INDAH', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(764, '8210-01-0756', 'LALISA HOTEL SURABAYA (P.T GRAHA TIRTAYU)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(765, '8210-01-0757', 'P.T ADI SAMPOERNA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(766, '8210-01-0758', 'P.T BHRAMARA ESA ANOSAMA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(767, '8210-01-0759', 'P.T EKTA PANGAN INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(768, '8210-01-0760', 'P.T PETRO ONE INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(769, '8210-01-0761', 'P.T SEKAR BUMI TBK.', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(770, '8210-01-0762', 'P.T TRILIUN PRIMA SUKSES', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(771, '8210-01-0763', 'P.T PLN UIW SULUTTENGGO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(772, '8210-01-0764', 'ASURANSI ADIRA MEDICILLIN (P.T JAVA SMARTINDO)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(773, '8210-01-0765', 'CV. CIPTA MEGAH KREASI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(774, '8210-01-0766', 'Angler BioChemLab, PT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(775, '8210-01-0767', 'KLINIK UTAMA & LAB SAYANG DIAGNOSTIC CENTER', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(776, '8210-01-0768', 'PT. Cakrawala Proteksi Indonesia (Admedika) ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(777, '8210-01-0769', 'P.T JASA MARGA (PERSERO) TBK.', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(778, '8210-01-0769', 'P.T JASA MARGA (PERSERO) TBK. (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(779, '8210-01-0770', 'P.T TEMAS SHIPPING', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(780, '8210-01-0771', 'PT.Indonesia Comnets Plus (Icon Plus)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(781, '8210-01-0772', 'PT Indonesia Kendaraan Terminal Tbk (IKT) (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(782, '8210-01-0773', 'MAGI Partial (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(783, '8210-01-0774', 'P.T REKAYASA INDUSTRI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(784, '8210-01-0775', 'CV SINAR TERANG', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(785, '8210-01-0776', 'Indonesia Medical Tourism Board', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(786, '8210-01-0777', 'PLN UIW KALSELTENG , P.T', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(787, '8210-01-0778', 'PT. Jasa Marga (PERSERO) Tbk Human Capital Services', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21');
INSERT INTO `insurances` (`id`, `no_va`, `name`, `status`, `alamat`, `description`, `created_at`, `updated_at`) VALUES
(788, '8210-01-0779', 'P.T PLN UIW MMU', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(789, '8210-01-0780', 'P.T SINAR ANEKA NIAGA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(790, '8210-01-0781', 'P.T CIPTA TERANG UNGGUL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(791, '8210-01-0782', 'BANK DKI - KANTOR CABANG VETERAN GRESIK', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(792, '8210-01-0783', 'Zurich Medicilin (PT. Zurich Asuransi Indonesia) - Admedika', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(793, '8210-01-0784', 'P.T INDONESIA FAR EAST OIL DRILLING ENGINEERING', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(794, '8210-01-0785', 'P.T ADIDAS SOURCING LIMITED', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(795, '8210-01-0786', 'AUSTRALIAN CONSULATE GENERAL SURABAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(796, '8210-01-0787', 'KSK Insurance - Admedika', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(797, '8210-01-0788', 'P.T ANUGERAH CAHAYA SEJAHTERA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(798, '8210-01-0789', 'P.T PAITON ENERGY', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(799, '8210-01-0790', 'YAYASAN BINA SEJAHTERA WARGA BULOG', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(800, '8210-01-0791', 'PT. RAKA SANDY ONEARINDO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(801, '8210-01-0792', 'PT PGN LNG Indonesia (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(802, '8210-01-0793', 'Waluyo Jati', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(803, '8210-01-0794', 'P.T PHILIPS INDONESIA COMMERCIAL (HALODOC)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(804, '8210-01-0795', 'PLN UID JAYA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(805, '8210-01-0796', 'PLN UIW KALBAR', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(806, '8210-01-0797', 'P.T BIO FARMA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(807, '8210-01-0798', 'Victoria Insurance (Admedika)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(808, '8210-01-0799', 'P.T PHILIPS DOMESTIC APPLIANCES (HALODOC)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(809, '8210-01-0800', 'PLN UIW Sulserabar', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(810, '8210-01-0801', 'P.T PLN UIP NUSRA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(811, '8210-01-0802', 'P.T PLN UIW P2B', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(812, '8210-01-0803', 'PT PJB UBJOM PLTU TENAYAN', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(813, '8210-01-0804', 'ASURANSI  MAXIMUS GRAHA PERSADA TBK.', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(814, '8210-01-0805', 'P.T CITRA MEDIA NUSA PURNAMA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(815, '8210-01-0806', 'PRISMA - P.T PALLADIUM INTERNATIONAL INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(816, '8210-01-0807', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR CABANG HR MUHAMMAD', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(817, '8210-01-0808', 'JOB PERTAMINA - MEDCO E&P TOMORI SULAWESI', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(818, '8210-01-0809', 'PT. ASURANSI JIWA ASTRA (ADMEDIKA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(819, '8210-01-0810', 'P.T BANK PEMBANGUNAN DAERAH JAWA TIMUR KANTOR CABANG UTAMA SBY', '0', ' JL BASUKI RAHMAT NO 98-104 SURABAYA', NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(820, '8210-01-0811', 'PLN UIW S2JB', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(821, '8210-01-0812', 'P.T PLN UNIT INDUK DISTRIBUSI JAWA BARAT', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(822, '8210-01-0813', 'CSUL FINANCE', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(823, '8210-01-0814', 'P.T PHAPROS TBK.', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(824, '8210-01-0815', 'P.T ANDALAN YASA MITRA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(825, '8210-01-0816', 'P.T TUNAS INDO LANGGENG', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(826, '8210-01-0817', 'P.T MULTI NATURA FARMINDO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(827, '8210-01-0818', 'P.T INDO HARAPAN SENTOSA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(828, '8210-01-0819', 'P.T PERTAMINA INTERNATIONAL SHIPPING (PIS) - ADMEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(829, '8210-01-0820', 'PT Lippo Life Assurance ', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(830, '8210-01-0821', 'P.T ACCELBYTE TEKNOLOGI INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(831, '8210-01-0822', 'P.T PLN UIP SULBAGSEL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(832, '8210-01-0823', 'PLN INSURANCE (ASURANSI PERISAI LISTRIK NASIONAL)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(833, '8210-01-0824', 'P.T AZP SERVICES INDONESIA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(834, '8210-01-0825', 'P.T PERTAMINA EP', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(835, '8210-01-0826', 'P.T PETROSEA TBK.', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(836, '8210-01-0827', 'PLN UIP3BS', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(837, '8210-01-0828', 'P.T BANK TABUNGAN NEGARA (PERSERO) TBK. - CAB. SIDOARJO', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(838, '8210-01-0829', 'ILGKSK - ADMEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(839, '8210-01-0830', 'KANMO GROUP (HALODOC)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(840, '8210-01-0831', 'P4MU (PERHIMPUNAN PERAWATAN PENDERITA PENYAKIT MATA UNDAAN)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(841, '8210-01-0832', 'P.T SEJAHTERA ABADI SOLUSI (MAYAPADA HOSPITAL SURABAYA)', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(842, '8210-01-0833', 'PERTAMINA TRANS KONTINENTAL', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21'),
(843, '8210-01-0834', 'MRT JAKARTA - ADMEDIKA', '0', NULL, NULL, '2022-08-22 00:08:21', '2022-08-22 00:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_08_094907_requests', 1),
(6, '2022_06_09_021641_request_progress', 1),
(10, '2022_06_29_090635_receipt', 2),
(13, '2022_06_09_035325_insurances', 3),
(15, '2022_08_19_083539_discounts', 4),
(16, '2022_09_08_022502_prices', 5),
(17, '2022_09_13_030524_resi', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `legalisir_price` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_started` date NOT NULL,
  `date_ended` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `legalisir_price`, `user_id`, `date_started`, `date_ended`, `status`, `created_at`, `updated_at`) VALUES
(1, 250000, '1', '2022-09-09', NULL, '1', '2022-09-09 01:18:46', '2022-09-11 21:46:37'),
(2, 250000, '1', '2022-09-09', NULL, '1', '2022-09-09 01:18:46', '2022-09-11 21:46:37'),
(3, 300000, '1', '2022-09-12', NULL, '0', '2022-09-11 21:46:37', '2022-09-11 21:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_receipt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical_record` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount` int(10) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_pengobatan` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`id`, `no_receipt`, `medical_record`, `episode`, `nama_pasien`, `price`, `discount`, `user_name`, `penjamin`, `date_pengobatan`, `created_at`, `updated_at`) VALUES
(1, 'MH-001/07/2022', '87654343431', 'I9012382', 'Fikrii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-03', '2022-07-07 02:52:07', '2022-07-07 02:52:07'),
(2, 'MH-002/07/2022', '87654343431', 'I9012382', 'Fikrii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-03', '2022-07-07 02:53:22', '2022-07-07 02:53:22'),
(3, 'MH-003/07/2022', '87654343431', 'I9012382', 'Fikrii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-03', '2022-07-07 02:53:49', '2022-07-07 02:53:49'),
(4, 'MH-004/07/2022', '87654343431', 'I9012382', 'Fikrii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-03', '2022-07-07 02:54:08', '2022-07-07 02:54:08'),
(5, 'MH-005/07/2022', '87654343431', 'I9012382', 'Fikrii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-03', '2022-07-07 02:54:16', '2022-07-07 02:54:16'),
(6, 'MH-006/07/2022', '87654343431', 'I9012382', 'Fikrii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-03', '2022-07-07 02:54:29', '2022-07-07 02:54:29'),
(7, 'MH-007/07/2022', '87654343431', '0923kwesdks43', 'Asdddd', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-08', '2022-07-07 02:57:45', '2022-07-07 02:57:45'),
(8, 'MH-008/07/2022', '87654343431', 'I9012820', 'Rendiii', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-06', '2022-07-07 18:38:02', '2022-07-07 18:38:02'),
(9, 'MH-009/07/2022', '876543434332', 'I9012382', 'Frederick', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-09', '2022-07-07 18:40:06', '2022-07-07 18:40:06'),
(10, 'MH-10/07/2022', '87654343431', 'I9012382', 'pikri', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-27', '2022-07-07 19:21:13', '2022-07-07 19:21:13'),
(11, 'MH-011/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 1, 'fikri im', 'PT AIA', '2022-07-06', '2022-07-07 21:26:05', '2022-07-07 21:26:05'),
(12, 'MH-012/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 1, 'fikri im', 'PT AIA', '2022-07-06', '2022-07-07 21:26:31', '2022-07-07 21:26:31'),
(13, 'MH-013/07/2022', '87654343431', 'I9012382', 'Revi', 10000000, 3, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-07 23:05:51', '2022-07-07 23:05:51'),
(14, 'MH-014/07/2022', '876543434332', '0923kwesdks32', 'Rona', 1000000, 2, 'fikri im', 'PT AIA', '2022-07-06', '2022-07-07 23:07:52', '2022-07-07 23:07:52'),
(15, 'MH-015/07/2022', '8765434343', '0923kwesdks', 'Asdddd', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-09', '2022-07-07 23:14:42', '2022-07-07 23:14:42'),
(16, 'MH-016/07/2022', '8765434343', '0923kwesdks', 'Asdddd', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-07 23:16:58', '2022-07-07 23:16:58'),
(17, 'MH-017/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-12', '2022-07-08 00:15:19', '2022-07-08 00:15:19'),
(18, 'MH-018/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-12', '2022-07-08 00:15:36', '2022-07-08 00:15:36'),
(19, 'MH-019/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-12', '2022-07-08 00:17:33', '2022-07-08 00:17:33'),
(20, 'MH-020/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 1, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 00:49:44', '2022-07-08 00:49:44'),
(21, 'MH-021/07/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-08 00:59:07', '2022-07-08 00:59:07'),
(22, 'MH-022/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 01:17:33', '2022-07-08 01:17:33'),
(23, 'MH-023/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 01:18:07', '2022-07-08 01:18:07'),
(24, 'MH-024/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 01:19:52', '2022-07-08 01:19:52'),
(25, 'MH-025/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 01:21:20', '2022-07-08 01:21:20'),
(26, 'MH-026/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 02:00:23', '2022-07-08 02:00:23'),
(27, 'MH-027/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 02:09:53', '2022-07-08 02:09:53'),
(28, 'MH-028/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 02:10:09', '2022-07-08 02:10:09'),
(29, 'MH-029/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 02:10:56', '2022-07-08 02:10:56'),
(30, 'MH-030/07/2022', '8765434343', '0923kwesdks', 'Fikriimmms', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-07', '2022-07-08 02:12:08', '2022-07-08 02:12:08'),
(31, 'MH-031/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 1, 'fikri im', 'PT AIA', '2022-07-10', '2022-07-11 18:52:16', '2022-07-11 18:52:16'),
(32, 'MH-032/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 19:10:25', '2022-07-11 19:10:25'),
(33, 'MH-033/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 19:10:32', '2022-07-11 19:10:32'),
(34, 'MH-034/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 19:14:04', '2022-07-11 19:14:04'),
(35, 'MH-035/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 19:28:17', '2022-07-11 19:28:17'),
(36, 'MH-036/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 19:36:09', '2022-07-11 19:36:09'),
(37, 'MH-037/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 19:37:36', '2022-07-11 19:37:36'),
(38, 'MH-038/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 20:14:35', '2022-07-11 20:14:35'),
(39, 'MH-039/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 20:17:24', '2022-07-11 20:17:24'),
(40, 'MH-040/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 20:17:37', '2022-07-11 20:17:37'),
(41, 'MH-041/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 21:22:04', '2022-07-11 21:22:04'),
(42, 'MH-042/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 21:22:55', '2022-07-11 21:22:55'),
(43, 'MH-043/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 21:25:31', '2022-07-11 21:25:31'),
(44, 'MH-044/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 22:25:17', '2022-07-11 22:25:17'),
(45, 'MH-045/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 22:25:32', '2022-07-11 22:25:32'),
(46, 'MH-046/07/2022', '8765434343', 'I9012382', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-11', '2022-07-11 23:21:01', '2022-07-11 23:21:01'),
(47, 'MH-047/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-10', '2022-07-12 02:26:41', '2022-07-12 02:26:41'),
(48, 'MH-048/07/2022', '87654343431', '0923kwesdks', 'andri', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 18:46:44', '2022-07-13 18:46:44'),
(49, 'MH-049/07/2022', '87654343431', '0923kwesdks', 'Mole', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 18:52:07', '2022-07-13 18:52:07'),
(50, 'MH-050/07/2022', '8765434343', 'I9012382', 'dead rabbit', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 19:01:36', '2022-07-13 19:01:36'),
(51, 'MH-051/07/2022', '8765434343', 'I9012382', 'dead rabbit', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 19:02:29', '2022-07-13 19:02:29'),
(52, 'MH-052/07/2022', '8765434343', 'I9012382', 'dead rabbit', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 19:16:50', '2022-07-13 19:16:50'),
(53, 'MH-053/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:06:42', '2022-07-13 21:06:42'),
(54, 'MH-054/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:13:39', '2022-07-13 21:13:39'),
(55, 'MH-055/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:15:32', '2022-07-13 21:15:32'),
(56, 'MH-056/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:16:48', '2022-07-13 21:16:48'),
(57, 'MH-057/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:17:58', '2022-07-13 21:17:58'),
(58, 'MH-058/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:20:17', '2022-07-13 21:20:17'),
(59, 'MH-059/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 105900, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-13 21:21:27', '2022-07-13 21:21:27'),
(60, 'MH-060/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:07:36', '2022-07-14 00:07:36'),
(61, 'MH-061/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:09:01', '2022-07-14 00:09:01'),
(62, 'MH-062/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:12:10', '2022-07-14 00:12:10'),
(63, 'MH-063/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:13:16', '2022-07-14 00:13:16'),
(64, 'MH-064/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:14:13', '2022-07-14 00:14:13'),
(65, 'MH-065/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:15:42', '2022-07-14 00:15:42'),
(66, 'MH-066/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:16:24', '2022-07-14 00:16:24'),
(67, 'MH-067/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:17:52', '2022-07-14 00:17:52'),
(68, 'MH-068/07/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-07-13', '2022-07-14 00:18:17', '2022-07-14 00:18:17'),
(69, 'MH-069/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-01', '2022-08-02 02:48:08', '2022-08-02 02:48:08'),
(70, 'MH-070/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:48:15', '2022-08-12 00:48:15'),
(71, 'MH-071/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:49:02', '2022-08-12 00:49:02'),
(72, 'MH-072/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:50:53', '2022-08-12 00:50:53'),
(73, 'MH-073/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:51:11', '2022-08-12 00:51:11'),
(74, 'MH-074/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:51:35', '2022-08-12 00:51:35'),
(75, 'MH-075/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:51:43', '2022-08-12 00:51:43'),
(76, 'MH-076/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 00:58:45', '2022-08-12 00:58:45'),
(77, 'MH-077/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 01:10:25', '2022-08-12 01:10:25'),
(78, 'MH-078/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 01:12:32', '2022-08-12 01:12:32'),
(79, 'MH-079/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 01:22:02', '2022-08-12 01:22:02'),
(80, 'MH-080/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 01:29:42', '2022-08-12 01:29:42'),
(81, 'MH-081/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 01:58:12', '2022-08-12 01:58:12'),
(82, 'MH-082/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 01:58:17', '2022-08-12 01:58:17'),
(83, 'MH-083/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-13', '2022-08-12 02:03:45', '2022-08-12 02:03:45'),
(84, 'MH-084/08/2022', '87654343431', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-12', '2022-08-12 02:04:16', '2022-08-12 02:04:16'),
(85, 'MH-085/08/2022', '87654343431', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-12', '2022-08-12 02:05:29', '2022-08-12 02:05:29'),
(86, 'MH-086/08/2022', '87654343431', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-12', '2022-08-12 02:05:45', '2022-08-12 02:05:45'),
(87, 'MH-087/08/2022', '87654343431', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-12', '2022-08-12 02:15:52', '2022-08-12 02:15:52'),
(88, 'MH-088/08/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-11', '2022-08-12 02:17:41', '2022-08-12 02:17:41'),
(89, 'MH-089/08/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-11', '2022-08-12 02:18:53', '2022-08-12 02:18:53'),
(90, 'MH-090/08/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-11', '2022-08-12 02:18:58', '2022-08-12 02:18:58'),
(91, 'MH-091/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:30:51', '2022-08-12 02:30:51'),
(92, 'MH-092/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:31:31', '2022-08-12 02:31:31'),
(93, 'MH-093/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:31:36', '2022-08-12 02:31:36'),
(94, 'MH-094/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:31:57', '2022-08-12 02:31:57'),
(95, 'MH-095/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:32:01', '2022-08-12 02:32:01'),
(96, 'MH-096/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:39:00', '2022-08-12 02:39:00'),
(97, 'MH-097/08/2022', '876543434332', 'I9012382', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-18', '2022-08-12 02:39:10', '2022-08-12 02:39:10'),
(98, 'MH-098/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-17', '2022-08-12 02:57:33', '2022-08-12 02:57:33'),
(99, 'MH-099/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'PT AIA', '2022-08-16', '2022-08-14 18:42:17', '2022-08-14 18:42:17'),
(100, 'MH-100/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'Asuransi Bersahabat', '2022-08-14', '2022-08-14 20:21:39', '2022-08-14 20:21:39'),
(101, 'MH-101/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-24', '2022-08-14 20:29:36', '2022-08-14 20:29:36'),
(102, 'MH-102/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-24', '2022-08-14 21:18:58', '2022-08-14 21:18:58'),
(103, 'MH-103/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-24', '2022-08-14 21:28:35', '2022-08-14 21:28:35'),
(104, 'MH-104/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'BNN', '2022-08-16', '2022-08-14 21:28:56', '2022-08-14 21:28:56'),
(105, 'MH-105/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'BNN', '2022-08-16', '2022-08-14 22:06:35', '2022-08-14 22:06:35'),
(106, 'MH-106/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'Asuransi Bersahabat', '2022-08-10', '2022-08-14 23:24:13', '2022-08-14 23:24:13'),
(107, 'MH-107/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'Asuransi Bersahabat', '2022-08-10', '2022-08-14 23:25:11', '2022-08-14 23:25:11'),
(108, 'MH-108/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'Asuransi Bersahabat', '2022-08-10', '2022-08-14 23:31:24', '2022-08-14 23:31:24'),
(109, 'MH-109/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'Asuransi Bersahabat', '2022-08-10', '2022-08-14 23:33:44', '2022-08-14 23:33:44'),
(110, 'MH-110/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'Asuransi Bersahabat', '2022-08-10', '2022-08-14 23:34:08', '2022-08-14 23:34:08'),
(111, 'MH-111/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-16', '2022-08-14 23:46:11', '2022-08-14 23:46:11'),
(112, 'MH-112/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-16', '2022-08-14 23:51:47', '2022-08-14 23:51:47'),
(113, 'MH-113/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-16', '2022-08-15 00:20:58', '2022-08-15 00:20:58'),
(114, 'MH-114/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'AIA', '2022-08-16', '2022-08-15 00:22:13', '2022-08-15 00:22:13'),
(115, 'MH-115/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'BNN', '2022-08-16', '2022-08-15 00:28:33', '2022-08-15 00:28:33'),
(116, 'MH-116/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'BNN', '2022-08-16', '2022-08-15 00:41:05', '2022-08-15 00:41:05'),
(117, 'MH-117/08/2022', '876543434332', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'BPJS', '2022-08-16', '2022-08-15 00:42:08', '2022-08-15 00:42:08'),
(118, 'MH-118/08/2022', '876543434332', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'BPJS', '2022-08-16', '2022-08-15 00:45:13', '2022-08-15 00:45:13'),
(119, 'MH-119/08/2022', '87654343431', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'fikri im', 'FWD Insurance', '2022-08-16', '2022-08-15 00:45:38', '2022-08-15 00:45:38'),
(120, 'MH-120/08/2022', '8765434343', '0923kwesdks', 'Asdddd', 10000000, 2, 'cs', 'AIA', '2022-08-14', '2022-08-15 01:36:11', '2022-08-15 01:36:11'),
(121, 'MH-121/08/2022', '8765434343', '0923kwesdks', 'Nitrous', 10000000, 2, 'cs', 'AIA', '2022-08-16', '2022-08-15 01:45:51', '2022-08-15 01:45:51'),
(122, 'MH-122/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 01:57:18', '2022-08-15 01:57:18'),
(123, 'MH-123/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:22:46', '2022-08-15 02:22:46'),
(124, 'MH-124/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:22:50', '2022-08-15 02:22:50'),
(125, 'MH-125/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:25:05', '2022-08-15 02:25:05'),
(126, 'MH-126/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:25:18', '2022-08-15 02:25:18'),
(127, 'MH-127/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:25:26', '2022-08-15 02:25:26'),
(128, 'MH-128/08/2022', '8765434343', 'I9012382', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:26:05', '2022-08-15 02:26:05'),
(129, 'MH-129/08/2022', '87654343431', '0923kwesdks43', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:45:27', '2022-08-15 02:45:27'),
(130, 'MH-130/08/2022', '87654343431', '0923kwesdks43', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:45:50', '2022-08-15 02:45:50'),
(131, 'MH-131/08/2022', '87654343431', '0923kwesdks43', 'Nitrous', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-16', '2022-08-15 02:53:24', '2022-08-15 02:53:24'),
(132, 'MH-132/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-17', '2022-08-15 18:36:49', '2022-08-15 18:36:49'),
(133, 'MH-133/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-17', '2022-08-15 18:42:39', '2022-08-15 18:42:39'),
(134, 'MH-134/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 10000000, 2, 'cs', 'FWD Insurance', '2022-08-17', '2022-08-15 18:53:17', '2022-08-15 18:53:17'),
(135, 'MH-135/08/2022', '8765434343', '0923kwesdks', 'Fikriimmm', 21474836470000, 2, 'cs', 'FWD Insurance', '2022-08-17', '2022-08-15 19:10:11', '2022-08-15 19:10:11'),
(136, 'MH-136/08/2022', 'adasd', 'I9012382', 'M Fikri Imadudin Masyhuri', 105900, 2, 'fikri im', 'Asuransi Bersahabat', '2022-12-08', '2022-08-16 00:14:57', '2022-08-16 00:14:57'),
(137, 'MH-137/11/2022', '8765434343', 'I9012382', 'Fikrii', 10000000, 2, 'user', 'ABDA Insurance', '2022-11-22', '2022-11-21 23:30:08', '2022-11-21 23:30:08'),
(138, 'MH-138/11/2022', '8765434343', 'I9012382', 'Asdddd', 10000000, 2, 'kwitansi', 'ABDA Insurance', '2022-11-24', '2022-11-23 20:47:42', '2022-11-23 20:47:42'),
(139, 'MH-139/11/2022', '87654343431', 'I9012382', 'Fikriimmms', 10000000, 2, 'kwitansi', 'ABDA Insurance', '2022-11-24', '2022-11-23 21:40:22', '2022-11-23 21:40:22'),
(140, 'MH-140/11/2022', '8765434343', '0923kwesdks43', 'Fikrii', 10000000, 2, 'kwitansi', 'ABDA Insurance', '2022-11-24', '2022-11-23 22:13:28', '2022-11-23 22:13:28'),
(141, 'MH-141/11/2022', '8765434343', '0923kwesdks43', 'Fikrii', 10000000, 2, 'kwitansi', 'ABDA Insurance', '2022-11-24', '2022-11-23 23:39:15', '2022-11-23 23:39:15'),
(142, 'MH-142/11/2022', '8765434343', '0923kwesdks43', 'Fikrii', 10000000, 2, 'kwitansi', 'ABDA Insurance', '2022-11-24', '2022-11-24 01:19:19', '2022-11-24 01:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_patient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `date_medicine` date NOT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `episode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurance_set` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_payment` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_payment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_taker` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_kk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_medicine` int(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `request_name`, `request_email`, `request_patient`, `request_phone`, `birthday`, `date_medicine`, `insurance`, `episode`, `insurance_set`, `total_price`, `status`, `status_payment`, `photo_payment`, `photo_taker`, `photo_ktp`, `photo_kk`, `price_medicine`, `created_at`, `updated_at`) VALUES
(1, 'Ebo', 'ebo@gmail.com', 'Fikri Im', '081232499785', '2013-05-01', '2022-06-15', 'ABDA Insurance', 'trre AIA', 3, 750000, '0', '1', 'americano.jpeg', '08-40_KFC_Logo.png', 'sushialmo.jpg', NULL, NULL, '2022-05-04 18:24:14', '2022-08-05 01:26:48'),
(2, 'Eri', 'eri@gmail.com', 'Rendi', '08239218349', '2013-05-01', '2022-06-15', 'Badak NGL', 'trre BPJS', 3, 750000, '1', '1', 'americano.jpeg', 'happymeal.png', 'tehpoci.jpg', NULL, NULL, '2022-05-26 18:24:14', '2022-08-05 02:25:28'),
(3, 'Upin', 'upin@gmail.com', 'Rajoot', '082938217892', '2013-05-01', '2022-06-15', 'Badak NGL', 'trre BPJS', 3, 750000, '3', '1', 'americano.jpeg', NULL, NULL, NULL, NULL, '2022-06-19 18:24:14', '2022-06-28 23:09:31'),
(4, 'Eri Ora', 'fff@gsd.com', 'Rizad', '0823923828324', '2021-07-10', '2022-05-24', 'ABDA Insurance', '238sdsdhw82', 3, 500000, '0', '1', 'frappuccino.jpg', NULL, NULL, NULL, NULL, '2022-06-19 18:24:14', '2022-06-28 20:08:10'),
(5, 'Irawan', 'fff@gsd.com', 'Cendy', '0823923828324', '2021-07-10', '2022-05-24', 'ABDA Insurance', '2309sklsdk', 2, 500000, '0', '0', '', NULL, NULL, NULL, NULL, '2022-06-19 18:25:46', '2022-06-28 19:52:03'),
(6, 'Dodi', 'fff@gsd.com', 'Brando', '0823923828324', '2021-07-10', '2022-05-24', 'ABDA Insurance', '239mkwe', 2, 500000, '3', '1', 'frappuccino.jpg', 'alacarte.png', NULL, NULL, NULL, '2022-06-19 18:26:01', '2022-06-29 00:20:30'),
(7, 'Resin', 'resin@gmail.com', 'Fragile', '08293127832', '2000-11-01', '2022-04-02', 'ABDA Insurance', '0923kwesdks', 2, 500000, '2', '1', 'frappuccino.jpg', '', NULL, NULL, NULL, '2022-06-19 19:57:58', '2022-06-19 19:57:58'),
(8, 'Resin', 'resin@gmail.com', 'Rio', '08293127832', '2000-11-01', '2022-04-02', 'ABDA Insurance', '0923kwesdks', 2, 500000, '1', '1', 'frappuccino.jpg', NULL, NULL, NULL, NULL, '2022-06-19 19:58:35', '2022-06-29 00:40:26'),
(9, 'tes', 'tes', 'tes', '923454323534', '2022-06-30', '2022-06-22', 'ABDA Insurance', '0923kwesdks43', 3, 750000, '1', '1', 'americano.jpeg', NULL, NULL, NULL, NULL, '2022-06-28 21:57:08', '2022-07-04 00:16:48'),
(10, 'Oza', 'oza@gmail.com', 'Ovi', '923454323534', '2022-07-07', '2022-07-06', 'ABDA Insurance', '0923kwesdks', 3, 750000, '0', '0', '', NULL, NULL, NULL, NULL, '2022-07-03 19:54:52', '2022-07-03 20:04:49'),
(11, 'Eri Ora', 'fff@gsd.com', 'asfsad', '08293127832', '2022-06-23', '2022-07-01', 'Badak NGL', '4', 2, 500000, '1', '1', 'frappuccino.jpg', NULL, NULL, NULL, NULL, '2022-07-03 20:28:17', '2022-07-03 23:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `request_progress`
--

CREATE TABLE `request_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_progress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_request` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_progress`
--

INSERT INTO `request_progress` (`id`, `title`, `detail_progress`, `id_request`, `name_user`, `created_at`, `updated_at`) VALUES
(1, 'Percepatan waktu', 'mau berangkat keluar kota, jadi minta segera diselesaikan', '7', 'fikri im', NULL, NULL),
(2, 'Percepatan waktu', 'mau berangkat keluar kota, jadi minta segera diselesaikan', '7', 'fikri im', NULL, NULL),
(3, 'tes', 'tes', '8', 'fikri im', '2022-06-22 23:29:25', '2022-06-22 23:29:25'),
(4, 'tes', 'tes', '11', 'fikri im', '2022-08-04 01:29:38', '2022-08-04 01:29:38'),
(5, 'asd', 'asd', '11', 'fikri im', '2022-08-04 02:37:06', '2022-08-04 02:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `resis`
--

CREATE TABLE `resis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_resi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_legalisir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_asuransi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resis`
--

INSERT INTO `resis` (`id`, `no_resi`, `alamat`, `id_legalisir`, `id_asuransi`, `created_at`, `updated_at`) VALUES
(1, '412321321321', 'Jl Doang jadian kaga', '10', '3', '2022-09-14 19:39:57', '2022-09-14 19:39:57'),
(3, '45243242412', 'Jl Doang jadian iya', '2', '48', '2022-09-14 23:22:16', '2022-09-14 23:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `user_type`, `signature`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$3flbeEfK21kzOOHs06S75.kq9nytUNdCSqBz.jF7QtYf.LMF0wNx.', '0', '', '2022-06-13 21:32:18', '2022-08-12 00:06:01'),
(2, 'kwitansi', 'kwitansi@gmail.com', '$2y$10$3flbeEfK21kzOOHs06S75.kq9nytUNdCSqBz.jF7QtYf.LMF0wNx.', '1', '', '2022-06-13 21:32:18', '2022-06-13 21:32:18'),
(3, 'user', 'user@gmail.com', '$2y$10$3flbeEfK21kzOOHs06S75.kq9nytUNdCSqBz.jF7QtYf.LMF0wNx.', '2', '', '2022-06-13 21:32:18', '2022-06-13 21:32:18'),
(4, 'cs', 'cs@gmail.com', '$2y$10$3flbeEfK21kzOOHs06S75.kq9nytUNdCSqBz.jF7QtYf.LMF0wNx.', '3', '', '2022-06-13 21:32:18', '2022-06-13 21:32:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_progress`
--
ALTER TABLE `request_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resis`
--
ALTER TABLE `resis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=844;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `request_progress`
--
ALTER TABLE `request_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resis`
--
ALTER TABLE `resis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
