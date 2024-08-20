-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.39 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- stridecycle 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `stridecycle` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `stridecycle`;

-- 테이블 stridecycle.tbl_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `boardNo` int NOT NULL AUTO_INCREMENT,
  `organizer` varchar(50) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `contents` text,
  `distance` int DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'RECRUITMENT',
  `category` varchar(1) DEFAULT 'C',
  `map` json DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `cdatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`boardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 stridecycle.tbl_enroll 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_enroll` (
  `uid` varchar(50) DEFAULT NULL,
  `boardNo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 stridecycle.tbl_region 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_region` (
  `idx` int NOT NULL,
  `si` varchar(50) DEFAULT NULL,
  `gu` varchar(50) DEFAULT NULL,
  `dong` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 stridecycle.tbl_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `uid` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `cnt` int DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `nickName` varchar(50) DEFAULT NULL,
  `favor` char(1) DEFAULT 'A',
  `authority` char(1) DEFAULT 'C',
  `cdatetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `udatetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
