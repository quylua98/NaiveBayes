-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 09, 2020 at 12:12 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `survey_answer`
--

CREATE TABLE `survey_answer` (
  `id` bigint NOT NULL,
  `hoc_luc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `suc_khoe` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngoai_hinh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kinh_te` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gioi_tinh` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tuoi` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `huong_nganh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `huong_noi_ngoai` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `survey_answer`
--

INSERT INTO `survey_answer` (`id`, `hoc_luc`, `suc_khoe`, `ngoai_hinh`, `kinh_te`, `gioi_tinh`, `tuoi`, `huong_nganh`, `result`, `huong_noi_ngoai`) VALUES
(1, 'Giỏi', 'Tốt', 'Có', 'Giàu có', 'Nữ', '21-24', 'Kinh tế', 'Hướng dẫn viên du lịch', 'Hướng nội'),
(2, 'Giỏi', 'Bình Thường', 'Không', 'Giàu có', 'Nam', '25-30', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng ngoại'),
(3, 'Khá', 'Yếu', 'Có', 'Khó Khăn', 'Nữ', '21-24', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng ngoại'),
(4, 'Khá', 'Bình Thường', 'Không', 'Bình thường', 'Nam', '25-30', 'Kinh tế', 'Kế Toán', 'Hướng nội'),
(5, 'Giỏi', 'Tốt', 'Có', 'Giàu có', 'Nữ', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(6, 'Khá', 'Yếu', 'Có', 'Bình thường', 'Nữ', '21-24', 'Kinh tế', 'Phiên dịch viên', 'Hướng nội'),
(7, 'Giỏi', 'Tốt', 'Có', 'Giàu có', 'Nam', '21-24', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(8, 'Khá', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng ngoại'),
(9, 'Khá', 'Tốt', 'Không', 'Khó Khăn', 'Nam', '18-20', 'Kinh tế', 'Kế Toán', 'Hướng ngoại'),
(10, 'Trung Bình', 'Yếu', 'Có', 'Bình thường', 'Nam', '25-30', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng nội'),
(11, 'Giỏi', 'Bình Thường', 'Không', 'Khó Khăn', 'Nữ', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(12, 'Trung Bình', 'Bình Thường', 'Có', 'Giàu có', 'Nữ', '21-24', 'Kinh tế', 'Tài chính ngân hàng', 'Hướng nội'),
(13, 'Giỏi', 'Bình Thường', 'Có', 'Khó Khăn', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ sư Công nghệ ô tô', 'Hướng nội'),
(14, 'Giỏi', 'Yếu', 'Có', 'Giàu có', 'Nam', '21-24', 'Kĩ thuật', 'Công nghệ dệt may', 'Hướng ngoại'),
(15, 'Khá', 'Yếu', 'Có', 'Giàu có', 'Nam', '21-24', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng nội'),
(16, 'Trung Bình', 'Yếu', 'Không', 'Khó Khăn', 'Nam', '21-24', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng ngoại'),
(17, 'Khá', 'Yếu', 'Có', 'Bình thường', 'Nữ', '25-30', 'Xã hội', 'Tâm lý giáo dục học', 'Hướng ngoại'),
(18, 'Giỏi', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '18-20', 'Xã hội', 'Tâm lý giáo dục học', 'Hướng nội'),
(19, 'Giỏi', 'Bình Thường', 'Có', 'Khó Khăn', 'Nữ', '18-20', 'Kĩ thuật', 'Công nghệ thực phẩm', 'Hướng nội'),
(20, 'Khá', 'Bình Thường', 'Có', 'Bình thường', 'Nam', '25-30', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng ngoại'),
(21, 'Trung Bình', 'Tốt', 'Có', 'Khó Khăn', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(22, 'Giỏi', 'Yếu', 'Có', 'Khó Khăn', 'Nam', '25-30', 'Xã hội', 'Việt nam học', 'Hướng ngoại'),
(23, 'Khá', 'Bình Thường', 'Có', 'Giàu có', 'Nữ', '21-24', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng nội'),
(24, 'Giỏi', 'Bình Thường', 'Có', 'Bình thường', 'Nam', '25-30', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng ngoại'),
(25, 'Trung Bình', 'Yếu', 'Có', 'Bình thường', 'Nam', '25-30', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(26, 'Trung Bình', 'Tốt', 'Có', 'Bình thường', 'Nam', '21-24', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng nội'),
(27, 'Khá', 'Yếu', 'Có', 'Khó Khăn', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ thuật địa chất', 'Hướng nội'),
(28, 'Trung Bình', 'Bình Thường', 'Có', 'Bình thường', 'Nam', '21-24', 'Kinh tế', 'Kinh tế đối ngoại', 'Hướng ngoại'),
(29, 'Khá', 'Bình Thường', 'Có', 'Giàu có', 'Nam', '21-24', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(30, 'Khá', 'Yếu', 'Có', 'Bình thường', 'Nữ', '25-30', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng ngoại'),
(31, 'Giỏi', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '18-20', 'Kinh tế', 'Kế Toán', 'Hướng nội'),
(32, 'Khá', 'Bình Thường', 'Không', 'Khó Khăn', 'Nữ', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(33, 'Khá', 'Yếu', 'Có', 'Bình thường', 'Nam', '21-24', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng nội'),
(34, 'Giỏi', 'Yếu', 'Có', 'Giàu có', 'Nam', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng ngoại'),
(35, 'Khá', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(36, 'Khá', 'Tốt', 'Có', 'Giàu có', 'Nam', '21-24', 'Kĩ thuật', 'Kỹ sư Công nghệ ô tô', 'Hướng ngoại'),
(37, 'Giỏi', 'Bình Thường', 'Có', 'Bình thường', 'Nữ', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(38, 'Giỏi', 'Tốt', 'Không', 'Giàu có', 'Nam', '18-20', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng nội'),
(39, 'Trung Bình', 'Tốt', 'Có', 'Giàu có', 'Nữ', '25-30', 'Kinh tế', 'Kế Toán', 'Hướng nội'),
(40, 'Khá', 'Bình Thường', 'Có', 'Giàu có', 'Nữ', '21-24', 'Kĩ thuật', 'Công nghệ dệt may', 'Hướng ngoại'),
(41, 'Giỏi', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(42, 'Khá', 'Yếu', 'Có', 'Bình thường', 'Nữ', '18-20', 'Kinh tế', 'Quản trị kinh doanh', 'Hướng ngoại'),
(43, 'Giỏi', 'Bình Thường', 'Có', 'Bình thường', 'Nữ', '25-30', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(44, 'Trung Bình', 'Tốt', 'Có', 'Bình thường', 'Nữ', '21-24', 'Kinh tế', 'Kế Toán', 'Hướng ngoại'),
(45, 'Giỏi', 'Bình Thường', 'Có', 'Khó Khăn', 'Nữ', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(46, 'Khá', 'Tốt', 'Có', 'Giàu có', 'Nữ', '18-20', 'Kinh tế', 'Quản trị kinh doanh', 'Hướng ngoại'),
(47, 'Giỏi', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '21-24', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng ngoại'),
(48, 'Khá', 'Tốt', 'Có', 'Bình thường', 'Nam', '21-24', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng nội'),
(49, 'Giỏi', 'Bình Thường', 'Có', 'Bình thường', 'Nam', '21-24', 'Kĩ thuật', 'Công nghệ thực phẩm', 'Hướng nội'),
(50, 'Khá', 'Bình Thường', 'Có', 'Khó Khăn', 'Nữ', '25-30', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng ngoại'),
(51, 'Khá', 'Yếu', 'Không', 'Bình thường', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(52, 'Giỏi', 'Yếu', 'Có', 'Bình thường', 'Nam', '21-24', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(53, 'Giỏi', 'Bình Thường', 'Không', 'Bình thường', 'Nam', '18-20', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng nội'),
(54, 'Trung Bình', 'Tốt', 'Có', 'Giàu có', 'Nữ', '25-30', 'Kinh tế', 'Quản trị kinh doanh', 'Hướng nội'),
(55, 'Trung Bình', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(56, 'Giỏi', 'Tốt', 'Có', 'Bình thường', 'Nam', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(57, 'Trung Bình', 'Yếu', 'Không', 'Giàu có', 'Nam', '21-24', 'Kinh tế', 'Quản trị kinh doanh', 'Hướng nội'),
(58, 'Giỏi', 'Tốt', 'Có', 'Giàu có', 'Nữ', '21-24', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng ngoại'),
(59, 'Trung Bình', 'Yếu', 'Có', 'Khó Khăn', 'Nam', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(60, 'Giỏi', 'Bình Thường', 'Không', 'Khó Khăn', 'Nữ', '18-20', 'Kĩ thuật', 'Công nghệ dệt may', 'Hướng ngoại'),
(61, 'Trung Bình', 'Tốt', 'Có', 'Bình thường', 'Nam', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(62, 'Khá', 'Yếu', 'Không', 'Bình thường', 'Nam', '21-24', 'Kĩ thuật', 'Công nghệ dệt may', 'Hướng nội'),
(63, 'Khá', 'Yếu', 'Có', 'Khó Khăn', 'Nam', '18-20', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(64, 'Trung Bình', 'Yếu', 'Có', 'Khó Khăn', 'Nữ', '25-30', 'Kinh tế', 'Quản trị kinh doanh', 'Hướng nội'),
(65, 'Giỏi', 'Yếu', 'Có', 'Giàu có', 'Nữ', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(66, 'Khá', 'Tốt', 'Không', 'Bình thường', 'Nữ', '21-24', 'Kĩ thuật', 'Công nghệ dệt may', 'Hướng ngoại'),
(67, 'Trung Bình', 'Yếu', 'Có', 'Giàu có', 'Nam', '18-20', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(68, 'Khá', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '25-30', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng ngoại'),
(69, 'Khá', 'Bình Thường', 'Có', 'Giàu có', 'Nữ', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(70, 'Trung Bình', 'Yếu', 'Có', 'Bình thường', 'Nam', '18-20', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(71, 'Khá', 'Bình Thường', 'Không', 'Giàu có', 'Nữ', '18-20', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng ngoại'),
(72, 'Trung Bình', 'Bình Thường', 'Có', 'Giàu có', 'Nam', '25-30', 'Kinh tế', 'Kế Toán', 'Hướng nội'),
(73, 'Giỏi', 'Tốt', 'Có', 'Bình thường', 'Nữ', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(74, 'Trung Bình', 'Yếu', 'Có', 'Giàu có', 'Nam', '18-20', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng nội'),
(75, 'Khá', 'Tốt', 'Không', 'Khó Khăn', 'Nam', '25-30', 'Kinh tế', 'Marketing- Truyền thông', 'Hướng nội'),
(76, 'Khá', 'Yếu', 'Có', 'Giàu có', 'Nữ', '25-30', 'Kĩ thuật', 'Điện- Điện tử', 'Hướng ngoại'),
(77, 'Giỏi', 'Bình Thường', 'Không', 'Bình thường', 'Nữ', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(78, 'Khá', 'Bình Thường', 'Có', 'Khó Khăn', 'Nam', '18-20', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng nội'),
(79, 'Trung Bình', 'Bình Thường', 'Có', 'Giàu có', 'Nam', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(80, 'Khá', 'Tốt', 'Có', 'Khó Khăn', 'Nữ', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(81, 'Giỏi', 'Yếu', 'Không', 'Giàu có', 'Nam', '25-30', 'Kinh tế', 'Quản trị kinh doanh', 'Hướng ngoại'),
(82, 'Khá', 'Yếu', 'Có', 'Bình thường', 'Nữ', '21-24', 'Kinh tế', 'Kế Toán', 'Hướng nội'),
(83, 'Trung Bình', 'Tốt', 'Không', 'Giàu có', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(84, 'Khá', 'Bình Thường', 'Có', 'Khó Khăn', 'Nữ', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(85, 'Khá', 'Yếu', 'Không', 'Khó Khăn', 'Nam', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(86, 'Khá', 'Tốt', 'Có', 'Bình thường', 'Nữ', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(87, 'Trung Bình', 'Yếu', 'Không', 'Giàu có', 'Nữ', '21-24', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng nội'),
(88, 'Giỏi', 'Bình Thường', 'Có', 'Giàu có', 'Nữ', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(89, 'Khá', 'Tốt', 'Có', 'Khó Khăn', 'Nữ', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(90, 'Khá', 'Yếu', 'Không', 'Bình thường', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng ngoại'),
(91, 'Trung Bình', 'Tốt', 'Có', 'Khó Khăn', 'Nam', '25-30', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(92, 'Khá', 'Yếu', 'Có', 'Giàu có', 'Nữ', '21-24', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(93, 'Giỏi', 'Bình Thường', 'Không', 'Khó Khăn', 'Nam', '25-30', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng nội'),
(94, 'Khá', 'Tốt', 'Có', 'Giàu có', 'Nữ', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại'),
(95, 'Trung Bình', 'Yếu', 'Có', 'Bình thường', 'Nam', '18-20', 'Kĩ thuật', 'Kỹ sư xây dựng công trình', 'Hướng nội'),
(96, 'Giỏi', 'Bình Thường', 'Không', 'Giàu có', 'Nam', '21-24', 'Kĩ thuật', 'Công nghệ thông tin', 'Hướng nội'),
(97, 'Khá', 'Bình Thường', 'Có', 'Khó Khăn', 'Nữ', '21-24', 'Kinh tế', 'Nhân viên kinh doanh', 'Hướng ngoại'),
(98, 'Khá', 'Bình Thường', 'Có', 'Bình thường', 'Nam', '18-20', 'Xã hội', 'Công tác xã hội', 'Hướng nội'),
(99, 'Trung Bình', 'Tốt', 'Có', 'Giàu có', 'Nữ', '21-24', 'Xã hội', 'Công tác xã hội', 'Hướng ngoại');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `survey_answer`
--
ALTER TABLE `survey_answer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `survey_answer`
--
ALTER TABLE `survey_answer`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
