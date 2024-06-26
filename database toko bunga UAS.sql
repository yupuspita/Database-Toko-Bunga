/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - tokobungadb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokobungadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tokobungadb`;

/*Table structure for table `itempesanan` */

DROP TABLE IF EXISTS `itempesanan`;

CREATE TABLE `itempesanan` (
  `id_item_pesanan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesanan` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id_item_pesanan`),
  KEY `idx_id_pesanan` (`id_pesanan`),
  KEY `idx_id_produk` (`id_produk`),
  CONSTRAINT `itempesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`),
  CONSTRAINT `itempesanan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `itempesanan` */

LOCK TABLES `itempesanan` WRITE;

insert  into `itempesanan`(`id_item_pesanan`,`id_pesanan`,`id_produk`,`jumlah`) values 
(1,1,1,2),
(2,1,3,1),
(3,1,1,2),
(4,1,3,1),
(5,2,2,3),
(6,3,1,1),
(7,3,2,2),
(8,1,1,5),
(9,1,2,3),
(10,2,3,10),
(11,3,1,2),
(12,4,2,7);

UNLOCK TABLES;

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `total_pengeluaran` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id_pelanggan`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

LOCK TABLES `pelanggan` WRITE;

insert  into `pelanggan`(`id_pelanggan`,`nama`,`email`,`telepon`,`total_pengeluaran`) values 
(1,'Andi','andi@example.com','08123456789',825000.00),
(2,'Budi','budi@example.com','08234567890',435000.00),
(3,'Cindy','cindy@example.com','08345678901',195000.00);

UNLOCK TABLES;

/*Table structure for table `pesanan` */

DROP TABLE IF EXISTS `pesanan`;

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tanggal_pesanan` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pesanan`),
  KEY `idx_id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pesanan` */

LOCK TABLES `pesanan` WRITE;

insert  into `pesanan`(`id_pesanan`,`id_pelanggan`,`tanggal_pesanan`) values 
(1,1,'2024-06-26 12:47:00'),
(2,2,'2024-06-26 12:47:00'),
(3,3,'2024-06-26 12:47:00'),
(4,1,'2024-06-26 13:06:09'),
(5,1,'2024-06-26 13:06:09'),
(6,2,'2024-06-26 13:06:09'),
(7,3,'2024-06-26 13:06:09');

UNLOCK TABLES;

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `produk` */

LOCK TABLES `produk` WRITE;

insert  into `produk`(`id_produk`,`nama`,`harga`) values 
(1,'Mawar Merah',35000.00),
(2,'Anggrek Putih',45000.00),
(3,'Lily Kuning',30000.00);

UNLOCK TABLES;

/* Trigger structure for table `pesanan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `setelah_insert_pesanan` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `setelah_insert_pesanan` AFTER INSERT ON `pesanan` FOR EACH ROW 
BEGIN 
    DECLARE total DECIMAL(10, 2);

    SET total = (
        SELECT SUM(p.harga * ip.jumlah) 
        FROM ItemPesanan ip 
        JOIN Produk p ON ip.id_produk = p.id_produk 
        WHERE ip.id_pesanan = NEW.id_pesanan
    );

    UPDATE Pelanggan 
    SET total_pengeluaran = total_pengeluaran + total 
    WHERE id_pelanggan = NEW.id_pelanggan;
END */$$


DELIMITER ;

/*Table structure for table `tampilanpesananpelanggan` */

DROP TABLE IF EXISTS `tampilanpesananpelanggan`;

/*!50001 DROP VIEW IF EXISTS `tampilanpesananpelanggan` */;
/*!50001 DROP TABLE IF EXISTS `tampilanpesananpelanggan` */;

/*!50001 CREATE TABLE  `tampilanpesananpelanggan`(
 `id_pelanggan` int(11) ,
 `nama` varchar(100) ,
 `email` varchar(100) ,
 `total_pesanan` bigint(21) ,
 `total_pengeluaran` decimal(10,2) 
)*/;

/*View structure for view tampilanpesananpelanggan */

/*!50001 DROP TABLE IF EXISTS `tampilanpesananpelanggan` */;
/*!50001 DROP VIEW IF EXISTS `tampilanpesananpelanggan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tampilanpesananpelanggan` AS select `p`.`id_pelanggan` AS `id_pelanggan`,`p`.`nama` AS `nama`,`p`.`email` AS `email`,count(`o`.`id_pesanan`) AS `total_pesanan`,`p`.`total_pengeluaran` AS `total_pengeluaran` from (`pelanggan` `p` left join `pesanan` `o` on(`p`.`id_pelanggan` = `o`.`id_pelanggan`)) group by `p`.`id_pelanggan`,`p`.`nama`,`p`.`email`,`p`.`total_pengeluaran` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
