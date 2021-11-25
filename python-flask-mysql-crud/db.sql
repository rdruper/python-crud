-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for python_crud
CREATE DATABASE IF NOT EXISTS `python_crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `python_crud`;

-- Dumping structure for table python_crud.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table python_crud.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created`) VALUES
	(3, 'Regis', 'rdruper', 'pbkdf2:sha256:260000$tbx79y3buNxNPc4f$67acea8e9af9ce05aa4204c2130f189a9323ebf4907824ed821d9d82d31d8f', '2021-11-25 11:16:41'),
	(4, 'teste', 'teste@', 'pbkdf2:sha256:260000$roaVrepvSWimNHr2$b0f05987b549d68ec768f821dcd706045e2a1b13975bd874dd6898ba4c3609', '2021-11-25 11:41:01'),
	(5, 'asfasdf', 'afgsdghdfg', 'pbkdf2:sha256:260000$XoUIx05CJS5zek0f$b66c0e4f0eb270e1a224897c9a974d7839d52c4bc6f4dbc18ae5aee8b8c024', '2021-11-25 11:57:32'),
	(6, 'oi', 'oioi', 'pbkdf2:sha256:260000$Bj4a4D2mBu4B1yXJ$63a50584be63804c641b2e844cbb9d3e67f089e77fc9c0f1ff4d41d468f72d', '2021-11-25 14:02:19'),
	(7, 'novo user edit', 'user@mail edit', 'pbkdf2:sha256:260000$62tqrtcldmf1uCcy$a54a30a8d4b417f2cf60e53ffb5a044b88340f2f19184c4d7aab8501394d6c', '2021-11-25 14:05:04'),
	(8, 'ghdgd', 'gdgh', 'pbkdf2:sha256:260000$coifcGj5bzPrZjBU$9a3ebc310082f5acbe15963605d97cd90e9e6b86d5f34032bff720a1275097', '2021-11-25 14:07:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
