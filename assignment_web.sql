-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-28 14:01:13
-- 伺服器版本： 10.4.20-MariaDB
-- PHP 版本： 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `assignment_web`
--

-- --------------------------------------------------------

--
-- 資料表結構 `government_data`
--

CREATE TABLE `government_data` (
  `District_en` text NOT NULL,
  `District_cn` text NOT NULL,
  `Name_en` text NOT NULL,
  `Name_cn` text NOT NULL,
  `Address_en` text NOT NULL,
  `Address_cn` text NOT NULL,
  `GIHS` text DEFAULT NULL,
  `Facilities_en` text NOT NULL,
  `Facilities_b5` text NOT NULL,
  `Ancillary_facilities_en` text DEFAULT NULL,
  `Ancillary_facilities_cn` text DEFAULT NULL,
  `Opening_hours_en` text NOT NULL,
  `Opening_hours_cn` text NOT NULL,
  `Phone` text NOT NULL,
  `Remarks_en` text DEFAULT NULL,
  `Remarks_cn` text DEFAULT NULL,
  `Longitude` text DEFAULT NULL,
  `Latitude` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `government_data`
--

INSERT INTO `government_data` (`District_en`, `District_cn`, `Name_en`, `Name_cn`, `Address_en`, `Address_cn`, `GIHS`, `Facilities_en`, `Facilities_b5`, `Ancillary_facilities_en`, `Ancillary_facilities_cn`, `Opening_hours_en`, `Opening_hours_cn`, `Phone`, `Remarks_en`, `Remarks_cn`, `Longitude`, `Latitude`) VALUES
('Tuen Mun', '屯門區', 'Cafeteria Old Beach', '舊咖啡灣泳灘', '18 3/4 milestone,Castle Peak Road', '青山公路 18 3/4 咪', 'DqtuvKn1wT', 'Barbecue Sites(23 nos. of BBQ Pits)', '燒烤場 (23個燒烤爐)', 'Light Refreshment Kiosk, Toilets', '小食亭, 洗手間', '24 hours', '24 小時', '2450 6306', '', '', '113-59-0', '22-22-33'),
('Sai Kung', '西貢區', 'Clear Water Bay First Beach ', '清水灣第一灣泳灘', 'Tai Wan Tau, Clear Water Bay Road', '清水灣道大環頭', 'EHalYn38v7', 'Barbecue Site', '燒烤場', '15 barbecue pits, benches &amp; tables, toilet', '15個燒烤爐，桌椅，洗手間', '24 hours daily', '全日24小時', '2719 8308', '', '', '114-17-28', '22-17-28'),
('Sai Kung', '西貢區', 'Kiu Tsui Beach ', '橋咀泳灘', 'Kiu Tsui, Sharp Island ', '橋咀洲橋咀泳灘', 'RBVSV6REew', 'Barbecue Site', '燒烤場', '13 barbecue pits, benches &amp; tables, toilet', '13個燒烤爐，桌椅，洗手間', '24 hours daily', '全日24小時', '2798 8171', '', '', '114-17-18', '22-22-4'),
('Sai Kung', '西貢區', 'Trio Beach ', '三星灣泳灘', 'Trio (Hebehaven) Beach', '三星灣泳灘(白沙灣區)', 'gwUP3v7VC5', 'Barbecue Site', '燒烤場', '20 barbecue pits, benches &amp; tables, toilet', '20個燒烤爐，桌椅，洗手間', '24 hours daily', '全日24小時', '2792 3672', '', '', '114-16-4', '22-21-28'),
('Sha Tin', '沙田區', 'Kwei Tei Street Garden', '桂地街花園', 'Kwei Tei Street, Fo Tan, Sha Tin', '沙田火炭桂地街', 'NYMCu25xD3', '2 barbecue pits', '2個燒烤爐', '', '', '24 hrs', '24小時', '2634 0147', '', '', '114-11-28', '22-24-0'),
('Sha Tin', '沙田區', 'Lok Shun Path Barbecue Area', '樂信徑燒烤場', 'Lok Shun Path, Sha Tin', '沙田火炭樂信徑', 'k3lrwDARjX', '6 barbecue pits', '6個燒烤爐', '', '', '24 hrs', '24小時', '2634 0147', 'Non-smoking', '全面禁煙', '114-11-58', '22-23-56'),
('Southern', '南區', 'Big Wave Bay Beach', '大浪灣泳灘', 'Big Wave Bay Road, Shek O, Hong Kong', '香港石澳大浪灣道', 'oelHd47URa', '20 barbecue pits', '燒烤爐20個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2809 4558', '', '', '114-14-49', '22-14-47'),
('Southern', '南區', 'Big Wave Bay Picnic Area', '大浪灣郊遊區', 'Big Wave Bay Road, Shek O, Hong Kong', '香港石澳大浪灣道', '1gIWCc5PQk', '6 barbecue pits', '燒烤爐6個', 'Toilets are provided.', '設有洗手間', '24 hours daily', '每日24小時開放', '2555 0103', '', '', '114-14-58', '22-14-24'),
('Southern', '南區', 'Chung Hom Kok Beach', '舂坎角泳灘', 'Chung Hom Kok Road, Hong Kong', '香港舂坎角道', 'eCW1s93jNO', '25 barbecue pits', '燒烤爐25個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2813 0454', '', '', '114-12-8', '22-13-4'),
('Southern', '南區', 'Chung Hom Kok Park', '舂坎角公園', 'Chung Hom Kok Road, Hong Kong', '香港舂坎角道', '0e879In4fk', '3 barbecue pits', '燒烤爐3個', '', '', '24 hours daily', '每日24小時開放', '2555 0103', '', '', '114-11-52', '22-12-38'),
('Southern', '南區', 'Deep Water Bay Beach', '深水灣泳灘', 'Island Road, Deep Water Bay, Hong Kong', '香港深水灣香島道', 'Xkg87Lgpg3', '33 barbecue pits', '燒烤爐33個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2812 0228', '', '', '114-11-52', '22-12-38'),
('Southern', '南區', 'Hair Pin Beach ', '夏萍灣泳灘', 'Stanley Beach Road, Stanley, Hong Kong', '香港赤柱灘道', 'zU4DOYpaKH', '22 barbecue pits', '燒烤爐22個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2813 0217', 'This beach is not open for swimming.', '該泳灘不開放給市民游泳', '114-12-53', '22-13-27'),
('Southern', '南區', 'Middle Bay Beach', '中灣泳灘', 'South Bay Road, Repulse Bay, Hong Kong', '香港淺水灣南灣道', 'zefPXEcXOW', '9 barbecue pits', '燒烤爐9個', '', '', '24 hours daily', '每日24小時開放', '2812 2546', '', '', '114-11-54', '22-13-48'),
('Southern', '南區', 'Shek O Beach', '石澳泳灘', 'Shek O Road, Shek O, Hong Kong', '香港石澳石澳道', 'DF2VYro0zG', '39 barbecue pits', '燒烤爐39個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2809 4557', '', '', '114-15-3', '22-13-43'),
('Southern', '南區', 'Shek O Headland Picnic Area', '石澳海角郊遊區', 'Shek O Headland Road, Shek O, Hong Kong', '香港石澳山仔路', 'GTbK6y9uuy', '3 barbecue pits', '燒烤爐3個', '', '', '24 hours daily', '每日24小時開放', '2555 0103', '', '', '114-15-27', '22-13-48'),
('Southern', '南區', 'South Bay Beach', '南灣泳灘', 'South Bay Road, Repulse Bay, Hong Kong', '香港淺水灣南灣道', '2gQZwU2YPE', '19 barbecue pits', '燒烤爐19個', '', '', '24 hours daily', '每日24小時開放', '2812 2468', '', '', '114-11-51', '22-13-30'),
('Southern', '南區', 'St. Stephen&apos;s Beach', '聖士提反灣泳灘', 'Wong Ma Kok Path, Stanley, Hong Kong', '香港赤柱黃麻角徑', 'VnpU3X6euA', '14 barbecue pits', '燒烤爐14個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2813 1872', '', '', '114-12-54', '22-12-48'),
('Southern', '南區', 'Stanley Main Beach', '赤柱正灘泳灘', 'Stanley Beach Road, Stanley, Hong Kong', '香港赤柱灘道', 'P0AT9SY1e4', '15 barbecue pits', '燒烤爐15個', 'Toilets (including accessible toilet)', '洗手間(設有暢通易達洗手間)', '24 hours daily', '每日24小時開放', '2813 0217', '', '', '114-12-51', '22-13-16'),
('Southern', '南區', 'Turtle Cove Beach', '龜背灣泳灘', 'Tai Tam Road, Stanley, Hong Kong', '香港赤柱大潭道', 'zKFfAyIRmf', '12 barbecue pits', '燒烤爐12個', 'Toilets', '洗手間', '24 hours daily', '每日24小時開放', '2813 0386', '', '', '114-13-24', '22-13-59'),
('Southern', '南區', 'Waterfall Bay Park', '瀑布灣公園', 'Waterfall Bay Road, Wah Fu Estate, Aberdeen, Hong Kong', '香港香港仔華富邨瀑布灣道', 'mNlIEM97QN', '10 barbecue pits', '燒烤爐10個', 'Toilets and accessible toilet are provided.', '設有洗手間和暢通易達洗手間', '24 hours daily', '每日24小時開放', '2555 0103', '', '', '114-8-2', '22-15-7'),
('Tsuen Wan', '荃灣區', 'Gemini Beaches', '雙仙灣泳灘', '12 milestone, Castle Peak Road - Sham Tseng', '青山公路深井段12咪', '3flS75o3X8', '2 Barbecue pits', '2個燒烤爐', '<li>Toilet</li>', '<li>洗手間</li>', 'Whole day', '全日開放', '2491 1229 / 2212 9738', '', '', '114-4-9', '22-21-50'),
('Tsuen Wan', '荃灣區', 'Hoi Mei Wan Beach', '海美灣泳灘', '11 3/4 milestone, Castle Peak Road - Ting Kau', '青山公路汀九段11 3/4咪', 'jDwuHrzYJA', '3 Barbecue pits', '3個燒烤爐', '<li>Toilet</li>', '<li>洗手間</li>', 'Whole day', '全日開放', '2491 1229 / 2212 9738', '', '', '114-4-15', '22-21-53'),
('Wong Tai Sin', '黃大仙區', 'Lion Rock Park', '獅子山公園', 'Chuk Yuen Road, Wong Tai Sin, Kowloon', '九龍黃大仙竹園道', '8QySepXOP0', '26 barbecue pits', '26個燒烤爐', '<li>26 sets of tables and benches at BBQ area\r\n<br><li>Men’s and ladies’ toilets (including accessible toilet)\r\n<br><li>Lighting system\r\n<br><li>1 children play area\r\n<br><li>3 elderly fitness corners\r\n<br><li>1 designated disabled parking space<br>\r\n', '<li>26組餐桌及座椅(位於燒烤場內)\r\n<br><li>男、女洗手間(包括暢通易達洗手間)\r\n<br><li>照明系統\r\n<br><li>1個兒童遊樂場\r\n<br><li>3個長者健體園地\r\n<br><li>1個暢通易達停車位<br>\r\n', '24 hours daily', '每日24小時開放', '2337 4648', '', '', '114-11-2', '22-20-41'),
('Islands', '離島區', 'Cheung Po Chai Cave Picnic Area', '張保仔洞郊遊區', 'Cheung Po Chai Road, Cheung Chau', '長洲張保仔路', 'pJw4CGwgXh', '6 barbecue pits with benches', '6組燒烤爐連椅', '<li>Picnic tables<br><li>Pavilion<br>', '<li>野餐檯<br><li>涼亭<br>', 'Whole day', '全日開放', '2852 4845', '', '', '114-1-6', '22-12-3'),
('Islands', '離島區', 'Hung Shing Yeh Beach', '洪聖爺灣泳灘', 'Hung Shing Yeh Beach, Yung Shue Wan, Lamma Island', '南丫島榕樹灣洪聖爺灣泳灘', 'reS55JdVEN', '9 barbecue pits with benches', '9組燒烤爐連椅', '<li>Wash basin (with 2 taps)<br><li>Toilets (including accessible toilet)<br>', '<li>1個洗手盆(2個水龍頭)<br><li>洗手間 (設有暢通易達洗手間)<br>', 'Whole day', '全日開放', '2982 0352', 'Beach', '泳灘', '114-7-11', '22-13-8'),
('Islands', '離島區', 'Lo So Shing Beach', '蘆鬚城泳灘', 'Lo So Shing Beach, Sok Kwu Wan, Lamma Island', '南丫島索罟灣蘆鬚城泳灘', 'wPeQdlsINb', '6 barbecue pits with benches', '6組燒烤爐連椅', 'Toilets', '洗手間', 'Whole day', '全日開放', '2982 8252', 'Beach', '泳灘', '114-7-22', '22-12-16'),
('Islands', '離島區', 'Lo Tik Wan Barbecue Area', '蘆荻灣燒烤場', 'Lo Tik Wan, Lamma', '南丫島蘆荻灣', 'ebUISBSCOi', '2 barbecue pits with benches', '2組燒烤爐連椅', 'Picnic table', '野餐檯', 'Whole day', '全日開放', '2852 4845', '', '', '114-7-34', '22-13-26'),
('Islands', '離島區', 'Po Chu Tam BBQ Area', '寶珠潭燒烤場', 'Tai O, Lantau Island', '大嶼山大澳', 'CYMnYakyfK', '3 barbecue pits with benches', '3組燒烤爐連椅', '<li>Garden bench<br><li>Chess table <br>', '<li>公園椅<br><li>棋檯<br>', 'Whole day', '全日開放', '2852 4845', 'Park Light Opening Hours: <br>7 pm to 5:30 am of the following day (May to Oct)<br>6 pm to 6:30 am of the following day (Nov to Apr)<br>', '公園燈開&#21855;時間:<br>晚上7時至翌日上午5時30分 (五月至十月)<br>晚上6時至翌日上午6時30分 (十一月至四月)<br>', '113-51-44', '22-15-28'),
('Islands', '離島區', 'Pui O Beach', '貝澳泳灘', 'Pui O Beach, Lantau', '大嶼山貝澳泳灘', 'BRHqPGUqUj', '6 barbecue pits with benches', '6組燒烤爐連椅', '<li>Wash basin (with 3 taps)<br><li>Toilets (including accessible toilet)<br>', '<li>1個洗手盆(3個水龍頭)<br><li>洗手間 (設有暢通易達洗手間)<br>', 'Whole day', '全日開放', '2984 7675', 'Beach', '泳灘', '113-58-33', '22-14-24'),
('Islands', '離島區', 'Silver Mine Bay Beach', '銀礦灣泳灘', 'Silver Mine Bay Beach, Lantau Island', '大嶼山銀礦灣泳灘', 'dXP6Ku5NF4', '24 barbecue pits with benches', '24組燒烤爐連椅', '<li>6 Wash basins (total 12 taps)<br><li>Toilets (including accessible toilet)<br>', '<li>6個洗手盆(12個水龍頭)<br><li>洗手間 (設有暢通易達洗手間)<br>', 'Whole day', '全日開放', '2984 8229', 'Beach', '泳灘', '113-59-56', '22-16-12'),
('Islands', '離島區', 'Tong Fuk Barbecue Area', '塘福燒烤場', 'Tong Fuk, Lantau Island', '大嶼山塘福', 'pNgHo0Zd3y', '3 barbecue pits with benches', '3組燒烤爐連椅', '<li>Pavilion<br><li>Concrete table with bench<br>', '<li>涼亭<br><li>石檯連石椅<br>', 'Whole day', '全日開放', '2852 4845', '', '', '113-56-2', '22-13-36'),
('Islands', '離島區', 'Tung Wan Barbecue Area, Peng Chau', '坪洲東灣燒烤場', 'Tung Wa, Peng Chau', '坪洲東灣', 'p3JhOK1w9A', '6 barbecue pits with benches', '6組燒烤爐連椅', '<li>2 portable toilets<br><li>Picnic tables<br><li>Pavilion<br>', '<li>2個流動廁所<br><li>野餐檯<br><li>涼亭<br>', 'Whole day', '全日開放', '2852 4845', '', '', '114-2-24', '22-17-13'),
('Islands', '離島區', 'Upper Cheung Sha Beach', '上長沙泳灘', 'Upper Cheung Sha Beach, Lautau Island.', '大嶼山上長沙泳灘', 'tiugCZlcVI', '7 barbecue pits with benches ', '7組燒烤爐連椅', 'Toilets (including accessible toilet)', '洗手間 (設有暢通易達洗手間)', 'Whole day', '全日開放', '2980 2114', 'Beach', '泳灘', '113-56-29', '22-13-50'),
('Tai Po', '大埔區', 'Tai Mei Tuk Barbecue Area', '大美督燒烤場', 'Tai Po Tai Mei Tuk Road', '大埔大美督路', '94HvOnjIkO', 'Barbecue Site', '燒烤場', '40 sets Barbecue pits, Benches and Tables.', '40組燒烤爐連椅桌', '24 hrs daily', '全日開放', '3183 9020', '', '', '114-13-58', '22-28-17'),
('Tsuen Wan', '荃灣區', 'Approach Beach', '近水灣泳灘', '10 1/2 milestone, Castle Peak Road - Ting Kau', '青山公路汀九段10咪半', 'mWskLVoPiM', '2 Barbecue pits', '2個燒烤爐', '<li>Toilet', '<li>洗手間', 'Whole day', '全日開放', '2491 1341 / 2212 9738', '', '', '114-5-11', '22-22-3'),
('Sai Kung', '西貢區', 'Hap Mun Bay Beach', '廈門灣泳灘', 'Hap Mun Bay, Sharp Island', '橋咀洲廈門灣泳灘', '2wpyosVWlN', 'Barbecue Site', '燒烤場', '22 barbecue pits, benches &amp; tables, toilet', '&nbsp;22個燒烤爐，桌椅，洗手間', '24 hours daily', '全日24小時', '2796 6788', '', '', '114-17-45', '22-21-25'),
('Islands', '', 'sfghfgh', '', 'dufrufiyfui ', '', NULL, 'dghdfghfdgh', '', 'dfghdfghdf', NULL, '64515641', '', '3516541', '', NULL, NULL, NULL),
('North', '', 'fgjjhgj', '', 'ghkfghk ', '', NULL, 'hgkghkgkj', '', 'ghkgkh', NULL, '545541', '', '241241', '', NULL, NULL, NULL),
('Sha Tin', '', 'ftgjhfj', '', 'fgjfgj ', '', NULL, 'jfgjfgj', '', '24 hour', NULL, '3122', '', '', '', NULL, NULL, NULL),
('Islands', '', 'ghjfgjh', '', 'fgjjhjh ', '', NULL, 'fgjfgjfgj', '', 'ghkjghkgfhk', NULL, '31512', '', '41561', '', NULL, NULL, NULL),
('Tsuen Wan', '', 'fgjhfgj', '', 'ghjghj ', '', NULL, 'gjgj', '', '24 hour', NULL, '11214', '', '', '', NULL, NULL, NULL),
('Islands', '', 'ghjkfghk', '', 'fghkgkh ', '', NULL, 'kghkj', '', '1351', NULL, '6451564', '', '', '', NULL, NULL, NULL),
('Tsuen Wan', '', 'dfhdfh', '', 'fghfghfgh ', '', NULL, 'dfghfgh', '', 'fgh', NULL, '5265', '', '', '', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
