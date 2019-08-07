-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 07, 2019 at 01:43 PM
-- Server version: 5.7.27-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rcubinit_spartan`
--

-- --------------------------------------------------------

--
-- Table structure for table `challanins`
--

CREATE TABLE `challanins` (
  `id` bigint(255) NOT NULL,
  `type` enum('company','person') NOT NULL DEFAULT 'person',
  `name` varchar(100) NOT NULL,
  `person_id` bigint(255) NOT NULL,
  `description` varchar(300) NOT NULL,
  `cases` varchar(100) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `status` enum('init','stockin','deleted') NOT NULL DEFAULT 'init'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `challanin_items`
--

CREATE TABLE `challanin_items` (
  `id` bigint(255) NOT NULL,
  `challanin_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `challanouts`
--

CREATE TABLE `challanouts` (
  `id` bigint(255) NOT NULL,
  `type` enum('company','person') NOT NULL DEFAULT 'person',
  `name` varchar(100) NOT NULL,
  `person_id` bigint(255) NOT NULL,
  `description` varchar(300) NOT NULL,
  `cases` varchar(100) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `status` enum('init','stockout','deleted') NOT NULL DEFAULT 'init'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `challanout_items`
--

CREATE TABLE `challanout_items` (
  `id` bigint(255) NOT NULL,
  `challanout_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` bigint(255) NOT NULL,
  `description` varchar(300) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `status` enum('init','stockout','deleted') NOT NULL DEFAULT 'init'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `damage_items`
--

CREATE TABLE `damage_items` (
  `id` bigint(255) NOT NULL,
  `damage_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dummyorders`
--

CREATE TABLE `dummyorders` (
  `id` bigint(255) NOT NULL,
  `type` enum('company','person') NOT NULL DEFAULT 'person',
  `name` varchar(100) NOT NULL,
  `person_id` bigint(255) NOT NULL,
  `description` varchar(300) NOT NULL,
  `delivery_date` varchar(100) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `status` enum('init') NOT NULL DEFAULT 'init'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dummyorder_items`
--

CREATE TABLE `dummyorder_items` (
  `id` bigint(255) NOT NULL,
  `dummyorder_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` bigint(255) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `contactperson` varchar(100) CHARACTER SET latin1 NOT NULL,
  `street` text CHARACTER SET latin1 NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 NOT NULL,
  `state` varchar(100) CHARACTER SET latin1 NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 NOT NULL,
  `pincode` varchar(100) CHARACTER SET latin1 NOT NULL,
  `gsttype` enum('unregister','register') CHARACTER SET latin1 NOT NULL DEFAULT 'register',
  `gstin` varchar(100) CHARACTER SET latin1 NOT NULL,
  `cin` varchar(100) CHARACTER SET latin1 NOT NULL,
  `mobile` varchar(100) CHARACTER SET latin1 NOT NULL,
  `tel` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `created_datetime` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`id`, `name`, `contactperson`, `street`, `city`, `state`, `country`, `pincode`, `gsttype`, `gstin`, `cin`, `mobile`, `tel`, `email`, `created_datetime`, `deleted`) VALUES
(2, 'P.RAM CHAND & CO.', 'AMIT SHARMA', '15 A NEW VIJAY NAGAR,BASTI NAU', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03AABFP6784B1ZH', '', '9417011182', '01812254625', 'sales@spartansports.in', '2018-11-14 12:11:59', 0),
(3, 'GANPATI PACKWELL', 'MR. GUPTA', 'OPP: SUTLEJ MOTORS , VILL WARIANA,KAPURTHALA RD,', 'JALANDHAR', 'Punjab', 'India', '144001', 'register', '03AAQPG4258C1ZZ', '', '9356390680', '', 'ganpatipackwell@yahoo.in', '2018-11-15 04:11:06', 0),
(4, 'UNIQUE ENTERPRISES', 'HEMANT', 'D-39&40, SPORTS & SURGICAL COMPLEX,KAPURTHALA ROAD', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03AAOPP2613E1Z1', '', '9814608484', '', 'pasricha.hemant@gmail.com', '2018-11-15 04:11:28', 0),
(5, 'SALVE INTERNATIONAL', 'MR.CHANNI', 'JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03AHKPD1560F1ZX', '', '9463471226', '', 'dasscharan625@gmail.com', '2018-11-16 12:11:21', 0),
(6, 'SUPREME SPORTS', 'MR.JATIN', 'JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03BNEPK1524R1ZX', '', '8847515858', '', 'uandiworldwide2017@gmail.com', '2018-11-16 12:11:24', 0),
(7, 'ANAND SHUTTLE COCK', 'MR.PAWAN', 'JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03AABFA4694D1ZV', '', '9814261135', '', '', '2018-11-16 12:11:27', 0),
(8, 'METRO SPORTS INDUSTRIES', '', 'NR. ST. SOLDIER COLLEGE BASTI DANISHMANDAN', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ABNPS2508R1Z4', '', '', '01815019726', 'metro@spartansports.co.in', '2018-11-15 05:11:15', 0),
(9, 'NEW ANAND SPORTS', '', 'BLUE CORRIDOR,NEAR D.Z PATEL SCHOOL,80FT ROAD', 'ANAND', 'Gujarat', 'India', '388001', 'register', '24AAMFN7247E1Z6', '', '', '', '', '2018-11-16 12:11:57', 0),
(10, 'SPORTS CENTRE', '', 'S.NO.2,H.NO.603, GULSHAN E MOHIUDDIN,VIP TRIANGLE,RETIGHT', 'BHOPAL', 'Madhya Pradesh', 'India', '', 'register', '23EZHPS6284N1ZI', '', '', '', '', '2018-11-16 12:11:32', 0),
(11, 'GANPATI SPORTS WORLD', '', 'G-1/1SHREE GOPALCOMPLEX,KUTCHERY ROAD', 'RANCHI', 'Jharkhand', 'India', '834001', 'register', '20AAMFG7087R1ZO', '', '', '', '', '2018-11-16 06:11:31', 0),
(12, 'U&I WORLD WIDE', 'JATIN', 'JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03BNEPK1524R1ZX', '', '8847515858', '', 'uandiworldwide2017@gmail.com', '2018-11-18 11:11:59', 0),
(13, 'ANKIT SPORTS', '', '1ST FLOOR , KHADI BHANDAR,TOWER CHOWNK', 'DEOGHAR', 'Jharkhand', 'India', '814112', 'register', '20AMWPJ6454B1Z5', '', '9709156724', '', '', '2018-11-22 11:11:12', 0),
(14, 'PIONEER SPORTS & SYNDICATE', '', 'RANCHI', 'RANCHI', 'Jharkhand', 'India', '834001', 'register', '20ABUPS2920E1ZS', '', '', '9334304195', '', '2018-11-23 12:11:17', 0),
(15, 'FRIENDS & CO.', 'SHIVAM COMPLEX,', 'DHANBAD', 'DHANBAD', 'Jharkhand', 'India', '826001', 'register', '20AAWPN5279Q1ZQ', '', '6204212014', '', '', '2018-11-23 12:11:24', 0),
(16, 'IMPRESSION THE SPORTS JUNCTION', '', 'ABOVE CHENNAI KITCHEN,2ND FLOOR BESIDE HOTEL EMERALD', 'HINOO', 'Jharkhand', 'India', '834002', 'register', '20AAFFI5526A1Z0', '', '9334713479', '', '', '2018-11-23 12:11:44', 0),
(17, 'EAST INDIA STORES', '', '3A,YASH KAMAL COMPLEX,', 'BISTUPUR', 'Jharkhand', 'India', '831001', 'register', '20AABFE5327R1ZE', '', '9431180690', '', '', '2018-11-23 01:11:46', 0),
(18, 'RAJ SPORTS COMPANY', '', 'MAIN RD RANCHI', 'RANCHI', 'Jharkhand', 'India', '834001', 'register', '20AABFR2745N1Z9', '', '9835111887', '', '', '2018-11-23 01:11:27', 0),
(19, 'OM SURYA SPORTS', '', '2/27 HIMAZA PLAZA, NIZAMPET GOSAD ROAD', 'HYDERABAD', 'Telangana', 'India', '', 'register', '36AACFO5969J1ZQ', '', '9666990990', '', '', '2018-11-23 02:11:08', 0),
(20, 'REWANCHAL STORES', '', 'C/O JYOTI SCIENTIFIC STORE', 'REWA', 'Madhya Pradesh', 'India', '', 'register', '23BRUPP8128G1ZB', '', '9425186513', '', '', '2018-11-23 02:11:04', 0),
(21, 'SPORTS N SPORTS', '', 'SARASWATI MARKET UPPER BAZAR', 'RANCHI', 'Jharkhand', 'India', '834001', 'register', '20ABEPP4761A1Z8', '', '9835535961', '', '', '2018-11-23 02:11:23', 0),
(22, 'KOTHARI VARIETY STORES', '', 'KOTHARI MARKET', 'CHAS', 'Jharkhand', 'India', '827001', 'register', '20AELPK5687E1ZH', '', '9835395723', '', '', '2018-11-23 02:11:02', 0),
(23, 'DAVID SPORTS', '', 'SHOP NO. LS-5, ISPAT MARKET', 'ROURKELA', 'Orissa', 'India', '769005', 'register', '21AGZPG9020H1ZC', '', '9861356219', '', '', '2018-11-23 03:11:59', 0),
(24, 'DAVID SPORTS', '', 'SHOP NO. LS-5, ISPAT MARKET', 'ROURKELA', 'Orissa', 'India', '769005', 'register', '21AGZPG9020H1ZC', '', '9861356219', '', '', '2018-11-23 03:11:00', 1),
(25, 'LEGEND SPORTS', '', 'SHOP NO. 6&9, NATRY BUILDING OPP ST PETERS CHURCH MILL', 'BANDRA - MUMBAI', 'Maharashtra', 'India', '400050', 'register', '27AAACL9225H1ZG', '', '', '26437742', '', '2018-11-23 03:11:05', 0),
(26, 'SPORTS 360', '', 'SHOP NO. 23& 24, GAGAN SHOPPING ARCADE, KRISHNA VATIKA', 'GOREGAON EAST-MUMBAI', 'Maharashtra', 'India', '', 'register', '27AJEPM8009N1ZS', '', '8657191250', '', '', '2018-11-23 03:11:35', 0),
(27, 'SHARMA SPORTS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2018-12-04 01:12:55', 1),
(28, 'SHARMA SPORTS', '', 'PARK MARKET,KALI MANDER,HIRAPUR DHANBAD- ( JHARKHAND )', 'DHANBAD', 'Jharkhand', 'India', '826001', 'register', '20AIEPS3916P1Z0', '', '', '', '', '2018-12-04 01:12:43', 0),
(29, 'CITY SPORTS', '', 'SHOP NO.3,YASHOVAN PLAZA,PARK MARKET,HIRAPUR DHANBAD- (JHARKHAND )', 'DHANBAD', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2018-12-04 01:12:55', 1),
(30, 'CITY SPORTS', '', 'SHOP NO.3, YASHOVAN PLAZA, PARK MARKET HIRAPUR DHANBAD- ( JHARKHAND )', 'DHANBAD', 'Jharkhand', 'India', '826001', 'register', '20EHDPS6128D1ZN', '', '7633012558', '', '', '2018-12-04 01:12:50', 0),
(31, 'HERITAGE SPORTS', '', '656/C 2ND FLOOR,16TH MAIN,5TH CROSS RD,SARASWATHIPURAM MYSURU - ( KARNATAKA ) ', 'MYSURU', 'Karnataka', 'India', '', 'register', '29BVSPA2706F1ZM', '', '9483931267', '', '', '2018-12-04 01:12:03', 0),
(32, 'OLYMPIC SPORTS', '', 'LAXMIDAS COMPLEX,MAIDAN ROAD,OPP SERVICE BUS MANGALURU - ( KARNATAKA )', 'MANGALURU', 'Karnataka', 'India', '575001', 'register', '29BDRPK6175R1ZA', '', '7899800520', '', '', '2018-12-04 02:12:25', 0),
(33, 'VISHWA SPORTS', '', 'SURAJ KUND RD,SURAJ KUND GANDHI NAGAR MEERUT - ( UTTARPRADESH )', 'MEERUT', 'Uttar Pradesh', 'India', '250001', 'register', '09ABBPK0089R1Z4', '', '9719206654', '', '', '2018-12-04 02:12:53', 0),
(34, 'LODHA BROTHERS', '', 'AKAL BHAWAN,KESARWADI,NEAR CHANDI HALL JODHPUR - ( RAJASTHAN )', 'JODHPUR', 'Rajasthan', 'India', '', 'register', '08AAYPL1026B1ZU', '', '9462278706', '', '', '2018-12-04 02:12:37', 0),
(35, 'SANDEEP SPORTS', '', 'CK48/145B HARTA VARANASI - ( UTTARPRADESH )', 'VARANASI', 'Uttar Pradesh', 'India', '221010', 'register', '09AGYPG4404G1Z7', '', '8953810990', '', '', '2018-12-04 02:12:25', 0),
(36, 'ANKIT SPORTS', '', 'DEOGHAR - ( JHARKHAND )', 'DEOGHAR', 'Jharkhand', 'India', '814112', 'register', '20AMWPJ6454B1Z5', '', '', '', '', '2018-12-04 02:12:16', 0),
(37, 'ARORA SPORTS', '', 'NEAR TIRUPATI BAJAJ, TANSEN RD, HAZIRA, BIRLA NAGAR, GWALIOR - ( MADHYA PRADESH ) ', 'GWALIOR', 'Madhya Pradesh', 'India', '474001', 'register', '23ANYPA3316J1Z0', '', '09329815886', '', '', '2018-12-04 02:12:17', 0),
(38, 'TEAM SPORTS CENTRE', '', 'NEW OSMAN GUNJ, TROOP BAZAR HYDERABAD - ( TELENGANA )', 'HYDERABAD', 'Telangana', 'India', '500001', 'register', '36AYBPK5143R1ZZ', '', '04066131913', '', '', '2018-12-04 02:12:14', 0),
(39, 'CITY SPORTS', '', '302 TULSI VIHAR, SIROL RD, GWALIOR - ( MADHYA PRADESH ) ', 'GWALIOR', 'Madhya Pradesh', 'India', '474001 ', 'register', '23ABUPY6898D1ZP', '', '09827008098', '', '', '2018-12-04 02:12:35', 0),
(40, 'OM SURYA SPORTS', '', '2/27 HIMAZA PLAZA, NIZAMPET GOSAD ROAD NEAR DELIGHT RESTAURENT , KUKATPALLY  R R HYDERABAD - ( TELENGANA )', 'HYDERABAD ', 'Telangana', 'India', '', 'register', '36AACFO5969J1ZQ', '', '9666990990', '', '', '2018-12-04 02:12:10', 0),
(41, 'SAFARI SPORTS', '', 'NEAR KIDDYS CORMER PUBLIC SCHOOL, SILVER ESTATE RD, THATIPUR GWALIOR - ( MADHYA PRADESH )', 'GWALIOR', 'Madhya Pradesh', 'India', '474001', 'unregister', '', '', '9977935186', '', '', '2018-12-04 03:12:45', 0),
(42, 'GEETANJALI TRADERS', '', 'NEAR OLD DOOARS BUS STAND BIDHAN RD SILIGURI - ( WEST BENGAL ) ', 'SILIGURI', 'West Bengal', 'India', '', 'register', '19AAGFG5314F1ZK', '', '9064368132', '', '', '2018-12-04 03:12:51', 0),
(43, 'BAPI STORES', '', 'KHUDIRAM PALLY ROAD, NEAR HONGKONG MARKET, SILIGURI - ( WEST BENGAL )', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19AFUPK5728G1ZV ', '', '9832095756 ', '', '', '2018-12-06 11:12:40', 0),
(44, 'COOCH BEHAR', '', '261,SILVER JUBILEE RD, COOCH BEHAR DISTT: COOCHBEHAR WEST BENGAL', 'COOCH BEHAR', 'West Bengal', 'India', '736101', 'register', '19ASEPD9631J1Z1', '', '9434168942', '', '', '2018-12-06 11:12:50', 0),
(45, 'JAIN SPORTS', '', '115 RAMCHANDRA NAGAR, NEAR PARMANAND HOSPITAL AIRPORT RD INDORE - ( MADHYA PRADESH )', 'INDORE', 'Madhya Pradesh', 'India', '', 'register', '23AFEPJ9488E1ZA', '', '9425940099', '', '', '2018-12-06 11:12:03', 0),
(46, 'MASTER SPORTS', '', 'SHOP NO. 9, OPP NCC WOMEN COLLEGE GWALIOR - ( MADHYA PRADESH )', 'GWALIOR', 'Madhya Pradesh', 'India', '474001', 'register', '23BEMPS3490D1ZE', '', '7512234950', '', '', '2018-12-06 12:12:08', 0),
(47, 'YADAV SPORTS WEAR', '', 'SHOP NO. 23, NEAR MODEL SCHOOL TT NAGAR STADIUM BHOPAL - ( MADHYA PRADESH )', 'BHOPAL', 'Madhya Pradesh', 'India', '462003', 'register', '23AFJPN3664D1ZL', '', '9893442060', '', '', '2018-12-06 12:12:49', 0),
(48, 'KOHLI SPORTS & ENTERPRISES', '', 'SHOP NO.20-21 JAWAHAR CHOWNK, BHADBHADA ROAD, NEAR GURUDWARA, BHOPAL - ( MADHYA PRADESH )', 'BHOPAL', 'Madhya Pradesh', 'India', '462003', 'register', '23ALOPK2561P1ZN', '', '', '', '', '2018-12-06 01:12:54', 0),
(49, 'DP UPASAK  & SONS', '', 'DAMBER CHOWNK,KALIMPONG KALIMPONG - ( WEST BENGAL )', 'KALIMPONG', 'West Bengal', 'India', '734301', 'register', '19AAFFM1146G1ZF', '', '8967774999', '', '', '2018-12-06 01:12:48', 0),
(50, 'NEW AWASTHY SPORTS', '', 'SURENDRA LANDMARK, BLOCK D, SHOP NO. 17, SHRI RAMESHWARAM BHOPAL - ( MADHYA PRADESH )', 'BHOPAL', 'Madhya Pradesh', 'India', '462206', 'register', '23AGGPA5057R1Z7', '', '9993960536', '', '', '2018-12-06 02:12:46', 0),
(51, 'BST SPORTS', '', 'FIRST FLOOR, PLOT NO-74, ROAD NO-2, MAMATHA NAGAR.OPPOSITE NAGOL - DISTT : HYDERABAD TELENGANA', 'HYDERABAD', 'Telangana', 'India', '500068', 'register', '36AXLPT0594N1ZL', '', '9152804918', '', '', '2018-12-08 01:12:50', 0),
(52, 'KAVYA SPORTS', '', '1ST CROSS BILARI ROAD, CHALLAKERE - DISTT : CHITRADURGA KARNATAKA', 'CHALLAKERE', 'Karnataka', 'India', '577522', 'register', '29BIBPB1578G1ZE', '', '6361075797', '', '', '2018-12-08 02:12:43', 0),
(53, 'ROYAL SPORTS', '', 'SHOP NO. 1 RELIABLE BUSINESS CENTRE, NEAR HOTEL SIDHARTHA HYDERABAD - ( TELENGANA )', 'HYDERABAD', 'Telangana', 'India', '', 'register', '36ASKPK6752H1ZE', '', '9618738113', '', '', '2018-12-08 02:12:36', 0),
(54, 'METRO SPORTS', '', 'OPP SHIV SURYA COMPLEX , HAJAPATEL NI POLE TANKSHALI, KALUPUR AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24CRPPD4600P1ZL', '', '8000234770', '', '', '2018-12-08 04:12:24', 0),
(55, 'S LODHA & CO.', '', '78-BALAJI MARKET BHILWARA - ( RAJASTHAN )', 'BHILWARA', 'Rajasthan', 'India', '', 'register', '08AAGPL3325F1ZY', '', '9829562067', '', '', '2018-12-08 04:12:43', 0),
(56, 'HATTRIC SPORTS', '', '1 ,PRIDE PURPLE SQUARE BUILDING A-KALE WADI MAIN RD,WAKAD - DISTT : PUNE', 'WAKAD', 'Maharashtra', 'India', '', 'register', '27AAJFH5102R1Z0', '', '8149014311', '', '', '2018-12-08 05:12:29', 0),
(57, 'BINA STORES', '', 'RN ROAD,NEAR GOVERNMENT PRESS , COOCH BEHAR - DISTT : COOCHBEHAR WEST BENGAL', 'COOCH BEHAR', 'West Bengal', 'India', '736101', 'register', '19AFAPG7222F1ZS', '', '9434938778', '', '', '2018-12-08 05:12:14', 0),
(58, 'SPORTS GALLERY', '', 'FF-17, VITTHAL COMPLEX, OPP SAKAK SCHOOL, CHANDKHEDA - DISTT : AHMEDABAD GUJARAT', 'CHANDKHEDA', 'Gujarat', 'India', '382424', 'register', '24AGKPT9697C1ZR', '', '9152101488', '', '', '2018-12-10 10:12:09', 0),
(59, 'WORLD OF SPORTS', '', '4, OMKAR HOUSE,CG ROAD,AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '380009', 'register', '24AAAFW1605P1Z4', '', '9152169651,9898343038', '', '', '2018-12-10 10:12:15', 0),
(60, 'BHARAT SPORTS', '', 'SHOP NO 6, HARDY COMPLEX, MAHATMA GANDHI ROAD SECUNDERABAD - DISTT : HYDERABAD TELENGANA', 'HYDERABAD', 'Telangana', 'India', '500003', 'register', '36AAHCB5635Q1Z3', '', '9640338686', '', '', '2018-12-10 11:12:32', 0),
(61, 'ANAND SPORTS', '', 'T/73, BIDHAN MARKET, SILIGURI,OPP HONG KONG MARKET SILIGURI - ( WEST BENGAL )', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19ACRPA9128Q1ZR', '', '9832064460,9734442948', '', '', '2018-12-10 03:12:32', 0),
(62, 'LEGEND SPORTS', '', 'SHOP NO. 6 & 9,NATRY BUILDIND OPP ST PETERS CHURCH MILL RD BANDRA - DISTT : MUMBAI MAHARASHTRA', 'BANDRA', 'Maharashtra', 'India', '400050', 'register', '27AAACL9225H1ZG', '', '26437742,26404823', '', '', '2018-12-12 12:12:43', 0),
(63, 'JYOTI SPORTS CO.', '', 'SHOP NO.3, GAYTRI COMPLEX POWER HOUSE,SABARMATI ', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AACFJ9062H1ZD', '', '9825425965', '', '', '2018-12-12 03:12:50', 0),
(64, 'IJERI & BROTHERS', '', 'SIDDESHWAR TEMPLE,FRONT ROAD , OPP KOTAK MAHINDRA BANK BIJAPUR - ( KARNATAKA )', 'BIJAPUR', 'Karnataka', 'India', '', 'register', '29ABCPI4677E1ZK', '', '9341777757', '', '', '2018-12-12 03:12:16', 0),
(65, 'DALJEET SINGH', '', 'BEHRAMPORE CARE OF VICKY KHELA GHAR BEHRAMPORE - DISTT : MURSHIDABAD', 'BEHRAMPORE', 'West Bengal', 'India', '', 'unregister', '', '', '9434336902', '', '', '2018-12-13 11:12:24', 0),
(66, 'NEW HANS WELDING WORKS', '', 'RAM SHARNAM COLONY, BASTI DANISHMANDAN, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'unregister', '03AZPPJ9393R1Z9', '', '9855378393,8847016408', '', '', '2018-12-13 12:12:47', 1),
(67, 'NEW HANS WELDING WORKS', '', 'RAM SHARNAM COLONY, BASTI DANISHMANDAN, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'unregister', '03AZPPJ9393R1Z9', '', '9855378393,8847016408', '', '', '2018-12-13 12:12:47', 0),
(68, 'AP ENTERPRISES', '', 'DSIDC COMPLEX, WAZIRPUR INDUSTRIAL AREA DELHI', 'DELHI', 'Delhi', 'India', '110052', 'register', '07BCXPB8990A1Z9', '', '9312281121', '', '', '2018-12-13 02:12:40', 1),
(69, 'AP ENTERPRISES', '', 'DSIDC COMPLEX, WAZIRPUR INDUSTRIAL AREA DELHI', 'DELHI', 'Delhi', 'India', '110052', 'register', '07BCXPB8990A1Z9', '', '9312281121', '', '', '2018-12-13 02:12:40', 0),
(70, 'ROOGUN SPORTS', '', '741, MOHALLA CHANDIGARH, BASTI DANISHMANDAN, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ACSFS4118B1ZD', '', '9417011182', '', '', '2018-12-13 04:12:08', 0),
(71, 'PERFECT SPORTS', '', '3, NEW HARGOBIND COLONY, GHAS MANDI, BASTI SHEIKH, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03ACSFS118B12D', '', '9888216528,9888416528', '', '', '2018-12-14 09:12:53', 0),
(72, 'Y.S. TRADING CO.', '', 'WX-3, BASTI NAU, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ACSFS4118B1ZD', '', '9417549984,9878316230', '', '', '2018-12-14 10:12:50', 0),
(73, 'VARDHMAN SPORTS', '', 'NEAR TULARAM CHOWNK, ANDHERDEO, JABALPUR', 'JABALPUR', 'Madhya Pradesh', 'India', '482002', 'register', '23AHPPJ4047A1ZQ', '', '7614078172,9424677780', '', '', '2018-12-14 04:12:12', 0),
(74, 'SPORTS CENTRE', '', '1078, ANDHERDEO ROAD, ANDHERDEO, JABALPUR', 'JABALPUR', 'Madhya Pradesh', 'India', '482002', 'register', '23AEWPA1458C1ZT', '', '9152616286', '', '', '2018-12-14 04:12:43', 0),
(75, 'NEW RAHUL SPORTS', '', 'SHOP NO-34 , AMRAVALI ROAD,MAHARAJBAGH ROAD,SITABULDI, NAGPUR - ( MAHARASHTRA )', 'NAGPUR', 'Maharashtra', 'India', '440012', 'register', '27ACIPP9594Q1ZA', '', '9850211413', '', '', '2018-12-14 04:12:31', 0),
(76, 'SPORTS KEMP', '', 'BAIJNATH PARA, RAIPUR - ( CHATTISGARH )', 'RAIPUR', 'Chhattisgarh', 'India', '492001', 'register', '22ACJPA2302G1ZJ', '', '9165200091', '', '', '2018-12-14 04:12:40', 0),
(77, 'KHELA', '', 'SARAFA COMPOUND,NETAJI SUBHAS ROAD,MALDA - ( WEST BENGAL )', 'MALDA', 'West Bengal', 'India', '703121', 'register', '19AFGPP6598H1ZO', '', '9064499013', '', '', '2018-12-15 10:12:41', 0),
(78, 'SRI GANESH SPORTS & FITNESS', '', 'STALL G11, COMMERCIAL ESTATE COMPLEX, CITY CENTRE, DURGAPUR', 'DURGAPUR', 'West Bengal', 'India', '713216', 'register', '19ATVPD2085J1Z5', '', '9150851045', '', '', '2018-12-15 10:12:51', 0),
(79, 'UJJWAL SPORTS', '', '27, MAHARAJ BAGH ROAD, SITABULDI, NAGPUR', 'NAGPUR', 'Maharashtra', 'India', '440012', 'register', '27ABWPG5153H1ZB', '', '9152789690', '', '', '2018-12-15 10:12:07', 0),
(80, 'VIJAY GENERAL STORE', '', 'STATION ROAD SHAHDOL - ( MADHYA PRADESH )', 'SHAHDOL', 'Madhya Pradesh', 'India', '484001', 'register', '23AXDPJ7754L1Z6', '', '7000606345,9407343393', '', '', '2018-12-15 11:12:56', 0),
(81, 'AGGARWAL SPORTS', '', 'BANJARI ROAD RAIPUR', 'RAIPUR', 'Chhattisgarh', 'India', '492001', 'register', '22BCXPA4933L1ZC', '', '9827164359', '', '', '2018-12-15 12:12:13', 0),
(82, 'BHARAT SPORTS', '', 'SHOP NO.29, MAHARAJ BAGH ROAD, SITABULDI, NAGPUR - ( MAHARASHTRA )', '', 'Maharashtra', 'India', '440012', 'register', '27ACAPA8749G1ZN', '', '9152680243', '', '', '2018-12-19 01:12:43', 0),
(83, 'DEMPO SPORTS', '', 'SHOP NO. UG-62,ASCON PLAZA, B/H BHULKA BHAVAN SCHOOL, ANANDMAHAL RD, ADAJAN SURAT - ( GUJARAT )', 'SURAT', 'Gujarat', 'India', '', 'register', '24AANFD1286E1ZK', '', '9925033978', '', '', '2018-12-19 01:12:42', 0),
(84, 'UNIVERSAL SPORTS', '', 'CENTRAL LIBRARY, SHYAM TALKIES ROAD , RAJU NAGAR, AGRASEN COLONY RAIGARH - ( CHATTISGARH )', 'RAIGARH', 'Chhattisgarh', 'India', '', 'register', '22BTNPG8966N1ZW', '', '9301010015', '', '', '2018-12-19 01:12:55', 0),
(85, 'MAGIC SPORTS', '', 'B-120,121, HIMALYA ARCADE,OPP VASTRAPUR LAKE DISTT : AHMEDABAD', 'VASTRAPUR', 'Gujarat', 'India', '380015', 'register', '24AKBPG7844H1Z9', '', '9825846900', '', '', '2018-12-19 03:12:09', 0),
(86, 'GAUTAM STORE', '', 'TOWER ROAD,MOTA BAZAR, NAVSARI - ( GUJARAT )', 'NAVSARI', 'Gujarat', 'India', '396445', 'register', '24AAACFG3302R1ZG', '', '9428716630', '', '', '2018-12-19 03:12:12', 0),
(87, 'SWAPNEEL SPORTS', '', 'RAGHAV APARTMENT, RESHIMBAGH CHOWK, NAGPUR - ( MAHARASHTRA )', 'NAGPUR', 'Maharashtra', 'India', '440009', 'register', '27CPRPK6497R1ZF', '', '8928026788', '', '', '2018-12-19 03:12:42', 0),
(88, 'ANUJ SPORTS', '', 'RS NO 199/4, BM NO 9433, UCHGAON,GANDHINAGAR,KOHLAPUR - ( MAHARASHTRA )', 'KOHLAPUR', 'Maharashtra', 'India', '', 'register', '27AWGPS8835D1Z5', '', '9974539740', '', '', '2018-12-21 12:12:00', 0),
(89, 'SHRI LAXMI SPORTS', '', 'SUBHASH NAGAR, GONDPARA, BILASPUR H O, BILASPUR - ( CHATTISGARH )', 'BILASPUR', 'Chhattisgarh', 'India', '495001', 'register', '22AGMPR4071Q1ZS', '', '99152672247', '', '', '2018-12-21 01:12:13', 0),
(90, 'KIND CORPORATION', '', '19 PANCHVATI SOCIETY SWAMINARAYAN MANDIR ROAD, MANINAGAR AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AAMPP7988G1ZZ', '', '7925462969', '', '', '2018-12-21 01:12:49', 0),
(91, 'NG ENTERPRISES', '', 'JALANDHAR', '', 'Punjab', 'India', '', 'unregister', '', '', '', '', '', '2018-12-21 01:12:30', 0),
(92, 'HRITIKA SPORTS', '', 'SHOP NO. 13, AURUM BUILDING, OPP VAKOLA MASJID, NEAR SANTOSH HOTEL,SANTACRUZ EAST MUMBAI - ( MAHARASHTRA )', 'MUMBAI', 'Maharashtra', 'India', '', 'register', '27AOIPA7337J1ZT', '', '9664506738', '', '', '2018-12-21 01:12:23', 0),
(93, 'RAPID SPORTS', '', '25,BALAJI AVENUE , OPPOSITE SUNRISE MALL, JUDGES BUNGALOW VASTRAPUR AHMEDABAD', 'VASTRAPUR', 'Gujarat', 'India', '', 'register', '24BBAPG6063M1ZO', '', '9152453896', '', '', '2018-12-21 02:12:30', 0),
(94, 'MISHA SPORTS', '', '15 S.K RD, NAWAB KAUR BUILDING, SURAJ KUND ,MEERUT,U.P  MEERUT - ( UTTARPRADESH )', 'MEERUT', 'Uttar Pradesh', 'India', '250002', 'register', '09AAOFM8633R1Z6', '', '9319083526', '', '', '2018-12-22 12:12:11', 0),
(95, 'PRO SPORTS', '', 'DR B.BARUAH RD,ULUBARI, GUWAHATI - ( ASSAM )', 'GUWAHATI', 'Assam', 'India', '781007', 'unregister', '18AAFHJ0737C1ZL', '', '', '', '', '2018-12-22 12:12:00', 0),
(96, 'LODHA BROTHERS', '', 'AKAL BHAWAN,KESARWADI,NEAR CHANDI HALL JODHPUR - ( RAJASTHAN )', 'JODHPUR', 'Rajasthan', 'India', '', 'register', '08AAYPL1026B1ZU', '', '9462278706', '', '', '2018-12-22 12:12:48', 0),
(97, 'SELECTION CENTRE SPORTS PRIVATE LIMITED', '', 'CHAMAN CHAMBERS, NEXT TO METRO BIG CINEMA A.P MARG, DHOBI TALAO MUMBAI - ( MAHARASHTRA )', 'MUMBAI', 'Maharashtra', 'India', '', 'register', '27AAOCS7770E1ZV', '', '', '22094509', '', '2018-12-24 03:12:51', 0),
(98, 'CAMPER ADVENTURE & SPORTS', '', 'FF-6,SAMARPAN COMPLEX, NEAR VAISHAI HOSPITAL, BOPAL CROSS ROAD AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24ACKPT2622D1ZU', '', '9426487232', '', '', '2018-12-24 03:12:37', 0),
(99, 'SPORTS POINT', '', 'SHOP NO. 136/3, PATRIKA CHAURAHA, CIVIL LINES, ALLAHABAD - ( UTTARPRADESH )', 'ALLAHABAD', 'Uttar Pradesh', 'India', '', 'register', '09DNVPS5229G127', '', '9793893227', '', '', '2018-12-24 05:12:38', 0),
(100, 'RANDERIA SPORTS', '', 'G,GROUND FLOOR, NATRAJ APPARTMENT PART-2 OPP, BHARAT MASA  MOTA MANDIR GALI,BHAGATLAO,SURAT - ( GUJARAT )', 'SURAT', 'Gujarat', 'India', '', 'register', '24AAXPR7228J1ZY', '', '9712029771', '', '', '2018-12-25 11:12:40', 0),
(101, 'VIPIN SPORTS', '', 'NEAR CITY KOTWALI CHOWNK SATNA - ( MADHYA PRADESH )', 'SATNA', 'Madhya Pradesh', 'India', '485001', 'register', '23ACJPA6443J1ZS', '', '9425837582', '', '', '2018-12-25 11:12:11', 0),
(102, 'SPORTS EMPORIUM', '', 'KAMLA COMPLEX, OPP CG BHAWAN, BILASPUR H O NEHRU CHOWNK BILASPUR - ( CHATTISGARH )', 'BILASPUR', 'Chhattisgarh', 'India', '495001', 'register', '22AIMPB3891L1Z3', '', '9981144100', '', '', '2018-12-25 03:12:44', 0),
(103, 'CHAMPION SPORTS & BOUTIQUE', '', '175, SARDAR COMPLEX, NEAR BUS STAND, KADODRA TALUKA PALSANA DISTT : SURAT', 'SURAT', 'Gujarat', 'India', '', 'register', '24APPPP5298B1ZK', '', '9426839386', '', '', '2018-12-26 03:12:37', 0),
(104, 'UNIVERSAL SPORTS', '', 'STATION ROAD RAIGARH HO, RAIGARH - ( CHATTISGARH )', 'RAIGARH', 'Chhattisgarh', 'India', '496001', 'register', '22AHAPG0375P1ZG', '', '8103698988', '', '', '2018-12-26 03:12:38', 0),
(105, 'SHREE SPORTS', '', 'STATION ROAD DURG - ( CHATTISGARH )', 'DURG', 'Chhattisgarh', 'India', '491001', 'register', '22AGXPA8404D1ZO', '', '8770225706', '', '', '2018-12-26 04:12:01', 0),
(106, 'KUKU SPORTS', '', 'GROUND FLOOR, JOHN TOWER, COLLEGE ROAD, REWA - ( MADHYA PPRADESH )', 'REWA', 'Madhya Pradesh', 'India', '486001', 'register', '23AFEPC8662H1ZL', '', '8517817747,9827217707', '', '', '2018-12-27 10:12:25', 0),
(107, 'TIRUMALA SPORTS', '', 'INDIRA NAGAR, T JUNCTION YOSUF GUDA, 8-2-293/82/W/75/4, RD NUMBER 5, KRISHNA NAGAR, JUBILEE HILLS HYDERABAD - ( TELEGANA  )', 'HYDERABAD', 'Telangana', 'India', '', 'register', '36AEFPG8982G2Z5', '', '4066620188', '', '', '2018-12-27 11:12:12', 0),
(108, 'M.K. SPORTS MEERUT', '', '432,SHIVPURAM, MOHKAMPUR, DELHI ROAD, MEEERUT-250002', 'MEERUT', 'Uttar Pradesh', 'India', '250002', 'register', '', '', '09EDDPM2106K1ZK', '', '', '2018-12-27 12:12:45', 0),
(109, 'SHREE RIDDHI SIDDHI ENTERPRISES', '', 'SHOP NO.14, ASHARAM COMPLEX, BEHIND JODHPUR SWEETS, NEAR AMBAMATA TEMPLE VAPI - ( GUJARAT )', 'VAPI', 'Gujarat', 'India', '', 'register', '24EWOPS8904R1ZC', '', '', '', '', '2018-12-27 03:12:31', 0),
(110, 'KAPIL DEV SPORTS', '', '#14-20-23, NEAR TALUKA OFFICE,STATION RD, GANDHI NAGAR,VIJAYWADA - ( ANDHRA PRADESH )', 'VIJAYWADA', 'Andhra Pradesh', 'India', '520003', 'register', '37AGAPD0852B1Z5', '', '90140356585', '', '', '2018-12-28 12:12:18', 0),
(111, 'MASAND INTERNATIONAL', '', 'BASTI SHEIKH ROAD, OPP. OBC BANK, JALANDHAR CITY', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ACSFS4118B1ZD', '', '9815200074,7009045625', '', '', '2018-12-28 03:12:11', 0),
(112, 'ANAND SHUTTLECOCK HOUSE', '', 'WX 85, BASTI NAU, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ACSFS4118B1ZD', '', '9914907388', '', '', '2018-12-28 03:12:58', 0),
(113, 'BEGUSARAI SPORTS', '', 'TRAFFIC CHOWNK,KACAHARI ROAD,BEGUSARAI - ( BIHAR )', 'BEGUSARAI', 'Bihar', 'India', '851101', 'register', '10BJCPK7329E1ZO', '', '8986144688', '', '', '2018-12-29 03:12:17', 0),
(114, 'BHARAT SPORTS', '', 'SHOP NO. G21-22,PBR TOWER, NEAR CHECK POST SEVOKE ROAD SILIGURI - ( WEST BENGAL )', 'SILIGURI', 'West Bengal', 'India', '', 'register', '19AATFB9376K1ZF', '', '8391068414', '', '', '2018-12-29 03:12:50', 0),
(115, 'TMS SPORTS', '', 'TAHER VILLA,CHANCHALGUDA,HYDERABAD - ( TELENGANA )', 'HYDERABAD', 'Telangana', 'India', '500001', 'register', '36DWDPK8852C1ZF', '', '9177433843', '', '', '2018-12-29 03:12:59', 0),
(116, 'SHREE K.B SPORTS & MENS WEAR', '', 'STATION ROAD,SATNA - ( MADHYA PRADESH )', 'SATNA', 'Madhya Pradesh', 'India', '485001', 'register', '23EFUPK4643J1ZZ', '', '9302124493', '', '', '2018-12-29 04:12:46', 0),
(117, 'REWANCHAL STORES', '', 'C/O JYOTI SCIENTIFIC STORE OPP GAS GODOWN REWA - ( MADHYA PRADESH )', 'REWA', 'Madhya Pradesh', 'India', '', 'register', '23BRUPP8128G1ZB', '', '9425186513', '', '', '2018-12-29 04:12:05', 0),
(118, 'P.NARESH SPORTS', '', '534/7, SIDDHESH APARTMENT, TUKDOJI CHOWK, HANUMAN NAGAR, NAGPUR - ( MAHARASHTRA )', 'NAGPUR', 'Maharashtra', 'India', '440009', 'register', '27AIRPP3316M1ZO', '', '9423058558', '', '', '2018-12-29 04:12:15', 0),
(119, 'M.S SPORTS COLLECTION', '', 'N.S ROAD POLICE CLUB BUILDING,MALDA - ( WEST BENGAL )', 'MALDA', 'West Bengal', 'India', '732101', 'register', '19ALGPS1331R1ZI', '', '', '', '', '2018-12-31 03:12:33', 0),
(120, 'GAUTAM BROTHERS', '', '2/4678,NEAR ASHAPURI MANDIR,SAGRAMPUR, SURAT - ( GUJARAT )', 'SURAT', 'Gujarat', 'India', '395002', 'register', '24ANAPS5107K1Z1', '', '9898934567', '', '', '2018-12-31 04:12:07', 0),
(121, 'MANI GALAXY SPORTS', '', 'B-113,FF,ABOVE APOLLA PHARMACY,KANAM-2 NR. RELIANCE CROSS ROAD,KUDASAN, GANDHINAGAR - ( GUJARAT )', 'GANDHINAGAR', 'Gujarat', 'India', '', 'register', '24AYIPD0260D1Z5', '', '9274860880', '', '', '2018-12-31 04:12:07', 0),
(122, 'BHAVYA SPORTS CENTRE', '', 'SHOP NO-384, GALI NO-9,SADAR, OPP : MUSAA DRYERS JABALPUR - ( MADHYA PRADESH )', 'JABALPUR', 'Madhya Pradesh', 'India', '', 'register', '23ADKPA4377K1ZI', '', '9826714005', '', '', '2018-12-31 05:12:36', 0),
(123, 'SHREE RAM SPORTS', '', '80 MAHATMA GANDHI ROAD,KOLKATA - ( WEST BENGAL )', 'KOLKATA', 'West Bengal', 'India', '700004', 'register', '19ABKFS0185R1ZA', '', '9883100156', '', '', '2019-01-01 02:01:45', 0),
(124, 'SHREE MANJUNATHA ENTERPRISES', '', '432/15,CHAMARAJA DOUBLE ROAD,CHAMARAJA MOHALLA MYSORE - ( KARNATAKA )', 'MYSORE', 'Karnataka', 'India', '', 'register', '29ALGPM8755K1ZB', '', '94480866284', '', '', '2019-01-01 03:01:52', 0),
(125, 'METRO SPORTS', '', 'OPP SHIV SURYA COMPLEX , HAJAPATEL NI POLE TANKSHALI, KALUPUR AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24CRPPD4600P1ZL', '', '8000234770', '', '', '2019-01-01 03:01:32', 0),
(126, '10 SPORTS', '', 'GARIMA GRAND, ULUBARI - DISTT : GUWAHATI ', 'GUWAHATI', 'Assam', 'India', '781007', 'register', '18AAFZ9970E1ZP', '', '9957187271', '', '', '2019-01-01 03:01:47', 0),
(127, 'AMAR SPORTS', '', 'SHOP NO. 3-4, NIMA COMPLEX,TEMPLE BAZAAR,SITABULDI NAGPUR - ( MAHARASHTRA )', 'NAGPUR', 'Maharashtra', 'India', '', 'register', '24AAVPT7118B1ZC', '', '07122539813', '', '', '2019-01-01 05:01:07', 0),
(128, 'SOCCER PLASTIC', '', 'JALLOWAL ROAD,JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144001', 'register', '03AABFP6784B1ZH', '', '9815900074', '', '', '2019-01-05 02:01:39', 0),
(129, 'BODYLINE', '', '1ST FLOOR,23,24,25,OMKAR,NEAR WALIA CHOWKDI,GIDC ANKLESHWAR - ( GUJARAT )', 'ANKLESHWAR', 'Gujarat', 'India', '', 'register', '24AHZPS5735J1ZH', '', '9825245300', '', '', '2019-01-05 05:01:05', 0),
(130, 'SUN SPORTS & FITNESS', '', 'SHOP NO.7, VRAJ VALENCIA, NEAR SOLA BRIDGE,BEHIND MAHINDRA SHOWROOM SG HIGHWAY,SOLA AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AVWPP8888Q1ZW', '', '9824717103', '', '', '2019-01-05 05:01:23', 0),
(131, 'SPORTS N SPORTS', '', 'SARSAWATI MARKET UPPER BAZAR RANCHI - ( JHARKHAND )', 'RANCHI', 'Jharkhand', 'India', '834001', 'register', '20ABEPP4761A1Z8', '', '9835535961', '', '', '2019-01-05 05:01:17', 0),
(132, 'ROYAL SPORTS', '', 'AC COLLEGE ROAD,KANNA VARI THOTA,GANTUR - ( ANDHRA PRADESH )', 'GANTUR', 'Andhra Pradesh', 'India', '522004', 'register', '37AIIPB5535H1ZC', '', '863230263', '', '', '2019-01-05 05:01:03', 0),
(133, 'BEFIT SPORTS', '', 'GANDHI CHOWK,NAMUNA GALI NO. 1,OPP SBI ATM AMRAVATI - ( MAHARASHTRA )', 'AMRAVATI', 'Maharashtra', 'India', '', 'register', '27AVCPG4396G1ZH', '', '9175297794,9422956404', '', '', '2019-01-05 05:01:51', 0),
(134, 'FORTUNE SPORTS', '', 'PLOT NO.5,ADHAR SHILA COMPLEX,MANSAROVAR RD,DELHI GATE, PALANPUR - ( GUJARAT )', '', 'Gujarat', 'India', '', 'register', '24CEWPS6193G1ZP', '', '8866222288', '', '', '2019-01-05 05:01:16', 0),
(135, 'PARAMOUNT SPORTS', '', '6,HARSHAM SETH MARKET,DEEPAK CHOWNK AKOLA - ( MAHARASHTRA )', 'AKOLA', 'Maharashtra', 'India', '444001', 'register', '27AVGPS3018P1Z1', '', '9422189786', '', '', '2019-01-07 10:01:49', 0),
(136, 'NANDI SPORTS', '', 'NACHAN RD, NEARJALKHABAR GOLIMORE,BENACHITY DURGAPUR - ( WEST BENGAL )', 'DURGAPUR', 'West Bengal', 'India', '', 'register', '19ACSPN3002D1ZR', '', '9832162883', '', '', '2019-01-07 11:01:47', 0),
(137, 'PNS SPORTS INDIA PRIVATE LIMITED', '', 'FLAT NO. 501,MJR PEARL APARTMENT,KADUGALI,GOPAL KRISHNA NAGAR,BANGALORE - ( KARNATAKA )', 'BANGALORE', 'Karnataka', 'India', '', 'register', '29AAKCP0292Q1ZM', '', '9818663835', '', '', '2019-01-07 11:01:22', 0),
(138, 'SANDEEP SPORTS', '', 'CK48/145B HARTA VARANASI - ( UTTARPRADESH )', 'VARANASI', 'Uttar Pradesh', 'India', '221010', 'register', '09AGYPG4404G1Z7', '', '8953810990', '', '', '2019-01-07 12:01:33', 0),
(139, 'DIAMOND SPORTS', '', 'OPP KHADI GRAMODYOG RAOPURA VADODARA - ( GUJARAT )', 'VADODARA', 'Gujarat', 'India', '', 'register', '24AABFD7008E1Z0', '', '9979956111', '', '', '2019-01-07 12:01:30', 0),
(140, 'RAJESH MISHRA,CARE OF SACHIN SPORTS & SURGICALS', '', 'MAHAJANPATTY,NEW BUS STAND ROAD, RAMPURHAT DISTT : BIRBHUM', 'BIRBHUM', 'West Bengal', 'India', '', 'unregister', '', '', '7001017625', '', '', '2019-01-09 12:01:41', 0),
(141, 'MJ SPORTS PLUS', '', '2ND FLOOR,VAHEGURU PLAZA,NEAR DOMINOZ PIZZA,BEDI BANDAR ROAD,JAMNAGAR - ( GUJARAT )', 'JAMNAGAR', 'Gujarat', 'India', '', 'register', '24AABPU9962A1ZN', '', '9377799663', '', '', '2019-01-09 12:01:36', 0),
(142, 'DIAMOND SPORTS', '', 'OPP KHADI GRAMODYOG RAOPURA VADODARA - ( GUJARAT )', 'VADODARA', 'Gujarat', 'India', '', 'register', '24AABFD7008E1Z0', '', '9979956111', '', '', '2019-01-09 12:01:24', 0),
(143, 'AJAY SPORTS', '', 'PLOT NO.13,A,NEAR BHAVNAGAR SOCIETY,OPP. SARDAR COMPLEX,GOVINDINDWADI,ISANPUR, AHMEDABAD', 'ISANPUR', 'Gujarat', 'India', '', 'register', '24ATOPC8018R1Z5', '', '9173730907', '', '', '2019-01-09 01:01:46', 0),
(144, 'LOKNATH SPORTS', '', 'KHATICTALA,STATION ROAD, NEAR YMATENT BERHAMPORE - DISTT : MURSHIDABAD', 'BERHAMPUR', 'West Bengal', 'India', '742101', 'register', '19AIIPR3365H1ZU', '', '9434183649', '', '', '2019-01-09 01:01:23', 0),
(145, 'GALAXY SPORTS', '', '2-RATNADEEP COMPLEX,PRERNATIRTH,DERASAR RD,OPP GLORIA RESTAURANT,ANANDNAGAR AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AAKFG9504H1ZD', '', '9824552570', '', '', '2019-01-09 02:01:19', 0),
(146, 'SPORTS TAGORELAND', '', 'SANTINIKETAN RD,NEAR LAXMINARAYAN MANDIR BOLPUR - DISTT ;BIRBHUM', 'BOLPUR', 'West Bengal', 'India', '731204', 'register', '19ADAPG4862B1ZW', '', '9474307077', '', '', '2019-01-09 02:01:03', 0),
(147, 'BUDHRAJA SPORTS', '', 'SHOP NO. 52,A MARKET,SEC-6,BHILAI - ( CHATTISGARH )', 'BHILAI', 'Chhattisgarh', 'India', '490006', 'register', '22ASZPD8017D1ZT', '', '7882275125', '', '', '2019-01-09 03:01:54', 0),
(148, 'LAL RAKHRA AGENCIES', '', '15/39,CAMBRIDGE ROAD HALASURU BANGALORE - ( KARNATAKA )', 'BANGALORE', 'Karnataka', 'India', '560008', 'register', '29AAAFL6027C1ZM', '', '8025555684', '', '', '2019-01-09 03:01:42', 0),
(149, 'CHAK DE SPORTS', '', 'NO.39/2,WHITEFIELD,ITPL MAIN ROAD OPP. NANDINI HOTEL KUNDALHALLI GATE,BENGALURU - ( KARNATAKA )', 'BENGALURU', 'Karnataka', 'India', '', 'register', '29AVBPK6934B1ZO', '', '9902972526', '', '', '2019-01-09 03:01:32', 0),
(150, 'SPORTS PLAZA', '', '1360 RELIEF RD,SALAPOSE RD,OPP RELIEF CINEMA,AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24BNPPS8702J1ZG', '', '9327061212', '', '', '2019-01-09 04:01:12', 0),
(151, 'NATIONAL SPORTS', '', 'KOTHI RD,OPPOSITE SURYA NARAYAN BAUG,ANANDPURA,VADODARA - ( GUJARAT )', 'VADODARA', 'Gujarat', 'India', '390001', 'register', '24AGCPP2307F1ZW', '', '9825028146', '', '', '2019-01-09 04:01:21', 0),
(152, 'SAGAR SPORTS', '', 'M G ROAD,OPPOSITE SHANKAR BHUVAN VALSAD - ( GUJARAT )', 'VALSAD', 'Gujarat', 'India', '396001', 'register', '24AAKFS8221R1ZK', '', '9913040408', '', '', '2019-01-09 04:01:12', 0),
(153, 'OM SPORTS', '', 'NO.5/2,1ST FLOOR, O S LANE MAIN ROAD,CHICKPETE,BANGALORE - ( KARNATAKA )', 'BANGALORE', 'Karnataka', 'India', '560053', 'register', '29ESHPS0492F1ZB', '', '9902489544,8042074598', '', '', '2019-01-09 04:01:16', 0),
(154, 'SOURABH MALVIYA C/O SHRI RAM SPORTS', '', '18,BIMA NAGAR,ANAND BAZAAR,PALASIYA,INDORE - ( MADHYA PRADESH )', 'INDORE', 'Madhya Pradesh', 'India', '', 'unregister', '', '', '9039521181', '', '', '2019-01-09 05:01:17', 0),
(155, 'SURYA SPORTS', '', '71,RAJ RATNAM MARKET,1ST FLOOR GP ESTATE BANGALORE - (  KARNATAKA )', 'BANGALORE', 'Karnataka', 'India', '', 'register', '29AAJPA7693N1ZY', '', '8041516547', '', '', '2019-01-09 05:01:34', 0),
(156, 'HARISH PURI & CO', '', '33/39,1ST FLOOR,AMAR NIWAS,5TH MAIN,5TH BLOCK, JAYA NAGAR BANGALORE - ( KARNATAKA )', 'BANGALORE', 'Karnataka', 'India', '', 'register', '29AAGPH8183B1ZO', '', '8022445224', '', '', '2019-01-09 05:01:31', 0),
(157, 'CHABBRA STORES AGENCIES', '', 'GROUND FLOOR,FRAZER ROAD, PATNA - ( BIHAR )', 'PATNA', 'Bihar', 'India', '800001', 'register', '10AABFD7364D1ZO', '', '9546269699', '', '', '2019-01-09 05:01:21', 0),
(158, 'CHAYYA SPORTS & FOOTWEAR', '', 'SADAR BAZAR,MAIN ROAD,BILASPUR - ( CHATTISGARH )', '', 'Chhattisgarh', 'India', '', 'register', '22BNZPD0287K1ZN', '', '8899855555', '', '', '2019-01-10 03:01:43', 0),
(159, 'KIRTI SPORTS', '', '11/1268,NANVAT MAIN RD,SURAT - ( GUJARAT )', 'SURAT', 'Gujarat', 'India', '395003', 'register', '24AAVPC0640D1Z6', '', '9898047720', '', '', '2019-01-10 04:01:03', 0),
(160, 'JOY SPORTS', '', 'E2/18,DUFFERIN ROAD,DR B.C. ROY MARKET (MAIDAAN MARKET)', 'KOLKATA', 'West Bengal', 'India', '700069', 'register', '19ALCPG1774C1ZE', '', '9836304479', '', '', '2019-01-10 04:01:12', 0),
(161, 'KHELO SPORTS', '', '109 K.P LANDMARK,NEAR BRIGHT DAY SCHOOL,VASNABHAYLI RD VADODARA - ( GUJARAT )', 'VADODARA', 'Gujarat', 'India', '391410', 'register', '24ABXPD4116G1ZS', '', '9930003400', '', '', '2019-01-10 04:01:55', 0),
(162, 'SHAN SPORTS', '', 'JILLA RISHAD, MKT COMPLEX PASCHIM MEDINIPUR - ( WEST BENGAL )', 'MEDINIPUR', 'West Bengal', 'India', '', 'register', '19AXSPG0218M1Z4', '', '8373084969', '', '', '2019-01-10 04:01:25', 0),
(163, 'WORLD OF CRICKET', '', 'SWAPNAVAIBHAV APARTMENT,ADWAIT COLONY VISE MALA,CANADA CORNER,NASHIK - ( MAHARASHTRA )', 'NASHIK', 'Maharashtra', 'India', '', 'register', '27AAGPO5934P1ZZ', '', '9422748777', '', '', '2019-01-12 10:01:13', 0),
(164, 'B.S SPORTS', '', '4-BHANU SADAN,OPP AIRTEL CENTRE,KOTHI CHAR RASTA DISTT : VADODARA', 'VADODARA', 'Gujarat', 'India', '', 'register', '24AAJFB8772B1ZJ', '', '02652415971', '', '', '2019-01-12 10:01:54', 0),
(165, 'NVK SPORTS LINE AND FITNESS', '', 'BESIDE CHIMAKURTHY EYE HOSPITAL,KURNOOL ROAD,PRAKASAM ONGOLE - ( ANDHRA PRADESH )', 'ONGOLE', 'Andhra Pradesh', 'India', '', 'register', '37BTTPB5693R1Z1', '', '09908397060', '', '', '2019-01-12 11:01:43', 0),
(166, 'GUJARAT SPORTS', '', 'A-687,KAMDHENU COMMERCIAL COMPLEX,POLYTECHNIC CROSS ROADS,OPP SAHAJANAND COMPLEX AMBAWADI DISTT : AHMEDABAD - ( GUJARAT )', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AABFG7111R1ZA', '', '07926305198', '', '', '2019-01-12 11:01:45', 0),
(167, 'KAMLAKAR HARMONIUM SHOP', '', 'LAXMINARAYAN MANDIR BUILDING, MAIN ROAD, CHANDRAPUR CITY,CHANDRAPUR - DISTT : NASHIK  MAHARASHTRA', 'NASHIK', 'Maharashtra', 'India', '442402', 'register', '27ACVPK7620H1Z6', '', '07172253724', '', '', '2019-01-12 11:01:15', 0),
(168, 'PLAYBALL SPORTS', '', 'RUBCO BUILDING,OPP VADANPALLY PLICE STATION DISTT : THRISSUR', 'VADANAPALLY', 'Kerala', 'India', '680614', 'register', '32AXCPG5094R1Z2', '', '9048092229', '', '', '2019-01-12 11:01:56', 0),
(169, 'SUMAN & COMPANY', '', '14A,SHIVAJI STADIUM MARKET,KOHLAPUR - ( MAHARASHTRA )', 'KOHLAPUR', 'Maharashtra', 'India', '416012', 'register', '27ABRPS3571Q1ZJ', '', '9096764639', '', '', '2019-01-12 12:01:13', 0),
(170, 'PANKAJ SPORTS', '', 'DR. B.C ROY MARKET,SHOP NO. E-3/17 MAIDAN MARKET KOLKATA - ( WEST BENGAL )', 'KOLKATA', 'West Bengal', 'India', '', 'register', '19BEVPG6232C1ZE', '', '09903679334', '', '', '2019-01-12 12:01:48', 0),
(171, 'ASHOK TRADING CO.', '', 'NO.15 BVK LYENGAR RD,ANCHEPET,CHICKPET BENGALURU- ( KARNATAKA )', 'BENGALURU', 'Karnataka', 'India', '', 'register', '29ABZPD2887Q1ZD', '', '8041225131', '', '', '2019-01-12 01:01:13', 0),
(172, 'NEW ASIAN SPORTS', 'AJAY KUMAR', 'PLOT NO. 1,GALI NO. 1 NEW GOPAL NAGAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03AALPR9909A1ZP', '', '94170-02427', '', '', '2019-01-14 12:01:08', 0),
(173, 'EON SPORTS & FITNESS', '', '18/2,2ND FLOOR,1ST CROSS MUNIYAPPA COMPLEX BANGALORE - ( KARNATAKA )', 'BANGALORE', 'Karnataka', 'India', '560040', 'register', '29AADFE5685N1ZP', '', '8023386400', '', '', '2019-01-14 05:01:10', 0),
(174, 'BLM SPORTS & FITNESS', '', 'UC-1 AMBEDKAR SARANI BENGAL AMBUJA CITY CENTRE URVASHI COMMERCIAL COMPLEX, DURGAPUR - ( WEST BENGAL )', 'DURGAPUR', 'West Bengal', 'India', '', 'register', '19BAPPP7716J1ZX', '', '9832234598', '', '', '2019-01-14 05:01:16', 0),
(175, 'CENTURY INDIA', '', 'K-13,SAWAN PARK ASHOK VIHAR PHASE-3,NEW DELHI', 'NEW DELHI', 'Delhi', 'India', '110052', 'register', '07AAEPA7037M1ZP', '', '9312281121', '', '', '2019-01-15 10:01:09', 0),
(176, 'SHIV SPORTS', '', 'SHOP NO. 12,SHIV SHAKTI SHOPPING CENTRE,BESIDE RAJHANS OLAMPIYA,BHATAR ROAD, SURAT - ( GUJARAT )', 'SURAT', 'Gujarat', 'India', '', 'unregister', '', '', '7600775244', '', '', '2019-01-15 10:01:19', 0),
(177, 'MBS SPORTS', '', '5,GITANJALI COMPLEX,OPP ZILA PANCHAYAT NEAR HDFC BANK, PALANPUR - ( GUJARAT )', 'PALANPUR', 'Gujarat', 'India', '', 'register', '24CJTPP7620P1ZB', '', '95374419552', '', '', '2019-01-15 10:01:53', 0),
(178, 'T.M SPORTS', '', 'D3/15/16,DR B.C ROY MARKET,MAIDAN MARKET KOLKATA - ( WEST BENGAL )', 'KOLKATA', 'West Bengal', 'India', '', 'register', '19AFWPA5732J1Z0', '', '8584966603', '', '', '2019-01-17 10:01:44', 0),
(179, 'MAANASVI SPORTS WORLD', '', 'JUNA RASTA,NEAR CHAROTAR BANK & GAYATRI KHAMAN ANAND - ( GUJARAT )', 'ANAND', 'Gujarat', 'India', '388001', 'register', '24ALKPP6289P1Z3', '', '9825043134', '', '', '2019-01-17 10:01:19', 0),
(180, 'VAKIL SPORTS', '', '106 SILICON VALLEY COMPLEX,OPP ISCON SQUARE,SHIVRANJANI CROSS ROAD SATELLITE ROAD,AHMEDABAD', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AABFV4710H1Z4', '', '8146558134', '', '', '2019-01-17 11:01:37', 0),
(181, 'MANOJ AGENCIES', '', 'JAI NEW PANDIT COLONY,SAHARANPUR RD NASIK - ( MAHARASHTRA )', 'NASIK', 'Maharashtra', 'India', '', 'register', '27AQOPS7436E1ZC', '', '9975559138', '', '', '2019-01-17 11:01:01', 0),
(182, 'SHREE SPORTS & SCIENTIFIC', '', '1-5 DREAM HOUSE,DATTA MANDIR ROAD,NASIK ROAD NASIK - ( MAHARASHTRA )', 'NASHIK', 'Maharashtra', 'India', '', 'register', '27ADUPC7917P1ZO', '', '02532451247,02532451947', '', '', '2019-01-17 11:01:20', 0),
(183, 'AUXILIUM SPORTS CO.', '', 'NIRMALA CONVENT RD,NEAR KP NAGAR,BBENZ CIRCLE VIJAYWADA - ( ANDHRA PRADESH )', 'VIJAYWADA', 'Andhra Pradesh', 'India', '', 'register', '37AAZFA7265Q1Z8', '', '8500536689', '', '', '2019-01-17 11:01:44', 0),
(184, 'SPORTS CAMP', '', 'B 1,MODERN COMPLEX,BESIDE PNB,MOTIBAGH CHOWNK RAIPUR - ( CHATTISGARH )', 'RAIPUR', 'Chhattisgarh', 'India', '', 'register', '22BPZPA0773D1Z2', '', '9039386829', '', '', '2019-01-17 11:01:51', 0),
(185, 'DELUXE SPORTS', '', 'NEAR BANK OF INDIA,MAIN ROAD,CHANDRAPUR - ( MAHARASHTRA )', 'CHANDRAPUR', 'Maharashtra', 'India', '442402', 'register', '27ACIPP9467A1ZB', '', '9822225502', '', '', '2019-01-17 11:01:00', 0),
(186, 'GUPTA STORES', '', 'AMAHIYO RD,REWA - ( MADHYA PRADESH )', 'REWA', 'Madhya Pradesh', 'India', '486001', 'register', '23AEXPG3539B1ZM', '', '7662253330', '', '', '2019-01-17 11:01:01', 0),
(187, 'SURAT SPORTS', '', 'M-11-13,KRISHNA COMPLEX OPP SADAR BRIDGE CIRCLE,ADAJAN ROAD SURAT - ( GUJARAT )', 'SURAT', 'Gujarat', 'India', '', 'register', '24ACAPR970K1ZF3', '', '9227447923', '', '', '2019-01-17 11:01:31', 0),
(188, 'VIZAG SPORTS', '', '52-10,41/2,RAMA TALKIES RD,NEAR CMR CENTRAL,RESAPUVANIPALEM,DWARKA NAGAR VISAKHAPATNAM - ( ANDHRA PRADESH )', 'VISAKHAPATNAM', 'Andhra Pradesh', 'India', '530016', 'register', '37ALBPR7248H1ZR', '', '08916666698', '', '', '2019-01-17 11:01:11', 0),
(189, 'MODERN SPORTS AGENCY', '', 'SAIBABA MANDIR RD WARDHA - ( MAHARASHTRA ) ', 'WARDHA', 'Maharashtra', 'India', '442001', 'register', '27AJZPB0765F1Z0', '', '9890539755', '', '', '2019-01-17 11:01:12', 0),
(190, 'ELITE SPORTS & FITNESS WORLD', '', 'OPP,GOPAL KIRANA STORE,OLD COTTON MARKET RD,AMRAVATI - ( MAHARASHTRA )', 'AMRAVATI', 'Maharashtra', 'India', '444601', 'register', '27AFRPB9499Q1Z5', '', '9420832720', '', '', '2019-01-17 11:01:04', 0),
(191, 'SPORTS WORLD', '', 'PLOT NO 72,ANAND NAGAR,NEWBOWENPALLY NEAR CHANDANA HOSPITAL SECUNDERABAD - ( TELENGANA )', 'SECUNDERABAD', 'Telangana', 'India', '500011', 'register', '36DMNPS1909E1ZT', '', '9885133392', '', '', '2019-01-17 11:01:31', 0),
(192, 'NEW GREY HOUND INTL. SPORTING GOODS', '', '986,BHAGAT SINGH NAGAR,MODEL HOUSE,JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144003', 'register', '03AMPLK4636P2ZL', '', '9914141181', '', '', '2019-01-17 02:01:01', 0),
(193, 'BHARAT SPORTS', '', 'PBR TOWER,NEAR CHECK POST,SHOP NO. G21-22,SEVOKE ROAD SILIGURI', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19AATFB9376K1ZF', '', '8391068414', '', '', '2019-01-18 10:01:46', 0),
(194, 'KALAVADIA BROTHERS', '', 'KRISHNA CHAMBERS,1ST FLOOR,PANCHESHWAR TOWER ROAD,OPP. SHALIGRAM APP,JAMNAGAR', 'JAMNAGAR', 'Gujarat', 'India', '361001', 'register', '24AJJPK6635R1ZJ', '', '9427241513', '', '', '2019-01-18 10:01:37', 0),
(195, 'WESTERN INDIA SPORTS', '', 'OPP. VICAS YAMAHA SHOWROOM,NEAR MALAVIYA PETROL PUMP GONDAL ROAD,RAJKOT', 'RAJKOT', 'Gujarat', 'India', '', 'register', '24ABAPR2568K1ZG', '', '9925564628', '', '', '2019-01-18 10:01:53', 0),
(196, 'YOUNG INDIA SPORTS', '', '1ST FLOOR,UPNISHAD ARC,VIR MOKHDAJI CIRCLE, NR. B-DIVISION,GHOGHA ROAD,BHAVNAGAR', 'BHAVNAGAR', 'Gujarat', 'India', '364001', 'register', '24CWQPB3525F1ZR', '', '', '', '', '2019-01-18 10:01:22', 0),
(197, 'MIRU SPORTS', '', 'NO.10/1,C4,CAPE ROAD ASHRAMAM NAGERCOIL,KANYAKUMARI,TAMILNADU', 'KANYAKUMARI', 'Tamil Nadu', 'India', '629704', 'register', '33BMDPP0045E1ZL', '', '', '', '', '2019-01-18 10:01:11', 0),
(198, 'PLAYERS SPORTS WORLD', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-18 12:01:31', 0),
(199, 'PAUL BROTHERS', '', 'COOCH BEHAR', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-18 12:01:21', 0),
(200, 'B.DASS GUPTA & CO.', '', 'SHAM BAZAAR,KOLKATA', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-18 12:01:01', 0),
(201, 'SAMRAT SPORTS', '', '122 PIRTALA,SANSKARI PUKUR,P.O SREEPALLY BARDHWAN', 'BARDHWAN', 'West Bengal', 'India', '', 'unregister', '', '', '', '', '', '2019-01-18 12:01:53', 0),
(202, 'MAYA SPORTS INDUSTRY', '', '110,RABINDRA SARANI,1ST FLOOR,KOLKATA', 'KOLKATA', 'West Bengal', 'India', '', 'unregister', '', '', '', '', '', '2019-01-18 12:01:35', 0),
(203, 'G.K SPORTS', '', '30,J-L NEHRU ROAD,KOLKATA', 'KOLKATA', 'West Bengal', 'India', '700016', 'unregister', '', '', '', '', '', '2019-01-18 12:01:46', 0),
(204, 'UNITED IMPORTERS', '', '26,JAWAHARLAL NEHRU ROAD,1ST FLOOR,KOLKATA', 'KOLKATA', 'West Bengal', 'India', '700087', 'register', '19AAAFU7044C1ZB', '', '', '', '', '2019-01-18 12:01:54', 0),
(205, 'SUNRISE SPORTS', '', '3,AMARTALLA STREET,KOLKATA', 'KOLKATA', 'West Bengal', 'India', '700001', 'register', '19ALHPS3956R1ZY', '', '9831077392', '', '', '2019-01-18 12:01:59', 0),
(206, 'PANKAJ SPORTS', '', '', 'KOLKATA', 'SELECT STATE', 'India', '', 'register', '19BEVPG6232C1ZE', '', '', '', '', '2019-01-18 01:01:45', 0),
(207, 'SACHIN SPORTS', '', '1-A, Wallajah Road, Chepauk, Chennai, Tamil Nadu ', 'CHENNAI', 'Tamil Nadu', 'India', '600002', 'register', '33BSOPS9358E1Z5', '', '044 2859 1109', '', '', '2019-01-18 01:01:55', 0),
(208, 'ESBEE SPORTS', '', '54/55, Wallajah Road, Near D1 Police Station,, Opp. Tamil Nadu Tourism, Chennai', 'CHENNAI', 'Tamil Nadu', 'India', ' 600002', 'register', '', '', '08071 268 255', '', '', '2019-01-18 01:01:56', 0),
(209, 'NEW ANAND SPORTS', '', 'BLUE CORRIDOR,NEAR D.Z PATEL SCHOOL 80 FT RD ANAND - ( GUJARAT )', 'ANAND', 'Gujarat', 'India', '', 'register', '24AAMFN7247E1Z6', '', '9825429449,2692249757', '', '', '2019-01-18 01:01:16', 0),
(210, 'SHARMA SPORTS AGENCIES', '', 'OPP CANARA BANK,DABA GARDENS,VISAKHAPATNAM - ( ANDHRA PRADESH )', 'VISAKHAPATNAM', 'Andhra Pradesh', 'India', '530020', 'register', '37ABBFS1588H1ZX', '', '9292009333', '', '', '2019-01-18 01:01:34', 0),
(211, 'SHREE SAHJANAND SPORTS', '', 'MIRJAPUR HIGHWAY BHUJ-KUTCH', 'BHUJ-KUTCH', 'Gujarat', 'India', '370001', 'register', '24ACHFS5235L1ZV', '', '7226006776', '', '', '2019-01-18 01:01:06', 0),
(212, 'SS PLAYERS LOUNGE', '', 'RAILWAY STATION ROAD,BHARUCH,GUJARAT', 'BHARUCH', 'Gujarat', 'India', '392201', 'register', '24AHSPJ2572M1ZU', '', '7610378103', '', '', '2019-01-18 01:01:42', 0),
(213, 'SPORTS SUPPLIER', '', 'NANDI DARSHAN COMPLEX BANGALORE', 'BANGALORE', 'Karnataka', 'India', '560053', 'register', '29AALPJ0240Q1ZC', '', '8022874514', '', '', '2019-01-18 01:01:20', 0),
(214, 'KOHLI SPORTS', '', 'OP BANK OF INDIA AMINABAD LUCKNOW', 'LUCKNOW', 'Uttar Pradesh', 'India', '226001', 'register', '09AARFK7631C2Z3', '', '9793373311', '', '', '2019-01-18 02:01:44', 0),
(215, 'DURGA ENTERPRISES', '', 'SHOP NO-39-40,MAHARAJ BAGH ROAD SITABULDI NAGPUR', 'NAGPUR', 'Maharashtra', 'India', '440012', 'register', '27AITPD4687M1ZE', '', '8552890126', '', '', '2019-01-18 04:01:03', 0),
(216, 'HAOOZAT SPORTS CORNER', '', 'NEAR ASHOK GUET HOUSE RAJKOT', 'RAJKOT', 'Gujarat', 'India', '360004', 'register', '24ABXPG1608A1Z2', '', '9426936366', '', '', '2019-01-18 04:01:51', 0),
(217, 'SPORTS ZONE ', '', '', 'SILIGURI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-19 10:01:30', 0),
(218, 'KAVERI SPORTS', '', 'Shop no:401, complex no:9, 4th floor, Kum kum arcade, Narayana Mudali Street, Sowcarpet, ChennaI', 'CHENNAI', 'Tamil Nadu', 'India', '600079', 'register', '03AJFPR8099A1Z2', '', ' 098841 57619', '', '', '2019-01-19 12:01:55', 0),
(219, 'DHONI SPORTS', '', 'WALAJA ROAD, Chepauk, Triplicane, Chennai, Tamil Nadu', 'CHENNAI', 'Tamil Nadu', 'India', '600005', 'register', '33FJVP50209E1Z4', '', '044 2854 3118', '', '', '2019-01-19 12:01:31', 0),
(220, 'NEW DENIM SPORTS', '', '', 'AMRAVATI', 'Maharashtra', 'India', '', 'register', '27BNVPP2288L1ZY', '', '', '', '', '2019-01-19 12:01:57', 0),
(221, 'JYOTI SPORTS WORLD', '', ' Shahu Stadium,, Satara, Maharashtra', 'SATARA', 'Maharashtra', 'India', '415001', 'register', '27AKWPP6786C1ZC', '', '9822498490', '', '', '2019-01-19 12:01:50', 0),
(222, 'RAMNIK LAL & SONS', '', '', 'SANGLI', 'SELECT STATE', 'India', '', 'register', '27ALCPS3030P1ZT', '', '', '', '', '2019-01-19 12:01:05', 0),
(223, 'QUALITY SPORTS', '', 'PANHALA', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '9011113199', '', '', '2019-01-19 12:01:51', 0),
(224, 'SAI SPORTS', '', '', 'NASHIK', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-19 12:01:23', 0),
(225, 'PRAGATI SPORTS POINT', '', 'GANDHI CHOWK,NAMUNA LINE NO. 1, AMRAVATI', 'AMRAVATI', 'Maharashtra', 'India', '', 'register', '27AZAPP2681B1ZK', '', '9595955692', '', '', '2019-01-19 12:01:03', 0),
(226, 'SHIV SPORTS POINT', '', 'NAMUNA GALLI NO.1,GANDHI CHOWK,AMRAVATI', 'AMRAVATI', 'Maharashtra', 'India', '444601', 'register', '27AGPPP0371C1ZE', '', '07212652222', '', '', '2019-01-19 12:01:07', 0),
(227, 'INDIAN SPORTS', '', 'SHOP NO.97 RAVI SHANKAR STADIUM DURG', 'DURG', 'Chhattisgarh', 'India', '', 'register', '22AKZPM3049G1ZW', '', '9406105786', '', '', '2019-01-19 01:01:27', 0),
(228, 'SPORTS LINK', '', 'NIMA COMPLEX TEMPLE BAZAR SITABULDI NAGPUR ', 'NAGPUR', 'Maharashtra', 'India', '440012', 'register', '27AATPT5744M1ZN', '', '9960340888', '', '', '2019-01-19 01:01:30', 0),
(229, 'ROYAL SPORTS', '', '5,SUTAR GALI NAGAR NIGAM ROAD INDORE ', 'INDORE', 'SELECT STATE', 'India', '452007', 'register', '23AJZPM8966D1ZI', '', '8889988811', '', '', '2019-01-19 01:01:42', 0),
(230, 'CITY SPORTS', '', 'PARIMAL CHWNK,BHAVNAGAR', 'BHAVNAGAR', 'Gujarat', 'India', '364002', 'register', '24AJMPG0166G1ZH', '', '9428401994', '', '', '2019-01-19 04:01:44', 0),
(231, 'GHANSHYAM SPORTS', '', 'KALWA CHWONK,JUNAGADH', 'JUNAGADH', 'Gujarat', 'India', '362001', 'register', '24AFVPD8821L1ZZ', '', '9428439388', '', '', '2019-01-19 04:01:30', 0),
(232, 'SPORTS LAND', '', 'VAKIL WADI M.G RD', 'NASHIK', 'Maharashtra', 'India', '422001', 'register', '27AHTPC7839D1Z1', '', '9371524222', '', '', '2019-01-19 04:01:08', 0),
(233, 'SPORTS N SPORTS', '', 'GANDHINAGAR VIJAYWADA', 'VIJAYWADA', 'Andhra Pradesh', 'India', '520003', 'register', '37BIMPS4494K1ZB', '', '9885308877', '', '', '2019-01-19 04:01:22', 0),
(234, 'BHARAT SPORTS PVT LTD', '', 'MAHATAMA GANDHI ROAD SECUNDRABAD', 'SECUNDRABAD', 'Telangana', 'India', '500003', 'register', '36AAHCB5635Q1Z3', '', '9640338686', '', '', '2019-01-19 04:01:54', 0);
INSERT INTO `persons` (`id`, `name`, `contactperson`, `street`, `city`, `state`, `country`, `pincode`, `gsttype`, `gstin`, `cin`, `mobile`, `tel`, `email`, `created_datetime`, `deleted`) VALUES
(235, 'P.NARESH SPORTS', '', '534/7, SIDDHESH APARTMENT, TUKDOJI CHOWK, HANUMAN NAGAR, NAGPUR - ( MAHARASHTRA )', 'NAGPUR', 'Maharashtra', 'India', '440009', 'register', '27AIRPP3316M1ZO', '', '09423058558', '', '', '2019-01-19 04:01:57', 0),
(236, 'SHREE SAI SPORTS', '', 'PALANPUR RANDER ROAD,SURAT', 'SURAT', 'Gujarat', 'India', '395009', 'register', '24ACXPC0706E1ZZ', '', '9426777336', '', '', '2019-01-19 04:01:29', 0),
(237, 'SAI SPORTS & MUSICAL', '', 'GROUND FLOOR SHOP,GAURAKSHAN ROAD AMRAVATI', 'AMRAVATI', 'Maharashtra', 'India', '444601', 'register', '27ACUPL9098B1ZY', '', '9370563117', '', '', '2019-01-19 05:01:03', 0),
(238, 'VEDEKAR SPORTS', '', 'KHANBAG SANGLI', 'SANGLI', 'Maharashtra', 'India', '416416', 'register', '27AAPPY7254D1Z4', '', '9403156155', '', '', '2019-01-19 05:01:12', 0),
(239, 'PLANET SPORTS', '', 'NEAR NATINAL COLLEGE', 'BANGALORE', 'Karnataka', 'India', '560004', 'register', '29AHZPK8649K1Z2', '', '9845330330', '', '', '2019-01-21 10:01:01', 0),
(240, 'PLAYWELL SPORTS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-21 10:01:34', 0),
(241, 'HERITAGE SPORTS', '', '', 'MYSORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-21 10:01:09', 0),
(242, 'THE CROWN CRICKETER', '', '', 'BANGALORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-21 10:01:42', 0),
(243, 'PUNTU SPORTS', '', 'GROUND FLOOR SHOP NO.20 BENGALORE', 'BENGALORE', 'Karnataka', 'India', '', 'unregister', '', '', '', '', '', '2019-01-21 10:01:32', 0),
(244, 'UNIVERSAL SPORTING CO.', '', 'SATRI COMPLEX BANGALORE', 'BANGALORE', 'Karnataka', 'India', '', 'unregister', '', '', '9035805694', '', '', '2019-01-21 10:01:29', 0),
(245, 'OLYMPA SPORTS & FITNESS', '', 'OPP. NEW PUBLIC GRAND M.C LAYOUT VIJAY NAGAR', 'BAGALORE', 'Karnataka', 'India', '', 'register', '29ABQPL67071ZT', '', '', '', '', '2019-01-21 12:01:14', 0),
(246, 'OLYMPIC TROPHIES & SPORTS', '', 'K.H ROAD ( DOUBLE ROAD ) BANGALORE', 'BANGALORE', 'Karnataka', 'India', '', 'register', '29AAAFO1966F1Z7', '', '08042434546', '', '', '2019-01-21 12:01:12', 0),
(247, 'OLYMPIC SPORTING CO.', '', 'GANDHINAGAR,BANGALORE', 'BANGALORE', 'Karnataka', 'India', '560009', 'unregister', '', '', '9739379681', '', '', '2019-01-21 12:01:34', 0),
(248, 'PLAYERS CHOICE', '', 'KRISHNA TOWER,GANDHINAGAR,BANGALORE', 'BANGALORE', 'Karnataka', 'India', '560009', 'register', '29AAGPD2410B1ZI', '', '08041329459', '', '', '2019-01-21 12:01:28', 0),
(249, 'WINNER SPORTS & FITNESS', '', 'SRINIVASNAGAR BANGALORE', 'BANGALORE', 'Karnataka', 'India', '', 'unregister', '', '', '', '', '', '2019-01-21 12:01:25', 0),
(250, 'SPORTS BONANZA', '', 'BALAJI COLONY TIRUPATI', 'TIRUPATI', 'Andhra Pradesh', 'India', ' 517501', 'unregister', '', '', '', '', '', '2019-01-21 12:01:39', 0),
(251, 'GENRAL SPORTS', '', 'MALIKARJUNA ROAD,GANDHI NAGAR VIJAYWADA', 'VIJAYWADA', 'Andhra Pradesh', 'India', '520032', 'register', '37AAKFG8818N1ZM', '', '', '', '', '2019-01-21 12:01:35', 0),
(252, 'CHARAN SPORTS', '', 'GAYATHRI NAGAR VIJAYWADA', 'VIJAYWADA', 'Andhra Pradesh', 'India', '', 'unregister', '', '', '9505576727', '', '', '2019-01-21 12:01:52', 0),
(253, 'VIZAG SPORTS', '', 'NEAR CMR CENTRAL,VISAKHAPATNAM', '', 'Andhra Pradesh', 'India', '', 'register', '37ALBPR7248H1ZR', '', '', '', '', '2019-01-21 12:01:31', 0),
(254, 'SPORTS & FITNESS PLANET TROPHY GALLERY', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '01815019726', '', '', '2019-01-21 12:01:43', 0),
(255, 'CHARAN SPORTS', '', '', 'VIJAYWADA', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-21 12:01:06', 0),
(256, 'HARSHA SPORTS ', '', '', 'SHIMOGA', 'Karnataka', 'India', '', 'register', '29AAJFM7191N1ZJ', '', '9035599644', '', '', '2019-01-21 12:01:46', 0),
(257, 'CRICKET DEN', '', '', 'SHIVAJINAGAR', 'Karnataka', 'India', '560042', 'unregister', '', '', '08025591089', '', '', '2019-01-23 12:01:06', 0),
(258, 'VENUS SPORTS', '', '', 'CHENNAI', 'SELECT STATE', 'India', '', 'register', '33ABRPI0622C1Z7', '', '', '', '', '2019-01-23 03:01:46', 0),
(259, 'KRIDA PARK', '', 'WALLAJAH ROAD', 'CHENNAI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-23 03:01:40', 0),
(260, 'SPORTS SUPPLIERS', '', '', 'CHENNAI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-23 03:01:10', 0),
(261, 'JAY SOMNATH SPORTS', '', 'NEAR BALAJI HALL', 'RAJKOT', 'Gujarat', 'India', '360004', 'unregister', '24ARJPC6306M1ZT', '', '8905205205', '', '', '2019-01-23 05:01:51', 0),
(262, 'PRAGATI SPORTS POINT', '', 'GANDHI CHOWNK', 'AMRAVATI', 'Maharashtra', 'India', '444601', 'register', '27AZAPP2681B1ZK', '', '9595955692', '', '', '2019-01-23 05:01:06', 0),
(263, 'SPORTS LINK', '', 'NIMA COMPLEX', '', 'Maharashtra', 'India', '440012', 'register', '27AATPT5744M1ZN', '', '9960340888', '', '', '2019-01-23 05:01:55', 0),
(264, 'SHITAL SPORTS', '', 'BUSINESS TERMINAL', 'RAJKOT', 'Gujarat', 'India', '360001', 'register', '24AAXFS4580Q1Z3', '', '9727726300', '', '', '2019-01-23 05:01:08', 0),
(265, 'SHAN SPORTS', '', 'JILLA RISHAD, MKT COMPLEX PASCHIM MEDINIPUR - ( WEST BENGAL )', 'MEDINIPUR', 'West Bengal', 'India', '721101', 'register', '19AXSPG0218M1Z4', '', '8373084969', '', '', '2019-01-23 05:01:31', 0),
(266, 'MAHIR SPORTS AND RADIUM', '', 'OPP IDBI BANK', 'KUTCH', 'Gujarat', 'India', '370201', 'register', '24BRLPG6645N1ZA', '', '9638900010', '', '', '2019-01-23 05:01:44', 0),
(267, 'N.G. ENTERPRISES', '', '10,MAJIT NAGAR,BASTI GUZAN JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144001', 'register', '03AAHFN1445M1ZA', '', '9888474411', '', '', '2019-01-24 09:01:14', 0),
(268, 'SAURAV', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-24 11:01:47', 0),
(269, 'DEEPAK SPORTS EQUIPMENT', '', 'STATION ROAD,BILIMORA', 'BILIMORA', 'Gujarat', 'India', '396321', 'register', '24AEJPG3650H1ZQ', '', '9428758212', '', '', '2019-01-24 12:01:16', 0),
(270, 'RADHE SPORTS', '', 'ANAND VIDYA NAGAR ROAD', 'ANAND', 'Gujarat', 'India', '388120', 'register', '24ANBPP3488M1ZJ', '', '9825371132', '', '', '2019-01-24 12:01:42', 0),
(271, 'S LODHA & CO.', '', 'BALAJI MARKET', 'BHILWARA', 'Rajasthan', 'India', '', 'register', '08AAGPL3325F1ZY', '', '9829562067', '', '', '2019-01-24 12:01:22', 0),
(272, 'PHOENIX SPORTS', '', 'SHOP NO. 2,SHOPPING CENTRE,SHASTRI NAGAR,CHENNAI', 'CHENNAI', 'Tamil Nadu', 'India', '', 'register', '33AXMPR233C1Z5', '', '', '', '', '2019-01-25 10:01:51', 0),
(273, 'RAGURAM SPORTS EMPORIUM', '', '', 'CHENNAI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-25 10:01:45', 0),
(274, 'SUNRISE SPORTS', '', '3,AMARTALLA STREET,KOLKATA', 'KOLKATA', 'West Bengal', 'India', '700001', 'unregister', '', '', '09831077392', '', '', '2019-01-25 10:01:13', 0),
(275, 'LIBERTY SPORTS', '', 'GULAB NIWAS,MI ROAD', 'JAIPUR', 'Rajasthan', 'India', '302001', 'register', '08AAAFL6700A1ZY', '', '9888556243', '', '', '2019-01-25 11:01:06', 0),
(276, 'JAYENA SPORTS', '', 'SURYA DARSHAN COMPLEX,JAHARGIRPURA', 'SURAT', 'Gujarat', 'India', '395005', 'register', '24CCBPP8683F1ZC', '', '', '', '', '2019-01-25 11:01:52', 0),
(277, 'SATYADEV SPORTS CO.', '', 'SAINIKPURI,OPP. DING DONG SECUNDERABAD', 'SECUNDERABAD', 'Telangana', 'India', '500094', 'register', '36EFOPS7439E1ZT', '', '9640383784', '', '', '2019-01-25 12:01:54', 0),
(278, 'BALAJI SPORTS CENTRE', '', 'VEERAPANDIYAAR NEAR BUS STAND', 'CHENNAI', 'SELECT STATE', 'India', '', 'register', '33BJVPP7353N1Z9', '', '', '', '', '2019-01-25 01:01:34', 0),
(279, 'PLAYERS SPORTS WORLD', '', 'VIDHAN MARKET', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19DLSPK0043K1ZQ', '', '', '9547824362', '', '2019-01-25 01:01:21', 0),
(280, 'WESTERN INDIA SPORTS', '', 'NEAR MALAVIYA PETROL PUMP', 'RAJKOT', 'Gujarat', 'India', '360001', 'register', '24ABAPR2568K1ZG', '', '9925564628', '', '', '2019-01-25 01:01:52', 0),
(281, 'SPORTS ZONE', '', 'KHUDIRAM PALLY', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19AGMPG3170H1ZB', '', '9832091343', '', '', '2019-01-25 03:01:32', 0),
(282, 'STAR SPORTS', '', 'DHARMPURI', '', 'Tamil Nadu', 'India', '', 'register', '33AKVPK2106N1ZW', '', '', '', '', '2019-01-25 05:01:15', 0),
(283, 'VIJ CORPORATION', '', '', 'CHENNAI', 'SELECT STATE', 'India', '641002', 'register', '33AONPS6228B1ZU', '', '', '', '', '2019-01-28 11:01:32', 0),
(284, 'SS SPORTS', '', 'NEAR GOONDER COMPLEX', 'CHENNAI', 'Tamil Nadu', 'India', '638011', 'register', 'BMVPS6598F1Z4', '', '', '', '', '2019-01-28 11:01:02', 0),
(285, 'JANATHA SPORTS', '', 'HEAD POST OFFICE ROAD,', 'CHENNAI', 'Tamil Nadu', 'India', '641001', 'register', '33AMBPV6730D1Z8', '', '', '', '', '2019-01-28 11:01:03', 0),
(286, 'V.G SPORTS & MUSICAL', '', 'POLIMOODU JUNCTION', 'THIRUVANANTHAPURAM', 'Kerala', 'India', '695001', 'register', '32AOPPG7499N1Z2', '', '9020301215', '', '', '2019-01-28 03:01:10', 0),
(287, 'MAHARANI SPORTS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-29 12:01:47', 0),
(288, 'MAHAVIR SPORTS & FITNESS', '', '', 'INDORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-29 01:01:53', 0),
(289, 'STADIUM SPORTS', '', '', 'TIRUPUR', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-29 03:01:40', 0),
(290, 'SUPER SPORTS', '', 'SANJAR SQUARE,KIMCHAR RASSTA', 'KIM', 'Gujarat', 'India', '394111', 'register', '24AXCPP2090C1ZV', '', '9898153880', '', '', '2019-01-29 04:01:51', 0),
(291, 'CENTURY SPORTS', '', 'PULIMOODU', '', 'Kerala', 'India', '', 'register', '32AFAPP350121ZS', '', '04712471972', '', '', '2019-01-29 04:01:22', 0),
(292, 'SPORTS LAND', '', '', 'PULIMOODU', 'Kerala', 'India', '695001', 'register', '', '', '04712336466', '', '', '2019-01-29 04:01:19', 0),
(293, 'VEDANT SPORTS', '', 'SHAHADA DIST NANDURBA', 'SHAHADA', 'Maharashtra', 'India', '425409', 'register', '27BYMPP8253K1ZM', '', '9878316280', '', '', '2019-01-31 11:01:50', 0),
(294, 'ASHOKA SPORTS', '', 'KALPITA ENCLAVE,ANDHERI EAST', 'MUMBAI', 'Maharashtra', 'India', '400069', 'register', '27AAGPA5705J1ZW', '', '9820687236', '', '', '2019-01-31 11:01:46', 0),
(295, 'HAFIZ KHATRI', '', 'PYDHONIE NEAR NULL BAZAR', 'MUMBAI', 'Maharashtra', 'India', '400003', 'unregister', '', '', '9833666821', '', '', '2019-01-31 11:01:10', 0),
(296, 'CITY SPORTS', '', 'BALAJI TRADELINKS', 'RAJKOT', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-01-31 12:01:22', 0),
(297, 'LUCKY SPORTS', '', 'GUR BANGA COMPLEX', 'VISAKHAPATNAM', 'Andhra Pradesh', 'India', '530016', 'register', '37ACHPM2085Q1ZX', '', '9963333533', '', '', '2019-01-31 04:01:58', 0),
(298, 'LUCKY SPORTS', '', 'GUR BANGA COMPLEX,VISAKHAPATNAM', 'VISAKHAPATNAM', 'Andhra Pradesh', 'India', '530016', 'register', '37ACHPM2085Q1ZX', '', '09963333533', '', '', '2019-02-01 09:02:43', 0),
(299, 'ARMOUR SPORTS', '', 'APOLIO TOWER,INDORE', 'INDORE', 'Madhya Pradesh', 'India', '452001', 'register', '23ARHPS1529E1ZZ', '', '07312524205', '', '', '2019-02-01 10:02:13', 0),
(300, 'S36 THE SPORTS & ENTERTAINMENT', '', 'NEAR SREEKRISHNA TEMPLE,ERNAKULAM,KERALA', 'ERNAKULAM', 'Kerala', 'India', '682024', 'register', '32AAOCS7989K1ZE', '', '9846072456', '', '', '2019-02-02 12:02:12', 0),
(301, 'S.R SPORTS', '', 'NEAR S.P RIMG ROAD BHOPAL', 'BHOPAL', 'Gujarat', 'India', '', 'register', '24CTEPR8241R1ZX', '', '8401994169', '', '', '2019-02-02 12:02:13', 0),
(302, 'SPORTS SPIRIT', '', 'SARJAPUR MAIN ROAD, BANGALORE', 'BANGALORE', 'Karnataka', 'India', '560035', 'register', '29ASEPK4468L1Z5', '', '9686211202', '', '', '2019-02-02 01:02:26', 0),
(303, 'QUALITY SPORTS C/O DALIP JOSHI', '', 'SINGHLANE', 'PINHALA', 'Maharashtra', 'India', '416201', 'unregister', '', '', '9011113199', '', '', '2019-02-02 04:02:00', 0),
(304, 'VEJEY SPORTS', '', 'NEAR JOSEPH CHURCH,TRICHY', 'TRICHY', 'SELECT STATE', 'India', '620002', 'register', '33AAFFV7491P1ZD', '', '7837071676', '', '', '2019-02-04 10:02:35', 0),
(305, 'POPLI BROTHERS', '', '', 'MADURAI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-04 10:02:07', 0),
(306, 'ANKIT SPORTS', '', 'DEOGHAR - ( JHARKHAND )', 'DEOGHAR', 'SELECT STATE', 'India', '814112', 'unregister', '', '', '', '', '', '2019-02-04 10:02:42', 0),
(307, 'HIIWAY SPORTS', '', 'TRICHY', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-04 10:02:17', 0),
(308, 'NEW GUPTA STORES', '', '', 'TRICHY', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-04 10:02:44', 0),
(309, 'WORLD OF CRICKET', '', 'ADWAIT COLONY', 'NASHIK', 'Maharashtra', 'India', '422005', 'register', '27AAGPO5934P1ZZ', '', '9422748777', '', '', '2019-02-04 04:02:21', 0),
(310, 'GABADA SPORTS', '', 'NEAR YAVATMAL MUSIC COUNCIL', 'YAVATMAL', 'Maharashtra', 'India', '445001', 'register', '27AHOPG8708L1ZR', '', '9834347742', '', '', '2019-02-04 04:02:48', 0),
(311, 'SPORTS STATION', '', 'MAIDAN MARKET', 'KOLKATA', 'West Bengal', 'India', '', 'register', '19AOWPD8252R1ZT', '', '9831681163', '', '', '2019-02-04 05:02:31', 0),
(312, 'OLYMPIA SPORTS & FITNESS', '', 'OPPNEW PUBLIC GRAND', 'BANGALORE', 'Karnataka', 'India', '560020', 'register', '29ABQPL6707N1ZT', '', '', '', '', '2019-02-04 05:02:35', 0),
(313, 'STAR SPORTS', '', '', 'tuticorin', 'Tamil Nadu', 'India', '628003', 'unregister', '', '', '', '', '', '2019-02-05 10:02:16', 0),
(314, 'JAY SPORTS', '', 'MOORTHY STREET', '', 'Tamil Nadu', 'India', '', 'register', '33AWDPS3550Q122', '', '9894300979', '', '', '2019-02-05 10:02:33', 0),
(315, 'NEW SPORTS', '', 'SHOP NO 7/8KADAVATHRA ERANAKULAM', '', 'SELECT STATE', 'India', '', 'register', '32AALFN091L1Z8', '', '9447222229', '', '', '2019-02-06 01:02:51', 0),
(316, 'MEENAKSHI SPORTS', '', 'CHENNAI', '', 'SELECT STATE', 'India', '600071', 'register', '33AJPPM4338K1ZU', '', '', '', '', '2019-02-06 01:02:22', 0),
(317, 'PRO SPORTS', '', 'DR B.BARUAH RD,ULUBARI, GUWAHATI - ( ASSAM )', 'GUWAHATI', 'Assam', 'India', '781007', 'unregister', '', '', '9435114797', '', '', '2019-02-06 01:02:44', 0),
(318, 'P.B.TRADING CORPORATION', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-06 01:02:22', 0),
(319, 'VERMA BROTHERS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-06 01:02:27', 0),
(320, 'D.P ENTERPRISES', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-06 01:02:20', 0),
(321, 'D.P ENTERPRISES', '', 'SHIV MANDU GUHATI', 'GUHATI', 'Assam', 'India', '', 'register', '18AILPM5401GIZB', '', '', '', '', '2019-02-06 04:02:59', 0),
(322, 'SILVER SPORTS', '', 'PAN BAZAAR GUWAHATI', 'GUWAHATI', 'Assam', 'India', '781001', 'register', '18AAVFS5842H1Z1', '', '9435019277', '', '', '2019-02-07 12:02:07', 0),
(323, 'J.K SPORTS HUB', '', 'E N COMPLEX SHILLONG ', 'SHILLONG', 'Meghalaya', 'India', '793001', 'register', '17APHPK9403R1Z8', '', '9436165206', '', '', '2019-02-09 11:02:39', 0),
(324, 'PREMIER SPORTS & FITNESS', '', 'BESIDE HONG KONG MARKET GATE NO 2', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19AFDP3161L1ZE', '', '9933007545', '', '', '2019-02-09 11:02:26', 0),
(325, 'SPORTS CENTRE', '', 'A.C PLAZA POLO SHILLONG', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '9863097780', '', '', '2019-02-09 11:02:23', 0),
(326, 'J.S SPORTS & MUSIC', '', 'G.S ROAD SHILLONG', 'SHILLONG', 'Meghalaya', 'India', '793002', 'register', '17AECPK4025M1Z1', '', '9999851117', '', '', '2019-02-09 04:02:23', 0),
(327, 'SPORTS & GAMES', '', 'GT ROAD TOWNHALL', 'BARDHAMAN', 'West Bengal', 'India', '713101', 'register', '19APBPS2758F1ZN', '', '', '', '', '2019-02-11 05:02:01', 0),
(328, 'ashok stores', '', 'NETAJI SUPER MARKET', 'NAGAON', 'Assam', 'India', '', 'register', '18AGUPD0383M1ZW', '', '9954058910', '', '', '2019-02-15 12:02:55', 0),
(329, 'RAJLAXMI STORES', '', 'NOAGAON', '', 'Assam', 'India', '', 'register', '18AGUPK6713G1Z0', '', '9435160428', '', '', '2019-02-15 12:02:12', 0),
(330, 'SITANATH BHANDER', '', 'NAGAON', '', 'Assam', 'India', '', 'register', '18AE6PP0498K1Z2', '', '', '', '', '2019-02-15 12:02:22', 0),
(331, 'SPORTS VILLA', '', '', '', 'Assam', 'India', '', 'unregister', '', '', '', '', '', '2019-02-15 12:02:23', 0),
(332, 'INDIAN SPORTS', '', 'G N B ROAD', '', 'Assam', 'India', '', 'register', '18ABYPB5832G1ZD', '', '', '', '', '2019-02-15 12:02:27', 0),
(333, 'ARIHANT METAL INDUSTRIES', '', 'MAHA MANDAL NR. RING ROAD CIRCLE', 'AHMEDABAD', 'Gujarat', 'India', '382415', 'register', '24AAXFA5267A1ZG', '', '9825173158', '', '', '2019-02-18 10:02:09', 0),
(334, 'INDIA MOTORS', '', 'SHOP NO. 52 M . I ROAD JAIPUR', 'JAIPUR', 'Rajasthan', 'India', '302001', 'register', '08AAAFL5196D1ZF', '', '01414032197', '', '', '2019-02-20 10:02:50', 0),
(335, 'ROY DRESSERS', '', 'AMBASSA,DHALAI, TRIPURA ', 'TRIPURA', 'Tripura', 'India', '799289', 'register', '16AIGPR8961F1ZU', '', '8729927404', '', '', '2019-02-20 10:02:00', 0),
(336, 'MODERN SPORTS INDUSTRIES', '', 'NEAR NEW HIGH COURT BUILDING ERNAKULAM', 'ERAKULAM', 'Kerala', 'India', '9847032801', 'register', '32ADWPM8102C1ZP', '', '9847032801', '', '', '2019-02-20 12:02:20', 0),
(337, 'DHANLAXMI ENTERPRISES', '', 'NAHARGARH ROAD,JAIPUR', 'JAIPUR', 'Rajasthan', 'India', '302001', 'register', '08CKOPS0861D1ZX', '', '8209647219', '', '', '2019-02-20 05:02:41', 0),
(338, 'MADHU SPORTS', '', 'RAILWAY ROAD SONIPAT', 'SONIPAT', 'Haryana', 'India', '131001', 'register', '06AARPK9228K1Z3', '', '', '', '', '2019-02-21 12:02:17', 0),
(339, 'VENKATADRI XTREME SPORTS', '', 'YELAHANKA NEW TOWN', '', 'SELECT STATE', 'India', '', 'register', '29AIDPA1420H2ZU', '', '09741117333', '', '', '2019-02-21 12:02:48', 0),
(340, 'SANAS SPORTS GALAXY', '', 'NEAR EKLAVYA POLYTECHNICAL COLLEGE', 'PUNE', 'SELECT STATE', 'India', '', 'register', '27AREPS9073Q1ZQ', '', '', '9370804080', '', '2019-02-21 12:02:49', 0),
(341, 'KK SPORTS', '', 'VAISHALI NAGAR', 'JAIPUR', 'SELECT STATE', 'India', '302021', 'register', '08AALFK8880B1Z1', '', '9829284205', '', '', '2019-02-21 01:02:07', 0),
(342, 'METRO SPORTS', '', 'SHOPPING COMPLEX', 'IMPHAL', 'SELECT STATE', 'India', '', 'register', '14BPZR2413H1ZL', '', '', '', '', '2019-02-21 05:02:20', 0),
(343, 'GOOD LUCK SPORTS', '', 'W.N.B ROAD ', 'MANGALDOI', 'SELECT STATE', 'India', '', 'register', '18BHVPS6914G1ZL', '', '', '', '', '2019-02-21 05:02:44', 0),
(344, 'R.N SPORTS', '', 'POONA BAZAR IMPHAL', '', 'SELECT STATE', 'India', '', 'register', '14ABZPJ0060F1ZS', '', '', '', '', '2019-02-21 05:02:43', 0),
(345, 'R.S.R.S AGENCIES', '', 'THANGAL BAZAR IMPHAL', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-02-21 05:02:37', 0),
(346, 'NATIONAL SPORTS', '', 'SHOP NO.6 MURLIPURA', 'JAIPUR', 'SELECT STATE', 'India', '303328', 'register', '08AMTPM8875A1', '', '9413072483', '', '', '2019-02-22 11:02:19', 0),
(347, 'SPORTS GALAXY', '', 'OPP. PRATAP STADIUM MAIN GATE CHITRAKOOT', 'JAIPUR', 'SELECT STATE', 'India', '302021', 'register', '08ACXFS9993D1Z1', '', '09413072483', '', '', '2019-02-22 11:02:30', 0),
(348, 'NIJAMI TRADERS', '', 'SANT KABIR NAGAR ', '', 'Uttar Pradesh', 'India', '', 'register', '09AYYPA33551ZP', '', '9889726291', '', '', '2019-02-23 03:02:32', 0),
(349, 'KALPANA ENTERPRISES', '', 'VIDYADHAR NAGAR JAIPUR', 'JAIPUR', 'Rajasthan', 'India', '302023', 'register', '08BAOPS6213G1ZF', '', '', '', '', '2019-02-23 04:02:09', 0),
(350, 'KALPANA ENTERPRISES', '', 'VIDYADHAR NAGAR JAIPUR', 'JAIPUR', 'Rajasthan', 'India', '302023', 'register', '08BAOPS6213G1ZF', '', '', '', '', '2019-02-23 04:02:10', 0),
(351, 'ROYAL SPORTS & FITNESS', '', 'ANNAPURNA CHAMBER ,JAIPUR', 'JAIPUR', 'Rajasthan', 'India', '302001', 'register', '08B1CDS9984C2ZP', '', '9983275116', '', '', '2019-02-25 10:02:31', 0),
(352, 'MISHRA SPORTS', '', 'SIKAR ROAD JAIPUR', '', 'SELECT STATE', 'India', '9799626535', 'register', '08AZHPM2286Q1ZK', '', '9799626535', '', '', '2019-02-25 10:02:02', 0),
(353, 'STEREO NATION', '', 'VAISHALI  NAGAR JAIPUR', '', 'Andhra Pradesh', 'India', '', 'register', '08ASBPK3052H1Z2', '', '9799297990', '', '', '2019-02-25 10:02:56', 0),
(354, 'SHYAM SPORTS', '', 'OPP. GOPAL CINEMA ', '', 'Rajasthan', 'India', '301001', 'register', '08BGHPS4223B1ZM', '', '9413559071', '', '', '2019-02-26 10:02:42', 0),
(355, 'BANGA SPORTS & FITNESS', '', 'KAILASH COLONY ALWAR', '', 'Rajasthan', 'India', '', 'register', '08AFVPB3024P2Z1', '', '', '', '', '2019-02-26 10:02:23', 0),
(356, 'ARADHNA SPORTS', '', 'AMRAVATI', '', 'Maharashtra', 'India', '444601', 'register', '27ALZPP10006D1Z2', '', '919767247868', '', '', '2019-02-27 11:02:18', 0),
(357, 'EASTERN SPORTS & AGENCIES', '', 'MAIN ROAD ASSAM', '', 'Assam', 'India', '', 'register', '18ACSPC3113E1ZY', '', '9954218081', '', '', '2019-02-27 11:02:31', 0),
(358, 'CITIZEN SPORTS', '', 'MAIN ROAD TEJPUR', '', 'Assam', 'India', '', 'register', '18AGQPK5520K1Z0', '', '8486266849', '', '', '2019-02-27 11:02:03', 0),
(359, 'PORWAL SPORTS EMPORIUM ', '', 'JANTA TALKIES', '', 'Rajasthan', 'India', '', 'unregister', '', '', '9413008496', '', '', '2019-03-02 12:03:13', 0),
(360, 'RAJENDRA SPORTS', '', 'KOTHWALL STREET MYSURU', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '9342111913', '', '', '2019-03-02 01:03:29', 0),
(361, 'SUNRISE SPORTS', '', 'KANTHA RAJA ROAD', 'MYSORE', 'SELECT STATE', 'India', '', 'register', '29ADSPN5031F1ZB', '', '9449806312', '', '', '2019-03-02 01:03:09', 0),
(362, 'NEW KONARK SPORTS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-02 01:03:19', 0),
(363, 'MARUTHI SPORTS CENTER', '', 'OPP OPTEX TEXTILE', '', 'Tamil Nadu', 'India', '606601', 'register', '33AXNFM1253AIZJ', '', '9442316151', '', '', '2019-03-02 04:03:14', 0),
(364, 'GOYAL SPORTS', '', 'NATANIYON KARASTA CHOURA RASTA', 'JAIPUR', 'Rajasthan', 'India', '302003', 'register', '08AEYPG1622E1ZJ', '', '9414241660', '', '', '2019-03-04 12:03:43', 0),
(365, 'CHARAN SPORTS GEAR', '', 'GAYATHRI NAGAR', 'VIJAYWADA-( ANDHRA PRADESH )', 'Andhra Pradesh', 'India', '520010', 'register', '37AMXPP6090L1ZY', '', '95055-76727', '', '', '2019-03-04 12:03:31', 0),
(366, 'PIONEER SPORTS', '', 'KOTRI ROAD', 'KOTA', 'Rajasthan', 'India', '324007', 'register', '08ADBPA7080N1ZF', '', '9414231463', '', '', '2019-03-04 12:03:17', 0),
(367, 'SYNDICATE SPORTS', '', 'GUMAN PURA ROAD', 'KOTA', 'Rajasthan', 'India', '324007', 'register', '08AJQPK7628H1ZO', '', '98280-81380', '', '', '2019-03-04 12:03:51', 0),
(368, 'PRAKASH SPORTS', '', 'BARTHUNIA CLINIC KOTA', 'KOTA', 'Rajasthan', 'India', '324001', 'register', '08AIUPG6574H1ZN', '', '09414236570', '', '', '2019-03-04 05:03:42', 0),
(369, 'PATEL SPORTS', '', 'MAHALAXMI CORNER', 'AHMEDABAD', 'Gujarat', 'India', '', 'register', '24AWIPP3328G1ZK', '', '9624911090', '', '', '2019-03-04 05:03:19', 0),
(370, 'ASIA SPORTS', '', 'STADIUM COMPLEX BIJAPUR', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-06 10:03:26', 0),
(371, 'ATS SPORTS', '', 'STADUIM SPORTS COMPLEX', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '8904634766', '', '', '2019-03-06 10:03:22', 0),
(372, 'SUNIL SPORTS', '', 'RAVI BHAWAN COMPLEX BANJARI ROAD', 'RAIPUR', 'Chhattisgarh', 'India', '492001', 'register', '22AYLMP2662F1ZJ', '', '70002-10640', '', '', '2019-03-06 11:03:35', 0),
(373, 'BANGA SPORTS & FITNESS', '', 'NEAR BHAGAT SINGH CIRCLE', 'ALWAR', 'Rajasthan', 'India', '301001', 'register', '08AFVPB3024P2Z1', '', '99281-44376', '', '', '2019-03-06 11:03:22', 0),
(374, 'UNITED SPORTS AGENCY', '', 'GALLERIA COMPLEX NYAMO LOTHA RD', 'DIMAPUR', 'Nagaland', 'India', '', 'register', '13ATGPS1892K1ZA', '', '98725-65814', '', '', '2019-03-06 11:03:23', 0),
(375, 'BREWING CRICKET', '', '7TH CROSS 2NB BLOCK, JAYANAGAR', 'BANGALORE', 'Karnataka', 'India', '', 'register', '29AAQFB6900N1ZV', '', '9845287654', '', '', '2019-03-06 02:03:20', 0),
(376, 'ABHINANDAN SPORTS', '', 'SUPER MARKET SUNDERGARH', 'SUNDERGARH', 'Orissa', 'India', '770001', 'register', '21ABLPM3773G1ZO', '', '06622275533', '', '', '2019-03-07 10:03:52', 0),
(377, 'SCIENTIFIC SUPPLIERS', '', 'GOLE BAZAR', 'SAMBHALPUR', 'SELECT STATE', 'India', '768001', 'register', '21AACHC3256Q1ZB', '', '', '', '', '2019-03-07 03:03:33', 0),
(378, 'MAHAVIR SPORTS', '', 'RACE COURCE RD OLD PALASIA', 'INDORE', 'Madhya Pradesh', 'India', '', 'register', '23BAWPJ9785L1ZM', '', '9589693000', '', '', '2019-03-07 04:03:39', 0),
(379, 'ARORA ENTERPRISES', 'MR.ARORA', 'BASTI NAU', 'JALANDHAR', 'Punjab', 'India', '144001', 'register', '03AYZPA8038P1Z2', '', '98780-74664', '', '', '2019-03-08 02:03:52', 0),
(380, 'MAHADEV SPORTS', '', 'AMRAVASTI COMPLEX ', 'CHENNAI', 'SELECT STATE', 'India', '', 'register', '33AMJPB5252C1ZN', '', '9677223425', '', '', '2019-03-09 01:03:01', 0),
(381, 'KRISHNA SPORTS & READYMADE', '', 'OPP. SAMOSA HOUSE ', 'JODHPUR', 'SELECT STATE', 'India', '342001', 'unregister', '', '', '7791000550', '', '', '2019-03-09 01:03:22', 0),
(382, 'MANISHA SPORTS', '', 'NEAR GANDHI MULI ', 'PALI', 'SELECT STATE', 'India', '306401', 'register', '08BKPPS4428C1ZW', '', '9460818580', '', '', '2019-03-09 01:03:35', 0),
(383, 'SRI NANDI SPORTS & GENERALS', '', 'AVK CILLEGE ROAD P.J EXTENSION', 'DAVANAGERE', 'Karnataka', 'India', '577002', 'register', '29ANPPR4968N1ZO', '', '9886079090', '', '', '2019-03-09 03:03:15', 0),
(384, 'KANTI SPORTS', '', 'HARIPUR ROAD', 'CUTTACK', 'Orissa', 'India', '753001', 'register', '21ABCPP2753N1ZL', '', '', '', '', '2019-03-09 04:03:07', 0),
(385, 'DELIGHT SPOTS', '', 'FIRE STATION ROAD', 'BEHRAMPUR', 'SELECT STATE', 'India', '760001', 'register', '21AANEO3307L1ZU', '', '', '', '', '2019-03-11 11:03:36', 0),
(386, 'GUPTA SPORTS', '', 'MASTAN ROAD', 'CUTTACK', 'SELECT STATE', 'India', '752001', 'register', '21AASPA3620L1ZY', '', '', '', '', '2019-03-11 11:03:30', 0),
(387, 'ANAND SPORTS', '', 'BUXI BAZAAR', 'CUTTACK', 'SELECT STATE', 'India', '753001', 'unregister', '', '', '', '', '', '2019-03-11 11:03:53', 0),
(388, 'SPORTS WORLD', '', 'INFRONT OF RED CROSS KALYAN MANDAP', 'PATNA', 'SELECT STATE', 'India', '766001', 'register', '21AGDPB9276G1ZN', '', '', '', '', '2019-03-11 11:03:46', 0),
(389, 'NOVELTY GIFT & SPORTS AGENCIES', '', 'G-34 BOTHRA COMPLEX', 'RAJASTHAN', 'SELECT STATE', 'India', '', 'register', '08AGSPM5251F1Z4', '', '9460453131', '', '', '2019-03-11 12:03:09', 0),
(390, 'RAGHAV TRADING COMPANY', '', 'CHOUDHARY BAZAAR', 'CUTTACK', 'SELECT STATE', 'India', '753001', 'register', '21AGVPS4612D1ZG', '', '', '', '', '2019-03-11 12:03:31', 0),
(391, 'CENTURY SPORTS', '', 'NEAR GENERAL POST OFFICE PULIMOODU', '', 'Kerala', 'India', '695001', 'register', '32AFAPP3501L1ZS', '', '04712471972', '', '', '2019-03-11 01:03:43', 0),
(392, 'SPORTS LINE', '', '', 'MANGLORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:58', 0),
(393, 'ANUJ SPORTS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:34', 0),
(394, 'FIFA SPORTS', '', '', 'MANGALORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:19', 0),
(395, 'SKIPPER', '', '', 'MANGALORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:49', 0),
(396, 'SPORTS WORLD', '', '', 'MANGALORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:15', 0),
(397, 'OLYMPIC SPORTS', '', '', 'MANGALORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:38', 0),
(398, 'KINKS SPORTS', '', '', 'GULBARGH', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 10:03:10', 0),
(399, 'KAMAKHYA TRADER', '', 'LENIN SARANI, A.K ROAD', 'AGARTALA', 'Tripura', 'India', '799001', 'register', '16AGYPD4604R1ZQ', '', '9436486763', '', '', '2019-03-14 12:03:34', 0),
(400, 'BURMA SPORTS', '', 'NEAR KALINGA STADIUM', 'BHUBNESHWAR', 'SELECT STATE', 'India', '751012', 'register', '', '', '', '', '', '2019-03-14 02:03:45', 0),
(401, 'OLYMPIC SPORTS', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-14 02:03:30', 0),
(402, 'STADIUM SPORTS', '', 'KPS BUILDING 1ST FLOOR, ODAKKADU', 'TIRUPUR', 'Tamil Nadu', 'India', '641602', 'register', '33ABVFS5470Q1Z5', '', '09171888018', '', '', '2019-03-15 12:03:32', 0),
(403, 'STAR SPORTS', '', 'NEAR POLICE STATION', 'GUWAHATI', 'Assam', 'India', '781012', 'register', '18ADAPY7633E1ZB', '', '94356-37777', '', '', '2019-03-15 02:03:26', 0),
(404, 'STAR SPORTS', '', '1ST FLOOR, UDAYA COMPLEX', 'GUWAHATI', 'Assam', 'India', '781012', 'register', '18ADAPY7633E1ZB', '', '9435637777', '', '', '2019-03-15 02:03:46', 0),
(405, 'PUSHKAR TRADERS', '', 'P/O RASRA ', 'BALLIA', 'Uttar Pradesh', 'India', '221712', 'register', '09AYGPP8034P1ZM', '', '8191824140', '', '', '2019-03-15 02:03:10', 0),
(406, 'SILVER SPORTS', '', 'M.B ROAD PAN BAZAAR', 'GUWAHATI', 'Assam', 'India', '781001', 'register', '18AAVFS5842H1ZI', '', '94350-19277', '', '', '2019-03-15 03:03:16', 0),
(407, 'UNIVERSAL SCIENCE & SPORTS EMPORIUM', '', 'VIVEKANAND MARG', 'BALASORE', 'SELECT STATE', 'India', '', 'register', '21AFVPS1201H1ZN', '', '', '', '', '2019-03-16 10:03:18', 0),
(408, 'ANAND SPORTS', '', 'BUXI BAZAAR', 'CUTTACK', 'Orissa', 'India', '7530001', 'register', '21AARPA8093N1ZA', '', '', '', '', '2019-03-18 03:03:35', 0),
(409, 'SPORTS LINE', '', 'MAK MAIL BUILDING KANKANADY', 'MANGALORE', 'Karnataka', 'India', '575002', 'register', '29ACFFS6356N1ZB', '', '9620540640', '', '', '2019-03-18 03:03:33', 0),
(410, 'SPORTS WORLD', '', 'ANAND NAGAR, NEW CHANDAN HOSPITAL', 'SECUNDERABAD', 'Telangana', 'India', '500011', 'register', '36DMNPS1909E1ZT', '', '9885133392', '', '', '2019-03-18 04:03:53', 0),
(411, 'LAXMI STORE', '', 'BADPOKHARI ADI', 'BARIPADA', 'SELECT STATE', 'India', '757001', 'register', '21AGRPM8957B1Z6', '', '', '', '', '2019-03-19 10:03:37', 0),
(412, 'NEW KALINGA SPORTS & FITNESS', '', 'SAHADEVKHUNTA', 'BALASORE', 'SELECT STATE', 'India', '756001', 'register', '21BIIPK9294B1ZB', '', '', '', '', '2019-03-19 10:03:44', 0),
(413, 'SPORTS EMPORIUM', '', 'BUBHNESHWAR', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-19 10:03:04', 0),
(414, 'MUSKAN SPORTS', '', 'GOVT. COLLEGE ROAD', 'RANGADHIFA', 'SELECT STATE', 'India', '', 'register', '21ADWPB1707C1Z6', '', '', '', '', '2019-03-19 10:03:14', 0),
(415, 'IL INDIA LABEL', '', '', 'JALANDHAR', 'Punjab', 'India', '', 'unregister', '', '', '', '', '', '2019-03-19 11:03:43', 0),
(416, 'MARSHAL INDIA', '', 'GARIMA GRAND BUILDING OPP. J-14', 'GUWAHATI', 'Assam', 'India', '781007', 'register', '18ADHPV5436H1Z4', '', '7896042414', '', '', '2019-03-19 04:03:31', 0),
(417, 'NANDRA SPORTS', '', '37, CONVENT STREET', 'PUDUCHERRY', 'Tamil Nadu', 'India', '605005', 'register', '34AHQPL6198P2Z8', '', '', '', '', '2019-03-22 12:03:59', 0),
(418, 'JAI MAHADEV SPORTS', '', 'NARAYAN MUDHALI STREET', 'CHENNAI', 'Tamil Nadu', 'India', '600079', 'register', '33BNKPD4184J1ZX', '', '9789045573', '', '', '2019-03-22 12:03:16', 0),
(419, 'SPORTS LAND', '', '', 'COIMBATORE', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-22 02:03:27', 0),
(420, 'NEW OLYMPIC SPORTS', '', '', 'CUTTACK', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-22 02:03:33', 0),
(421, 'GUPTA STORES', '', 'MASTAN ROAD, NEAR BHARAT MOTORS', 'CUTTACK', 'Orissa', 'India', '7530001', 'register', '21AASPA3620L1ZY', '', '06712304808', '', '', '2019-03-22 04:03:16', 0),
(422, 'FIDELIA STORE', '', 'VENGLAI NEAR POLICE STATION', 'LUNGLEI', 'SELECT STATE', 'India', 'MIZORAM', 'register', '15AASPZ6198E2ZT', '', '8257946693', '', '', '2019-03-22 04:03:55', 0),
(423, 'FIDELIA STORE', '', 'VENGLAI NEAR POLICE STATION', 'LUNGLEI', 'SELECT STATE', 'India', 'MIZORAM', 'register', '15AASPZ6198E2ZT', '', '8257946693', '', '', '2019-03-22 04:03:00', 0),
(424, 'K.V SPORTS & TRADERS', '', 'PONNERI', 'THIRUVALLUR', 'SELECT STATE', 'India', '601204', 'unregister', '', '', '', '', '', '2019-03-22 04:03:25', 0),
(425, 'DWARIK SPORTS', '', 'BY PASS ROAD', 'BHADRAK', 'Orissa', 'India', '', 'register', '21AOJPM2984E1Z0', '', '', '', '', '2019-03-22 05:03:55', 0),
(426, 'SHIV SPORTS', '', '', 'AMRAVATI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-03-23 11:03:17', 0),
(427, 'RAMKRISHNA SPORTS', '', 'SAKUNTALA ROAD', 'AGARTALA', 'Tripura', 'India', '799001', 'register', '16BMNPS2337G1ZT', '', '9436480897', '', '', '2019-03-23 11:03:05', 0),
(428, 'PA LEGGUARD WORKS', '', '107/8C, YADGARPUR, KILA ROAD ', 'MEERUT', 'Uttar Pradesh', 'India', '', 'register', '03ACSFS4118B1ZD', '', '9634343588', '', '', '2019-03-23 02:03:27', 0),
(429, 'SHARDA STORES', '', 'STATION ROAD', 'BONGAIGOAN', 'Assam', 'India', '783380', 'register', '18AHBPS0437R1ZT', '', '', '9435484012', '', '2019-03-25 10:03:05', 0),
(430, 'ARORA ENTERPRISES', '', 'BASTI NAU, BASRI SHIEKH ROAD', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ACSFS4118B1ZD', '', '9815004437', '', '', '2019-03-25 02:03:40', 0),
(431, 'DEVATAN SPORTS', '', 'SHOP NO.7 PRATHANA APPARTMENT', 'ANKLESHWAR', 'Gujarat', 'India', '', 'register', '24AFLPA5035R1Z8', '', '', '', '', '2019-03-25 02:03:45', 0),
(432, 'UNITED SPORTS', '', 'HANUMAN NAGAR ', 'GWALIOR', 'Madhya Pradesh', 'India', '474003', 'unregister', '', '', '9425111545', '', '', '2019-03-26 01:03:01', 0),
(433, 'SAHARA SPORTS', '', 'NEAR GURUDWARA NADAN MAHAL RD', 'LUCKNOW', 'Uttar Pradesh', 'India', '9415102515', 'register', '09AHNPS7345C1ZY', '', '94151025515', '', '', '2019-03-26 01:03:38', 0),
(434, 'DALJEET SINGH C/O VICKEY KHELA GHAR', '', 'JIAGANJ', 'MURSHIDABAD', 'West Bengal', 'India', '742123', 'register', '', '', '9434336902', '', '', '2019-03-27 03:03:59', 0),
(435, 'FIFA SPORTS', '', '18/19 ESSEL WILICON, FIRST FLOOR', 'MANGALORE', 'Karnataka', 'India', '575062', 'register', '29AAFFF4001P1ZA', '', '9008536459', '', '', '2019-03-27 04:03:09', 0),
(436, 'KV SPORTS & TRADERS', '', 'PONNERI', 'THIRUVALLUR', 'Tamil Nadu', 'India', '601204', 'register', '33AXKPV9091R1Z8', '', '', '', '', '2019-03-27 05:03:39', 0),
(437, 'VERSATILE BRAND & MARKETING PVT. LTD', '', 'SCF 51 BASEMENT PHASE X1', 'MOHALI', 'Punjab', 'India', '160062', 'register', '03AADCV7217J1ZC', '', '9780356083', '', '', '2019-03-28 10:03:25', 0),
(438, 'JOYRAM SPORTS', '', 'N.S ROAD NEAR NSRCC ', 'AGARTALA', 'Tripura', 'India', '799001', 'register', '16BJVPS8832D1ZL', '', '9774009897', '', '', '2019-03-28 05:03:18', 0),
(439, 'SHANTI STORES', '', 'HOTEL MOONLIGHT NEAR HANUMAN CIRCLE', 'JAISALMER', 'Rajasthan', 'India', '345001', 'register', '08AFJPC0676C1ZS', '', '9461770075', '', '', '2019-03-29 03:03:29', 0),
(440, 'R.K SPORTS', '', 'POONA BAZAAR POLO GROUND', 'IMPHAL', 'Manipur', 'India', '795001', 'register', '14ABZPJ0060F1ZS', '', '9089354918', '', '', '2019-03-29 04:03:48', 0),
(441, 'STAR SPORTS', '', 'NEW KARNAL ROAD', 'KAITHAL', 'Haryana', 'India', '136027', 'register', '06CHSPS0301R1ZS', '', '86079-00009', '', '', '2019-03-29 04:03:44', 0),
(442, 'SANGAM SPORTS CENTRE', '', 'RAMA COMPLEX OPP. MEENA BAZAR', 'YAMUNA NAGAR', 'Haryana', 'India', '135001', 'register', '06ABAPR3118F1Z1', '', '9896301149', '', '', '2019-03-29 04:03:50', 0),
(443, 'YEDEKAR SPORTS', '', 'KHANBAG SANGLI', 'SANGLI', 'Maharashtra', 'India', '', 'register', '27AAPPY7254D1Z4', '', '9403156155', '', '', '2019-03-30 05:03:01', 0),
(444, 'MUTHA SPORTS', '', '136 MANPET ', 'BANGALORE', 'Karnataka', 'India', '', 'register', '29ACUPD6712E1ZH', '', '', '', '', '2019-04-02 10:04:25', 0),
(445, 'B K SPORTS', '', 'HOODA SHOPPING COMPLEX', 'KARNAL', 'SELECT STATE', 'India', '132001', 'register', '06AAUPK5821H1ZG', '', '', '', '', '2019-04-02 01:04:27', 0),
(446, 'AUSTIN SPORTS INDUSTRIES', '', 'D-100, NEW DASHMESH NAGAR, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144001', 'register', '03ATJPA1013F1ZO', '', '9878404384', '', '', '2019-04-04 12:04:37', 0),
(447, 'VIKAS SHOES & SPORTS', '', 'BHIWANI', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-04 02:04:11', 0),
(448, 'CAPITAL SPORTS', '', 'SHOP NO 4 NEAR RAILWAY CROSSING', 'RAJKOT', 'Gujarat', 'India', '36001', 'register', '24AIAPD9606P1Z4', '', '', '9428251523', '', '2019-04-04 02:04:25', 0),
(449, 'OLYMPIC SPORTS', '', 'KOIL STREET PARKASH HIGH ROAD', 'CHITTOOR', 'SELECT STATE', 'India', '', 'register', '37AGJPR1030J1ZD', '', '9440573536', '', '', '2019-04-04 02:04:33', 0),
(450, 'NEW R.K SPORTS', '', 'OPP RANA PRATAP NAGAR,RAILWAY STATION', 'UDAIPUR', 'Rajasthan', 'India', '313002', 'register', '08C1RPS5710G1ZO', '', '', '', '', '2019-04-04 03:04:24', 0),
(451, 'INDIA SPORTS', '', 'G N B ROAD TINSUKIA', '', 'SELECT STATE', 'India', '', 'register', '18ABYPB32G1ZD', '', '', '', '', '2019-04-04 03:04:21', 0),
(452, 'NAGPAL SPORTS', '', '', 'KARNAL', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-04 03:04:19', 0),
(453, 'OLYMPIC SPORTS', '', '', 'BHUBHNESHWAR', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-04 04:04:15', 0),
(454, 'SAMLESHWARI SPORTS AND CHEMICALS', '', 'SAMBALPUR', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-04 04:04:35', 0),
(455, 'LAXMI SPORTS', '', 'HUBLI', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '9880332044', '', '', '2019-04-04 04:04:48', 0),
(456, 'RAKHRA SPORTS', '', 'HARIDWAR PLAZA', 'BANGALORE', 'Karnataka', 'India', '560042', 'unregister', '', '', '', '', '', '2019-04-04 04:04:43', 0),
(457, 'RAJ CHATAK SPORTS', '', 'AKKAM BUILDING', 'BANGALORE', 'Karnataka', 'India', '560053', 'unregister', '', '', '', '', '', '2019-04-04 05:04:10', 0),
(458, 'ACE CRICKETER', '', '2ND CROSS MURUGESHPALYA', 'BANGALORE', 'Karnataka', 'India', '560017', 'register', '29AMKPG5913E1Z2', '', '9986683000', '', '', '2019-04-04 05:04:27', 0),
(459, 'SHRI SAI SPORTS', '', 'OPPOSITE OLD COURT, BUXAR', 'BIHAR', 'Bihar', 'India', '802101', 'register', '10ALFPG1415M1ZM', '', '9430574477', '', '', '2019-04-05 10:04:25', 0),
(460, 'SPORTS CENTRE', '', 'GANDHI STADIUM COMPLEX SHOP NO 14. JAIN MANDIR', 'AMBIKAPUR', 'Chhattisgarh', 'India', '497001', 'register', '22AUXPS5294B1Z7', '', '9300619393', '', '', '2019-04-05 10:04:16', 0),
(461, 'CITY SPORTS', '', 'HOTEL HAWELI GROUND FLOOR', 'BHILWARA', 'Rajasthan', 'India', '311001', 'register', '08AANFC4036H1ZF', '', '09782982228', '', '', '2019-04-05 04:04:45', 0),
(462, 'STAR TRADERS', '', 'NEAR URMILA EDUCATION GANDIA BASTI', '', 'Uttar Pradesh', 'India', '272001', 'register', '09BBNPJ3349G1ZE', '', '8795913169', '', '', '2019-04-05 04:04:24', 0),
(463, 'SIDANVICK SPORTS & FITNESS', '', 'NEAR GURU NAANAK DAIRY OLD NAGAR DAS CORNER', 'MUMBAI', 'Maharashtra', 'India', '400069', 'register', '27AZXPK1734D1Z6', '', '8433802778', '', '', '2019-04-05 05:04:17', 0),
(464, 'SURENDRA SPORTS', '', 'PATANKAR BAZAAR', 'GWALIOR', 'Madhya Pradesh', 'India', '474003', 'unregister', '', '', '09425111545', '', '', '2019-04-10 12:04:38', 0),
(465, 'RATTAN SPORTS', '', 'INSIDE NAGORI GATE,', 'HARYANA', 'SELECT STATE', 'India', '125001', 'register', '06AAEPL7944C1ZT', '', '9215811855', '', '', '2019-04-10 12:04:26', 0),
(466, 'NEW AHMEDABAD SPORTS', '', '', 'MUMBAI', 'Maharashtra', 'India', '400069', 'unregister', '', '', '08433802778', '', '', '2019-04-10 01:04:12', 0),
(467, 'THE CHAMPION SPORTS', '', 'SHOP NO.9, BHARAT BAUG, OPP. KALYAN JEWELLERS, SV ROAD', 'WEST MUMBAI', 'SELECT STATE', 'India', '400092', 'unregister', '', '', '', '', '', '2019-04-10 01:04:44', 0),
(468, 'THE CHAMPION SPORTS', 'JEHANGIR MANSION,A.P MARG,DHOBI TALAO ', '', 'MUMBAI', 'Maharashtra', 'India', '400069', 'register', '27AAAFC5001F1Z5', '', '08433802778', '', '', '2019-04-10 02:04:20', 0),
(469, 'MAA NAV DURGA SPORTS', '', 'SHREE KRUPA, RHB ROAD,MULUND WEST MUMBAI', '', 'Maharashtra', 'India', '400080', 'register', '27AAEPS2970B1ZS', '', '', '9821375605', '', '2019-04-10 03:04:41', 0),
(470, 'B&D SPORTS', '', 'D-110,HASTINAPUR, TEHSIL MAWANA, DISTT- MEERUT', 'MEERUT', 'Uttar Pradesh', 'India', '', 'register', '09DRPK5976L1ZY', '', '9045638076', '', '', '2019-04-12 03:04:06', 0),
(471, 'GENERAL SPORTS', '', '', 'VIJAYWADA', 'SELECT STATE', 'India', '52002', 'register', '37AATEGS483C1ZZ', '', '', '', '', '2019-04-15 10:04:36', 0),
(472, 'MAHAVEER SPORTS', '', '', 'RAJAMUNDRY', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-15 10:04:33', 0),
(473, 'SWIFT SPORTS', '', 'JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '144003', 'register', '03AAWPV6938Q2ZX', '', '01812295610', '', '', '2019-04-15 12:04:37', 0),
(474, 'BONNY INTERNATIONAL', '', 'E1A INDUSTRIAL AREA ', 'JALANDHAR', 'Punjab', 'India', '144004', 'register', '03AAPFB0176R1Z2', '', '9815097000', '', '', '2019-04-15 12:04:39', 0),
(475, 'RED TALENT GROUP ', '', '', 'CHANDIGARH', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-15 05:04:36', 0),
(476, 'HINDUSTAN PLASTICS', '', '50, UMESH VIHAR T.P. NAGAR ', 'MEERUT', 'Uttar Pradesh', 'India', '', 'register', '09AAMPJ8049C1ZJ', '', '', '', '', '2019-04-18 10:04:11', 0),
(477, 'CAXTON SPORTS', '', '', 'MUMBAI', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-18 02:04:50', 0),
(478, 'CHAND SPORTS', '', 'SHOP NO.2, DIAMOND PALACE TO BANDRA POLICE STATION,HILL ROAD BANDRA ', 'BANDRA', 'SELECT STATE', 'India', '400050', 'register', '27AVPPK6821K1Z1', '', '', '', '', '2019-04-18 02:04:41', 0),
(479, 'GEAR UP SPORTS', '', 'VILE PARLE', 'MUMBAI', 'SELECT STATE', 'India', '', 'register', '27AALFG5785F1ZZ', '', '', '', '', '2019-04-18 02:04:08', 0),
(480, 'ISHWAR SPORTS AND FITNESS', '', 'MILKAT NO. 9483 MASUTE MADA UCHGAON, TALUKA-KARVEER', 'KOHLAPUR', 'Maharashtra', 'India', '416119', 'register', '27AAHGI5287L1ZR', '', '', '', '', '2019-04-18 02:04:39', 0),
(481, 'T.R INTERNATIONAL ', '', 'NEW SANT NAGAR, BASTI SHEIKH, JALANDHAR', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03ADGPR5718P1Z2', '', '9041829726', '', '', '2019-04-22 10:04:58', 0),
(482, 'PLAYER SPORTS', '', '', 'UJJAIN', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-22 01:04:11', 0),
(483, 'NEEMUCH SPORTS', '', '32, RAJENDRA PRASAD STADIUM', 'NEEMUCH', 'Madhya Pradesh', 'India', '', 'unregister', '', '', '9589733722', '', '', '2019-04-22 01:04:17', 0),
(484, 'G-9 SPORTS', '', 'SUTAN GALI, SPORTS MARKET NEAR NAGAR NIGAM ROAD', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-22 02:04:51', 0),
(485, 'PLAYERS SPORTS SHOPEE', '', 'DURGA PLAZA DEWAS ROAD', 'UJJAIN', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-22 02:04:06', 0),
(486, 'ABHISHEK JAGGA', '', 'GANPATI TOWER,VAISHALI NAGAR', 'JAIPUR', 'SELECT STATE', 'India', '302021', 'unregister', '', '', '9799297990', '', '', '2019-04-22 03:04:42', 0),
(487, 'NAIGAONKAR SPORTS', '', 'SUNIL PLAZA COMPLEX', 'OSMANABAD', 'SELECT STATE', 'India', '', 'register', '27AKUPN9938N1ZT', '', '', '', '', '2019-04-22 03:04:37', 0),
(488, 'Y.J. SPORTS', '', 'SHOP NO 6 OPP POLICE PARADI GROUND, VISHRM BAG', 'SANGLI', 'SELECT STATE', 'India', '416416', 'register', '27AIDPJ5959L1ZP', '', '9421217672', '', '', '2019-04-22 03:04:19', 0),
(489, 'DUNGARPURIA SPORTS', '', 'SARANG MARG SURAJPOLE OPPOSITE JAGDISH MISHTAN BHANDAR', 'UDAIPUR', 'Rajasthan', 'India', '313002', 'register', '08AMAPV5528Q1Z9', '', '9509902200', '', '', '2019-04-22 03:04:25', 0),
(490, 'SHREE VIJAY SPORTS', '', 'STADIUM ROAD', 'MAHARASHRTA', 'Maharashtra', 'India', '431122', 'register', '27AGNPJ0724H1ZG', '', '', '', '', '2019-04-23 02:04:09', 0),
(491, 'ASHOK SPORTS CO.', '', 'BRAHMA CHAMBERS 2010, SADASHIV PETH, TILAK ROAD', 'PUNE', 'Maharashtra', 'India', '411030', 'register', '27AACFA7909G1ZI', '', '8600090127', '', '', '2019-04-24 01:04:43', 0),
(492, 'SANJEEV WILSON', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-25 02:04:17', 0),
(493, 'HARDESH KUMAR', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-25 02:04:30', 0),
(494, 'INDERBIR SINGH', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-25 02:04:41', 0),
(495, 'DHEERAJ KUMAR', '', '', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-25 02:04:10', 0),
(496, 'RAHUL TRADING CO.', '', 'B-22,TRIMURTI COMPLEX', 'NADIAD', 'Gujarat', 'India', '387001', 'register', '24ADTPP0980C1ZG', '', '09925385353', '', '', '2019-04-27 04:04:40', 0),
(497, 'HANISH FURNITURE & ENGINEER WORKS', '', '25 ADELFI ARCADE ', 'NASHIK', 'SELECT STATE', 'India', '422401', 'register', '27AARPD7290G1ZD', '', '', '', '', '2019-04-29 10:04:12', 0),
(498, 'GANESH SPORTS & EQUIPMENT', '', 'PALIKA BAZAAR COMPLEX TIBETIAN MARKET', 'NASHIK', 'SELECT STATE', 'India', '422401', 'register', '27AEKPJ0836R1ZX', '', '', '', '', '2019-04-29 10:04:19', 0),
(499, 'CHEEMA TRADERS', '', 'G ROAD AKOLA', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-04-30 10:04:30', 0),
(500, 'SHAKTI SPORTS', '', 'GURNAGAR HOUSING SORITY,', 'AURANGABAD', 'Maharashtra', 'India', '431005', 'register', '27ADBFS2874G1ZX', '', '', '', '', '2019-04-30 12:04:01', 0),
(501, 'KARMUSE SPORTS', '', 'SHIV PAVILION, NEAR RAMMANDIR CHOWNK', 'SANGLI', 'SELECT STATE', 'India', '416416', 'register', '27ACCPK5660J1ZG', '', '', '09423112255', '', '2019-04-30 02:04:21', 0),
(502, 'SPORTS HUB', '', 'AROKIASAMY ROAD (WEST) OPP. LADIES CLUB R.S PURAM', 'COIMBATORE', 'Tamil Nadu', 'India', '641002', 'register', '33ADQFS2871Q1Z7', '', '04224979696', '', '', '2019-04-30 03:04:22', 0),
(503, 'STAR SPORTS', '', '', 'VISHAKAPATNAM', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-05-01 11:05:45', 0),
(504, 'THE SUPPORT ZONE', '', 'J-76 GF, PARYAVARAN COMPLEX NEB SARAI', 'NEW DELHI', 'Delhi', 'India', '110068', 'register', '07AESPT0319M1ZX', '', '', '', '', '2019-05-02 11:05:57', 0),
(505, 'SHIVA SPORTS', '', '', '', 'Andhra Pradesh', 'India', '', 'unregister', '', '', '', '', '', '2019-05-02 12:05:24', 0),
(506, 'B & D INTERNATIONAL', '', 'OPP R.K DHABA , KAPURTHALA ROAD, BASTI BAWA KHEL', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03ACSFS4118B1ZD', '', '9045638076', '', '', '2019-05-03 10:05:47', 0),
(507, 'NEW INTERNATIONAL SPORTS', '', 'SHOP NO. 16,17 AMODI COMPLEX BMC BANK', 'AURANGABAD', 'Maharashtra', 'India', '431005', 'register', '27AHJPJ8506C1ZG', '', '', '', '', '2019-05-04 11:05:18', 0),
(508, 'SUKANYA SPORTS', '', 'SHOP NO. 44, CANNOUGHT GARDEN BEHIND LIC OFFICE', 'AURANGABAD', 'Maharashtra', 'India', '431005', 'register', '27BMHPS1296N1Z9', '', '9823113113', '', '', '2019-05-04 11:05:52', 0),
(509, 'UNIVERSAL MARKET', '', 'PLOT NO. 344, GROWTHCENTER CODCO, MAHANAGAR', 'AURANGABAD', 'Maharashtra', 'India', '431005', 'register', '27BDTPP0648E1Z8', '', '', '', '', '2019-05-04 11:05:31', 0),
(510, 'ABHAY DOGRA', '', 'JALANDHAR', '', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-05-06 02:05:27', 0),
(511, 'SARVADAYA INDUSTRIES', '', '', 'BILASPUR', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-05-08 11:05:48', 0),
(512, 'ASHA SPORTS', '', 'NEAR RAJURI CORNER, LAKKADKOT', 'JALNA', 'SELECT STATE', 'India', '', 'register', '27AAGPC8336J1Z6', '', '', '', '', '2019-05-08 12:05:03', 0),
(513, 'SAMARTH MUSICALS & SPORTS', '', 'FIRST FLOOR NEW POLICE COMPLEX', 'JALNA', 'SELECT STATE', 'India', '431203', 'register', '27ABGPK0512J1ZX', '', '', '', '', '2019-05-08 12:05:30', 0),
(514, 'SAILAXMI SPORTS & MUSICALS', '', 'MAHADEV MANDI ROAD', 'YAVATMAL', 'SELECT STATE', 'India', '', 'register', '27ANKPP7197B1ZB', '', '', '', '', '2019-05-08 01:05:24', 0),
(515, 'GAGANDEEP SPORTS', '', '', 'JALANDHAR', 'SELECT STATE', 'India', '', 'unregister', '', '', '', '', '', '2019-05-09 11:05:10', 0),
(516, 'BEACON SPORTS LLP', '', 'PT TOWER ,4/75,4/76', '', 'Kerala', 'India', '676106', 'register', '32AAUFB0573H1ZG', '', '7902224422', '', '', '2019-05-10 12:05:43', 0),
(517, 'PRIME SPORTS', '', 'BASTI NAU,BASTI SHEIKH ROAD', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03ACSFS4118B1ZD', '', '9872976446', '', '', '2019-05-11 10:05:04', 0),
(518, 'ARZOO RUBBERS', '', 'ANOOP NAGAR,BASTI PIRDAS ROAD,NEAR LEATHER COMPLEX', 'JALANDHAR', 'Punjab', 'India', '144002', 'register', '03CSQPK1418J1ZP', '', '09872739328', '', '', '2019-05-11 01:05:10', 0),
(519, 'FLIPCART INDIA PRIVATE LIMITED', '', 'SY NO. 130,256,259 AND 283, MALUR INDUSTRIAL AREA HOSAKOTE VILLAGE', 'KOLAR', 'Karnataka', 'India', '563130', 'register', '29AABCF8078M1ZX', '', '7349512321', '', '', '2019-05-11 01:05:20', 0),
(520, 'FLIPCART INDIA PRIVATE LIMITED', '', 'KHASRA NO. 14/6 MIN, 7 MIN, 13 MIN, 14,15,17,18 MIN9,10,11, 12/1,17/3,4,5,6,7,8,11/2,12,13,14,15', 'BINOLA', 'Haryana', 'India', '122413', 'register', '06AABCF8078M1Z5', '', '7349512321', '', '', '2019-05-11 01:05:33', 0),
(521, 'FLIPCART INDIA PRIVATE LIMITED', '', 'BLOCK B6&B8, ACORN LOGISTIC AND INDUSTRIAL COM,LOCATED AT DIVE ANJUR VILLAGE', 'MUMBAI', 'Maharashtra', 'India', '421302', 'register', '27AABCF8078M1Z1', '', '7349512321', '', '', '2019-05-11 01:05:11', 0),
(522, 'FLIPCART INDIA PRIVATE LIMITED', '', 'PROCONNECT SUPPLY CHAIN SOLUTION LIMITED INSIDE MAA AMBE WAREHOUSING', 'HOOGLY', 'West Bengal', 'India', '712250', 'register', '19AABCF8078M1ZY', '', '7349512321', '', '', '2019-05-11 03:05:50', 0),
(523, 'POPULAR SPORTS', '', 'ANNA SALAI, VELLOD', '', 'SELECT STATE', 'India', '632001', 'unregister', '', '', '', '', '', '2019-05-13 12:05:18', 0),
(524, 'SHIVAM SPORTS', '', 'SHRI JAGDAMBA NIWAS CHITNIS PARK', 'NAGPUR', 'SELECT STATE', 'India', '', 'register', '27AIIPP1973B1Z9', '', '', '', '', '2019-05-13 01:05:02', 0),
(525, 'SURANA SPORTS', '', 'NEAR DADABADI, M.G ROAD,', 'RAIPUR', 'Chhattisgarh', 'India', '492001', 'register', '22AALFS7164E1Z6', '', '9893594700', '', '', '2019-05-14 03:05:00', 0),
(526, 'SPORTS JUNCTION', '', 'RP TOWERS, COIMBATORE ROAD', 'POLLACHI', 'SELECT STATE', 'India', '', 'register', '33AFPV9742F1ZO', '', '', '', '', '2019-05-16 10:05:19', 0),
(527, 'CHAMPION SPORTS & WEAR', '', 'LTB COMPOUND, NEAR BUS STAND, DINDIGUL', '', 'SELECT STATE', 'India', '', 'register', '33AARPA8871G2ZH', '', '6382218029', '', '', '2019-05-16 10:05:20', 0),
(528, 'VISHAL SPORTING', '', 'RAJPUT NAGAR, NAMDEV BHAWAN, MODEL HOUSE', 'JALANDHAR', 'Punjab', 'India', '144003', 'register', '03ACSFS4118B1ZD', '', '01812295610', '', '', '2019-05-16 02:05:35', 0);
INSERT INTO `persons` (`id`, `name`, `contactperson`, `street`, `city`, `state`, `country`, `pincode`, `gsttype`, `gstin`, `cin`, `mobile`, `tel`, `email`, `created_datetime`, `deleted`) VALUES
(529, 'SIXER SPORTS', '', 'TRIVANDRUM ROAD, MURUGANKURICHI, PALAYAMKPTTAI', '', 'SELECT STATE', 'India', '', 'register', '33AUPP6269P1ZE', '', '', '', '', '2019-05-25 12:05:59', 0),
(530, 'SPORTS & GIFT WORLD', '', 'NO-3, HOLLY CROSS COMPLEX,MELAPUTHAR', 'TRICHY', 'SELECT STATE', 'India', '', 'register', '33AADPV0562F1ZX', '', '', '', '', '2019-05-25 12:05:37', 0),
(531, 'BORN & PLAY', '', 'NO-49, MADURAI VEERA SAMY KOVIL STREET,PUTHUR', 'PUTHUR', 'SELECT STATE', 'India', '', 'register', '33CTMPM5051L1ZD', '', '', '', '', '2019-05-25 12:05:02', 0),
(532, 'NEW OLYMPIC SPORTS', '', '', 'CUTTACK', 'SELECT STATE', 'India', '', 'register', '21AEVPG6350G1ZJ', '', '', '', '', '2019-05-25 12:05:49', 0),
(533, 'PIONEER SPORTS & FITNESS', '', '20, UPPER GROUND FLOOR, METRO PLAZA, BITTAN MARKET', 'BHOPAL', 'Madhya Pradesh', 'India', '462016', 'register', '23AOOPS5223H1ZT', '', '07552426900', '', '', '2019-05-25 03:05:12', 0),
(534, 'AMITCO KHEL INDUSTRIES', '', '65, SARASWATI , SURAJ KUND ROAD', 'MEERUT', 'Uttar Pradesh', 'India', '250001', 'register', '09ABFFA1449M1Z7', '', '9837080458', '', '', '2019-05-25 04:05:22', 0),
(535, 'AMITCO KHEL INDUSTRIES', '', '65, SARASWATI , SURAJ KUND ROAD', 'MEERUT', 'Uttar Pradesh', 'India', '250001', 'register', '09ABFFA1449M1Z7', '', '9837080458', '', '', '2019-05-25 04:05:22', 0),
(536, 'SREE RUDRADEV ENTERPRISES', '', '90,RAMAKRISHNA ROAD ASHRAMPURA', 'SILIGURI', 'West Bengal', 'India', '734001', 'register', '19ADRFS5615B1ZV', '', '8016042241', '', '', '2019-05-25 05:05:03', 0),
(537, '22 YARDS SPORTS GALLERY', '', '12/1,EKAMBARESHWAR AGRAHARAM STREET', 'CHENNAI', 'Tamil Nadu', 'India', '600003', 'register', '33AERPD2685R1ZS', '', '08667018681', '', '', '2019-05-29 04:05:46', 0),
(538, 'SANNEE C/O G-9 SPORTS', '', '6-7, SUTAR GALLI,SPORTS MARKET NEAR NAGAR NIGAM ROAD', 'INDORE', 'Madhya Pradesh', 'India', '452009', 'unregister', '', '', '8817821212', '', '', '2019-05-30 10:05:50', 0),
(539, 'SINDH SPORTS', '', 'MAIN ROAD,ANDHERDEV', 'JABALPUR', 'Madhya Pradesh', 'India', '482001', 'register', '23ASLPS8569D2Z8', '', '9827070498', '', '', '2019-05-30 11:05:53', 0),
(540, 'ANDHRA SPORTS', '', 'NEAR RAJ TOWERS,OPP UAE EXCHANGE, ELURU ROAD', 'VIJAYWADA', 'Andhra Pradesh', 'India', '520002', 'register', '37ACBPT0186B1ZT', '', '09392968650', '', '', '2019-05-30 11:05:41', 0),
(541, 'UNIVERSAL MARKET', '', 'PLOT NO. 344, GROWTHCENTER CODCO, MAHANAGAR', 'AURANGABAD', 'Maharashtra', 'India', '431005', 'unregister', '', '', '', '', '', '2019-05-31 12:05:29', 0),
(542, 'POPULAR SPORTS', '', 'NO. 1, NXT TO ARYA BHAVAN HOTEL, ANNA SALAI', 'VELLORE', 'Tamil Nadu', 'India', '632001', 'register', '33AAAFP5270D1ZO', '', '04162222972', '', '', '2019-05-31 12:05:46', 0),
(543, 'YOGESH KUMAR GIRISHBHAI BHAGDEO C/O SPORTS U LIKE', '', 'NEAR SUNNY STORE OPP. INDIRA GANDHI STADIUM', 'GONDIA', 'Maharashtra', 'India', '441601', 'unregister', '', '', '9823593227', '', '', '2019-05-31 01:05:32', 0),
(544, 'INDO ORGANIC CHEMICAL CORPORATION', '', 'NO. 12, EKAMBARESHWAR, AGARAHARAM STREET, PARK TOWN', 'CHENNAI', 'Tamil Nadu', 'India', '600003', 'register', '33AAFPK4729H1ZT', '', '9444051747', '', '', '2019-05-31 01:05:34', 0),
(545, 'GANADOR HEADGEARS', '', '135 NAKODAR ROAD', 'JALANDHAR', 'Punjab', 'India', '', 'register', '03FOAPS6674M1ZC', '', '', '', '', '2019-06-03 03:06:25', 0),
(546, 'SHIVRAJ SPORTS WEAR', '', 'SHOP NO. 28, GARUD COMPLEX, SAKRI RD, DHULE', '', 'Maharashtra', 'India', '424001', 'register', '27BBAPP0715K1ZQ', '', '9970299919', '', '', '2019-06-04 11:06:57', 0),
(547, 'SPORTS JUNCTION', '', '88, RP TOWERS, COIMBATORE ROAD', 'POLLACHI', 'Tamil Nadu', 'India', '642001', 'register', '33AFKPV9742F1Z0', '', '', '', '', '2019-06-04 11:06:58', 0),
(548, 'ASIAN SPORTS', '', '181/4, AKSHAYA COMPLEX, OPP. STADIUM BALAMORE RD', 'NAGERCOIL', 'Tamil Nadu', 'India', '', 'register', '33ACFPN3414N1ZL', '', '', '', '', '2019-06-05 04:06:33', 0),
(549, 'SAMARTH MUSICALS & SPORTS', '', 'FIRST FLOOR NEW POLICE COMPLEX', 'JALNA', 'SELECT STATE', 'India', '431203', 'register', '27ABGPK0512J1ZX', '', '', '', '', '2019-06-05 05:06:22', 0),
(550, 'DEEPU SPORTS', '', '1520, GROUND FLOOR, OPP MURUGAN ROCK CENTRE', 'THANJAVUR', 'SELECT STATE', 'India', '613001', 'register', '33AAJPP4660N1Z9', '', '', '', '', '2019-06-06 02:06:49', 0),
(551, 'SPORTS WORLD', '', 'ADARSH NAGAR, KALADHUNGI ROAD, HALDWANI', 'NAINITAL', 'Uttarakhand', 'India', '263001', 'register', '05ABSPB9294L1ZZ', '', '', '', '', '2019-06-11 12:06:22', 0),
(552, 'PREMIER SPORTS ', '', 'JAYALAKSHMI COMPLEX, 14 THIRUVALLURV SLI', 'PUDUCHEERRY', 'Tamil Nadu', 'India', '605013', 'register', '34AAOFP2735R1ZJ', '', '', '', '', '2019-06-11 12:06:34', 0),
(553, 'BORN 7 PLAY', '', 'NO-49, MADURAI VEERA SAMY KOVIL STREET,PUTHUR', 'TRICHY', 'Tamil Nadu', 'India', '620017', 'register', '33CTMPM5051L1ZD', '', '', '', '', '2019-06-11 12:06:37', 0),
(554, 'MARUTHI SPORTS', '', '1520, SOUTH RAMPART', 'THANJAVUR', 'Tamil Nadu', 'India', '513001', 'register', '9442316151', '', '', '', '', '2019-06-11 01:06:15', 0),
(555, 'DURGA PLASTICS', '', 'BASTI SHEIKH ROAD, OPP. SANYAS ASHRAM', 'JALANDHAR', 'SELECT STATE', 'India', '144002', 'register', '03AHCPG2072P1ZG', '', '9216292182', '', '', '2019-06-20 11:06:21', 0),
(556, 'UNITED AGENCIES', '', 'HANUMAN NAGAR, PATANAKAR BAZAR LASHKAR', 'GWALIOR', 'Madhya Pradesh', 'India', '474003', 'register', '23AHIPS2399K1ZS', '', '09425111545', '', '', '2019-06-20 03:06:17', 0),
(557, 'SPORTS AND GIFT WORLD', '', 'NO-3 HOLLY CROSS COMPLEX, MELAPUTHUR', 'TRICHY', 'Tamil Nadu', 'India', '620001', 'register', '33AADPV0562F1ZX', '', '8807766434', '', '', '2019-06-20 03:06:24', 0),
(558, 'OLYMPIC SPORTING COMPANY', '', '3, 1ST FLOOR, THIMMAIAH CHAMBERS, GANDHI NAGAR', 'BANGALORE', 'Karnataka', 'India', '560009', 'register', '29AABFO7118E1ZC', '', '9739379681', '', '', '2019-06-20 03:06:49', 0),
(559, 'OLYMPIC SPORTING COMPANY', '', '3, 1ST FLOOR, THIMMAIAH CHAMBERS, GANDHI NAGAR', 'BANGALORE', 'Karnataka', 'India', '560009', 'register', '29AABFO7118E1ZC', '', '9739379681', '', '', '2019-06-20 03:06:50', 0),
(560, 'Name', 'Person', '', '', 'Andhra Pradesh', 'India', '', 'unregister', '', '', '', '', '', '2019-07-14 06:33:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(255) NOT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `category_id` bigint(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `quantityin` varchar(100) NOT NULL,
  `ean` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `hsn` varchar(100) NOT NULL,
  `gstpercentage` int(100) NOT NULL,
  `dealprice` float NOT NULL,
  `currency` varchar(100) NOT NULL DEFAULT 'Rs',
  `mrp` float NOT NULL,
  `created_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `category_id`, `name`, `description`, `quantityin`, `ean`, `size`, `color`, `hsn`, `gstpercentage`, `dealprice`, `currency`, `mrp`, `created_datetime`, `update_datetime`, `deleted`) VALUES
(1, 'CB1001', 10, 'MSD LIMITED EDITION EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 18500, 'Rs', 37000, '2019-07-08 12:11:51', '2019-07-08 02:41:51', 0),
(2, 'CB1002', 10, 'MSD PLAYERS EDITION CAMO EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 18500, 'Rs', 37000, '2019-07-08 12:15:53', '2019-07-08 02:45:53', 0),
(3, 'CB1003', 10, 'MSD HELICOPTER EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 12500, 'Rs', 25000, '2019-07-08 12:17:07', '2019-07-08 02:47:07', 0),
(4, 'CB1004', 10, 'MSD T20 SPECIAL EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 8500, 'Rs', 17000, '2019-07-08 12:18:05', '2019-07-08 02:48:05', 0),
(5, 'CB1005', 10, 'MSD WARRIOR EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 6900, 'Rs', 13800, '2019-07-08 12:18:53', '2019-07-08 02:48:53', 0),
(6, 'CB1006', 10, 'MSD BULLET EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 5500, 'Rs', 11000, '2019-07-08 12:20:03', '2019-07-08 02:50:03', 0),
(7, 'CB1007', 10, 'MSD FIGHTER EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 3900, 'Rs', 78000, '2019-07-08 12:20:36', '2019-07-08 02:50:36', 0),
(8, 'CB1008', 10, 'MSD RUN  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 3200, 'Rs', 6400, '2019-07-08 12:21:20', '2019-07-08 02:51:20', 0),
(9, 'CB1009', 10, 'MSD LIMITED EDITION  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 7800, 'Rs', 15600, '2019-07-08 12:30:13', '2019-07-08 03:00:13', 0),
(10, 'CB1010', 10, 'MSD LIMITED EDITION  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 7800, 'Rs', 15600, '2019-07-08 12:30:43', '2019-07-08 03:00:43', 0),
(11, 'CB1011', 10, 'MSD LIMITED EDITION  EW 5', '', 'Pcs', '', '5', '', '9506', 12, 6200, 'Rs', 12400, '2019-07-08 12:31:21', '2019-07-08 03:01:21', 0),
(12, 'CB1012', 10, 'MSD LIMITED EDITION  EW 4', '', 'Pcs', '', '4', '', '9506', 12, 6000, 'Rs', 12000, '2019-07-08 12:31:54', '2019-07-08 03:01:54', 0),
(13, 'CB1014', 10, 'MSD FIGHTER JUNIOR  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 3750, 'Rs', 7500, '2019-07-08 12:33:01', '2019-07-08 03:03:01', 0),
(14, 'CB1015', 10, 'MSD FIGHTER JUNIOR  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 3750, 'Rs', 7500, '2019-07-08 12:33:30', '2019-07-08 03:03:30', 0),
(15, 'CB1016', 10, 'MSD FIGHTER JUNIOR  EW 5', '', 'Pcs', '', '5', '', '9506', 12, 3550, 'Rs', 7100, '2019-07-08 12:34:06', '2019-07-08 03:04:06', 0),
(16, 'CB1017', 10, 'MSD FIGHTER JUNIOR  EW 4', '', 'Pcs', '', '4', '', '9506', 12, 3550, 'Rs', 7100, '2019-07-08 12:34:37', '2019-07-08 03:04:37', 0),
(17, 'CB1019', 10, 'MSD RUN JUNIOR  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 3050, 'Rs', 6100, '2019-07-08 12:35:20', '2019-07-08 03:05:20', 0),
(18, 'CB1020', 10, 'MSD RUN JUNIOR  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 3050, 'Rs', 6100, '2019-07-08 12:35:46', '2019-07-08 03:05:46', 0),
(19, 'CB1021', 10, 'MSD RUN JUNIOR  EW 5', '', 'Pcs', '', '5', '', '9506', 12, 2750, 'Rs', 5500, '2019-07-08 12:36:17', '2019-07-08 03:06:17', 0),
(20, 'CB1022', 10, 'MSD RUN JUNIOR  EW 4', '', 'Pcs', '', '4', '', '9506', 12, 2750, 'Rs', 5500, '2019-07-08 12:36:48', '2019-07-08 03:06:48', 0),
(21, 'CB1029', 13, 'MSD BUM BUM BHOLE KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 2100, 'Rs', 4200, '2019-07-08 12:39:50', '2019-07-08 03:09:50', 0),
(22, 'CB1033', 13, 'MSD SHER KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1550, 'Rs', 3100, '2019-07-08 12:40:48', '2019-07-08 03:10:48', 0),
(23, 'CB1034', 13, 'MSD SHER KW H', '', 'Pcs', '', 'H', '', '9506', 12, 1550, 'Rs', 3100, '2019-07-08 12:41:14', '2019-07-08 03:11:14', 0),
(24, 'CB1035', 13, 'MSD SHER KW 6', '', 'Pcs', '', '6', '', '9506', 12, 1550, 'Rs', 3100, '2019-07-08 12:41:42', '2019-07-08 03:11:42', 0),
(25, 'CB1036', 13, 'MSD SHER KW 5', '', 'Pcs', '', '5', '', '9506', 12, 1250, 'Rs', 2500, '2019-07-08 12:42:20', '2019-07-08 03:12:20', 0),
(26, 'CB1037', 13, 'MSD SHER KW 4', '', 'Pcs', '', '4', '', '9506', 12, 999, 'Rs', 1998, '2019-07-08 12:43:31', '2019-07-08 03:13:31', 0),
(27, 'CB1038', 13, 'MSD KING KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1300, 'Rs', 2600, '2019-07-08 12:44:12', '2019-07-08 03:14:12', 0),
(28, 'CB1039', 13, 'MSD KING KW H', '', 'Pcs', '', 'H', '', '9506', 12, 1250, 'Rs', 2500, '2019-07-08 12:44:41', '2019-07-08 03:14:41', 0),
(29, 'CB1040', 13, 'MSD KING KW 6', '', 'Pcs', '', '6', '', '9506', 12, 1250, 'Rs', 2500, '2019-07-08 12:45:10', '2019-07-08 03:15:10', 0),
(30, 'CB1041', 13, 'MSD KING KW 5', '', 'Pcs', '', '5', '', '9506', 12, 899, 'Rs', 1798, '2019-07-08 12:45:58', '2019-07-08 03:15:58', 0),
(31, 'CB1042', 13, 'MSD KING KW 4', '', 'Pcs', '', '4', '', '9506', 12, 899, 'Rs', 1798, '2019-07-08 12:46:51', '2019-07-08 03:16:51', 0),
(32, 'CB1046', 13, 'MSD FIGHTER KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1085, 'Rs', 2170, '2019-07-08 12:47:33', '2019-07-08 03:17:33', 0),
(33, 'CB1047', 13, 'MSD FIGHTER EW 6', '', 'Pcs', '', '6', '', '9506', 12, 985, 'Rs', 1970, '2019-07-08 12:48:25', '2019-07-08 03:18:25', 0),
(34, 'CB1048', 13, 'MSD FIGHTER KW 5', '', 'Pcs', '', '5', '', '9506', 12, 895, 'Rs', 1970, '2019-07-08 12:49:39', '2019-07-08 03:19:39', 0),
(35, 'CB1049', 13, 'MSD FIGHTER KW 4', '', 'Pcs', '', '4', '', '9506', 12, 895, 'Rs', 1790, '2019-07-08 12:51:38', '2019-07-08 03:21:38', 0),
(36, 'CB1050', 13, 'MSD FIGHTER KW 3', '', 'Pcs', '', '3', '', '9506', 12, 895, 'Rs', 1790, '2019-07-08 12:52:11', '2019-07-08 03:22:11', 0),
(37, 'CB1051', 13, 'MSD RUN KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1010, 'Rs', 2020, '2019-07-08 12:52:56', '2019-07-08 03:22:56', 0),
(38, 'CB1052', 13, 'MSD RUN KW 6', '', 'Pcs', '', '6', '', '9506', 12, 910, 'Rs', 1820, '2019-07-08 12:53:27', '2019-07-08 03:23:27', 0),
(39, 'CB1053', 13, 'MSD RUN KW 5', '', 'Pcs', '', '5', '', '9506', 12, 820, 'Rs', 1640, '2019-07-08 12:54:02', '2019-07-08 03:24:02', 0),
(40, 'CB1054', 13, 'MSD RUN KW 4', '', 'Pcs', '', '4', '', '9506', 12, 820, 'Rs', 1640, '2019-07-08 12:54:23', '2019-07-08 03:24:23', 0),
(41, 'CB1056', 13, 'SPARTAN MINI AUTOGRAPH BAT', '', 'Pcs', '', 'MINI', '', '9506', 12, 80, 'Rs', 160, '2019-07-08 02:28:48', '2019-07-08 04:58:48', 0),
(42, 'CB1057', 14, 'MSD SPARTAN TENNIS BAT KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 750, 'Rs', 1500, '2019-07-08 02:33:07', '2019-07-08 05:03:07', 0),
(43, 'CB1058', 14, 'MSD SPARTAN TENNIS BAT KW 6', '', 'Pcs', '', '6', '', '9506', 12, 700, 'Rs', 1400, '2019-07-08 02:37:16', '2019-07-08 05:07:16', 0),
(44, 'CB1059', 14, 'MSD SPARTAN TENNIS BAT KW 5', '', 'Pcs', '', '5', '', '9506', 12, 650, 'Rs', 1300, '2019-07-08 02:38:22', '2019-07-08 05:08:22', 0),
(45, 'CB1060', 14, 'MSD SPARTAN TENNIS BAT KW 4', '', 'Pcs', '', '4', '', '9506', 12, 650, 'Rs', 1300, '2019-07-08 02:38:44', '2019-07-08 05:08:44', 0),
(46, 'CB1061', 14, 'MSD SPARTAN TENNIS BAT KPW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 550, 'Rs', 1100, '2019-07-08 02:39:25', '2019-07-08 05:09:25', 0),
(47, 'CB1062', 14, 'MSD SPARTAN TENNIS BAT KPW 6', '', 'Pcs', '', '6', '', '9506', 12, 500, 'Rs', 1000, '2019-07-08 02:40:42', '2019-07-08 05:10:42', 0),
(48, 'CB1063', 14, 'MSD SPARTAN TENNIS BAT KPW 5', '', 'Pcs', '', '5', '', '9506', 12, 500, 'Rs', 1000, '2019-07-08 02:41:04', '2019-07-08 05:11:04', 0),
(49, 'CB1064', 14, 'MSD SPARTAN TENNIS BAT KPW 4', '', 'Pcs', '', '4', '', '9506', 12, 450, 'Rs', 900, '2019-07-08 02:41:41', '2019-07-08 05:11:41', 0),
(50, 'CBL1065', 15, 'MSD LIMITED EDITION (GOLD)', '', 'Pair', '', 'MRH', '', '4203', 12, 2495, 'Rs', 4990, '2019-07-08 03:11:57', '2019-07-08 05:41:57', 0),
(51, 'CBL1065-L', 15, 'MSD LIMITED EDITION (GOLD)', '', 'Pair', '', 'MLH', '', '4203', 12, 2495, 'Rs', 4990, '2019-07-08 03:12:55', '2019-07-08 05:42:55', 0),
(52, 'CBL1066', 15, 'MSD T20 SPECIAL', '', 'Pair', '', 'MRH', '', '4203', 12, 1695, 'Rs', 3390, '2019-07-08 03:14:53', '2019-07-08 05:44:53', 0),
(53, 'CBL1066-L', 15, 'MSD T20 SPECIAL', '', 'Pair', '', 'MLH', '', '4203', 12, 1695, 'Rs', 3390, '2019-07-08 03:15:23', '2019-07-08 05:45:23', 0),
(54, 'CBL1067', 15, 'MSD WARRIOR', '', 'Pair', '', 'MRH', '', '4203', 12, 1250, 'Rs', 2700, '2019-07-08 03:22:29', '2019-07-08 05:52:29', 0),
(55, 'CBL1067-L', 15, 'MSD WARRIOR', '', 'Pair', '', 'MLH', '', '4203', 12, 1250, 'Rs', 2700, '2019-07-08 03:22:55', '2019-07-08 05:52:55', 0),
(56, 'CBL1072', 15, 'MSD RUN', '', 'Pair', '', 'MRH', '', '4203', 12, 675, 'Rs', 1350, '2019-07-08 03:23:58', '2019-07-08 05:53:58', 0),
(57, 'CBL1072-L', 15, 'MSD RUN', '', 'Pair', '', 'MLH', '', '4203', 12, 675, 'Rs', 1350, '2019-07-08 03:25:20', '2019-07-08 05:55:20', 0),
(58, 'CBL1073', 15, 'MSD RUN', '', 'Pair', '', 'YRH', '', '4203', 12, 675, 'Rs', 1350, '2019-07-08 03:26:49', '2019-07-08 05:56:49', 0),
(59, 'CBL1073-L', 15, 'MSD RUN', '', 'Pair', '', 'YLH', '', '4203', 12, 675, 'Rs', 1350, '2019-07-08 03:27:08', '2019-07-08 05:57:08', 0),
(60, 'CBL1074', 15, 'MSD RUN', '', 'Pair', '', 'BRH', '', '4203', 12, 675, 'Rs', 1350, '2019-07-08 03:27:39', '2019-07-08 05:57:39', 0),
(61, 'CBL1074-L', 15, 'MSD RUN', '', 'Pair', '', 'BLH', '', '4203', 12, 675, 'Rs', 1350, '2019-07-08 03:29:10', '2019-07-08 05:59:10', 0),
(62, 'CBL1075', 15, 'MSD ECO', '', 'Pair', '', 'MRH', '', '4203', 12, 520, 'Rs', 1040, '2019-07-08 03:30:04', '2019-07-08 06:00:04', 0),
(63, 'CBL1075-L', 15, 'MSD ECO', '', 'Pair', '', 'MLH', '', '4203', 12, 520, 'Rs', 1040, '2019-07-08 03:30:40', '2019-07-08 06:00:40', 0),
(64, 'CBL1075-Y', 15, 'MSD ECO', '', 'Pair', '', 'YRH', '', '4203', 12, 520, 'Rs', 1040, '2019-07-08 03:31:44', '2019-07-08 06:01:44', 0),
(65, 'CBL1075-YL', 15, 'MSD ECO', '', 'Pair', '', 'YLH', '', '4203', 12, 520, 'Rs', 1040, '2019-07-08 03:32:14', '2019-07-08 06:02:14', 0),
(66, 'CBL1075-B', 15, 'MSD ECO', '', 'Pair', '', 'BRH', '', '4203', 12, 520, 'Rs', 1040, '2019-07-08 03:34:12', '2019-07-08 06:04:12', 0),
(67, 'CBL1075-BL', 15, 'MSD ECO', '', 'Pair', '', 'BLH', '', '4203', 12, 520, 'Rs', 1040, '2019-07-08 03:38:19', '2019-07-08 06:08:19', 0),
(68, 'CBG1076', 16, 'MSD LIMITED EDITION (GOLD)', '', 'Pair', '', 'MRH', '', '4203', 12, 2025, 'Rs', 4050, '2019-07-08 03:45:50', '2019-07-08 06:15:50', 0),
(69, 'CBG1076-L', 16, 'MSD LIMITED EDITION (GOLD)', '', 'Pair', '', 'MLH', '', '4203', 12, 2025, 'Rs', 4050, '2019-07-08 03:56:38', '2019-07-08 06:26:38', 0),
(70, 'CBG1077', 16, 'MSD T20 SPECIAL', '', 'Pair', '', 'MRH', '', '4203', 12, 1680, 'Rs', 3360, '2019-07-08 03:57:42', '2019-07-08 06:27:42', 0),
(71, 'CBG1077-L', 16, 'MSD T20 SPECIAL', '', 'Pair', '', 'MLH', '', '4203', 12, 1680, 'Rs', 3360, '2019-07-08 03:58:27', '2019-07-08 06:28:27', 0),
(72, 'CBG1083', 16, 'MSD RUN', '', 'Pair', '', 'MRH', '', '4203', 12, 385, 'Rs', 770, '2019-07-08 03:59:15', '2019-07-08 06:29:15', 0),
(73, 'CBG1083-L', 16, 'MSD RUN', '', 'Pair', '', 'MLH', '', '4203', 12, 385, 'Rs', 770, '2019-07-08 03:59:37', '2019-07-08 06:29:37', 0),
(74, 'CBG1084', 16, 'MSD RUN', '', 'Pair', '', 'YRH', '', '4203', 12, 385, 'Rs', 770, '2019-07-08 04:00:20', '2019-07-08 06:30:20', 0),
(75, 'CBG1084-L', 16, 'MSD RUN', '', 'Pair', '', 'YLH', '', '4203', 12, 385, 'Rs', 770, '2019-07-08 04:00:52', '2019-07-08 06:30:52', 0),
(76, 'CBG1085', 16, 'MSD RUN', '', 'Pair', '', 'BRH', '', '4203', 12, 385, 'Rs', 770, '2019-07-08 04:01:49', '2019-07-08 06:31:49', 0),
(77, 'CBG1085-L', 16, 'MSD RUN', '', 'Pair', '', 'BLH', '', '4203', 12, 385, 'Rs', 770, '2019-07-08 04:02:26', '2019-07-08 06:32:26', 0),
(78, 'CBG1086', 16, 'MSD ECO', '', 'Pair', '', 'MRH', '', '4203', 12, 315, 'Rs', 630, '2019-07-08 04:03:04', '2019-07-08 06:33:04', 0),
(79, 'CBG1086-L', 16, 'MSD ECO', '', 'Pair', '', 'MLH', '', '4203', 12, 315, 'Rs', 630, '2019-07-08 04:03:20', '2019-07-08 06:33:20', 0),
(80, 'CBG1087', 16, 'MSD ECO', '', 'Pair', '', 'YRH', '', '4203', 12, 315, 'Rs', 630, '2019-07-08 04:03:45', '2019-07-08 06:33:45', 0),
(81, 'CBG1087-L', 16, 'MSD ECO', '', 'Pair', '', 'YLH', '', '4203', 12, 315, 'Rs', 630, '2019-07-08 04:03:59', '2019-07-08 06:33:59', 0),
(82, 'CBG1088', 16, 'MSD ECO', '', 'Pair', '', 'BRH', '', '4203', 12, 315, 'Rs', 630, '2019-07-08 04:04:30', '2019-07-08 06:34:30', 0),
(83, 'CBG1088-L', 16, 'MSD ECO', '', 'Pair', '', 'BLH', '', '4203', 12, 315, 'Rs', 630, '2019-07-08 04:05:10', '2019-07-08 06:35:10', 0),
(84, 'WKG1092', 17, 'MSD LIMITED EDITION GOLD', '', 'Pair', '', 'MEN', '', '9506', 12, 2100, 'Rs', 4200, '2019-07-08 04:14:41', '2019-07-08 06:44:41', 0),
(85, 'WKG1093', 17, 'MSD WARRIOR', '', 'Pair', '', 'MEN', '', '9506', 12, 1275, 'Rs', 2550, '2019-07-08 04:16:15', '2019-07-08 06:46:15', 0),
(86, 'WKG1093Y', 17, 'MSD WARRIOR', '', 'Pair', '', 'YOUTH', '', '9506', 12, 1275, 'Rs', 2550, '2019-07-08 04:16:49', '2019-07-08 06:46:49', 0),
(87, 'WKG1093B', 17, 'MSD WARRIOR', '', 'Pair', '', 'BOYS', '', '9506', 12, 1275, 'Rs', 2550, '2019-07-08 04:19:50', '2019-07-08 06:49:50', 0),
(88, 'CKB1096', 18, 'MSD CAMO', '', 'Pcs', '', '', '', '4202', 18, 1700, 'Rs', 3400, '2019-07-08 04:22:49', '2019-07-08 06:52:49', 0),
(89, 'CKB1099', 18, 'MSD SPARTA (RED/BLUE)', '', 'Pcs', '', '', '', '4202', 18, 1099, 'Rs', 2198, '2019-07-08 04:23:48', '2019-07-08 06:53:48', 0),
(90, 'CKB1100', 18, 'MSD RUN', '', 'Pcs', '', '', '', '4202', 18, 380, 'Rs', 760, '2019-07-08 04:24:26', '2019-07-08 06:54:26', 0),
(91, 'CKB1102', 18, 'MSD CAMO (ORANGE)', '', 'Pcs', '', '', '', '4202', 18, 999, 'Rs', 1998, '2019-07-08 04:25:22', '2019-07-08 06:55:22', 0),
(92, 'CKB1102G', 18, 'MSD CAMO (GOLD)', '', 'Pcs', '', '', '', '4202', 18, 999, 'Rs', 1998, '2019-07-08 04:25:51', '2019-07-08 06:55:51', 0),
(93, 'CKB1103', 18, 'MSD CAMO SPECIAL (ORANGE)', '', 'Pcs', '', '', '', '4202', 18, 1500, 'Rs', 3000, '2019-07-08 04:26:44', '2019-07-08 06:56:44', 0),
(94, 'CKB1103G', 18, 'MSD CAMO SPECIAL (GOLD)', '', 'Pcs', '', '', '', '4202', 18, 1500, 'Rs', 3000, '2019-07-08 04:27:08', '2019-07-08 06:57:08', 0),
(95, 'CS1104-4', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '4', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:29:54', '2019-07-08 06:59:54', 0),
(96, 'CS1104-5', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '5', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:30:08', '2019-07-08 07:00:08', 0),
(97, 'CS1104-6', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '6', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:30:16', '2019-07-08 07:00:16', 0),
(98, 'CS1104-7', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '7', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:30:31', '2019-07-08 07:00:31', 0),
(99, 'CS1104-8', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '8', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:30:44', '2019-07-08 07:00:44', 0),
(100, 'CS1104-9', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '9', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:30:54', '2019-07-08 07:00:54', 0),
(101, 'CS1104-10', 19, 'SPARTAN EXTREME PRO SPIKES', '', 'Pair', '', '10', '', '6404', 18, 1150, 'Rs', 2300, '2019-07-08 04:31:03', '2019-07-08 07:01:03', 0),
(102, 'CS1105-4', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '4', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:32:15', '2019-07-08 07:02:15', 0),
(103, 'CS1105-5', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '5', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:32:37', '2019-07-08 07:02:37', 0),
(104, 'CS1105-6', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '6', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:32:47', '2019-07-08 07:02:47', 0),
(105, 'CS1105-7', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '7', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:33:04', '2019-07-08 07:03:04', 0),
(106, 'CS1105-8', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '8', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:33:19', '2019-07-08 07:03:19', 0),
(107, 'CS1105-9', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '9', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:33:35', '2019-07-08 07:03:35', 0),
(108, 'CS1105-10', 19, 'SPARTAN EXTREME ', '', 'Pair', '', '10', '', '6404', 18, 725, 'Rs', 1450, '2019-07-08 04:33:51', '2019-07-08 07:03:51', 0),
(109, 'CS1106-4', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '4', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:35:05', '2019-07-08 07:05:05', 0),
(110, 'CS1106-5', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '5', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:35:14', '2019-07-08 07:05:14', 0),
(111, 'CS1106-6', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '6', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:35:23', '2019-07-08 07:05:23', 0),
(112, 'CS1106-7', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '7', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:35:35', '2019-07-08 07:05:35', 0),
(113, 'CS1106-8', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '8', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:35:44', '2019-07-08 07:05:44', 0),
(114, 'CS1106-9', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '9', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:35:52', '2019-07-08 07:05:52', 0),
(115, 'CS1106-10', 19, 'SPARTAN CHAMP WITH P.V.C SOLE', '', 'Pair', '', '10', '', '6404', 18, 350, 'Rs', 700, '2019-07-08 04:36:11', '2019-07-08 07:06:11', 0),
(116, 'CB1107', 11, 'CG BOSS EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 18500, 'Rs', 37000, '2019-07-08 05:04:23', '2019-07-08 07:34:23', 0),
(117, 'CB1108', 11, 'CG AUTHORITY EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 18500, 'Rs', 37000, '2019-07-08 05:07:19', '2019-07-08 07:37:19', 0),
(118, 'CB1109', 11, 'CG THUNDER  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 12500, 'Rs', 25000, '2019-07-08 05:07:55', '2019-07-08 07:37:55', 0),
(119, 'CB1110', 11, 'CG FORCE  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 10500, 'Rs', 21000, '2019-07-08 05:09:01', '2019-07-08 07:39:01', 0),
(120, 'CB1112', 11, 'CG SPARTA  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 8000, 'Rs', 16000, '2019-07-08 05:09:46', '2019-07-08 07:39:46', 0),
(121, 'CB1113', 11, 'CG FIGHTER  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 5500, 'Rs', 11000, '2019-07-08 05:10:20', '2019-07-08 07:40:20', 0),
(122, 'CB1114', 11, 'CG COMBAT  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 4200, 'Rs', 8400, '2019-07-08 05:11:03', '2019-07-08 07:41:03', 0),
(123, 'CB1115', 11, 'CG RUN  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 3200, 'Rs', 6400, '2019-07-08 05:11:52', '2019-07-08 07:41:52', 0),
(124, 'CH1138', 20, 'CRICKET HELMET SPARTAN MSD FIGHTER S', '', 'Pcs', '', 'S', '', '6506', 18, 1075, 'Rs', 2150, '2019-07-08 05:16:46', '2019-07-08 07:46:46', 0),
(125, 'CH1139', 20, 'CRICKET HELMET SPARTAN MSD FIGHTER M', '', 'Pcs', '', 'M', '', '6506', 18, 1075, 'Rs', 2150, '2019-07-08 05:17:08', '2019-07-08 07:47:08', 0),
(126, 'CH1140', 20, 'CRICKET HELMET SPARTAN MSD FIGHTER L', '', 'Pcs', '', 'L', '', '6506', 18, 1075, 'Rs', 2150, '2019-07-08 05:17:59', '2019-07-08 07:47:59', 0),
(127, 'CH1141', 20, 'CRICKET HELMET SPARTAN MSD RUN S', '', 'Pcs', '', 'S', '', '6506', 18, 575, 'Rs', 1150, '2019-07-08 05:21:26', '2019-07-08 07:51:26', 0),
(128, 'CH1142', 20, 'CRICKET HELMET SPARTAN MSD RUN M', '', 'Pcs', '', 'M', '', '6506', 18, 575, 'Rs', 1150, '2019-07-08 05:22:00', '2019-07-08 07:52:00', 0),
(129, 'CH1143', 20, 'CRICKET HELMET SPARTAN MSD RUN L', '', 'Pcs', '', 'L', '', '6506', 18, 575, 'Rs', 1150, '2019-07-08 05:22:19', '2019-07-08 07:52:19', 0),
(130, 'CB1144', 21, 'SIKANDER 1000 EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 12500, 'Rs', 25000, '2019-07-09 10:27:16', '2019-07-09 00:57:16', 0),
(131, 'CB1144-H', 21, 'SIKANDER 1000 EW H', '', 'Pcs', '', 'H', '', '9506', 12, 12500, 'Rs', 25000, '2019-07-09 10:27:54', '2019-07-09 00:57:54', 0),
(132, 'CB1144-6', 21, 'SIKANDER 1000 EW 6', '', 'Pcs', '', '6', '', '9506', 12, 12500, 'Rs', 25000, '2019-07-09 10:28:36', '2019-07-09 00:58:36', 0),
(133, 'CB1144-5', 21, 'SIKANDER 1000 EW 5', '', 'Pcs', '', '5', '', '9506', 12, 6000, 'Rs', 12000, '2019-07-09 10:29:18', '2019-07-09 00:59:18', 0),
(134, 'CB1144-4', 21, 'SIKANDER 1000 EW 4', '', 'Pcs', '', '4', '', '9506', 12, 6000, 'Rs', 12000, '2019-07-09 10:29:45', '2019-07-09 00:59:45', 0),
(135, 'CB1144-LE', 21, 'SIKANDER LE EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 18500, 'Rs', 37000, '2019-07-09 10:30:41', '2019-07-09 01:00:41', 0),
(136, 'CB1145', 21, 'SIKANDER 2000  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 8500, 'Rs', 17000, '2019-07-09 10:31:36', '2019-07-09 01:01:36', 0),
(137, 'CB1145-H', 21, 'SIKANDER 2000  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 8500, 'Rs', 17000, '2019-07-09 10:32:30', '2019-07-09 01:02:30', 0),
(138, 'CB1145-6', 21, 'SIKANDER 2000  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 8500, 'Rs', 17000, '2019-07-09 10:34:25', '2019-07-09 01:04:25', 0),
(139, 'CB1145-5', 21, 'SIKANDER 2000  EW 5', '', 'Pcs', '', '5', '', '9506', 12, 5000, 'Rs', 10000, '2019-07-09 10:35:01', '2019-07-09 01:05:01', 0),
(140, 'CB1145-4', 21, 'SIKANDER 2000  EW 4', '', 'Pcs', '', '4', '', '9506', 12, 5000, 'Rs', 10000, '2019-07-09 10:35:40', '2019-07-09 01:05:40', 0),
(141, 'CB1146', 21, 'SIKANDER 3000  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 6900, 'Rs', 13800, '2019-07-09 10:37:49', '2019-07-09 01:07:49', 0),
(142, 'CB1146-H', 21, 'SIKANDER 3000  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 6900, 'Rs', 13800, '2019-07-09 10:39:03', '2019-07-09 01:09:03', 0),
(143, 'CB1146-6', 21, 'SIKANDER 3000  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 6900, 'Rs', 13800, '2019-07-09 10:40:03', '2019-07-09 01:10:03', 0),
(144, 'CB1146-5', 21, 'SIKANDER 3000  EW 5', '', 'Pcs', '', '5', '', '9506', 12, 4000, 'Rs', 8000, '2019-07-09 10:43:30', '2019-07-09 01:13:30', 0),
(145, 'CB1146-4', 21, 'SIKANDER 3000  EW 4', '', 'Pcs', '', '4', '', '9506', 12, 4000, 'Rs', 8000, '2019-07-09 10:43:53', '2019-07-09 01:13:53', 0),
(146, 'CB1147', 21, 'SIKANDER 4000  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 5500, 'Rs', 11000, '2019-07-09 10:45:12', '2019-07-09 01:15:12', 0),
(147, 'CB1147-H', 21, 'SIKANDER 4000  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 5500, 'Rs', 11000, '2019-07-09 10:45:54', '2019-07-09 01:15:54', 0),
(148, 'CB1147-6', 21, 'SIKANDER 4000  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 5500, 'Rs', 11000, '2019-07-09 10:47:38', '2019-07-09 01:17:38', 0),
(149, 'CB1147-5', 21, 'SIKANDER 4000  EW 5', '', 'Pcs', '', '5', '', '9506', 12, 3000, 'Rs', 6000, '2019-07-09 10:48:06', '2019-07-09 01:18:06', 0),
(150, 'CB1147-4', 21, 'SIKANDER 4000  EW 4', '', 'Pcs', '', '4', '', '9506', 12, 3000, 'Rs', 6000, '2019-07-09 10:48:30', '2019-07-09 01:18:30', 0),
(151, 'CB1148', 21, 'SIKANDER 5000  EW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 3900, 'Rs', 7800, '2019-07-09 10:49:20', '2019-07-09 01:19:20', 0),
(152, 'CB1148-H', 21, 'SIKANDER 5000  EW H', '', 'Pcs', '', 'H', '', '9506', 12, 3900, 'Rs', 7800, '2019-07-09 10:49:41', '2019-07-09 01:19:41', 0),
(153, 'CB1148-6', 21, 'SIKANDER 5000  EW 6', '', 'Pcs', '', '6', '', '9506', 12, 3900, 'Rs', 7800, '2019-07-09 10:50:12', '2019-07-09 01:20:12', 0),
(154, 'CB1149', 23, 'SIKANDER 1000 KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1550, 'Rs', 3100, '2019-07-09 11:30:10', '2019-07-09 02:00:10', 0),
(155, 'CB1150', 23, 'SIKANDER 2000 KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1350, 'Rs', 2700, '2019-07-09 11:32:19', '2019-07-09 02:02:19', 0),
(156, 'CB1151', 23, 'SIKANDER 3000 KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1085, 'Rs', 2170, '2019-07-09 11:33:05', '2019-07-09 02:03:05', 0),
(157, 'CB1152', 23, 'SIKANDER 4000 KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1010, 'Rs', 2020, '2019-07-09 11:33:30', '2019-07-09 02:03:30', 0),
(158, 'CB1116', 22, 'CG HAMMER KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1350, 'Rs', 2700, '2019-07-09 11:35:57', '2019-07-09 02:05:57', 0),
(159, 'CB1117', 22, 'CG HAMMER KW H', '', 'Pcs', '', 'H', '', '9506', 12, 1350, 'Rs', 2700, '2019-07-09 11:36:15', '2019-07-09 02:06:15', 0),
(160, 'CB1118', 22, 'CG HAMMER KW 6', '', 'Pcs', '', '6', '', '9506', 12, 1350, 'Rs', 2700, '2019-07-09 11:36:48', '2019-07-09 02:06:48', 0),
(161, 'CB1119', 22, 'CG CYCLONE  KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1250, 'Rs', 2500, '2019-07-09 11:38:56', '2019-07-09 02:08:56', 0),
(162, 'CB1120', 22, 'CG CYCLONE  KW 6', '', 'Pcs', '', '6', '', '9506', 12, 1200, 'Rs', 2400, '2019-07-09 11:39:46', '2019-07-09 02:09:46', 0),
(163, 'CB1121', 22, 'CG RDX  KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1085, 'Rs', 2170, '2019-07-09 11:41:17', '2019-07-09 02:11:17', 0),
(164, 'CB1122', 22, 'CG RDX  KW 6', '', 'Pcs', '', '6', '', '9506', 12, 949, 'Rs', 1898, '2019-07-09 11:44:32', '2019-07-09 02:14:32', 0),
(165, 'CB1123', 22, 'CG RDX  KW 5', '', 'Pcs', '', '5', '', '9506', 12, 949, 'Rs', 1898, '2019-07-09 11:45:44', '2019-07-09 02:15:44', 0),
(166, 'CB1124', 22, 'CG RDX  KW 4', '', 'Pcs', '', '4', '', '9506', 12, 949, 'Rs', 1898, '2019-07-09 11:46:18', '2019-07-09 02:16:18', 0),
(167, 'CB1125', 22, 'CG 6XR KW SH', '', 'Pcs', '', 'SH', '', '9506', 12, 1010, 'Rs', 2020, '2019-07-09 11:47:15', '2019-07-09 02:17:15', 0),
(168, 'CB1125-6', 22, 'CG 6XR KW 6', '', 'Pcs', '', '6', '', '9506', 12, 975, 'Rs', 1950, '2019-07-09 11:48:30', '2019-07-09 02:18:30', 0),
(169, 'CB1125-5', 22, 'CG 6XR KW 5', '', 'Pcs', '', '5', '', '9506', 12, 975, 'Rs', 1950, '2019-07-09 11:48:48', '2019-07-09 02:18:48', 0),
(170, 'CBG1176', 16, 'SIKANDER BATTING GLOVES MEN', '', 'Pair', '', 'MRH', '', '4203', 12, 1600, 'Rs', 3200, '2019-07-09 11:52:40', '2019-07-09 02:22:40', 0),
(171, 'CBG1176-L', 16, 'SIKANDER BATTING GLOVES MEN', '', 'Pair', '', 'MLH', '', '4203', 12, 1600, 'Rs', 3200, '2019-07-09 11:52:59', '2019-07-09 02:22:59', 0),
(172, 'CBG1176-Y', 16, 'SIKANDER BATTING GLOVES YOUTH', '', 'Pair', '', 'MRH', '', '4203', 12, 1600, 'Rs', 3200, '2019-07-09 11:54:02', '2019-07-09 02:24:02', 0),
(173, 'CBG1176-YL', 16, 'SIKANDER BATTING GLOVES YOUTH', '', 'Pair', '', 'MLH', '', '4203', 12, 1600, 'Rs', 3200, '2019-07-09 11:54:23', '2019-07-09 02:24:23', 0),
(174, 'CBG1176-B', 16, 'SIKANDER BATTING GLOVES BOYS', '', 'Pair', '', 'MRH', '', '4203', 12, 1600, 'Rs', 3200, '2019-07-09 11:54:46', '2019-07-09 02:24:46', 0),
(175, 'CBG1176-BL', 16, 'SIKANDER BATTING GLOVES BOYS', '', 'Pair', '', 'MLH', '', '4203', 12, 1600, 'Rs', 3200, '2019-07-09 11:55:06', '2019-07-09 02:25:06', 0),
(176, 'CS1153', 24, 'STUMP WOODEN DECO WITH BAILS (SET OF 6 PCS)', '', 'SET', '', '', '', '9506', 12, 330, 'Rs', 660, '2019-07-09 11:57:32', '2019-07-09 02:27:32', 0),
(177, 'CS1154', 24, 'WOODEN NATURAL WITH BAILS  (SET OF 6 PCS)', '', 'SET', '', '', '', '9506', 12, 360, 'Rs', 720, '2019-07-09 11:58:22', '2019-07-09 02:28:22', 0),
(178, 'CS1155', 25, 'SPARTAN MATCH COTTON', '', 'Pcs', '', '', '', '', 12, 140, 'Rs', 280, '2019-07-09 12:00:50', '2019-07-09 02:30:50', 0),
(179, 'CLB1156', 26, 'SPARTAN CLUB PRO', '', 'Pcs', '', '', '', '9506', 12, 270, 'Rs', 540, '2019-07-09 12:03:16', '2019-07-09 02:33:16', 0),
(180, 'CLB1157', 26, 'SPARTAN LEAGUE PRO', '', 'Pcs', '', '', '', '9506', 12, 340, 'Rs', 680, '2019-07-09 12:04:10', '2019-07-09 02:34:10', 0),
(181, 'CLB1158', 26, 'SPARTAN TOURNAMENT  PRO', '', 'Pcs', '', '', '', '9506', 12, 405, 'Rs', 810, '2019-07-09 12:04:51', '2019-07-09 02:34:51', 0),
(182, 'CLB1159', 26, 'SPARTAN TEST  PRO', '', 'Pcs', '', '', '', '9506', 12, 610, 'Rs', 1220, '2019-07-09 12:05:28', '2019-07-09 02:35:28', 0),
(183, 'CN1166', 27, 'SPARTAN SIZE 60*10', '', 'Pcs', '', '', '', '9506', 12, 795, 'Rs', 1590, '2019-07-09 12:07:48', '2019-07-09 02:37:48', 0),
(184, 'CN1167', 27, 'SPARTAN SIZE 80*10', '', 'Pcs', '', '', '', '9506', 12, 1075, 'Rs', 2150, '2019-07-09 12:08:14', '2019-07-09 02:38:14', 0),
(185, 'CN1168', 27, 'SPARTAN SIZE 100*10', '', 'Pcs', '', '', '', '9506', 12, 1350, 'Rs', 2700, '2019-07-09 12:08:54', '2019-07-09 02:38:54', 0),
(186, 'CN1169', 27, 'SPARTAN SIZE 100*10 HEAVY DUTY', '', 'Pcs', '', '', '', '9506', 12, 7775, 'Rs', 15550, '2019-07-09 12:09:27', '2019-07-09 02:39:27', 0),
(187, 'CSM1170', 28, 'CRICKET METAL STUMPS', '', 'Pcs', '', '', '', '9506', 12, 330, 'Rs', 660, '2019-07-09 12:17:27', '2019-07-09 02:47:27', 0),
(188, 'CSM1171', 28, 'CRICKET SPRINGS  STUMPS', '', 'Pcs', '', '', '', '9506', 12, 875, 'Rs', 1750, '2019-07-09 12:18:32', '2019-07-09 02:48:32', 0),
(189, 'CTB1172', 29, 'TOURNAMENT HAVY WEIGHT 115-120 GMS MAROON', '', 'SET', '', '', '', '9506', 12, 39, 'Rs', 78, '2019-07-09 12:22:07', '2019-07-09 02:52:07', 0),
(190, 'CTB1173', 29, 'TOURNAMENT MEDIUM WEIGHT YELLOW', '', 'SET', '', '', '', '9506', 12, 39, 'Rs', 78, '2019-07-09 12:23:11', '2019-07-09 02:53:11', 0),
(191, 'CTB1174', 29, 'TOURNAMENT LIGHT WEIGHT YELLOW', '', 'SET', '', '', '', '9506', 12, 35, 'Rs', 70, '2019-07-09 12:23:56', '2019-07-09 02:53:56', 0),
(192, 'CWB1175', 29, 'SPARTAN WIND BALL', '', 'Pair', '', '', '', '9506', 12, 45, 'Rs', 90, '2019-07-09 12:25:58', '2019-07-09 02:55:58', 0),
(193, 'CB1178', 9, 'SPARTAN DREAM EW SH', '', 'Pair', '', 'SH', '', '9506', 12, 5000, 'Rs', 10000, '2019-07-09 12:27:30', '2019-07-09 02:57:30', 0),
(194, 'CEG1179-M', 30, 'SPARTAN ELBOW GUARD', '', 'Pcs', '', 'MEN', '', '9506', 12, 50, 'Rs', 100, '2019-07-09 12:29:22', '2019-07-09 02:59:22', 0),
(195, 'CEG1179-Y', 30, 'SPARTAN ELBOW GUARD', '', 'Pcs', '', 'YOUTH', '', '9506', 12, 45, 'Rs', 90, '2019-07-09 12:30:13', '2019-07-09 03:00:13', 0),
(196, 'CEG1179-B', 30, 'SPARTAN ELBOW GUARD', '', 'Pcs', '', 'BOYS', '', '9506', 12, 40, 'Rs', 80, '2019-07-09 12:30:56', '2019-07-09 03:00:56', 0),
(197, 'CTG1180-M', 30, 'SPARTAN THIGH GUARD', '', 'Pcs', '', 'MEN', '', '9506', 12, 110, 'Rs', 220, '2019-07-09 12:33:18', '2019-07-09 03:03:18', 0),
(198, 'CTG1180-Y', 30, 'SPARTAN THIGH GUARD', '', 'Pcs', '', 'YOUTH', '', '9506', 12, 100, 'Rs', 200, '2019-07-09 12:33:49', '2019-07-09 03:03:49', 0),
(199, 'CTG1180-B', 30, 'SPARTAN THIGH GUARD', '', 'Pcs', '', 'BOYS', '', '9506', 12, 90, 'Rs', 180, '2019-07-09 12:35:56', '2019-07-09 03:05:56', 0),
(200, 'IG1181-M', 31, 'SPARTAN INNER GLOVES ECO', '', 'Pair', '', 'MEN', '', '9506', 12, 60, 'Rs', 120, '2019-07-09 12:39:16', '2019-07-09 03:09:16', 0),
(201, 'IG1181-Y', 31, 'SPARTAN INNER GLOVES ECO', '', 'Pair', '', 'YOUTH', '', '9506', 12, 60, 'Rs', 120, '2019-07-09 12:39:36', '2019-07-09 03:09:36', 0),
(202, 'IG1181-B', 31, 'SPARTAN INNER GLOVES ECO', '', 'Pair', '', 'BOYS', '', '9506', 12, 60, 'Rs', 120, '2019-07-09 12:39:59', '2019-07-09 03:09:59', 0),
(203, 'AG1200-M', 32, 'SPARTAN TOP', '', 'Pair', '', 'MEN', '', '9506', 12, 38, 'Rs', 76, '2019-07-09 12:42:04', '2019-07-09 03:12:04', 0),
(204, 'AG1200-Y', 32, 'SPARTAN TOP', '', 'Pair', '', 'YOUTH', '', '9506', 12, 38, 'Rs', 76, '2019-07-09 12:42:31', '2019-07-09 03:12:31', 0),
(205, 'AG1200-B', 32, 'SPARTAN TOP', '', 'Pair', '', 'BOYS', '', '9506', 12, 38, 'Rs', 76, '2019-07-09 12:42:59', '2019-07-09 03:12:59', 0),
(206, 'CB5001', 34, 'SPARTAN HYBRID', '', 'Pcs', '', '5', '', '9506', 12, 750, 'Rs', 1500, '2019-07-09 12:48:15', '2019-07-09 03:18:15', 0),
(207, 'CB5002', 34, 'SPARTAN TRIGGER', '', 'Pcs', '', '5', '', '9506', 12, 540, 'Rs', 1080, '2019-07-09 12:49:04', '2019-07-09 03:19:04', 0),
(208, 'CB5003', 34, 'SPARTAN TERMINATOR', '', 'Pcs', '', '5', '', '9506', 12, 510, 'Rs', 1020, '2019-07-09 12:49:49', '2019-07-09 03:19:49', 0),
(209, 'CB5004', 34, 'SPARTAN OZY KING', '', 'Pcs', '', '5', '', '9506', 12, 470, 'Rs', 940, '2019-07-09 12:50:52', '2019-07-09 03:20:52', 0),
(210, 'CB5005', 34, 'SPARTAN COMMANDER', '', 'Pcs', '', '5', '', '9506', 12, 415, 'Rs', 830, '2019-07-09 12:51:39', '2019-07-09 03:21:39', 0),
(211, 'CB5006', 34, 'SPARTAN PERFORMANCE', '', 'Pcs', '', '5', '', '9506', 12, 380, 'Rs', 760, '2019-07-09 12:52:33', '2019-07-09 03:22:33', 0),
(212, 'SB5007', 35, 'SPARTAN GLORY SHINNING RUBBER', '', 'Pcs', '', '5', '', '9506', 12, 525, 'Rs', 1050, '2019-07-09 12:56:09', '2019-07-09 03:26:09', 0),
(213, 'SB5008', 35, 'SPARTAN LUCAS', '', 'Pcs', '', '5', '', '9506', 12, 447, 'Rs', 894, '2019-07-09 12:56:40', '2019-07-09 03:26:40', 0),
(214, 'SB5009', 35, 'SPARTAN INDIA KING', '', 'Pcs', '', '5', '', '9506', 12, 436, 'Rs', 872, '2019-07-09 12:57:20', '2019-07-09 03:27:20', 0),
(215, 'SB5010', 35, 'SPARTAN CLASSIC', '', 'Pcs', '', '5', '', '9506', 12, 422, 'Rs', 844, '2019-07-09 12:57:54', '2019-07-09 03:27:54', 0),
(216, 'SB5011', 35, 'SPARTAN PREMIER BLACK & WHITE', '', 'Pcs', '', '5', '', '9506', 12, 402, 'Rs', 804, '2019-07-09 12:58:51', '2019-07-09 03:28:51', 0),
(217, 'SB5012', 35, 'SPARTAN ECO', '', 'Pcs', '', '5', '', '9506', 12, 362, 'Rs', 724, '2019-07-09 12:59:33', '2019-07-09 03:29:33', 0),
(218, 'SB5013', 35, 'SPARTAN TRAINER', '', 'Pcs', '', '5', '', '9506', 12, 290, 'Rs', 580, '2019-07-09 01:00:08', '2019-07-09 03:30:08', 0),
(219, 'SB5014', 36, 'SPARTAN WORLD', '', 'Pcs', '', '5', '', '9506', 12, 180, 'Rs', 360, '2019-07-09 01:01:15', '2019-07-09 03:31:15', 0),
(220, 'SB5015', 36, 'SPARTAN WORLD 6 PANEL', '', 'Pcs', '', '3', '', '9506', 12, 160, 'Rs', 320, '2019-07-09 01:02:23', '2019-07-09 03:32:23', 0),
(221, 'SB5016', 36, 'SPARTAN STORM', '', 'Pcs', '', '5', '', '9506', 12, 260, 'Rs', 520, '2019-07-09 01:03:29', '2019-07-09 03:33:29', 0),
(222, 'SB5017', 36, 'SPARTAN FUN', '', 'Pcs', '', '5', '', '9506', 12, 85, 'Rs', 170, '2019-07-09 01:04:10', '2019-07-09 03:34:10', 0),
(223, 'SB5018', 37, 'SPARTAN THUNDER', '', 'Pcs', '', '5', '', '9506', 12, 275, 'Rs', 550, '2019-07-09 01:04:45', '2019-07-09 03:34:45', 0),
(224, 'SS5020', 38, 'SPARTAN STAR', '', 'Pair', '', '4', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:05:48', '2019-07-09 03:35:48', 0),
(225, 'SS5020-5', 38, 'SPARTAN STAR', '', 'Pair', '', '5', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:05:58', '2019-07-09 03:35:58', 0),
(226, 'SS5020-6', 38, 'SPARTAN STAR', '', 'Pair', '', '6', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:06:08', '2019-07-09 03:36:08', 0),
(227, 'SS5020-7', 38, 'SPARTAN STAR', '', 'Pair', '', '7', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:06:16', '2019-07-09 03:36:16', 0),
(228, 'SS5020-8', 38, 'SPARTAN STAR', '', 'Pair', '', '8', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:06:23', '2019-07-09 03:36:23', 0),
(229, 'SS5020-9', 38, 'SPARTAN STAR', '', 'Pair', '', '9', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:06:32', '2019-07-09 03:36:32', 0),
(230, 'SS5020-10', 38, 'SPARTAN STAR', '', 'Pair', '', '10', '', '9506', 5, 315, 'Rs', 499, '2019-07-09 01:06:40', '2019-07-09 03:36:40', 0),
(231, 'SS5022-4', 38, 'SPARTAN WEAPON', '', 'Pair', '', '4', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:07:19', '2019-07-09 03:37:19', 0),
(232, 'SS5022-5', 38, 'SPARTAN WEAPON', '', 'Pair', '', '5', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:07:29', '2019-07-09 03:37:29', 0),
(233, 'SS5022-6', 38, 'SPARTAN WEAPON', '', 'Pair', '', '6', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:07:43', '2019-07-09 03:37:43', 0),
(234, 'SS5022-7', 38, 'SPARTAN WEAPON', '', 'Pair', '', '7', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:08:03', '2019-07-09 03:38:03', 0),
(235, 'SS5022-8', 38, 'SPARTAN WEAPON', '', 'Pair', '', '8', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:08:12', '2019-07-09 03:38:12', 0),
(236, 'SS5022-9', 38, 'SPARTAN WEAPON', '', 'Pair', '', '9', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:08:20', '2019-07-09 03:38:20', 0),
(237, 'SS5022-10', 38, 'SPARTAN WEAPON', '', 'Pair', '', '10', '', '9506', 5, 450, 'Rs', 900, '2019-07-09 01:08:30', '2019-07-09 03:38:30', 0),
(238, 'SK5023', 39, 'SPARTAN STOCKING-POLYSTER', '', 'Pair', '', '', '', '6115', 5, 52, 'Rs', 104, '2019-07-09 01:09:36', '2019-07-09 03:39:36', 0),
(239, 'SK5024', 39, 'SPARTAN STOCKING - PLAYERS', '', 'Pair', '', '', '', '6115', 5, 65, 'Rs', 130, '2019-07-09 01:10:23', '2019-07-09 03:40:23', 0),
(240, 'SSG5033', 40, 'SPARTAN PROFFESIONAL WITH ANKLE', '', 'Pair', '', '', '', '9506', 12, 95, 'Rs', 190, '2019-07-09 03:21:59', '2019-07-09 05:51:59', 0),
(241, 'SSG5034', 40, 'SPARTAN PLASTIC MOULDED FOAM PADDED WITH ANKLE BIG SIZE', '', 'Pair', '', '', '', '9506', 12, 78, 'Rs', 140, '2019-07-09 03:23:40', '2019-07-09 05:53:40', 0),
(242, 'GKG5035', 41, 'SPARTAN GLORY', '', 'Pair', '', '', '', '4203', 12, 885, 'Rs', 1770, '2019-07-09 03:27:26', '2019-07-09 05:57:26', 0),
(243, 'GKG5036', 41, 'SPARTAN PRO', '', 'Pair', '', '', '', '4203', 12, 520, 'Rs', 1050, '2019-07-09 03:28:05', '2019-07-09 05:58:05', 0),
(244, 'SN5039', 42, 'SPARTAN CHAMPION EXTRA THICK QUALITY NYLON', '', 'Pcs', '', '', '', '9506', 12, 1350, 'Rs', 2700, '2019-07-09 03:32:07', '2019-07-09 06:02:07', 0),
(245, 'SN5040', 42, 'SPARTAN MATCH EXTRA THICK SILKY TRI COLOUR BOX', '', 'Pcs', '', '', '', '9506', 12, 2425, 'Rs', 4850, '2019-07-09 03:33:45', '2019-07-09 06:03:45', 0),
(246, 'SW5076', 44, 'SPARTAN STOP WATCH 100 LAPS 1-1000 SEC', '', 'Pcs', '', '', '', '9102', 18, 2100, 'Rs', 4200, '2019-07-09 03:38:55', '2019-07-09 06:08:55', 0),
(247, 'SW5077', 44, 'SPARTAN STOP WATCH ', '', 'Pcs', '', '', '', '9102', 18, 135, 'Rs', 270, '2019-07-09 03:39:35', '2019-07-09 06:09:35', 0),
(248, 'S5078', 45, 'SPARTAN SOCKS MILANCH', '', 'Pcs', '', '', '', '6115', 5, 75, 'Rs', 150, '2019-07-09 03:41:04', '2019-07-09 06:11:04', 0),
(249, 'S5079', 45, 'SPARTAN ANKEL HALF TOWEL COTTON SOCKS', '', 'Pcs', '', '', '', '6115', 5, 62, 'Rs', 124, '2019-07-09 03:41:50', '2019-07-09 06:11:50', 0),
(250, 'S5080', 45, 'SPARTAN SOCKS (PACK OF 3)', '', 'Pcs', '', '', '', '6115', 5, 145, 'Rs', 290, '2019-07-09 03:43:08', '2019-07-09 06:13:08', 0),
(251, 'VB5088', 47, 'SPARTAN POWER PU LAMINATED', '', 'Pcs', '', '4', '', '9506', 12, 370, 'Rs', 740, '2019-07-09 03:47:41', '2019-07-09 06:17:41', 0),
(252, 'VB5089', 47, 'SPARTAN SUPER VOLLEY LEATHER LAMINATE', '', 'Pcs', '', '4', '', '9506', 12, 670, 'Rs', 1340, '2019-07-09 03:48:37', '2019-07-09 06:18:37', 0),
(253, 'VB5090', 47, 'SPARTAN LOTUS  VOLLEY P.U  LAMINATE', '', 'Pcs', '', '4', '', '9506', 12, 495, 'Rs', 990, '2019-07-09 03:49:53', '2019-07-09 06:19:53', 0),
(254, 'VB5091', 47, 'SPARTAN STAR VOLLEY JAPNESE P.U  LAMINATE', '', 'Pcs', '', '4', '', '9506', 12, 950, 'Rs', 1900, '2019-07-09 03:50:45', '2019-07-09 06:20:45', 0),
(255, 'VB5092', 48, 'SPARTAN STAR KOREAN PU 18 P', '', 'Pcs', '', '4', '', '9506', 12, 330, 'Rs', 660, '2019-07-09 03:51:47', '2019-07-09 06:21:47', 0),
(256, 'VB5093', 48, 'SPARTAN SOFT TOUCH MICRO FIBRE P.U. 18 P', '', 'Pcs', '', '4', '', '9506', 12, 360, 'Rs', 720, '2019-07-09 03:52:59', '2019-07-09 06:22:59', 0),
(257, 'VB5094', 48, 'SPARTAN MATCH POINT P.V.C. 18 P', '', 'Pcs', '', '4', '', '9506', 12, 175, 'Rs', 350, '2019-07-09 03:53:58', '2019-07-09 06:23:58', 0),
(258, 'VB5095', 49, 'SPARTAN JAPANESE 18 P TRI COLOUR', '', 'Pcs', '', '4', '', '9506', 12, 343, 'Rs', 685, '2019-07-09 03:55:42', '2019-07-09 06:25:42', 0),
(259, 'VB5096', 49, 'SPARTAN INDIA KING 32 P', '', 'Pcs', '', '4', '', '9506', 12, 333, 'Rs', 666, '2019-07-09 03:56:17', '2019-07-09 06:26:17', 0),
(260, 'VB5097', 49, 'SPARTAN PREMIER 18 P COLOUR', '', 'Pcs', '', '4', '', '9506', 12, 307, 'Rs', 614, '2019-07-09 03:58:01', '2019-07-09 06:28:01', 0),
(261, 'VB5098', 49, 'SPARTAN TRAINER 32 P', '', 'Pcs', '', '4', '', '9506', 12, 290, 'Rs', 580, '2019-07-09 03:58:41', '2019-07-09 06:28:41', 0),
(262, 'SB5099', 50, 'SPARTAN GOLD (KOREAN PU)', '', 'Pcs', '', '3', '', '9506', 12, 350, 'Rs', 700, '2019-07-09 04:01:18', '2019-07-09 06:31:18', 0),
(263, 'SB5100', 50, 'SPARTAN LEATHER 32 P', '', 'Pcs', '', '3', '', '9506', 12, 425, 'Rs', 850, '2019-07-09 04:02:02', '2019-07-09 06:32:02', 0),
(264, 'SB5101', 51, 'SPARTAN MATCH 4 SIDE TAPE (15 MESHES)', '', 'Pcs', '', '', '', '9506', 12, 400, 'Rs', 800, '2019-07-09 04:03:22', '2019-07-09 06:33:22', 0),
(265, 'SN5102', 51, 'SPARTAN PRACTICE 202 (12 MESHES)', '', 'Pcs', '', '', '', '9506', 12, 290, 'Rs', 580, '2019-07-09 04:09:43', '2019-07-09 06:39:43', 0),
(266, 'VBN5103', 52, 'SPARTAN MATCH SUPERIOR NYLON WITH WIRE APP. BY VFI', '', 'Pcs', '', '', '', '9506', 12, 1380, 'Rs', 2760, '2019-07-09 04:18:42', '2019-07-09 06:48:42', 0),
(267, 'VBN5104', 52, 'SPARTAN TOP NYLON 4 SIDETETRON TAPE APP. BY VFI', '', 'Pcs', '', '', '', '9506', 12, 1595, 'Rs', 1140, '2019-07-09 04:19:47', '2019-07-09 06:49:47', 0),
(268, 'VBN5105', 52, 'SPARTAN CHAMPION 4 SIDE TAPE ', '', 'Pcs', '', '', '', '9506', 12, 420, 'Rs', 840, '2019-07-09 04:21:19', '2019-07-09 06:51:19', 0),
(269, 'SPARTAN PRACTICE COTTON 4 SIDE TAPE', 52, 'VBN 5106', '', 'Pcs', '', '', '', '9506', 12, 340, 'Rs', 680, '2019-07-09 04:23:02', '2019-07-09 06:53:02', 0),
(270, 'VBP5107', 54, 'SPARTAN TOP ADJUSTABLE & MOVEABLE POLE  (G.I. PIPE)', '', 'Pcs', '', '', '', '9506', 12, 8580, 'Rs', 17160, '2019-07-09 04:27:28', '2019-07-09 06:57:28', 0),
(271, 'VBP5108', 54, 'SPARTAN MATCH ADJUSTABLE FIXABLE POLE', '', 'Pcs', '', '', '', '9506', 12, 4680, 'Rs', 9360, '2019-07-09 04:28:17', '2019-07-09 06:58:17', 0),
(272, 'VBP5109', 54, 'SPARTAN MATCH PRACTICE FIXABLE POLE', '', 'Pcs', '', '', '', '9506', 12, 2275, 'Rs', 4550, '2019-07-09 04:29:04', '2019-07-09 06:59:04', 0),
(273, 'VA5110', 54, 'SPARTAN ANTENNA FIBRE GLASS WITH COVER', '', 'Pcs', '', '', '', '9506', 12, 2390, 'Rs', 780, '2019-07-09 04:30:01', '2019-07-09 07:00:01', 0),
(274, 'VBW 5112', 54, 'SPARTAN NET WIRE PVC COTTED 13 MTR', '', 'Pcs', '', '', '', '9506', 12, 338, 'Rs', 676, '2019-07-09 04:31:11', '2019-07-09 07:01:11', 0),
(275, 'VRS5113', 54, 'REFEREE STAND WITH PADDING', '', 'Pcs', '', '', '', '9506', 12, 7500, 'Rs', 15000, '2019-07-09 04:34:19', '2019-07-09 07:04:19', 0),
(276, 'VBS5114-4', 53, 'SPARTAN MAXX', '', 'Pair', '', '4', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:35:41', '2019-07-09 07:05:41', 0),
(277, 'VBS5114-5', 53, 'SPARTAN MAXX', '', 'Pair', '', '5', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:35:55', '2019-07-09 07:05:55', 0),
(278, 'VBS5114-6', 53, 'SPARTAN MAXX', '', 'Pair', '', '6', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:36:09', '2019-07-09 07:06:09', 0),
(279, 'VBS5114-7', 53, 'SPARTAN MAXX', '', 'Pair', '', '7', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:36:29', '2019-07-09 07:06:29', 0),
(280, 'VBS5114-8', 53, 'SPARTAN MAXX', '', 'Pair', '', '8', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:37:01', '2019-07-09 07:07:01', 0),
(281, 'VBS5114-9', 53, 'SPARTAN MAXX', '', 'Pair', '', '9', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:37:34', '2019-07-09 07:07:34', 0),
(282, 'VBS5114-10', 53, 'SPARTAN MAXX', '', 'Pair', '', '10', '', '6404', 5, 495, 'Rs', 990, '2019-07-09 04:38:02', '2019-07-09 07:08:02', 0),
(283, 'VBS5115-4', 53, 'SPARTAN RYDER', '', 'Pair', '', '4', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:39:34', '2019-07-09 07:09:34', 0),
(284, 'VBS5115-5', 53, 'SPARTAN RYDER', '', 'Pair', '', '5', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:39:41', '2019-07-09 07:09:41', 0),
(285, 'VBS5115-6', 53, 'SPARTAN RYDER', '', 'Pair', '', '6', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:40:21', '2019-07-09 07:10:21', 0),
(286, 'VBS5115-7', 53, 'SPARTAN RYDER', '', 'Pair', '', '7', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:40:40', '2019-07-09 07:10:40', 0),
(287, 'VBS5115-8', 53, 'SPARTAN RYDER', '', 'Pair', '', '8', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:40:52', '2019-07-09 07:10:52', 0),
(288, 'VBS5115-9', 53, 'SPARTAN RYDER', '', 'Pair', '', '9', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:41:03', '2019-07-09 07:11:03', 0),
(289, 'VBS5115-10', 53, 'SPARTAN RYDER', '', 'Pair', '', '10', '', '6404', 5, 725, 'Rs', 1450, '2019-07-09 04:41:21', '2019-07-09 07:11:21', 0),
(290, 'VBS5116-4', 53, 'SPARTAN STORM', '', 'Pair', '', '4', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:42:10', '2019-07-09 07:12:10', 0),
(291, 'VBS5116-5', 53, 'SPARTAN STORM', '', 'Pair', '', '5', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:42:23', '2019-07-09 07:12:23', 0),
(292, 'VBS5116-6', 53, 'SPARTAN STORM', '', 'Pair', '', '6', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:42:32', '2019-07-09 07:12:32', 0),
(293, 'VBS5116-7', 53, 'SPARTAN STORM', '', 'Pair', '', '7', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:42:44', '2019-07-09 07:12:44', 0),
(294, 'VBS5116-8', 53, 'SPARTAN STORM', '', 'Pair', '', '8', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:42:53', '2019-07-09 07:12:53', 0),
(295, 'VBS5116-9', 53, 'SPARTAN STORM', '', 'Pair', '', '9', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:43:07', '2019-07-09 07:13:07', 0),
(296, 'VBS5116-10', 53, 'SPARTAN STORM', '', 'Pair', '', '10', '', '6404', 5, 775, 'Rs', 1550, '2019-07-09 04:43:16', '2019-07-09 07:13:16', 0),
(297, 'VBS5118-4', 53, 'SPARTAN ECO', '', 'Pair', '', '4', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:52:38', '2019-07-09 07:22:38', 0),
(298, 'VBS5118-5', 53, 'SPARTAN ECO', '', 'Pair', '', '5', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:52:48', '2019-07-09 07:22:48', 0),
(299, 'VBS5118-6', 53, 'SPARTAN ECO', '', 'Pair', '', '6', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:52:55', '2019-07-09 07:22:55', 0),
(300, 'VBS5118-7', 53, 'SPARTAN ECO', '', 'Pair', '', '7', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:53:03', '2019-07-09 07:23:03', 0),
(301, 'VBS5118-8', 53, 'SPARTAN ECO', '', 'Pair', '', '8', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:53:11', '2019-07-09 07:23:11', 0),
(302, 'VBS5118-9', 53, 'SPARTAN ECO', '', 'Pair', '', '9', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:53:18', '2019-07-09 07:23:18', 0),
(303, 'VBS5118-10', 53, 'SPARTAN ECO', '', 'Pair', '', '10', '', '6404', 5, 625, 'Rs', 1250, '2019-07-09 04:53:28', '2019-07-09 07:23:28', 0),
(304, 'BB5119', 56, 'SPARTAN GOLD STAR COMPOSITE LEATHER', '', 'Pair', '', '7', '', '9506', 12, 925, 'Rs', 1850, '2019-07-09 04:56:20', '2019-07-09 07:26:20', 0),
(305, 'BB5120', 56, 'SPARTAN GOLD STAR COMPOSITE LEATHER', '', 'Pair', '', '6', '', '9506', 12, 900, 'Rs', 1800, '2019-07-09 04:57:27', '2019-07-09 07:27:27', 0),
(306, 'BB5121', 56, 'SPARTAN SUPER GRIP FOAM RUBBER', '', 'Pair', '', '7', '', '9506', 12, 365, 'Rs', 730, '2019-07-09 04:58:13', '2019-07-09 07:28:13', 0),
(307, 'BB5122', 56, 'SPARTAN SUPER GRIP FOAM RUBBER', '', 'Pair', '', '6', '', '9506', 12, 355, 'Rs', 710, '2019-07-09 04:59:02', '2019-07-09 07:29:02', 0),
(308, 'BB5123', 56, 'SPARTAN SUPER POWER', '', 'Pair', '', '7', '', '9506', 12, 345, 'Rs', 690, '2019-07-09 05:00:32', '2019-07-09 07:30:32', 0),
(309, 'BB5124', 56, 'SPARTAN CLASSIC', '', 'Pair', '', '7', '', '9506', 12, 335, 'Rs', 670, '2019-07-09 05:01:04', '2019-07-09 07:31:04', 0),
(310, 'BB5125', 56, 'SPARTAN CLASSIC', '', 'Pair', '', '6', '', '9506', 12, 325, 'Rs', 650, '2019-07-09 05:01:38', '2019-07-09 07:31:38', 0),
(311, 'BB5126', 56, 'SPARTAN CLASSIC', '', 'Pair', '', '5', '', '9506', 12, 310, 'Rs', 620, '2019-07-09 05:02:05', '2019-07-09 07:32:05', 0),
(312, 'BB5127', 56, 'SPARTAN CLASSIC', '', 'Pair', '', '3', '', '9506', 12, 110, 'Rs', 220, '2019-07-09 05:02:24', '2019-07-09 07:32:24', 0),
(313, 'BBN5134', 58, 'SPARTAN SILKY SUPERIOR', '', 'Pair', '', '', '', '9506', 12, 250, 'Rs', 500, '2019-07-09 05:07:32', '2019-07-09 07:37:32', 0),
(314, 'BBS5132-4', 57, 'SPARTAN POWER', '', 'Pair', '', '4', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:08:52', '2019-07-09 07:38:52', 0),
(315, 'BBS5132-5', 57, 'SPARTAN POWER', '', 'Pair', '', '5', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:09:26', '2019-07-09 07:39:26', 0),
(316, 'BBS5132-6', 57, 'SPARTAN POWER', '', 'Pair', '', '6', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:10:22', '2019-07-09 07:40:22', 0),
(317, 'BBS5132-7', 57, 'SPARTAN POWER', '', 'Pair', '', '7', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:10:29', '2019-07-09 07:40:29', 0),
(318, 'BBS5132-8', 57, 'SPARTAN POWER', '', 'Pair', '', '8', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:10:37', '2019-07-09 07:40:37', 0),
(319, 'BBS5132-9', 57, 'SPARTAN POWER', '', 'Pair', '', '9', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:10:49', '2019-07-09 07:40:49', 0),
(320, 'BBS5132-10', 57, 'SPARTAN POWER', '', 'Pair', '', '10', '', '6404', 5, 635, 'Rs', 1270, '2019-07-09 05:11:00', '2019-07-09 07:41:00', 0),
(321, 'BBS5130-4', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '4', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:24:03', '2019-07-09 07:54:03', 0),
(322, 'BBS5130-5', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '5', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:24:42', '2019-07-09 07:54:42', 0),
(323, 'BBS5130-6', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '6', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:24:52', '2019-07-09 07:54:52', 0),
(324, 'BBS5130-7', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '7', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:25:02', '2019-07-09 07:55:02', 0),
(325, 'BBS5130-8', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '8', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:25:10', '2019-07-09 07:55:10', 0),
(326, 'BBS5130-9', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '9', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:25:18', '2019-07-09 07:55:18', 0),
(327, 'BBS5130-10', 57, 'SPARTAN JUMPER BLACK', '', 'Pair', '', '10', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:25:58', '2019-07-09 07:55:58', 0),
(328, 'BBS5130W-4', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '4', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:00', '2019-07-09 07:57:00', 0),
(329, 'BBS5130W-5', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '5', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:09', '2019-07-09 07:57:09', 0),
(330, 'BBS5130W-6', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '6', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:16', '2019-07-09 07:57:16', 0),
(331, 'BBS5130W-7', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '7', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:22', '2019-07-09 07:57:22', 0),
(332, 'BBS5130W-8', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '8', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:30', '2019-07-09 07:57:30', 0),
(333, 'BBS5130W-9', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '9', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:37', '2019-07-09 07:57:37', 0),
(334, 'BBS5130W-10', 57, 'SPARTAN JUMPER WHITE & BLUE', '', 'Pair', '', '10', '', '6404', 5, 770, 'Rs', 1540, '2019-07-09 05:27:45', '2019-07-09 07:57:45', 0),
(335, 'BBDR5136', 59, 'SPARTAN DRUNKEN RING WITH 3 SPRING', '', 'Pair', '', '', '', '6409506', 12, 4050, 'Rs', 8100, '2019-07-09 05:33:09', '2019-07-09 08:03:09', 0),
(336, 'BBDR5137', 59, 'SPARTAN DUNKING RING WITH 2 SPRING', '', 'Pair', '', '', '', '9506', 12, 2850, 'Rs', 5700, '2019-07-09 05:34:13', '2019-07-09 08:04:13', 0),
(337, 'BBR5138', 59, 'SPARTAN RING 20MM', '', 'Pair', '', '', '', '9506', 12, 1200, 'Rs', 2400, '2019-07-09 05:35:10', '2019-07-09 08:05:10', 0),
(338, 'BBR5139', 59, 'SPARTAN RING 18MM', '', 'Pair', '', '', '', '9506', 12, 1040, 'Rs', 2080, '2019-07-09 05:37:22', '2019-07-09 08:07:22', 0),
(339, 'BBR5140', 59, 'SPARTAN RING 16MM', '', 'Pair', '', '', '', '9506', 12, 1800, 'Rs', 1600, '2019-07-09 05:37:57', '2019-07-09 08:07:57', 0),
(340, 'HB5141', 60, 'SPARTAN ELITE FLORO COLOUR', '', 'Pcs', '', 'MEN', '', '9506', 12, 450, 'Rs', 900, '2019-07-09 05:44:24', '2019-07-09 08:14:24', 0);
INSERT INTO `products` (`id`, `sku`, `category_id`, `name`, `description`, `quantityin`, `ean`, `size`, `color`, `hsn`, `gstpercentage`, `dealprice`, `currency`, `mrp`, `created_datetime`, `update_datetime`, `deleted`) VALUES
(341, 'HB5142', 60, 'SPARTAN ELITE FLORO COLOUR', '', 'Pcs', '', 'WOMEN', '', '9506', 12, 435, 'Rs', 870, '2019-07-09 05:44:45', '2019-07-09 08:14:45', 0),
(342, 'HB5143', 60, 'SPARTAN HI-TECH', '', 'Pcs', '', 'MEN', '', '9506', 12, 422, 'Rs', 844, '2019-07-09 05:45:30', '2019-07-09 08:15:30', 0),
(343, 'HB5144', 60, 'SPARTAN HI-TECH', '', 'Pcs', '', 'WOMEN', '', '9506', 12, 412, 'Rs', 824, '2019-07-09 05:46:04', '2019-07-09 08:16:04', 0),
(344, 'HBN5146', 61, 'SPARTAN PERFORMANCE MODEL-3', '', 'Pair', '', '', '', '9506', 12, 950, 'Rs', 1900, '2019-07-09 05:47:06', '2019-07-09 08:17:06', 0),
(345, 'HBN5147', 61, 'SPARTAN TOP NYLON MACHINE MADE', '', 'Pair', '', '', '', '9506', 12, 1750, 'Rs', 3500, '2019-07-09 05:47:53', '2019-07-09 08:17:53', 0),
(346, 'HBGP5148', 62, 'HAND BALL GOAL POST FIXABLE (8CM*8CM) PRACTICE', '', 'SET', '', '', '', '9506', 12, 11500, 'Rs', 23000, '2019-07-09 05:50:21', '2019-07-09 08:20:21', 0),
(347, 'HBGP5149', 62, 'HAND BALL GOAL POST MATCH (8CM*8CM) MOVEABLE', '', 'SET', '', '', '', '9506', 12, 16900, 'Rs', 33800, '2019-07-09 05:51:04', '2019-07-09 08:21:04', 0),
(348, 'TB5151', 63, 'SPARTAN MATCH THROW BALL PLAIN/ GRAIN', '', 'Pcs', '', '5', '', '9506', 12, 425, 'Rs', 850, '2019-07-09 05:52:30', '2019-07-09 08:22:30', 0),
(349, 'TB5152', 63, 'SPARTAN MATCH NET BALL', '', 'Pcs', '', '5', '', '9506', 12, 425, 'Rs', 850, '2019-07-09 05:52:59', '2019-07-09 08:22:59', 0),
(350, 'TBNTT5156', 64, 'SPARTAN TOP NYLON WITH TETRON TAPE', '', 'Pcs', '', '', '', '9506', 12, 660, 'Rs', 1320, '2019-07-09 05:54:09', '2019-07-09 08:24:09', 0),
(351, 'TBN5157', 64, 'SPARTAN MATCH COTTON', '', 'Pcs', '', '', '', '9506', 12, 250, 'Rs', 500, '2019-07-09 05:55:19', '2019-07-09 08:25:19', 0),
(352, 'TBN5158', 64, 'SPARTAN PRACTICE NYLON', '', 'Pcs', '', '', '', '9506', 12, 185, 'Rs', 370, '2019-07-09 05:56:32', '2019-07-09 08:26:32', 0),
(353, 'BSC5167', 65, 'SPARTAN NYLON SUPER FLY 786 (6PCS)', '', 'Pcs', '', '', '', '9506', 12, 224, 'Rs', 458, '2019-07-10 10:02:35', '2019-07-10 00:32:35', 0),
(354, 'JS5182-4', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '4', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:11:27', '2019-07-10 00:41:27', 0),
(355, 'JS5182-5', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '5', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:12:03', '2019-07-10 00:42:03', 0),
(356, 'JS5182-6', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '6', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:12:12', '2019-07-10 00:42:12', 0),
(357, 'JS5182-7', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '7', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:12:22', '2019-07-10 00:42:22', 0),
(358, 'JS5182-8', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '8', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:12:33', '2019-07-10 00:42:33', 0),
(359, 'JS5182-9', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '9', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:12:47', '2019-07-10 00:42:47', 0),
(360, 'JS5182-10', 66, 'SPARTAN TORANDO JOGGING SHOE', '', 'Pair', '', '10', '', '6404', 5, 625, 'Rs', 1250, '2019-07-10 10:13:06', '2019-07-10 00:43:06', 0),
(361, 'JS5184-4', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '4', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:15:53', '2019-07-10 00:45:53', 0),
(362, 'JS5184-5', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '5', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:16:01', '2019-07-10 00:46:01', 0),
(363, 'JS5184-6', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '6', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:16:09', '2019-07-10 00:46:09', 0),
(364, 'JS5184-7', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '7', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:16:17', '2019-07-10 00:46:17', 0),
(365, 'JS5184-8', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '8', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:16:25', '2019-07-10 00:46:25', 0),
(366, 'JS5184-9', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '9', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:16:34', '2019-07-10 00:46:34', 0),
(367, 'JS5184-10', 66, 'SPARTAN GALAXY JOGGING SHOE', '', 'Pair', '', '10', '', '6404', 5, 390, 'Rs', 645, '2019-07-10 10:16:49', '2019-07-10 00:46:49', 0),
(368, 'BN5165', 68, 'SPARTAN SUPERIOR NYLON WITH TATRON TAPE', '', 'Pcs', '', '', '', '9506', 12, 375, 'Rs', 750, '2019-07-10 10:28:51', '2019-07-10 00:58:51', 0),
(369, 'BN5166', 68, 'SPARTAN MATCH 4 SIDE CANVAS', '', 'Pcs', '', '', '', '9506', 12, 405, 'Rs', 810, '2019-07-10 10:31:44', '2019-07-10 01:01:44', 0),
(370, 'SP5042', 43, 'SOCCER GOAL POST IRON 3\"PIPE WITH SUPPORT', '', 'SET', '', '', '', '9506', 12, 15500, 'Rs', 31000, '2019-07-10 10:33:42', '2019-07-10 01:03:42', 0),
(371, 'SP5043', 43, 'SOCCER GOAL POST IRON 3\"PIPE WITH SUPPORT & MOVEABLE', '', 'SET', '', '', '', '9506', 12, 21000, 'Rs', 42000, '2019-07-10 10:34:14', '2019-07-10 01:04:14', 0),
(372, 'SP5044', 43, 'SOCCER GOAL POST IRON 4\"PIPE WITH SUPPORT ', '', 'SET', '', '', '', '9506', 12, 19000, 'Rs', 38000, '2019-07-10 10:35:06', '2019-07-10 01:05:06', 0),
(373, 'SP5045', 43, 'SOCCER GOAL POST IRON 4\"PIPE WITH SUPPORT & MOVEABLE', '', 'SET', '', '', '', '9506', 12, 26000, 'Rs', 52000, '2019-07-10 10:35:55', '2019-07-10 01:05:55', 0),
(374, 'SP5046', 43, 'SOCCER GOAL POST IRON 5\"PIPE WITH SUPPORT ', '', 'SET', '', '', '', '9506', 12, 28500, 'Rs', 57000, '2019-07-10 10:36:38', '2019-07-10 01:06:38', 0),
(375, 'M5048', 69, 'MARKER', '', 'Pcs', '', '', '', '9506', 12, 7.5, 'Rs', 15, '2019-07-10 10:53:23', '2019-07-10 01:23:23', 0),
(376, 'AS5049', 69, 'AGILITY STICK', '', 'Pcs', '', '', '', '9506', 12, 100, 'Rs', 200, '2019-07-10 10:54:04', '2019-07-10 01:24:04', 0),
(377, 'AL5050', 69, 'ADJUSTABLE LADDER(4 MTR)', '', 'Pcs', '', '', '', '9506', 12, 195, 'Rs', 390, '2019-07-10 10:54:50', '2019-07-10 01:24:50', 0),
(378, 'AL5051', 69, 'ADJUSTABLE LADDER(46MTR)', '', 'Pcs', '', '', '', '9506', 12, 290, 'Rs', 580, '2019-07-10 10:55:22', '2019-07-10 01:25:22', 0),
(379, 'AL5052', 69, 'ADJUSTABLE LADDER(8MTR)', '', 'Pcs', '', '', '', '9506', 12, 385, 'Rs', 770, '2019-07-10 10:55:48', '2019-07-10 01:25:48', 0),
(380, 'D5053', 69, 'DOME', '', 'Pcs', '', '', '', '9506', 12, 15, 'Rs', 30, '2019-07-10 10:56:23', '2019-07-10 01:26:23', 0),
(381, 'C5054', 69, 'CONE 6\"', '', 'Pcs', '', '', '', '9506', 12, 16, 'Rs', 32, '2019-07-10 10:57:05', '2019-07-10 01:27:05', 0),
(382, 'C5055', 69, 'CONE 9\"', '', 'Pcs', '', '', '', '9506', 12, 24, 'Rs', 48, '2019-07-10 10:57:32', '2019-07-10 01:27:32', 0),
(383, 'C5056', 69, 'CONE 12\"', '', 'Pcs', '', '', '', '9506', 12, 42, 'Rs', 84, '2019-07-10 10:58:08', '2019-07-10 01:28:08', 0),
(384, 'C5057', 69, 'CONE 15\"', '', 'Pcs', '', '', '', '9506', 12, 68, 'Rs', 136, '2019-07-10 10:58:35', '2019-07-10 01:28:35', 0),
(385, 'C5058', 69, 'CONE 18\"', '', 'Pcs', '', '', '', '9506', 12, 128, 'Rs', 256, '2019-07-10 10:59:09', '2019-07-10 01:29:09', 0),
(386, 'TH5059', 69, 'TRAINING HURDLES 6\"', '', 'Pcs', '', '', '', '9506', 12, 65, 'Rs', 130, '2019-07-10 11:00:02', '2019-07-10 01:30:02', 0),
(387, 'TH5060', 69, 'TRAINING HURDLES 9\"', '', 'Pcs', '', '', '', '9506', 12, 75, 'Rs', 150, '2019-07-10 11:00:23', '2019-07-10 01:30:23', 0),
(388, 'TH5061', 69, 'TRAINING HURDLES 12\"', '', 'Pcs', '', '', '', '9506', 12, 82, 'Rs', 164, '2019-07-10 11:00:52', '2019-07-10 01:30:52', 0),
(389, 'TH5062', 69, 'TRAINING HURDLES 15\"', '', 'Pcs', '', '', '', '9506', 12, 90, 'Rs', 180, '2019-07-10 11:01:16', '2019-07-10 01:31:16', 0),
(390, 'TH5063', 69, 'TRAINING HURDLES 18\"', '', 'Pcs', '', '', '', '9506', 12, 103, 'Rs', 206, '2019-07-10 11:01:40', '2019-07-10 01:31:40', 0),
(391, 'CI5064', 69, 'CORNER FLAG SET OF 4 PCS.', '', 'Pcs', '', '', '', '9506', 12, 580, 'Rs', 1160, '2019-07-10 11:02:37', '2019-07-10 01:32:37', 0),
(392, 'APG5065', 69, 'AIR PRESSURE GUAGE', '', 'Pcs', '', '', '', '9506', 12, 350, 'Rs', 700, '2019-07-10 11:03:11', '2019-07-10 01:33:11', 0),
(393, 'APG5066', 69, 'AIR HAND PUMP WITH PRESSURE GUAGE', '', 'Pcs', '', '', '', '9506', 12, 550, 'Rs', 1100, '2019-07-10 11:03:45', '2019-07-10 01:33:45', 0),
(394, 'AHP5067', 69, 'AIR HAND PUMP', '', 'Pcs', '', '', '', '9506', 12, 140, 'Rs', 280, '2019-07-10 11:04:14', '2019-07-10 01:34:14', 0),
(395, 'SB5068', 69, 'SUBSITUTION BOARD SIZE 43*38CM', '', 'Pcs', '', '', '', '9506', 12, 1250, 'Rs', 2500, '2019-07-10 11:05:08', '2019-07-10 01:35:08', 0),
(396, 'RS5072', 69, 'RUNNING PARASCHUTE', '', 'Pcs', '', '', '', '9506', 12, 390, 'Rs', 780, '2019-07-10 11:06:18', '2019-07-10 01:36:18', 0),
(397, 'SBM5073', 69, 'SCORE BOARD MANUAL', '', 'Pcs', '', '', '', '9506', 12, 1100, 'Rs', 2200, '2019-07-10 11:07:11', '2019-07-10 01:37:11', 0),
(398, 'B5074', 69, 'BIBS', '', 'Pcs', '', '', '', '9506', 12, 85, 'Rs', 170, '2019-07-10 11:08:03', '2019-07-10 01:38:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `parent_id` bigint(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `slug`, `parent_id`, `deleted`) VALUES
(8, 'Cricket', 'cricket', 0, 0),
(9, 'English Willow Cricket Bats', 'english-willow-cricket-bats', 8, 0),
(10, 'Ms Dhoni Series', 'ms-dhoni-series', 9, 0),
(11, 'Chris Gayle Series ', 'chris-gayle-series-', 9, 0),
(12, 'Cricket Bat Kashmir Willow', 'cricket-bat-kashmir-willow', 8, 0),
(13, 'Ms Dhoni Series Kw Bats', 'ms-dhoni-series-kw-bats', 12, 0),
(14, 'Cricket Tennis Bats', 'cricket-tennis-bats', 8, 0),
(15, 'Cricket Batting Legguard', 'cricket-batting-legguard', 8, 0),
(16, 'Cricket Batting Gloves', 'cricket-batting-gloves', 8, 0),
(17, 'Wicket Keeping Gloves', 'wicket-keeping-gloves', 8, 0),
(18, 'Cricket Kit Bag', 'cricket-kit-bag', 8, 0),
(19, 'Cricket Shoes', 'cricket-shoes', 8, 0),
(20, 'Cricket Helmets', 'cricket-helmets', 8, 0),
(21, 'David Warner Series', 'david-warner-series', 9, 0),
(22, 'Chris Gayle Series Kw', 'chris-gayle-series-kw', 12, 0),
(23, 'David Warner Series Kw', 'david-warner-series-kw', 12, 0),
(24, 'Cricket Stumps', 'cricket-stumps', 8, 0),
(25, 'Cricket Supporter', 'cricket-supporter', 8, 0),
(26, 'Cricket Leather Ball', 'cricket-leather-ball', 8, 0),
(27, 'Cricket Net Nylon', 'cricket-net-nylon', 8, 0),
(28, 'Cricket Metal  Spring Stumps', 'cricket-metal-spring-stumps', 8, 0),
(29, 'Cricket Tenniswindsynthetic Ball', 'cricket-tenniswindsynthetic-ball', 8, 0),
(30, 'Cricket Arm Guardthigh Guard', 'cricket-arm-guardthigh-guard', 8, 0),
(31, 'Cricket Inner Gloves', 'cricket-inner-gloves', 8, 0),
(32, 'Cricket Abdominal Guard', 'cricket-abdominal-guard', 8, 0),
(33, 'Soccer', 'soccer', 0, 0),
(34, 'Soccer Ball Pu  Hand Stitched', 'soccer-ball-pu-hand-stitched', 33, 0),
(35, 'Soccer Ball Synthetichand Stitched', 'soccer-ball-synthetichand-stitched', 33, 0),
(36, 'Soccer Ball Pvc Hand Stitched Multi Colour', 'soccer-ball-pvc-hand-stitched-multi-colour', 0, 0),
(37, 'Soccer Ball Moulded', 'soccer-ball-moulded', 0, 0),
(38, 'Soccer Shoe', 'soccer-shoe', 0, 0),
(39, 'Soccer Stocking', 'soccer-stocking', 0, 0),
(40, 'Soccer Shin Guard', 'soccer-shin-guard', 33, 0),
(41, 'Goal Keeper Glove', 'goal-keeper-glove', 0, 0),
(42, 'Soccer Goal Post Net', 'soccer-goal-post-net', 0, 0),
(43, 'Soccer Goal Post', 'soccer-goal-post', 0, 0),
(44, 'Stop Watch', 'stop-watch', 0, 0),
(45, 'Socks', 'socks', 0, 0),
(46, 'VOLLEY BALL', 'volley-ball', 0, 0),
(47, 'Volley Ball Laminated Moulded', 'volley-ball-laminated-moulded', 0, 0),
(48, 'Volley Ball Pu Pvc Hand Stitched', 'volley-ball-pu-pvc-hand-stitched', 0, 0),
(49, 'Volley Ball Synthetic Hand Stitched', 'volley-ball-synthetic-hand-stitched', 0, 0),
(50, 'Shooting Ball', 'shooting-ball', 0, 0),
(51, 'Shooting Net', 'shooting-net', 0, 0),
(52, 'Volleyball Net', 'volleyball-net', 46, 0),
(53, 'Volleyball Shoe', 'volleyball-shoe', 46, 0),
(54, 'Volley Ball Poleantennawirereferee Stand', 'volley-ball-poleantennawirereferee-stand', 46, 0),
(55, 'Basket Ball', 'basket-ball', 0, 0),
(56, 'Basket Ball Moulded', 'basket-ball-moulded', 55, 0),
(57, 'Basket Ball Shoe', 'basket-ball-shoe', 0, 0),
(58, 'Basket Ball Net', 'basket-ball-net', 0, 0),
(59, 'Basket Ball Ring', 'basket-ball-ring', 0, 0),
(60, 'HAND BALL SYNTHETIC HAND STITCHED', 'hand-ball-synthetic-hand-stitched', 0, 0),
(61, 'Hand Ball Net', 'hand-ball-net', 0, 0),
(62, 'Hand Ball Goal Post', 'hand-ball-goal-post', 0, 0),
(63, 'Other Balls', 'other-balls', 0, 0),
(64, 'Throw Ball Net', 'throw-ball-net', 0, 0),
(65, 'Badminton Shuttle Cock Feathernylonindooroutdoor', 'badminton-shuttle-cock-feathernylonindooroutdoor', 0, 0),
(66, 'Jogging Shoe', 'jogging-shoe', 0, 0),
(67, 'Badminton', 'badminton', 0, 0),
(68, 'Badminton Net', 'badminton-net', 67, 0),
(69, 'Training Accessories', 'training-accessories', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(255) NOT NULL,
  `type` enum('company','person') NOT NULL DEFAULT 'person',
  `name` varchar(100) NOT NULL,
  `person_id` bigint(255) NOT NULL,
  `gst_type` enum('sgst-cgst','igst') NOT NULL,
  `quotation_ref` varchar(100) NOT NULL,
  `bill_to` varchar(100) NOT NULL,
  `ship_to` varchar(100) NOT NULL,
  `ship_via` varchar(100) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `delivery_date` varchar(100) NOT NULL,
  `delivery_terms` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `status` enum('init','stockin','deleted') NOT NULL DEFAULT 'init',
  `payment_terms` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(255) NOT NULL,
  `purchase_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `discount_percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(255) NOT NULL,
  `type` enum('company','person') NOT NULL DEFAULT 'person',
  `name` varchar(100) NOT NULL,
  `person_id` bigint(255) NOT NULL,
  `quotation_ref` varchar(100) NOT NULL,
  `purchase_ref` varchar(100) NOT NULL,
  `gst_type` enum('sgst-cgst','igst') NOT NULL,
  `bill_to` varchar(300) NOT NULL,
  `ship_to` varchar(300) NOT NULL,
  `ship_via` varchar(200) NOT NULL,
  `transport_mode` varchar(200) NOT NULL,
  `delivery_date` varchar(100) NOT NULL,
  `gr_no` varchar(100) NOT NULL,
  `gr_date` varchar(100) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `cases` varchar(100) NOT NULL,
  `discount_percent` float NOT NULL,
  `created_by` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `status` enum('init','stockout','deleted') NOT NULL DEFAULT 'init'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(255) NOT NULL,
  `sale_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `discount_percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_log`
--

CREATE TABLE `stock_log` (
  `id` bigint(255) NOT NULL,
  `warehouse_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `product_sku` varchar(100) NOT NULL,
  `change_in_quantity` float NOT NULL,
  `total_quantity` bigint(255) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` varchar(100) NOT NULL,
  `created_by` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(255) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Harjot Singh', 'jot143@live.in', 'e10adc3949ba59abbe56e057f20f883e', '2019-06-22 02:00:00', '2019-06-22 19:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bigint(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `sku`, `name`, `address`) VALUES
(1, 'war1', 'Wahehouse 1', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challanins`
--
ALTER TABLE `challanins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challanin_items`
--
ALTER TABLE `challanin_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challanouts`
--
ALTER TABLE `challanouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challanout_items`
--
ALTER TABLE `challanout_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damage_items`
--
ALTER TABLE `damage_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dummyorders`
--
ALTER TABLE `dummyorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dummyorder_items`
--
ALTER TABLE `dummyorder_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_log`
--
ALTER TABLE `stock_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challanins`
--
ALTER TABLE `challanins`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challanin_items`
--
ALTER TABLE `challanin_items`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challanouts`
--
ALTER TABLE `challanouts`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challanout_items`
--
ALTER TABLE `challanout_items`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damage_items`
--
ALTER TABLE `damage_items`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dummyorders`
--
ALTER TABLE `dummyorders`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dummyorder_items`
--
ALTER TABLE `dummyorder_items`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_log`
--
ALTER TABLE `stock_log`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
