/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.15-MariaDB, for Linux (aarch64)
--
-- Host: localhost    Database: perpus_smp_1_tarutung_db
-- ------------------------------------------------------
-- Server version	10.11.15-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES
(1,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"162.158.163.179\"}',NULL,'2026-01-02 08:13:11','2026-01-02 08:13:11'),
(2,'default','created','App\\Models\\Book','created',1,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Sukses AKM Nasional SMP\\/MTS \",\"slug\":\"sukses-akm-nasional-smpmtseZK6\",\"tahun_terbit\":2022,\"isbn\":\"978-623-257-214-0\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(3,'default','created','App\\Models\\Book','created',2,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\" Erlangga X-Press US Matematika\",\"slug\":\"erlangga-x-press-us-matematikaPHif\",\"tahun_terbit\":2022,\"isbn\":\"978-623-266-331-2\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(4,'default','created','App\\Models\\Book','created',3,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Erlangga Express US SMP\\/MTs Bahasa Indonesia\",\"slug\":\"erlangga-express-us-smpmts-bahasa-indonesiaczvd\",\"tahun_terbit\":2022,\"isbn\":\"978-623-266-353-4\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":5,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(5,'default','created','App\\Models\\Book','created',4,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Erlangga Express US SMP\\/MTs Bahasa Inggris\",\"slug\":\"erlangga-express-us-smpmts-bahasa-inggrismotr\",\"tahun_terbit\":2022,\"isbn\":\"978-623-266-350-3\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":3,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(6,'default','created','App\\Models\\Book','created',5,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Erlangga Fokus AKM SMP\\/MTs Literasi Membaca Numerasi\",\"slug\":\"erlangga-fokus-akm-smpmts-literasi-membaca-numerasiNubE\",\"tahun_terbit\":2022,\"isbn\":\"978-623-266-354-1\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":6,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(7,'default','created','App\\Models\\Book','created',6,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Pendalaman Buku Teks Matematika 1A\",\"slug\":\"pendalaman-buku-teks-matematika-1aLbtF\",\"tahun_terbit\":2022,\"isbn\":\"978-602-299-830-3\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":6,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(8,'default','created','App\\Models\\Book','created',7,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Pendalaman Buku Teks IPS Terpadu  2A\",\"slug\":\"pendalaman-buku-teks-ips-terpadu-2aafLi\",\"tahun_terbit\":2022,\"isbn\":\"978-602-299-984-3\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":4,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(9,'default','created','App\\Models\\Book','created',8,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Pendalaman Buku Teks IPS Terpadu  2B\",\"slug\":\"pendalaman-buku-teks-ips-terpadu-2bLEVI\",\"tahun_terbit\":2022,\"isbn\":\"978-602-299-987-4\",\"deskripsi\":\"lorem ipsum dolorem\",\"publisher_id\":4,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(10,'default','created','App\\Models\\Book','created',9,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Pulang-Pergi\",\"slug\":\"pulang-pergirL2w\",\"tahun_terbit\":2021,\"isbn\":\"9786020641110\",\"deskripsi\":\"Novel aksi drama petualangan Bujang.\",\"publisher_id\":3,\"kondisi\":\"Tersedia\",\"category_id\":5,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(11,'default','created','App\\Models\\Book','created',10,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Naruto Vol. 72\",\"slug\":\"naruto-vol-72ezN2\",\"tahun_terbit\":2015,\"isbn\":\"9789792732112\",\"deskripsi\":\"Komik pertempuran terakhir Naruto dan Sasuke.\",\"publisher_id\":7,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(12,'default','created','App\\Models\\Book','created',11,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Cantik Itu Luka\",\"slug\":\"cantik-itu-lukaPdwu\",\"tahun_terbit\":2002,\"isbn\":\"9789792200115\",\"deskripsi\":\"Novel fiksi sastra mahakarya Eka Kurniawan.\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":8,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(13,'default','created','App\\Models\\Book','created',12,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"One Piece Vol. 100\",\"slug\":\"one-piece-vol-100GYKP\",\"tahun_terbit\":2022,\"isbn\":\"9786024801123\",\"deskripsi\":\"Komik petualangan Luffy di Negeri Wano.\",\"publisher_id\":5,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(14,'default','created','App\\Models\\Book','created',13,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Aroma Karsa\",\"slug\":\"aroma-karsadOoI\",\"tahun_terbit\":2018,\"isbn\":\"9786026711105\",\"deskripsi\":\"Novel fiksi tentang pencarian tanaman mistis.\",\"publisher_id\":8,\"kondisi\":\"Tersedia\",\"category_id\":8,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(15,'default','created','App\\Models\\Book','created',14,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Jujutsu Kaisen 01\",\"slug\":\"jujutsu-kaisen-01SoO9\",\"tahun_terbit\":2021,\"isbn\":\"9786230021114\",\"deskripsi\":\"Komik aksi tentang kutukan dan penyihir.\",\"publisher_id\":2,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(16,'default','created','App\\Models\\Book','created',15,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Gadis Kretek\",\"slug\":\"gadis-kretekEhf2\",\"tahun_terbit\":2012,\"isbn\":\"9789792281119\",\"deskripsi\":\"Fiksi sejarah tentang industri kretek di Jawa.\",\"publisher_id\":4,\"kondisi\":\"Tersedia\",\"category_id\":8,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(17,'default','created','App\\Models\\Book','created',16,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Demon Slayer 01\",\"slug\":\"demon-slayer-01XMJW\",\"tahun_terbit\":2020,\"isbn\":\"9786230011115\",\"deskripsi\":\"Komik petualangan Tanjiro memburu iblis.\",\"publisher_id\":6,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(18,'default','created','App\\Models\\Book','created',17,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Rapijali\",\"slug\":\"rapijaliKAAY\",\"tahun_terbit\":2021,\"isbn\":\"9786026716110\",\"deskripsi\":\"Novel fiksi remaja tentang musik dan mimpi.\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":5,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(19,'default','created','App\\Models\\Book','created',18,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Doraemon Antologi\",\"slug\":\"doraemon-antologiiwx4\",\"tahun_terbit\":2010,\"isbn\":\"9789792751113\",\"deskripsi\":\"Koleksi komik klasik petualangan robot kucing.\",\"publisher_id\":3,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(20,'default','created','App\\Models\\Book','created',19,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Orang-Orang Biasa\",\"slug\":\"orang-orang-biasaydxC\",\"tahun_terbit\":2019,\"isbn\":\"9786022911117\",\"deskripsi\":\"Novel fiksi tentang aksi pencurian kawanan amatir.\",\"publisher_id\":5,\"kondisi\":\"Tersedia\",\"category_id\":8,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(21,'default','created','App\\Models\\Book','created',20,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Attack on Titan 01\",\"slug\":\"attack-on-titan-01KTdg\",\"tahun_terbit\":2013,\"isbn\":\"9786027731112\",\"deskripsi\":\"Komik distopia perjuangan manusia melawan raksasa.\",\"publisher_id\":8,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(22,'default','created','App\\Models\\Book','created',21,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Negeri 5 Menara\",\"slug\":\"negeri-5-menara5pG4\",\"tahun_terbit\":2009,\"isbn\":\"9789792241114\",\"deskripsi\":\"Novel fiksi inspiratif kehidupan di pesantren.\",\"publisher_id\":2,\"kondisi\":\"Tersedia\",\"category_id\":5,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(23,'default','created','App\\Models\\Book','created',22,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Slam Dunk Vol. 01\",\"slug\":\"slam-dunk-vol-01olbQ\",\"tahun_terbit\":2003,\"isbn\":\"9789792011116\",\"deskripsi\":\"Komik olahraga legendaris tentang basket.\",\"publisher_id\":7,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(24,'default','created','App\\Models\\Book','created',23,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Filosofi Kopi\",\"slug\":\"filosofi-kopifKg1\",\"tahun_terbit\":2006,\"isbn\":\"9789799101110\",\"deskripsi\":\"Kumpulan fiksi pendek bertema kehidupan.\",\"publisher_id\":4,\"kondisi\":\"Tersedia\",\"category_id\":8,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(25,'default','created','App\\Models\\Book','created',24,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Crayon Shinchan\",\"slug\":\"crayon-shinchaniMYv\",\"tahun_terbit\":2005,\"isbn\":\"9789792051112\",\"deskripsi\":\"Komik komedi keseharian anak TK yang jenaka.\",\"publisher_id\":6,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(26,'default','created','App\\Models\\Book','created',25,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Supernova: Ksatria\",\"slug\":\"supernova-ksatriaQFKr\",\"tahun_terbit\":2001,\"isbn\":\"9789799100114\",\"deskripsi\":\"Fiksi sains religius spiritual yang mendalam.\",\"publisher_id\":3,\"kondisi\":\"Tersedia\",\"category_id\":8,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(27,'default','created','App\\Models\\Book','created',26,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Black Clover 01\",\"slug\":\"black-clover-01xXC3\",\"tahun_terbit\":2019,\"isbn\":\"9786230001117\",\"deskripsi\":\"Komik fantasi tentang dunia sihir.\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(28,'default','created','App\\Models\\Book','created',27,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Hujan\",\"slug\":\"hujanjpiC\",\"tahun_terbit\":2016,\"isbn\":\"9786020321118\",\"deskripsi\":\"Novel fiksi ilmiah bertema masa depan dan cinta.\",\"publisher_id\":5,\"kondisi\":\"Tersedia\",\"category_id\":5,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(29,'default','created','App\\Models\\Book','created',28,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Blue Lock 01\",\"slug\":\"blue-lock-01IjnD\",\"tahun_terbit\":2022,\"isbn\":\"9786230031113\",\"deskripsi\":\"Komik aksi sepak bola bertema survival.\",\"publisher_id\":2,\"kondisi\":\"Tersedia\",\"category_id\":3,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(30,'default','created','App\\Models\\Book','created',29,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Ensiklopedia Antariksa\",\"slug\":\"ensiklopedia-antariksaKelH\",\"tahun_terbit\":2019,\"isbn\":\"9786024811110\",\"deskripsi\":\"Panduan lengkap mengenai tata surya dan galaksi.\",\"publisher_id\":4,\"kondisi\":\"Tersedia\",\"category_id\":1,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(31,'default','created','App\\Models\\Book','created',30,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Ensiklopedia Hewan Purba\",\"slug\":\"ensiklopedia-hewan-purba8uWS\",\"tahun_terbit\":2020,\"isbn\":\"9786024811111\",\"deskripsi\":\"Membahas berbagai jenis dinosaurus dan masa hidupnya.\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":1,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(32,'default','created','App\\Models\\Book','created',31,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Sapiens: Sejarah Singkat Manusia\",\"slug\":\"sapiens-sejarah-singkat-manusiayOsj\",\"tahun_terbit\":2017,\"isbn\":\"9786024411112\",\"deskripsi\":\"Narasi tentang sejarah perkembangan umat manusia.\",\"publisher_id\":6,\"kondisi\":\"Tersedia\",\"category_id\":2,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(33,'default','created','App\\Models\\Book','created',32,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Filosofi Teras\",\"slug\":\"filosofi-teras2z9J\",\"tahun_terbit\":2018,\"isbn\":\"9786024411113\",\"deskripsi\":\"Penerapan stoisisme dalam kehidupan modern.\",\"publisher_id\":2,\"kondisi\":\"Tersedia\",\"category_id\":2,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(34,'default','created','App\\Models\\Book','created',33,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Majalah National Geographic\",\"slug\":\"majalah-national-geographicitdS\",\"tahun_terbit\":2023,\"isbn\":\"9781234567114\",\"deskripsi\":\"Edisi khusus mengenai perubahan iklim dunia.\",\"publisher_id\":8,\"kondisi\":\"Tersedia\",\"category_id\":4,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(35,'default','created','App\\Models\\Book','created',34,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Majalah Bobo Edisi Koleksi\",\"slug\":\"majalah-bobo-edisi-koleksi6cWJ\",\"tahun_terbit\":2022,\"isbn\":\"9781234567115\",\"deskripsi\":\"Kumpulan cerita dan aktivitas menarik untuk anak.\",\"publisher_id\":3,\"kondisi\":\"Tersedia\",\"category_id\":4,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(36,'default','created','App\\Models\\Book','created',35,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Matematika Kelas X\",\"slug\":\"matematika-kelas-xuuUA\",\"tahun_terbit\":2021,\"isbn\":\"9789791111116\",\"deskripsi\":\"Buku paket wajib kurikulum merdeka untuk SMA.\",\"publisher_id\":5,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(37,'default','created','App\\Models\\Book','created',36,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Biologi Dasar Kelas XI\",\"slug\":\"biologi-dasar-kelas-xizaJG\",\"tahun_terbit\":2021,\"isbn\":\"9789791111117\",\"deskripsi\":\"Materi lengkap mengenai sel dan sistem organ manusia.\",\"publisher_id\":7,\"kondisi\":\"Tersedia\",\"category_id\":6,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(38,'default','created','App\\Models\\Book','created',37,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Kamus Besar Bahasa Indonesia\",\"slug\":\"kamus-besar-bahasa-indonesiaG70F\",\"tahun_terbit\":2016,\"isbn\":\"9789793331118\",\"deskripsi\":\"Referensi utama kosakata bahasa Indonesia terlengkap.\",\"publisher_id\":1,\"kondisi\":\"Tersedia\",\"category_id\":7,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(39,'default','created','App\\Models\\Book','created',38,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Atlas Dunia Lengkap\",\"slug\":\"atlas-dunia-lengkapX7MA\",\"tahun_terbit\":2020,\"isbn\":\"9789793331119\",\"deskripsi\":\"Peta navigasi seluruh negara beserta profil singkatnya.\",\"publisher_id\":4,\"kondisi\":\"Tersedia\",\"category_id\":7,\"stok\":null,\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:44:19','2026-01-02 08:44:19'),
(40,'default','updated','App\\Models\\Book','updated',1,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Sukses AKM Nasional SMP\\/MTS\",\"slug\":\"sukses-akm-nasional-smpmtszoz5\",\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/pGPv6QuuipcminTdNzzGyBiiM3VA8SUUJWRBKWqs.webp\"},\"old\":{\"judul\":\"Sukses AKM Nasional SMP\\/MTS \",\"slug\":\"sukses-akm-nasional-smpmtseZK6\",\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:57:41','2026-01-02 08:57:41'),
(41,'default','updated','App\\Models\\Book','updated',2,'App\\Models\\User',1370198567,'{\"attributes\":{\"judul\":\"Erlangga X-Press US Matematika\",\"slug\":\"erlangga-x-press-us-matematikapfdb\",\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/Xu3BswdUhtzvjYJMaqU8MLaVI4jGT0OaJ8agDDyV.jpg\"},\"old\":{\"judul\":\" Erlangga X-Press US Matematika\",\"slug\":\"erlangga-x-press-us-matematikaPHif\",\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:58:38','2026-01-02 08:58:38'),
(42,'default','updated','App\\Models\\Book','updated',3,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/RID1gr5hk2enyHArBWGVXl9dQ9WRpVuKSpS53yDw.webp\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 08:59:27','2026-01-02 08:59:27'),
(43,'default','updated','App\\Models\\Book','updated',4,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/TDOkL4LoVqEO6GB7JKtbMgYc7WppOSv0ZMOITabQ.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:00:20','2026-01-02 09:00:20'),
(44,'default','updated','App\\Models\\Book','updated',5,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/IEI11epC8JKphL4MnjTRLl19FbFirvrk3POsSmXk.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:01:52','2026-01-02 09:01:52'),
(45,'default','updated','App\\Models\\Book','updated',6,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\"},\"old\":{\"kondisi\":\"Tersedia\"}}',NULL,'2026-01-02 09:05:19','2026-01-02 09:05:19'),
(46,'default','updated','App\\Models\\Book','updated',6,'App\\Models\\User',1370198567,'{\"attributes\":{\"cover\":\"books\\/uyEs4lrP7syblBxzFC0MQboXnnJDHl7JwTBvbP52.png\"},\"old\":{\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:06:10','2026-01-02 09:06:10'),
(47,'default','updated','App\\Models\\Book','updated',7,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/d19GZ7o0vIctMqjnrvOEhbqz3dpIEV7ZUuznWPpU.png\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:07:22','2026-01-02 09:07:22'),
(48,'default','updated','App\\Models\\Book','updated',7,'App\\Models\\User',1370198567,'{\"attributes\":{\"cover\":\"books\\/RRZJvqLGx6HbUosF79LaTQI1gV1sysap4Hq9oLPO.png\"},\"old\":{\"cover\":\"books\\/d19GZ7o0vIctMqjnrvOEhbqz3dpIEV7ZUuznWPpU.png\"}}',NULL,'2026-01-02 09:09:50','2026-01-02 09:09:50'),
(49,'default','updated','App\\Models\\Book','updated',8,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/aowfrzGLALMgoTxbT2ef1srZHUtmA1GbCmC9L0IF.png\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:11:16','2026-01-02 09:11:16'),
(50,'default','updated','App\\Models\\Book','updated',9,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/kP93mjP3NNluK5LLppsCldmKz3WwOMHqDDKOMmDv.png\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:12:31','2026-01-02 09:12:31'),
(51,'default','updated','App\\Models\\Book','updated',10,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/64wkfwhlParQeJOBUmGcdAiwsdHtrXkkkgSnmk8n.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:13:56','2026-01-02 09:13:56'),
(52,'default','updated','App\\Models\\Book','updated',11,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/vheisdP2rA8a5szAdXz17YyMgrgioRRGrH19VQ1R.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:15:26','2026-01-02 09:15:26'),
(53,'default','updated','App\\Models\\Book','updated',12,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/fGWdGNXZsExXhgEIxXURdCfFkYP0rIOqHkXMbARt.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:17:38','2026-01-02 09:17:38'),
(54,'default','updated','App\\Models\\Book','updated',13,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/di5J8geAsJ3hRxbhaKcILkocoMu9rBTw15UZMak9.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:18:42','2026-01-02 09:18:42'),
(55,'default','updated','App\\Models\\Book','updated',14,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/e3tx8nFQkBIba2Tqcs77zLNDCZ1RC2l3Hawy0LSk.webp\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:19:35','2026-01-02 09:19:35'),
(56,'default','updated','App\\Models\\Book','updated',15,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/gK62hx94aoZtdmVm4MZMEtcuG9pua7gPqUJdSxfR.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:22:44','2026-01-02 09:22:44'),
(57,'default','updated','App\\Models\\Book','updated',16,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/yWJoZIR4xyK6Lww5jnxsgWk79UtcRZrCy1SFqrro.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:23:28','2026-01-02 09:23:28'),
(58,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',2167284722,'{\"ip_address\":\"162.158.88.105\"}',NULL,'2026-01-02 09:25:43','2026-01-02 09:25:43'),
(59,'default','updated','App\\Models\\Book','updated',17,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/hDPV3aWNmakyVFs5OzmiNlsHUw9XDPdBwOW5OPe7.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:27:25','2026-01-02 09:27:25'),
(60,'default','updated','App\\Models\\Book','updated',18,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/8LuHM9U28dwWMx6lQJ9okrxin1EkiVVv4DZnHshr.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:28:06','2026-01-02 09:28:06'),
(61,'default','updated','App\\Models\\Book','updated',19,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/cRkTKAwtcfnX2QoEMKzWVxqiahDYYwFWhi1b9IC6.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:28:59','2026-01-02 09:28:59'),
(62,'default','updated','App\\Models\\Book','updated',20,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/K2nci04T0FAOzPhuQHNqqMaTekXYa8rgBSxxpFsD.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:29:43','2026-01-02 09:29:43'),
(63,'default','updated','App\\Models\\Book','updated',21,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/bhNrEHv3MPa5U4eGBtmf2TjclXd4JywhArnn4OYC.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:31:29','2026-01-02 09:31:29'),
(64,'default','updated','App\\Models\\Book','updated',22,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/7gM6iMUs0oBImdoxObRMgKCrEum3gMLjyaBgZ6OU.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:32:32','2026-01-02 09:32:32'),
(65,'default','updated','App\\Models\\Book','updated',29,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/lwYx5RsZ5csMefdHCkdUEQcNdMsfFPb1jhb3k6WW.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:33:49','2026-01-02 09:33:49'),
(66,'default','updated','App\\Models\\Book','updated',31,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/0R6haBrpy3mzoe8luIHJZEielqiYIPvddxHCTcdy.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:35:16','2026-01-02 09:35:16'),
(67,'default','updated','App\\Models\\Book','updated',30,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/3OyAzmDkTkw0OQCKHTkzyNT9lcLUYtT1JwyQ564e.png\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:36:14','2026-01-02 09:36:14'),
(68,'default','updated','App\\Models\\Book','updated',33,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/bVECRZIq2yUq6SVGjKWV3WnbSfhjp9ZOmNjQSY4F.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:37:37','2026-01-02 09:37:37'),
(69,'default','updated','App\\Models\\Book','updated',34,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/1QzAOHKLZmMye7qjF1ey3u8doLdP8STGhD3GGggy.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:37:52','2026-01-02 09:37:52'),
(70,'default','updated','App\\Models\\Book','updated',32,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/6rX7ceX2UlnWTM3zA9l2D8mYMGo7MAZccEySMT9e.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:38:44','2026-01-02 09:38:44'),
(71,'default','updated','App\\Models\\Book','updated',37,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/EEpdQKh712f80jHrysB7vfxKxOOkepzzIEB5AlS8.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:40:25','2026-01-02 09:40:25'),
(72,'default','updated','App\\Models\\Book','updated',38,'App\\Models\\User',1370198567,'{\"attributes\":{\"kondisi\":\"Tidak Tersedia\",\"cover\":\"books\\/TP7JzuU8s7xtVNm6qWwHYLb5buuB5iBSR6MHpI1t.jpg\"},\"old\":{\"kondisi\":\"Tersedia\",\"cover\":\"books\\/no_cover.jpg\"}}',NULL,'2026-01-02 09:40:40','2026-01-02 09:40:40'),
(73,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"104.23.251.101\"}',NULL,'2026-01-04 10:04:17','2026-01-04 10:04:17'),
(74,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"162.158.107.36\"}',NULL,'2026-01-04 10:14:23','2026-01-04 10:14:23'),
(75,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"162.158.107.36\"}',NULL,'2026-01-04 10:15:03','2026-01-04 10:15:03'),
(76,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"172.70.206.98\"}',NULL,'2026-01-04 10:49:44','2026-01-04 10:49:44'),
(77,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"172.64.217.127\"}',NULL,'2026-01-04 13:47:24','2026-01-04 13:47:24'),
(78,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"172.71.124.208\"}',NULL,'2026-01-05 02:23:30','2026-01-05 02:23:30'),
(79,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',3138020474,'{\"ip_address\":\"162.158.170.227\"}',NULL,'2026-01-05 02:28:02','2026-01-05 02:28:02'),
(80,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',66,'{\"ip_address\":\"104.23.176.5\"}',NULL,'2026-01-05 02:28:08','2026-01-05 02:28:08'),
(81,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',123087907,'{\"ip_address\":\"162.158.106.10\"}',NULL,'2026-01-05 02:28:26','2026-01-05 02:28:26'),
(82,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1122334466,'{\"ip_address\":\"162.158.108.4\"}',NULL,'2026-01-05 02:28:44','2026-01-05 02:28:44'),
(83,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1345678910,'{\"ip_address\":\"104.23.176.5\"}',NULL,'2026-01-05 02:28:47','2026-01-05 02:28:47'),
(84,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1122334455,'{\"ip_address\":\"172.69.176.20\"}',NULL,'2026-01-05 02:28:51','2026-01-05 02:28:51'),
(85,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',2315685432,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:28:52','2026-01-05 02:28:52'),
(86,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',123617657,'{\"ip_address\":\"172.70.188.148\"}',NULL,'2026-01-05 02:28:53','2026-01-05 02:28:53'),
(87,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1230062122,'{\"ip_address\":\"172.70.143.211\"}',NULL,'2026-01-05 02:28:53','2026-01-05 02:28:53'),
(88,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',125643218,'{\"ip_address\":\"172.70.143.88\"}',NULL,'2026-01-05 02:28:53','2026-01-05 02:28:53'),
(89,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',5839486284,'{\"ip_address\":\"162.158.162.84\"}',NULL,'2026-01-05 02:28:54','2026-01-05 02:28:54'),
(90,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',139096242,'{\"ip_address\":\"172.69.176.4\"}',NULL,'2026-01-05 02:28:54','2026-01-05 02:28:54'),
(91,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',129310087,'{\"ip_address\":\"172.71.82.98\"}',NULL,'2026-01-05 02:28:56','2026-01-05 02:28:56'),
(92,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',0,'{\"ip_address\":\"172.70.208.84\"}',NULL,'2026-01-05 02:28:58','2026-01-05 02:28:58'),
(93,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',118053102,'{\"ip_address\":\"172.69.176.4\"}',NULL,'2026-01-05 02:28:59','2026-01-05 02:28:59'),
(94,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',118584370,'{\"ip_address\":\"172.71.124.205\"}',NULL,'2026-01-05 02:29:00','2026-01-05 02:29:00'),
(95,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1324658723,'{\"ip_address\":\"172.71.81.86\"}',NULL,'2026-01-05 02:29:00','2026-01-05 02:29:00'),
(96,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1010101010,'{\"ip_address\":\"172.71.124.209\"}',NULL,'2026-01-05 02:29:03','2026-01-05 02:29:03'),
(97,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1234567890,'{\"ip_address\":\"162.158.108.5\"}',NULL,'2026-01-05 02:29:08','2026-01-05 02:29:08'),
(98,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',5912347691,'{\"ip_address\":\"162.158.88.123\"}',NULL,'2026-01-05 02:29:12','2026-01-05 02:29:12'),
(99,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1243576092,'{\"ip_address\":\"172.71.124.204\"}',NULL,'2026-01-05 02:29:12','2026-01-05 02:29:12'),
(100,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',3468543678,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:29:16','2026-01-05 02:29:16'),
(101,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',400066,'{\"ip_address\":\"162.158.88.123\"}',NULL,'2026-01-05 02:29:17','2026-01-05 02:29:17'),
(102,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1234567891,'{\"ip_address\":\"172.70.143.210\"}',NULL,'2026-01-05 02:29:17','2026-01-05 02:29:17'),
(103,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',127245455,'{\"ip_address\":\"172.69.176.20\"}',NULL,'2026-01-05 02:29:18','2026-01-05 02:29:18'),
(104,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1234759306,'{\"ip_address\":\"162.158.162.84\"}',NULL,'2026-01-05 02:29:19','2026-01-05 02:29:19'),
(105,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',129720857,'{\"ip_address\":\"172.68.164.91\"}',NULL,'2026-01-05 02:29:19','2026-01-05 02:29:19'),
(106,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',66,'{\"ip_address\":\"108.162.226.166\"}',NULL,'2026-01-05 02:29:22','2026-01-05 02:29:22'),
(107,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1245816513,'{\"ip_address\":\"172.70.92.235\"}',NULL,'2026-01-05 02:29:40','2026-01-05 02:29:40'),
(108,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1234567890,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:29:49','2026-01-05 02:29:49'),
(109,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1234567890,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:29:55','2026-01-05 02:29:55'),
(110,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',7645892340,'{\"ip_address\":\"162.159.98.181\"}',NULL,'2026-01-05 02:30:02','2026-01-05 02:30:02'),
(111,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',114297558,'{\"ip_address\":\"162.158.162.84\"}',NULL,'2026-01-05 02:30:03','2026-01-05 02:30:03'),
(112,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1765423980,'{\"ip_address\":\"172.70.215.37\"}',NULL,'2026-01-05 02:30:10','2026-01-05 02:30:10'),
(113,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',500000,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:30:18','2026-01-05 02:30:18'),
(114,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',987654321,'{\"ip_address\":\"162.158.108.4\"}',NULL,'2026-01-05 02:30:21','2026-01-05 02:30:21'),
(115,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',2358964186,'{\"ip_address\":\"162.158.108.4\"}',NULL,'2026-01-05 02:30:48','2026-01-05 02:30:48'),
(116,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',4671839207,'{\"ip_address\":\"162.158.108.20\"}',NULL,'2026-01-05 02:31:11','2026-01-05 02:31:11'),
(117,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',123755789,'{\"ip_address\":\"172.71.81.86\"}',NULL,'2026-01-05 02:31:41','2026-01-05 02:31:41'),
(118,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',112419239,'{\"ip_address\":\"172.69.165.56\"}',NULL,'2026-01-05 02:38:02','2026-01-05 02:38:02'),
(119,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',7000,'{\"ip_address\":\"172.69.165.56\"}',NULL,'2026-01-05 02:38:31','2026-01-05 02:38:31'),
(120,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',111719311,'{\"ip_address\":\"172.69.165.56\"}',NULL,'2026-01-05 02:39:07','2026-01-05 02:39:07'),
(121,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1122334451,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:39:20','2026-01-05 02:39:20'),
(122,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',119832414,'{\"ip_address\":\"104.23.176.6\"}',NULL,'2026-01-05 02:41:03','2026-01-05 02:41:03'),
(123,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',119955185,'{\"ip_address\":\"104.23.251.85\"}',NULL,'2026-01-05 02:41:32','2026-01-05 02:41:32'),
(124,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',123456789,'{\"ip_address\":\"172.69.176.21\"}',NULL,'2026-01-05 02:41:45','2026-01-05 02:41:45'),
(125,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1112223334,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:41:46','2026-01-05 02:41:46'),
(126,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',117724276,'{\"ip_address\":\"162.158.88.123\"}',NULL,'2026-01-05 02:42:00','2026-01-05 02:42:00'),
(127,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1111122222,'{\"ip_address\":\"172.71.81.85\"}',NULL,'2026-01-05 02:42:07','2026-01-05 02:42:07'),
(128,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',118345378,'{\"ip_address\":\"172.70.143.210\"}',NULL,'2026-01-05 02:43:54','2026-01-05 02:43:54'),
(129,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',119500374,'{\"ip_address\":\"172.70.208.84\"}',NULL,'2026-01-05 02:44:15','2026-01-05 02:44:15'),
(130,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',126921352,'{\"ip_address\":\"172.70.189.68\"}',NULL,'2026-01-05 02:44:38','2026-01-05 02:44:38'),
(131,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',116506176,'{\"ip_address\":\"162.158.186.173\"}',NULL,'2026-01-05 02:44:58','2026-01-05 02:44:58'),
(132,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',112303920,'{\"ip_address\":\"108.162.227.135\"}',NULL,'2026-01-05 02:45:55','2026-01-05 02:45:55'),
(133,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',101126703,'{\"ip_address\":\"162.158.106.10\"}',NULL,'2026-01-05 02:45:59','2026-01-05 02:45:59'),
(134,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',108569443,'{\"ip_address\":\"172.68.164.91\"}',NULL,'2026-01-05 02:46:45','2026-01-05 02:46:45'),
(135,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',109651990,'{\"ip_address\":\"172.70.92.234\"}',NULL,'2026-01-05 02:47:01','2026-01-05 02:47:01'),
(136,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',103942364,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:47:05','2026-01-05 02:47:05'),
(137,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',105146468,'{\"ip_address\":\"162.158.88.123\"}',NULL,'2026-01-05 02:47:49','2026-01-05 02:47:49'),
(138,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',112018823,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:48:13','2026-01-05 02:48:13'),
(139,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1096564321,'{\"ip_address\":\"172.69.176.20\"}',NULL,'2026-01-05 02:50:04','2026-01-05 02:50:04'),
(140,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',207201212,'{\"ip_address\":\"162.158.106.10\"}',NULL,'2026-01-05 02:50:07','2026-01-05 02:50:07'),
(141,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',111691116,'{\"ip_address\":\"172.70.143.131\"}',NULL,'2026-01-05 02:50:12','2026-01-05 02:50:12'),
(142,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',4545454545,'{\"ip_address\":\"162.158.163.206\"}',NULL,'2026-01-05 02:50:15','2026-01-05 02:50:15'),
(143,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1234567789,'{\"ip_address\":\"104.23.175.36\"}',NULL,'2026-01-05 02:50:18','2026-01-05 02:50:18'),
(144,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',118882376,'{\"ip_address\":\"172.70.188.149\"}',NULL,'2026-01-05 02:50:51','2026-01-05 02:50:51'),
(145,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',113139823,'{\"ip_address\":\"172.70.208.84\"}',NULL,'2026-01-05 02:50:55','2026-01-05 02:50:55'),
(146,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',3269168362,'{\"ip_address\":\"172.71.81.85\"}',NULL,'2026-01-05 02:55:45','2026-01-05 02:55:45'),
(147,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1122334453,'{\"ip_address\":\"172.71.124.205\"}',NULL,'2026-01-05 02:58:00','2026-01-05 02:58:00'),
(148,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',119832414,'{\"ip_address\":\"162.158.88.105\"}',NULL,'2026-01-05 03:03:12','2026-01-05 03:03:12'),
(149,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"172.70.93.111\"}',NULL,'2026-02-05 11:30:55','2026-02-05 11:30:55'),
(150,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"172.70.208.64\"}',NULL,'2026-02-05 11:36:41','2026-02-05 11:36:41'),
(151,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"172.68.164.110\"}',NULL,'2026-02-08 03:51:23','2026-02-08 03:51:23'),
(152,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"162.158.107.35\"}',NULL,'2026-02-08 04:14:05','2026-02-08 04:14:05'),
(153,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1272819201,'{\"ip_address\":\"172.69.176.20\"}',NULL,'2026-02-08 04:26:13','2026-02-08 04:26:13'),
(154,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"104.23.176.6\"}',NULL,'2026-02-08 04:55:29','2026-02-08 04:55:29'),
(155,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"104.23.176.5\"}',NULL,'2026-02-08 04:58:03','2026-02-08 04:58:03'),
(156,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"104.23.176.5\"}',NULL,'2026-02-08 05:36:27','2026-02-08 05:36:27'),
(157,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1370198567,'{\"ip_address\":\"104.23.176.5\"}',NULL,'2026-02-08 05:36:43','2026-02-08 05:36:43'),
(158,'default','User successfully logged in.',NULL,NULL,NULL,'App\\Models\\User',1272819201,'{\"ip_address\":\"162.158.163.206\"}',NULL,'2026-02-08 10:10:37','2026-02-08 10:10:37'),
(159,'default','User logged out.',NULL,NULL,NULL,'App\\Models\\User',1272819201,'{\"ip_address\":\"104.23.176.5\"}',NULL,'2026-02-08 10:11:41','2026-02-08 10:11:41');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `tahun_terbit` int(10) unsigned NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `kondisi` varchar(255) NOT NULL DEFAULT 'Tersedia',
  `category_id` bigint(20) unsigned NOT NULL,
  `publisher_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_slug_unique` (`slug`),
  UNIQUE KEY `books_isbn_unique` (`isbn`),
  KEY `books_category_id_foreign` (`category_id`),
  CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES
(1,'Sukses AKM Nasional SMP/MTS','sukses-akm-nasional-smpmtszoz5',2022,'978-623-257-214-0','lorem ipsum dolorem','books/pGPv6QuuipcminTdNzzGyBiiM3VA8SUUJWRBKWqs.webp','Tidak Tersedia',6,1,'2026-01-02 08:44:19','2026-01-02 08:57:41'),
(2,'Erlangga X-Press US Matematika','erlangga-x-press-us-matematikapfdb',2022,'978-623-266-331-2','lorem ipsum dolorem','books/Xu3BswdUhtzvjYJMaqU8MLaVI4jGT0OaJ8agDDyV.jpg','Tidak Tersedia',6,1,'2026-01-02 08:44:19','2026-01-02 08:58:38'),
(3,'Erlangga Express US SMP/MTs Bahasa Indonesia','erlangga-express-us-smpmts-bahasa-indonesiaczvd',2022,'978-623-266-353-4','lorem ipsum dolorem','books/RID1gr5hk2enyHArBWGVXl9dQ9WRpVuKSpS53yDw.webp','Tidak Tersedia',6,5,'2026-01-02 08:44:19','2026-01-02 08:59:27'),
(4,'Erlangga Express US SMP/MTs Bahasa Inggris','erlangga-express-us-smpmts-bahasa-inggrismotr',2022,'978-623-266-350-3','lorem ipsum dolorem','books/TDOkL4LoVqEO6GB7JKtbMgYc7WppOSv0ZMOITabQ.jpg','Tidak Tersedia',6,3,'2026-01-02 08:44:19','2026-01-02 09:00:20'),
(5,'Erlangga Fokus AKM SMP/MTs Literasi Membaca Numerasi','erlangga-fokus-akm-smpmts-literasi-membaca-numerasiNubE',2022,'978-623-266-354-1','lorem ipsum dolorem','books/IEI11epC8JKphL4MnjTRLl19FbFirvrk3POsSmXk.jpg','Tidak Tersedia',6,6,'2026-01-02 08:44:19','2026-01-02 09:01:52'),
(6,'Pendalaman Buku Teks Matematika 1A','pendalaman-buku-teks-matematika-1aLbtF',2022,'978-602-299-830-3','lorem ipsum dolorem','books/uyEs4lrP7syblBxzFC0MQboXnnJDHl7JwTBvbP52.png','Tidak Tersedia',6,6,'2026-01-02 08:44:19','2026-01-02 09:06:10'),
(7,'Pendalaman Buku Teks IPS Terpadu  2A','pendalaman-buku-teks-ips-terpadu-2aafLi',2022,'978-602-299-984-3','lorem ipsum dolorem','books/RRZJvqLGx6HbUosF79LaTQI1gV1sysap4Hq9oLPO.png','Tidak Tersedia',6,4,'2026-01-02 08:44:19','2026-01-02 09:09:50'),
(8,'Pendalaman Buku Teks IPS Terpadu  2B','pendalaman-buku-teks-ips-terpadu-2bLEVI',2022,'978-602-299-987-4','lorem ipsum dolorem','books/aowfrzGLALMgoTxbT2ef1srZHUtmA1GbCmC9L0IF.png','Tidak Tersedia',6,4,'2026-01-02 08:44:19','2026-01-02 09:11:16'),
(9,'Pulang-Pergi','pulang-pergirL2w',2021,'9786020641110','Novel aksi drama petualangan Bujang.','books/kP93mjP3NNluK5LLppsCldmKz3WwOMHqDDKOMmDv.png','Tidak Tersedia',5,3,'2026-01-02 08:44:19','2026-01-02 09:12:31'),
(10,'Naruto Vol. 72','naruto-vol-72ezN2',2015,'9789792732112','Komik pertempuran terakhir Naruto dan Sasuke.','books/64wkfwhlParQeJOBUmGcdAiwsdHtrXkkkgSnmk8n.jpg','Tidak Tersedia',3,7,'2026-01-02 08:44:19','2026-01-02 09:13:56'),
(11,'Cantik Itu Luka','cantik-itu-lukaPdwu',2002,'9789792200115','Novel fiksi sastra mahakarya Eka Kurniawan.','books/vheisdP2rA8a5szAdXz17YyMgrgioRRGrH19VQ1R.jpg','Tidak Tersedia',8,1,'2026-01-02 08:44:19','2026-01-02 09:15:26'),
(12,'One Piece Vol. 100','one-piece-vol-100GYKP',2022,'9786024801123','Komik petualangan Luffy di Negeri Wano.','books/fGWdGNXZsExXhgEIxXURdCfFkYP0rIOqHkXMbARt.jpg','Tidak Tersedia',3,5,'2026-01-02 08:44:19','2026-01-02 09:17:38'),
(13,'Aroma Karsa','aroma-karsadOoI',2018,'9786026711105','Novel fiksi tentang pencarian tanaman mistis.','books/di5J8geAsJ3hRxbhaKcILkocoMu9rBTw15UZMak9.jpg','Tidak Tersedia',8,8,'2026-01-02 08:44:19','2026-01-02 09:18:42'),
(14,'Jujutsu Kaisen 01','jujutsu-kaisen-01SoO9',2021,'9786230021114','Komik aksi tentang kutukan dan penyihir.','books/e3tx8nFQkBIba2Tqcs77zLNDCZ1RC2l3Hawy0LSk.webp','Tidak Tersedia',3,2,'2026-01-02 08:44:19','2026-01-02 09:19:35'),
(15,'Gadis Kretek','gadis-kretekEhf2',2012,'9789792281119','Fiksi sejarah tentang industri kretek di Jawa.','books/gK62hx94aoZtdmVm4MZMEtcuG9pua7gPqUJdSxfR.jpg','Tidak Tersedia',8,4,'2026-01-02 08:44:19','2026-01-02 09:22:44'),
(16,'Demon Slayer 01','demon-slayer-01XMJW',2020,'9786230011115','Komik petualangan Tanjiro memburu iblis.','books/yWJoZIR4xyK6Lww5jnxsgWk79UtcRZrCy1SFqrro.jpg','Tidak Tersedia',3,6,'2026-01-02 08:44:19','2026-01-02 09:23:28'),
(17,'Rapijali','rapijaliKAAY',2021,'9786026716110','Novel fiksi remaja tentang musik dan mimpi.','books/hDPV3aWNmakyVFs5OzmiNlsHUw9XDPdBwOW5OPe7.jpg','Tidak Tersedia',5,1,'2026-01-02 08:44:19','2026-01-02 09:27:25'),
(18,'Doraemon Antologi','doraemon-antologiiwx4',2010,'9789792751113','Koleksi komik klasik petualangan robot kucing.','books/8LuHM9U28dwWMx6lQJ9okrxin1EkiVVv4DZnHshr.jpg','Tidak Tersedia',3,3,'2026-01-02 08:44:19','2026-01-02 09:28:06'),
(19,'Orang-Orang Biasa','orang-orang-biasaydxC',2019,'9786022911117','Novel fiksi tentang aksi pencurian kawanan amatir.','books/cRkTKAwtcfnX2QoEMKzWVxqiahDYYwFWhi1b9IC6.jpg','Tidak Tersedia',8,5,'2026-01-02 08:44:19','2026-01-02 09:28:59'),
(20,'Attack on Titan 01','attack-on-titan-01KTdg',2013,'9786027731112','Komik distopia perjuangan manusia melawan raksasa.','books/K2nci04T0FAOzPhuQHNqqMaTekXYa8rgBSxxpFsD.jpg','Tidak Tersedia',3,8,'2026-01-02 08:44:19','2026-01-02 09:29:43'),
(21,'Negeri 5 Menara','negeri-5-menara5pG4',2009,'9789792241114','Novel fiksi inspiratif kehidupan di pesantren.','books/bhNrEHv3MPa5U4eGBtmf2TjclXd4JywhArnn4OYC.jpg','Tidak Tersedia',5,2,'2026-01-02 08:44:19','2026-01-02 09:31:29'),
(22,'Slam Dunk Vol. 01','slam-dunk-vol-01olbQ',2003,'9789792011116','Komik olahraga legendaris tentang basket.','books/7gM6iMUs0oBImdoxObRMgKCrEum3gMLjyaBgZ6OU.jpg','Tidak Tersedia',3,7,'2026-01-02 08:44:19','2026-01-02 09:32:32'),
(29,'Ensiklopedia Antariksa','ensiklopedia-antariksaKelH',2019,'9786024811110','Panduan lengkap mengenai tata surya dan galaksi.','books/lwYx5RsZ5csMefdHCkdUEQcNdMsfFPb1jhb3k6WW.jpg','Tidak Tersedia',1,4,'2026-01-02 08:44:19','2026-01-02 09:33:49'),
(30,'Ensiklopedia Hewan Purba','ensiklopedia-hewan-purba8uWS',2020,'9786024811111','Membahas berbagai jenis dinosaurus dan masa hidupnya.','books/3OyAzmDkTkw0OQCKHTkzyNT9lcLUYtT1JwyQ564e.png','Tidak Tersedia',1,1,'2026-01-02 08:44:19','2026-01-02 09:36:14'),
(31,'Sapiens: Sejarah Singkat Manusia','sapiens-sejarah-singkat-manusiayOsj',2017,'9786024411112','Narasi tentang sejarah perkembangan umat manusia.','books/0R6haBrpy3mzoe8luIHJZEielqiYIPvddxHCTcdy.jpg','Tidak Tersedia',2,6,'2026-01-02 08:44:19','2026-01-02 09:35:16'),
(32,'Filosofi Teras','filosofi-teras2z9J',2018,'9786024411113','Penerapan stoisisme dalam kehidupan modern.','books/6rX7ceX2UlnWTM3zA9l2D8mYMGo7MAZccEySMT9e.jpg','Tidak Tersedia',2,2,'2026-01-02 08:44:19','2026-01-02 09:38:44'),
(33,'Majalah National Geographic','majalah-national-geographicitdS',2023,'9781234567114','Edisi khusus mengenai perubahan iklim dunia.','books/bVECRZIq2yUq6SVGjKWV3WnbSfhjp9ZOmNjQSY4F.jpg','Tidak Tersedia',4,8,'2026-01-02 08:44:19','2026-01-02 09:37:37'),
(34,'Majalah Bobo Edisi Koleksi','majalah-bobo-edisi-koleksi6cWJ',2022,'9781234567115','Kumpulan cerita dan aktivitas menarik untuk anak.','books/1QzAOHKLZmMye7qjF1ey3u8doLdP8STGhD3GGggy.jpg','Tidak Tersedia',4,3,'2026-01-02 08:44:19','2026-01-02 09:37:52'),
(37,'Kamus Besar Bahasa Indonesia','kamus-besar-bahasa-indonesiaG70F',2016,'9789793331118','Referensi utama kosakata bahasa Indonesia terlengkap.','books/EEpdQKh712f80jHrysB7vfxKxOOkepzzIEB5AlS8.jpg','Tidak Tersedia',7,1,'2026-01-02 08:44:19','2026-01-02 09:40:25'),
(38,'Atlas Dunia Lengkap','atlas-dunia-lengkapX7MA',2020,'9789793331119','Peta navigasi seluruh negara beserta profil singkatnya.','books/TP7JzuU8s7xtVNm6qWwHYLb5buuB5iBSR6MHpI1t.jpg','Tidak Tersedia',7,4,'2026-01-02 08:44:19','2026-01-02 09:40:40');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borroweds`
--

DROP TABLE IF EXISTS `borroweds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `borroweds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_nisn` bigint(20) NOT NULL,
  `book_id` bigint(20) unsigned NOT NULL,
  `borrowed_at` date NOT NULL,
  `returned_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borroweds_user_nisn_foreign` (`user_nisn`),
  KEY `borroweds_book_id_foreign` (`book_id`),
  CONSTRAINT `borroweds_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `borroweds_user_nisn_foreign` FOREIGN KEY (`user_nisn`) REFERENCES `users` (`nisn`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borroweds`
--

LOCK TABLES `borroweds` WRITE;
/*!40000 ALTER TABLE `borroweds` DISABLE KEYS */;
INSERT INTO `borroweds` VALUES
(1,2167284722,5,'2026-01-02','2026-01-09','2026-01-02 09:25:52','2026-01-02 09:25:52'),
(2,1345678910,2,'2026-01-05','2026-01-12','2026-01-05 02:17:22','2026-01-05 02:17:22'),
(3,127245455,2,'2026-01-05','2026-01-12','2026-01-05 02:17:24','2026-01-05 02:17:24'),
(4,7000,2,'2026-01-05','2026-01-12','2026-01-05 02:17:55','2026-01-05 02:17:55'),
(5,1122334466,3,'2026-01-05','2026-01-12','2026-01-05 02:17:58','2026-01-05 02:17:58'),
(6,118053102,3,'2026-01-05','2026-01-12','2026-01-05 02:18:55','2026-01-05 02:18:55'),
(7,1765423980,1,'2026-01-05','2026-01-12','2026-01-05 02:19:35','2026-01-05 02:19:35'),
(8,4671839207,3,'2026-01-05','2026-01-12','2026-01-05 02:19:36','2026-01-05 02:19:36'),
(9,118584370,1,'2026-01-05','2026-01-12','2026-01-05 02:19:36','2026-01-05 02:19:36'),
(10,2315685432,5,'2026-01-05','2026-01-12','2026-01-05 02:19:36','2026-01-05 02:19:36'),
(11,1234567891,2,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(12,125643218,3,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(13,2358964186,3,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(14,123087907,1,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(15,114297558,1,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(16,7645892340,1,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(17,139096242,1,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(18,1234567890,1,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(19,0,5,'2026-01-05','2026-01-12','2026-01-05 02:19:37','2026-01-05 02:19:37'),
(20,123617657,5,'2026-01-05','2026-01-12','2026-01-05 02:19:38','2026-01-05 02:19:38'),
(21,112419239,4,'2026-01-05','2026-01-12','2026-01-05 02:19:38','2026-01-05 02:19:38'),
(22,3138020474,1,'2026-01-05','2026-01-12','2026-01-05 02:19:38','2026-01-05 02:19:38'),
(23,5912347691,4,'2026-01-05','2026-01-12','2026-01-05 02:19:38','2026-01-05 02:19:38'),
(24,987654321,1,'2026-01-05','2026-01-12','2026-01-05 02:19:38','2026-01-05 02:19:38'),
(25,3468543678,3,'2026-01-05','2026-01-12','2026-01-05 02:19:38','2026-01-05 02:19:38'),
(26,1230062122,5,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(27,1345678910,1,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(28,127245455,3,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(29,400066,1,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(30,1234759306,1,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(31,129310087,1,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(32,66,2,'2026-01-05','2026-01-12','2026-01-05 02:19:39','2026-01-05 02:19:39'),
(33,123710110,5,'2026-01-05','2026-01-12','2026-01-05 02:19:40','2026-01-05 02:19:40'),
(34,1918171615,31,'2026-01-05','2026-01-12','2026-01-05 02:19:40','2026-01-05 02:19:40'),
(35,5839486284,5,'2026-01-05','2026-01-12','2026-01-05 02:19:41','2026-01-05 02:19:41'),
(36,1245816513,3,'2026-01-05','2026-01-12','2026-01-05 02:19:41','2026-01-05 02:19:41'),
(37,1243576092,5,'2026-01-05','2026-01-12','2026-01-05 02:19:41','2026-01-05 02:19:41'),
(38,101010101,31,'2026-01-05','2026-01-12','2026-01-05 02:19:42','2026-01-05 02:19:42'),
(39,129720857,3,'2026-01-05','2026-01-12','2026-01-05 02:19:42','2026-01-05 02:19:42'),
(40,1010101010,4,'2026-01-05','2026-01-12','2026-01-05 02:19:42','2026-01-05 02:19:42'),
(41,1324658723,5,'2026-01-05','2026-01-12','2026-01-05 02:19:42','2026-01-05 02:19:42'),
(42,123755789,3,'2026-01-05','2026-01-12','2026-01-05 02:19:44','2026-01-05 02:19:44'),
(43,500000,4,'2026-01-05','2026-01-12','2026-01-05 02:19:46','2026-01-05 02:19:46'),
(44,1122334455,31,'2026-01-05','2026-01-12','2026-01-05 02:19:47','2026-01-05 02:19:47'),
(45,123456789,12,'2026-01-05','2026-01-12','2026-01-05 02:19:48','2026-01-05 02:19:48'),
(46,118053102,1,'2026-01-05','2026-01-12','2026-01-05 02:19:58','2026-01-05 02:19:58'),
(47,1122334466,2,'2026-01-05','2026-01-12','2026-01-05 02:19:58','2026-01-05 02:19:58'),
(48,7000,3,'2026-01-05','2026-01-12','2026-01-05 02:20:20','2026-01-05 02:20:20'),
(49,123456789,1,'2026-01-05','2026-01-12','2026-01-05 02:20:26','2026-01-05 02:20:26'),
(50,66,1,'2026-01-05','2026-01-12','2026-01-05 02:20:31','2026-01-05 02:20:31'),
(51,4671839207,5,'2026-01-05','2026-01-12','2026-01-05 02:20:41','2026-01-05 02:20:41'),
(52,3468543678,2,'2026-01-05','2026-01-12','2026-01-05 02:20:42','2026-01-05 02:20:42'),
(53,114297558,4,'2026-01-05','2026-01-12','2026-01-05 02:22:19','2026-01-05 02:22:19'),
(54,1324658723,1,'2026-01-05','2026-01-12','2026-01-05 02:23:07','2026-01-05 02:23:07'),
(55,3269168362,1,'2026-01-05','2026-01-12','2026-01-05 02:32:16','2026-01-05 02:32:16'),
(56,2341523467,1,'2026-01-05','2026-01-12','2026-01-05 02:32:18','2026-01-05 02:32:18'),
(57,2345678910,2,'2026-01-05','2026-01-12','2026-01-05 02:33:05','2026-01-05 02:33:05'),
(58,6281683573,5,'2026-01-05','2026-01-12','2026-01-05 02:34:03','2026-01-05 02:34:03'),
(59,1234567892,1,'2026-01-05','2026-01-12','2026-01-05 02:35:22','2026-01-05 02:35:22'),
(60,1230047820,3,'2026-01-05','2026-01-12','2026-01-05 02:35:38','2026-01-05 02:35:38'),
(61,1234567789,3,'2026-01-05','2026-01-12','2026-01-05 02:35:39','2026-01-05 02:35:39'),
(62,1234567789,4,'2026-01-05','2026-01-12','2026-01-05 02:36:00','2026-01-05 02:36:00'),
(63,8765433190,1,'2026-01-05','2026-01-12','2026-01-05 02:36:12','2026-01-05 02:36:12'),
(64,5432167890,1,'2026-01-05','2026-01-12','2026-01-05 02:36:13','2026-01-05 02:36:13'),
(65,1011458012,1,'2026-01-05','2026-01-12','2026-01-05 02:36:16','2026-01-05 02:36:16'),
(66,3245790012,1,'2026-01-05','2026-01-12','2026-01-05 02:36:21','2026-01-05 02:36:21'),
(67,4545454545,5,'2026-01-05','2026-01-12','2026-01-05 02:36:25','2026-01-05 02:36:25'),
(68,3245098765,1,'2026-01-05','2026-01-12','2026-01-05 02:36:25','2026-01-05 02:36:25'),
(69,1234567895,2,'2026-01-05','2026-01-12','2026-01-05 02:36:26','2026-01-05 02:36:26'),
(70,7777777777,1,'2026-01-05','2026-01-12','2026-01-05 02:36:31','2026-01-05 02:36:31'),
(71,5912343816,4,'2026-01-05','2026-01-12','2026-01-05 02:37:09','2026-01-05 02:37:09'),
(72,9990001112,4,'2026-01-05','2026-01-12','2026-01-05 02:37:13','2026-01-05 02:37:13'),
(73,5432167890,1,'2026-01-05','2026-01-12','2026-01-05 02:37:25','2026-01-05 02:37:25'),
(74,8765433190,2,'2026-01-05','2026-01-12','2026-01-05 02:37:40','2026-01-05 02:37:40'),
(75,111719311,2,'2026-01-05','2026-01-12','2026-01-05 02:38:45','2026-01-05 02:38:45'),
(76,2233441109,1,'2026-01-05','2026-01-12','2026-01-05 02:39:02','2026-01-05 02:39:02'),
(77,3245098765,4,'2026-01-05','2026-01-12','2026-01-05 02:39:10','2026-01-05 02:39:10'),
(78,119832414,5,'2026-01-05','2026-01-12','2026-01-05 02:39:30','2026-01-05 02:39:30'),
(79,1111122222,2,'2026-01-05','2026-01-12','2026-01-05 02:39:58','2026-01-05 02:39:58'),
(80,1112223334,2,'2026-01-05','2026-01-12','2026-01-05 02:39:59','2026-01-05 02:39:59'),
(81,8301730183,2,'2026-01-05','2026-01-12','2026-01-05 02:40:07','2026-01-05 02:40:07'),
(82,1568293682,3,'2026-01-05','2026-01-12','2026-01-05 02:40:22','2026-01-05 02:40:22'),
(83,119955185,4,'2026-01-05','2026-01-12','2026-01-05 02:40:27','2026-01-05 02:40:27'),
(84,5463728190,5,'2026-01-05','2026-01-12','2026-01-05 02:40:42','2026-01-05 02:40:42'),
(85,3457092341,4,'2026-01-05','2026-01-12','2026-01-05 02:40:57','2026-01-05 02:40:57'),
(86,2563710856,4,'2026-01-05','2026-01-12','2026-01-05 02:40:59','2026-01-05 02:40:59'),
(87,9874213695,5,'2026-01-05','2026-01-12','2026-01-05 02:41:10','2026-01-05 02:41:10'),
(88,1287459834,4,'2026-01-05','2026-01-12','2026-01-05 02:41:16','2026-01-05 02:41:16'),
(89,117724276,5,'2026-01-05','2026-01-12','2026-01-05 02:41:39','2026-01-05 02:41:39'),
(90,207201212,4,'2026-01-05','2026-01-12','2026-01-05 02:41:50','2026-01-05 02:41:50'),
(91,1562378950,4,'2026-01-05','2026-01-12','2026-01-05 02:41:50','2026-01-05 02:41:50'),
(92,7354891538,3,'2026-01-05','2026-01-12','2026-01-05 02:41:58','2026-01-05 02:41:58'),
(93,2563710856,1,'2026-01-05','2026-01-12','2026-01-05 02:42:04','2026-01-05 02:42:04'),
(94,2470742246,4,'2026-01-05','2026-01-12','2026-01-05 02:42:14','2026-01-05 02:42:14'),
(95,9238475612,3,'2026-01-05','2026-01-12','2026-01-05 02:42:15','2026-01-05 02:42:15'),
(96,116506176,4,'2026-01-05','2026-01-12','2026-01-05 02:43:04','2026-01-05 02:43:04'),
(97,1234567123,3,'2026-01-05','2026-01-12','2026-01-05 02:43:20','2026-01-05 02:43:20'),
(98,118345378,3,'2026-01-05','2026-01-12','2026-01-05 02:43:38','2026-01-05 02:43:38'),
(99,1937496374,4,'2026-01-05','2026-01-12','2026-01-05 02:43:42','2026-01-05 02:43:42'),
(100,119500374,1,'2026-01-05','2026-01-12','2026-01-05 02:44:07','2026-01-05 02:44:07'),
(101,1096564321,2,'2026-01-05','2026-01-12','2026-01-05 02:44:15','2026-01-05 02:44:15'),
(102,312456987,3,'2026-01-05','2026-01-12','2026-01-05 02:44:23','2026-01-05 02:44:23'),
(103,312456987,1,'2026-01-05','2026-01-12','2026-01-05 02:44:37','2026-01-05 02:44:37'),
(104,9284610847,2,'2026-01-05','2026-01-12','2026-01-05 02:44:58','2026-01-05 02:44:58'),
(105,101126703,3,'2026-01-05','2026-01-12','2026-01-05 02:45:48','2026-01-05 02:45:48'),
(106,108569443,1,'2026-01-05','2026-01-12','2026-01-05 02:45:51','2026-01-05 02:45:51'),
(107,103942364,2,'2026-01-05','2026-01-12','2026-01-05 02:46:13','2026-01-05 02:46:13'),
(108,5671384920,3,'2026-01-05','2026-01-12','2026-01-05 02:46:26','2026-01-05 02:46:26'),
(109,103942364,1,'2026-01-05','2026-01-12','2026-01-05 02:46:33','2026-01-05 02:46:33'),
(110,109651990,3,'2026-01-05','2026-01-12','2026-01-05 02:46:44','2026-01-05 02:46:44'),
(111,5671384920,4,'2026-01-05','2026-01-12','2026-01-05 02:47:01','2026-01-05 02:47:01'),
(112,105146468,4,'2026-01-05','2026-01-12','2026-01-05 02:47:37','2026-01-05 02:47:37'),
(113,112018823,2,'2026-01-05','2026-01-12','2026-01-05 02:48:07','2026-01-05 02:48:07'),
(114,123710110,2,'2026-01-05','2026-01-12','2026-01-05 02:48:29','2026-01-05 02:48:29'),
(115,118882376,2,'2026-01-05','2026-01-12','2026-01-05 02:50:30','2026-01-05 02:50:30'),
(116,113139823,1,'2026-01-05','2026-01-12','2026-01-05 02:50:39','2026-01-05 02:50:39'),
(117,1122334453,1,'2026-01-05','2026-01-12','2026-01-05 02:56:13','2026-01-05 02:56:13'),
(118,1122334453,1,'2026-01-05','2026-01-12','2026-01-05 02:57:42','2026-01-05 02:57:42'),
(119,119832414,3,'2026-01-05','2026-01-12','2026-01-05 03:03:44','2026-01-05 03:03:44');
/*!40000 ALTER TABLE `borroweds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Ensiklopedia','ensiklopedia61J7',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(2,'Buku Non-Fiksi','buku-non-fiksin4s3',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(3,'Komik','komikaGNV',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(4,'Majalah','majalahTynA',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(5,'Novel','novelsSgi',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(6,'Buku Pelajaran/Paket','buku-pelajaranpaketZ7l3',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(7,'Buku Referensi','buku-referensi1v0U',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52'),
(8,'Buku Fiksi','buku-fiksiOX77',NULL,'2026-01-02 08:12:52','2026-01-02 08:12:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebook_downloads`
--

DROP TABLE IF EXISTS `ebook_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ebook_downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ebook_id` bigint(20) unsigned NOT NULL,
  `user_nisn` bigint(20) DEFAULT NULL,
  `downloaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ebook_downloads_ebook_id_foreign` (`ebook_id`),
  KEY `ebook_downloads_user_nisn_foreign` (`user_nisn`),
  CONSTRAINT `ebook_downloads_ebook_id_foreign` FOREIGN KEY (`ebook_id`) REFERENCES `ebooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ebook_downloads_user_nisn_foreign` FOREIGN KEY (`user_nisn`) REFERENCES `users` (`nisn`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebook_downloads`
--

LOCK TABLES `ebook_downloads` WRITE;
/*!40000 ALTER TABLE `ebook_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebook_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebooks`
--

DROP TABLE IF EXISTS `ebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ebooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `tahun_terbit` int(10) unsigned NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `publisher_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ebooks_slug_unique` (`slug`),
  UNIQUE KEY `ebooks_isbn_unique` (`isbn`),
  KEY `ebooks_category_id_foreign` (`category_id`),
  KEY `ebooks_publisher_id_foreign` (`publisher_id`),
  CONSTRAINT `ebooks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ebooks_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooks`
--

LOCK TABLES `ebooks` WRITE;
/*!40000 ALTER TABLE `ebooks` DISABLE KEYS */;
INSERT INTO `ebooks` VALUES
(1,'An Introduction to English Grammar Second Edition','an-introduction-to-english-grammar-second-editionithk',2010,'12-G-GGHT-421OP1','An Introduction to English Grammar Second Edition','ebooks/KTimGGObVmxhgbmjAdaBdo3rjftWLn5CP2yHzw9h.jpg','ebooks/jLaXwk1wTXNOxoLqcy2maVDnhxtPU68q0dczSPZ0.pdf',6,4,'2026-01-02 09:51:47','2026-01-02 09:51:47',0),
(2,'Ayat-ayat Api','ayat-ayat-apiarv8',2000,'978-602-03-3953-5','kumpulan puisi yang terbagi dalam tiga bagian utama, yaitu ayat nol, ayat arloji, dan ayat api.','ebooks/eDsIXpqcollRxvMgLBXViS3HxSWHu5qJJHwmfWye.png','ebooks/LbVXM4TiJ3QqxHJ4FyU8mCjhQoSLzaqqW6O3aR2n.pdf',5,4,'2026-01-02 09:55:25','2026-01-02 09:55:25',0);
/*!40000 ALTER TABLE `ebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` enum('VII','VIII','IX') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kelas_tingkat_unique` (`tingkat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES
(1,'VII','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(2,'VIII','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(3,'IX','2026-01-02 08:12:52','2026-01-02 08:12:52');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2025_04_02_063705_create_categories_table',1),
(5,'2025_04_10_062503_create_publishers_table',1),
(6,'2025_04_10_062820_create_books_table',1),
(7,'2025_04_10_080422_create_stocks_table',1),
(8,'2025_04_10_081108_create_borroweds_table',1),
(9,'2025_04_10_095424_create_return_books_table',1),
(10,'2025_04_10_102020_create_announcements_table',1),
(11,'2025_07_15_041703_change_publisher_on_books',1),
(12,'2025_07_22_182238_change_cover_length_in_books_table',1),
(13,'2025_08_21_034710_create_return_book_checks_table',1),
(14,'2025_08_30_151945_create_permission_tables',1),
(15,'2025_09_14_153357_add_return_date_to_return_books_table',1),
(16,'2025_09_14_155543_remove_returned_at_from_return_books_table',1),
(17,'2025_09_14_155750_add_book_id_to_return_book_checks_table',1),
(18,'2025_09_18_054647_change_deskripsi_column_on_books_table',1),
(19,'2025_09_28_145414_remove_penerbit_from_books_table',1),
(20,'2025_09_28_145611_remove_stok_from_books_table',1),
(21,'2025_09_29_141223_add_damaged_to_stocks_table',1),
(22,'2025_10_10_080359_create_ebooks_table',1),
(23,'2025_10_11_082117_remove_kondisi_from_ebooks_table',1),
(24,'2025_10_17_083854_create_kelas_table',1),
(25,'2025_10_17_084244_add_kelas_id_to_users_table',1),
(26,'2025_10_18_071917_add_download_count_to_ebooks_table',1),
(27,'2025_10_18_072101_create_ebook_downloads_table',1),
(28,'2025_12_15_061147_create_activity_log_table',1),
(29,'2025_12_15_061148_add_event_column_to_activity_log_table',1),
(30,'2025_12_15_061149_add_batch_uuid_column_to_activity_log_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES
(1,'App\\Models\\User',1370198567),
(2,'App\\Models\\User',0),
(2,'App\\Models\\User',66),
(2,'App\\Models\\User',7000),
(2,'App\\Models\\User',400066),
(2,'App\\Models\\User',500000),
(2,'App\\Models\\User',101010101),
(2,'App\\Models\\User',101126703),
(2,'App\\Models\\User',103942364),
(2,'App\\Models\\User',105146468),
(2,'App\\Models\\User',108569443),
(2,'App\\Models\\User',109651990),
(2,'App\\Models\\User',111691116),
(2,'App\\Models\\User',111719311),
(2,'App\\Models\\User',112018823),
(2,'App\\Models\\User',112303920),
(2,'App\\Models\\User',112419239),
(2,'App\\Models\\User',113139823),
(2,'App\\Models\\User',114297558),
(2,'App\\Models\\User',116506176),
(2,'App\\Models\\User',117724276),
(2,'App\\Models\\User',118053102),
(2,'App\\Models\\User',118345378),
(2,'App\\Models\\User',118584370),
(2,'App\\Models\\User',118882376),
(2,'App\\Models\\User',119500374),
(2,'App\\Models\\User',119832414),
(2,'App\\Models\\User',119955185),
(2,'App\\Models\\User',123087907),
(2,'App\\Models\\User',123456789),
(2,'App\\Models\\User',123617657),
(2,'App\\Models\\User',123710110),
(2,'App\\Models\\User',123755789),
(2,'App\\Models\\User',125643218),
(2,'App\\Models\\User',126921352),
(2,'App\\Models\\User',127245455),
(2,'App\\Models\\User',129310087),
(2,'App\\Models\\User',129720857),
(2,'App\\Models\\User',139096242),
(2,'App\\Models\\User',207201212),
(2,'App\\Models\\User',312456987),
(2,'App\\Models\\User',987654321),
(2,'App\\Models\\User',1010101010),
(2,'App\\Models\\User',1011458012),
(2,'App\\Models\\User',1096564321),
(2,'App\\Models\\User',1111122222),
(2,'App\\Models\\User',1112223334),
(2,'App\\Models\\User',1122334451),
(2,'App\\Models\\User',1122334453),
(2,'App\\Models\\User',1122334455),
(2,'App\\Models\\User',1122334466),
(2,'App\\Models\\User',1200192311),
(2,'App\\Models\\User',1230047820),
(2,'App\\Models\\User',1230062122),
(2,'App\\Models\\User',1234567123),
(2,'App\\Models\\User',1234567789),
(2,'App\\Models\\User',1234567890),
(2,'App\\Models\\User',1234567891),
(2,'App\\Models\\User',1234567892),
(2,'App\\Models\\User',1234567895),
(2,'App\\Models\\User',1234759306),
(2,'App\\Models\\User',1243576092),
(2,'App\\Models\\User',1245816513),
(2,'App\\Models\\User',1272819201),
(2,'App\\Models\\User',1287459834),
(2,'App\\Models\\User',1324658723),
(2,'App\\Models\\User',1345678910),
(2,'App\\Models\\User',1562378950),
(2,'App\\Models\\User',1568293682),
(2,'App\\Models\\User',1765423980),
(2,'App\\Models\\User',1918171615),
(2,'App\\Models\\User',1937496374),
(2,'App\\Models\\User',2167284722),
(2,'App\\Models\\User',2233441109),
(2,'App\\Models\\User',2315685432),
(2,'App\\Models\\User',2341523467),
(2,'App\\Models\\User',2345678910),
(2,'App\\Models\\User',2358964186),
(2,'App\\Models\\User',2470742246),
(2,'App\\Models\\User',2563710856),
(2,'App\\Models\\User',3138020474),
(2,'App\\Models\\User',3245098765),
(2,'App\\Models\\User',3245790012),
(2,'App\\Models\\User',3269168362),
(2,'App\\Models\\User',3457092341),
(2,'App\\Models\\User',3468543678),
(2,'App\\Models\\User',4545454545),
(2,'App\\Models\\User',4671839207),
(2,'App\\Models\\User',5432167890),
(2,'App\\Models\\User',5463728190),
(2,'App\\Models\\User',5671384920),
(2,'App\\Models\\User',5839486284),
(2,'App\\Models\\User',5912343816),
(2,'App\\Models\\User',5912347691),
(2,'App\\Models\\User',6281683573),
(2,'App\\Models\\User',7354891538),
(2,'App\\Models\\User',7645892340),
(2,'App\\Models\\User',7777777777),
(2,'App\\Models\\User',8301730183),
(2,'App\\Models\\User',8765433190),
(2,'App\\Models\\User',9238475612),
(2,'App\\Models\\User',9284610847),
(2,'App\\Models\\User',9874213695),
(2,'App\\Models\\User',9990001112);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publishers_name_unique` (`name`),
  UNIQUE KEY `publishers_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES
(1,'Penerbit Diva Press','penerbit-diva-pressZ7qD','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(2,'Penerbit Republika','penerbit-republikaoRZE','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(3,'Bhuana Ilmu Populer','bhuana-ilmu-populersMYu','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(4,'Erlangga','erlanggaOlV8','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(5,'Penerbit Grasindo','penerbit-grasindotLaE','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(6,'Pustaka Alvabet','pustaka-alvabetwvD5','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(7,'Penerbit Buku Kompas','penerbit-buku-kompas4siC','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(8,'Penerbit Haru','penerbit-haruoWWR','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(9,'Penerbit Hikmah','penerbit-hikmah04q9','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(10,'Salam Semesta','salam-semestaAxL4','2026-01-02 08:12:52','2026-01-02 08:12:52'),
(11,'Penerbit Bentang Pustaka','penerbit-bentang-pustakaR1Ec','2026-01-02 08:12:52','2026-01-02 08:12:52');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_book_checks`
--

DROP TABLE IF EXISTS `return_book_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_book_checks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `return_book_id` bigint(20) unsigned NOT NULL,
  `book_id` bigint(20) unsigned NOT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_book_checks_return_book_id_foreign` (`return_book_id`),
  CONSTRAINT `return_book_checks_return_book_id_foreign` FOREIGN KEY (`return_book_id`) REFERENCES `return_books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_book_checks`
--

LOCK TABLES `return_book_checks` WRITE;
/*!40000 ALTER TABLE `return_book_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_book_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_books`
--

DROP TABLE IF EXISTS `return_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `return_books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `borrowed_id` bigint(20) unsigned NOT NULL,
  `book_id` bigint(20) unsigned NOT NULL,
  `user_nisn` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pengecekan',
  `kondisi` varchar(255) NOT NULL DEFAULT 'Baik',
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_books_borrowed_id_foreign` (`borrowed_id`),
  KEY `return_books_book_id_foreign` (`book_id`),
  KEY `return_books_user_nisn_foreign` (`user_nisn`),
  CONSTRAINT `return_books_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `return_books_borrowed_id_foreign` FOREIGN KEY (`borrowed_id`) REFERENCES `borroweds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `return_books_user_nisn_foreign` FOREIGN KEY (`user_nisn`) REFERENCES `users` (`nisn`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_books`
--

LOCK TABLES `return_books` WRITE;
/*!40000 ALTER TABLE `return_books` DISABLE KEYS */;
INSERT INTO `return_books` VALUES
(1,6,3,118053102,'Pengecekan','Baik',NULL,'2026-01-05 02:21:20','2026-01-05 02:21:20','2026-01-05 00:00:00'),
(2,6,3,118053102,'Pengecekan','Baik',NULL,'2026-01-05 02:21:52','2026-01-05 02:21:52','2026-01-05 00:00:00'),
(3,6,3,118053102,'Pengecekan','Baik',NULL,'2026-01-05 02:21:54','2026-01-05 02:21:54','2026-01-05 00:00:00'),
(4,46,1,118053102,'Pengecekan','Baik',NULL,'2026-01-05 02:22:08','2026-01-05 02:22:08','2026-01-05 00:00:00'),
(5,9,1,118584370,'Pengecekan','Baik',NULL,'2026-01-05 02:22:32','2026-01-05 02:22:32','2026-01-05 00:00:00'),
(6,14,1,123087907,'Pengecekan','Baik',NULL,'2026-01-05 02:22:32','2026-01-05 02:22:32','2026-01-05 00:00:00'),
(7,42,3,123755789,'Pengecekan','Baik',NULL,'2026-01-05 02:22:33','2026-01-05 02:22:33','2026-01-05 00:00:00'),
(8,49,1,123456789,'Pengecekan','Baik',NULL,'2026-01-05 02:22:33','2026-01-05 02:22:33','2026-01-05 00:00:00'),
(9,43,4,500000,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(10,39,3,129720857,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(11,28,3,127245455,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(12,19,5,0,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(13,30,1,1234759306,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(14,10,5,2315685432,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(15,31,1,129310087,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(16,22,1,3138020474,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(17,44,31,1122334455,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(18,27,1,1345678910,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(19,34,31,1918171615,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(20,18,1,1234567890,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(21,13,3,2358964186,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(22,40,4,1010101010,'Pengecekan','Baik',NULL,'2026-01-05 02:22:34','2026-01-05 02:22:34','2026-01-05 00:00:00'),
(23,29,1,400066,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(24,52,2,3468543678,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(25,23,4,5912347691,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(26,47,2,1122334466,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(27,21,4,112419239,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(28,38,31,101010101,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(29,35,5,5839486284,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(30,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(31,17,1,139096242,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(32,36,3,1245816513,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(33,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(34,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(35,8,3,4671839207,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(36,20,5,123617657,'Pengecekan','Baik',NULL,'2026-01-05 02:22:35','2026-01-05 02:22:35','2026-01-05 00:00:00'),
(37,16,1,7645892340,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(38,12,3,125643218,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(39,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(40,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(41,33,5,123710110,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(42,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(43,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(44,7,1,1765423980,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(45,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(46,24,1,987654321,'Pengecekan','Baik',NULL,'2026-01-05 02:22:36','2026-01-05 02:22:36','2026-01-05 00:00:00'),
(47,26,5,1230062122,'Pengecekan','Baik',NULL,'2026-01-05 02:22:37','2026-01-05 02:22:37','2026-01-05 00:00:00'),
(48,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:37','2026-01-05 02:22:37','2026-01-05 00:00:00'),
(49,11,2,1234567891,'Pengecekan','Baik',NULL,'2026-01-05 02:22:37','2026-01-05 02:22:37','2026-01-05 00:00:00'),
(50,37,5,1243576092,'Pengecekan','Baik',NULL,'2026-01-05 02:22:41','2026-01-05 02:22:41','2026-01-05 00:00:00'),
(51,41,5,1324658723,'Pengecekan','Baik',NULL,'2026-01-05 02:23:19','2026-01-05 02:23:19','2026-01-05 00:00:00'),
(52,4,2,7000,'Pengecekan','Baik',NULL,'2026-01-05 02:23:53','2026-01-05 02:23:53','2026-01-05 00:00:00'),
(53,26,5,1230062122,'Pengecekan','Baik',NULL,'2026-01-05 02:27:04','2026-01-05 02:27:04','2026-01-05 00:00:00'),
(54,57,2,2345678910,'Pengecekan','Baik',NULL,'2026-01-05 02:33:10','2026-01-05 02:33:10','2026-01-05 00:00:00'),
(55,58,5,6281683573,'Pengecekan','Baik',NULL,'2026-01-05 02:34:20','2026-01-05 02:34:20','2026-01-05 00:00:00'),
(56,56,1,2341523467,'Pengecekan','Baik',NULL,'2026-01-05 02:35:16','2026-01-05 02:35:16','2026-01-05 00:00:00'),
(57,59,1,1234567892,'Pengecekan','Baik',NULL,'2026-01-05 02:35:29','2026-01-05 02:35:29','2026-01-05 00:00:00'),
(58,70,1,7777777777,'Pengecekan','Baik',NULL,'2026-01-05 02:36:35','2026-01-05 02:36:35','2026-01-05 00:00:00'),
(59,69,2,1234567895,'Pengecekan','Baik',NULL,'2026-01-05 02:36:36','2026-01-05 02:36:36','2026-01-05 00:00:00'),
(60,65,1,1011458012,'Pengecekan','Baik',NULL,'2026-01-05 02:36:37','2026-01-05 02:36:37','2026-01-05 00:00:00'),
(61,67,5,4545454545,'Pengecekan','Baik',NULL,'2026-01-05 02:36:45','2026-01-05 02:36:45','2026-01-05 00:00:00'),
(62,64,1,5432167890,'Pengecekan','Baik',NULL,'2026-01-05 02:36:50','2026-01-05 02:36:50','2026-01-05 00:00:00'),
(63,71,4,5912343816,'Pengecekan','Baik',NULL,'2026-01-05 02:37:40','2026-01-05 02:37:40','2026-01-05 00:00:00'),
(64,60,3,1230047820,'Pengecekan','Baik',NULL,'2026-01-05 02:38:02','2026-01-05 02:38:02','2026-01-05 00:00:00'),
(65,61,3,1234567789,'Pengecekan','Baik',NULL,'2026-01-05 02:38:32','2026-01-05 02:38:32','2026-01-05 00:00:00'),
(66,66,1,3245790012,'Pengecekan','Baik',NULL,'2026-01-05 02:38:33','2026-01-05 02:38:33','2026-01-05 00:00:00'),
(67,61,3,1234567789,'Pengecekan','Baik',NULL,'2026-01-05 02:38:39','2026-01-05 02:38:39','2026-01-05 00:00:00'),
(68,75,2,111719311,'Pengecekan','Baik',NULL,'2026-01-05 02:38:52','2026-01-05 02:38:52','2026-01-05 00:00:00'),
(69,76,1,2233441109,'Pengecekan','Baik',NULL,'2026-01-05 02:39:07','2026-01-05 02:39:07','2026-01-05 00:00:00'),
(70,55,1,3269168362,'Pengecekan','Baik',NULL,'2026-01-05 02:39:14','2026-01-05 02:39:14','2026-01-05 00:00:00'),
(71,68,1,3245098765,'Pengecekan','Baik',NULL,'2026-01-05 02:39:22','2026-01-05 02:39:22','2026-01-05 00:00:00'),
(72,68,1,3245098765,'Pengecekan','Baik',NULL,'2026-01-05 02:39:23','2026-01-05 02:39:23','2026-01-05 00:00:00'),
(73,68,1,3245098765,'Pengecekan','Baik',NULL,'2026-01-05 02:39:26','2026-01-05 02:39:26','2026-01-05 00:00:00'),
(74,80,2,1112223334,'Pengecekan','Baik',NULL,'2026-01-05 02:41:19','2026-01-05 02:41:19','2026-01-05 00:00:00'),
(75,87,5,9874213695,'Pengecekan','Baik',NULL,'2026-01-05 02:41:19','2026-01-05 02:41:19','2026-01-05 00:00:00'),
(76,82,3,1568293682,'Pengecekan','Baik',NULL,'2026-01-05 02:41:23','2026-01-05 02:41:23','2026-01-05 00:00:00'),
(77,84,5,5463728190,'Pengecekan','Baik',NULL,'2026-01-05 02:41:24','2026-01-05 02:41:24','2026-01-05 00:00:00'),
(78,83,4,119955185,'Pengecekan','Baik',NULL,'2026-01-05 02:41:25','2026-01-05 02:41:25','2026-01-05 00:00:00'),
(79,84,5,5463728190,'Pengecekan','Baik',NULL,'2026-01-05 02:41:26','2026-01-05 02:41:26','2026-01-05 00:00:00'),
(80,89,5,117724276,'Pengecekan','Baik',NULL,'2026-01-05 02:41:44','2026-01-05 02:41:44','2026-01-05 00:00:00'),
(81,90,4,207201212,'Pengecekan','Baik',NULL,'2026-01-05 02:41:55','2026-01-05 02:41:55','2026-01-05 00:00:00'),
(82,79,2,1111122222,'Pengecekan','Baik',NULL,'2026-01-05 02:42:00','2026-01-05 02:42:00','2026-01-05 00:00:00'),
(83,79,2,1111122222,'Pengecekan','Baik',NULL,'2026-01-05 02:42:01','2026-01-05 02:42:01','2026-01-05 00:00:00'),
(84,79,2,1111122222,'Pengecekan','Baik',NULL,'2026-01-05 02:42:01','2026-01-05 02:42:01','2026-01-05 00:00:00'),
(85,79,2,1111122222,'Pengecekan','Baik',NULL,'2026-01-05 02:42:01','2026-01-05 02:42:01','2026-01-05 00:00:00'),
(86,94,4,2470742246,'Pengecekan','Baik',NULL,'2026-01-05 02:42:27','2026-01-05 02:42:27','2026-01-05 00:00:00'),
(87,81,2,8301730183,'Pengecekan','Baik',NULL,'2026-01-05 02:42:28','2026-01-05 02:42:28','2026-01-05 00:00:00'),
(88,97,3,1234567123,'Pengecekan','Baik',NULL,'2026-01-05 02:43:41','2026-01-05 02:43:41','2026-01-05 00:00:00'),
(89,97,3,1234567123,'Pengecekan','Baik',NULL,'2026-01-05 02:43:42','2026-01-05 02:43:42','2026-01-05 00:00:00'),
(90,98,3,118345378,'Pengecekan','Baik',NULL,'2026-01-05 02:43:44','2026-01-05 02:43:44','2026-01-05 00:00:00'),
(91,99,4,1937496374,'Pengecekan','Baik',NULL,'2026-01-05 02:43:48','2026-01-05 02:43:48','2026-01-05 00:00:00'),
(92,99,4,1937496374,'Pengecekan','Baik',NULL,'2026-01-05 02:43:49','2026-01-05 02:43:49','2026-01-05 00:00:00'),
(93,100,1,119500374,'Pengecekan','Baik',NULL,'2026-01-05 02:44:12','2026-01-05 02:44:12','2026-01-05 00:00:00'),
(94,101,2,1096564321,'Pengecekan','Baik',NULL,'2026-01-05 02:44:25','2026-01-05 02:44:25','2026-01-05 00:00:00'),
(95,103,1,312456987,'Pengecekan','Baik',NULL,'2026-01-05 02:44:43','2026-01-05 02:44:43','2026-01-05 00:00:00'),
(96,85,4,3457092341,'Pengecekan','Baik',NULL,'2026-01-05 02:45:20','2026-01-05 02:45:20','2026-01-05 00:00:00'),
(97,88,4,1287459834,'Pengecekan','Baik',NULL,'2026-01-05 02:45:21','2026-01-05 02:45:21','2026-01-05 00:00:00'),
(98,88,4,1287459834,'Pengecekan','Baik',NULL,'2026-01-05 02:45:23','2026-01-05 02:45:23','2026-01-05 00:00:00'),
(99,88,4,1287459834,'Pengecekan','Baik',NULL,'2026-01-05 02:45:32','2026-01-05 02:45:32','2026-01-05 00:00:00'),
(100,91,4,1562378950,'Pengecekan','Baik',NULL,'2026-01-05 02:45:33','2026-01-05 02:45:33','2026-01-05 00:00:00'),
(101,104,2,9284610847,'Pengecekan','Baik',NULL,'2026-01-05 02:45:42','2026-01-05 02:45:42','2026-01-05 00:00:00'),
(102,105,3,101126703,'Pengecekan','Baik',NULL,'2026-01-05 02:45:55','2026-01-05 02:45:55','2026-01-05 00:00:00'),
(103,106,1,108569443,'Pengecekan','Baik',NULL,'2026-01-05 02:45:55','2026-01-05 02:45:55','2026-01-05 00:00:00'),
(104,109,1,103942364,'Pengecekan','Baik',NULL,'2026-01-05 02:46:41','2026-01-05 02:46:41','2026-01-05 00:00:00'),
(105,110,3,109651990,'Pengecekan','Baik',NULL,'2026-01-05 02:46:50','2026-01-05 02:46:50','2026-01-05 00:00:00'),
(106,109,1,103942364,'Pengecekan','Baik',NULL,'2026-01-05 02:46:50','2026-01-05 02:46:50','2026-01-05 00:00:00'),
(107,63,1,8765433190,'Pengecekan','Baik',NULL,'2026-01-05 02:47:10','2026-01-05 02:47:10','2026-01-05 00:00:00'),
(108,112,4,105146468,'Pengecekan','Baik',NULL,'2026-01-05 02:47:45','2026-01-05 02:47:45','2026-01-05 00:00:00'),
(109,60,3,1230047820,'Pengecekan','Baik',NULL,'2026-01-05 02:50:09','2026-01-05 02:50:09','2026-01-05 00:00:00'),
(110,95,3,9238475612,'Pengecekan','Baik',NULL,'2026-01-05 02:50:26','2026-01-05 02:50:26','2026-01-05 00:00:00'),
(111,115,2,118882376,'Pengecekan','Baik',NULL,'2026-01-05 02:50:36','2026-01-05 02:50:36','2026-01-05 00:00:00'),
(112,115,2,118882376,'Pengecekan','Baik',NULL,'2026-01-05 02:50:38','2026-01-05 02:50:38','2026-01-05 00:00:00'),
(113,92,3,7354891538,'Pengecekan','Baik',NULL,'2026-01-05 02:50:42','2026-01-05 02:50:42','2026-01-05 00:00:00'),
(114,116,1,113139823,'Pengecekan','Baik',NULL,'2026-01-05 02:50:45','2026-01-05 02:50:45','2026-01-05 00:00:00'),
(115,117,1,1122334453,'Pengecekan','Baik',NULL,'2026-01-05 02:56:29','2026-01-05 02:56:29','2026-01-05 00:00:00');
/*!40000 ALTER TABLE `return_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'admin','web','2026-01-02 08:12:51','2026-01-02 08:12:51'),
(2,'member','web','2026-01-02 08:12:52','2026-01-02 08:12:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('1fBYXRc20oS9cOfiDOp7dJt495n9LsZCGX6GVWSq',NULL,'172.71.190.241','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYnp3WFllVTZtYkQwaW9HcTdVcHFHcm50VUd3REgzdFJmNkdrSnA3eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770602540),
('1HmA88aSUq9vsnPKXR6fp1PP4j1n3k2NeScVFFys',NULL,'172.68.245.83','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZk1zcDdXQXhFcVM5MlFlSjVNcWE2aHpaV1ZVZVRvS2VqWTNDVTNmRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770612075),
('2lxzOoeCAjnNOe3cSwGYQetCT05PPgzFcw4jzD56',NULL,'172.71.223.159','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRUNiTlhNcGM0c3NET0Z4dThiQklmSUM2Um5KcExCekczWERNRzBGYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770603454),
('6JXwEmsWvSuX77gDXIALhXKKGpswMpYykYBfZ4JF',NULL,'172.71.190.35','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoidUtMelJvdWhHZ0Eza29ST2dxdm82OUIzUXhDUHVFbEhjbnRLTnNDSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770604689),
('7uldAACNco2v7W0HnoxoY3P4SrzzgEJpgSYDXrwo',NULL,'104.23.243.139','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoic3dqSklWWE5kRU9GbkxzNzRiZHR2SlN6cDRqOVFpcEY2NkNQRVJkTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770604079),
('94SItldJrUXxIfHijiLk8qlGhZlcD0LEk1nbT41q',NULL,'172.70.35.165','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoieFRCa09LclFRcmRFUzdDVXpxRkpNOUFXekdEa1NKanF5ZGFXc2thWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770612998),
('aSrFllAxcgO8usQzZw4y56vTU82qEAmZQFl9hznD',NULL,'104.23.243.139','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiM0tEWjRsUTNQQkpkRTZaR1JWZ000dEVYMEMyWlRWR25aOHVRYVBieiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770600994),
('AUAlRN27oWtFtCxfWkui4wK2EA9El0MFt711Lflc',NULL,'104.23.209.195','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWFRHRlBtdlRSRWpUcTduS0JnZm8xeE8wUzQwTGVaTExrR2lHQ2VNeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770604384),
('B0Qo7XnfFc2TJhhSIOFKBdxkLtb4NjGCkJbx7vGY',NULL,'172.70.35.181','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWkdxSjVUamtpREw2c2FiNzd6TUw1aDg0WFdUYUN1REtMY29yUFVYTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770608384),
('bBqmxAw9qUxjS3boMGafjFm7fyNjQi547Ze70NwM',NULL,'172.70.35.165','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQUtFVWx6dG05S0xNd2k2R2tyVlZ2d1NNZ2xpb0pGdjQ1Q1FQQlZuTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770611140),
('bxlm1s9qCSiGzbjZB2E39JqyKrWyaPHjBehngWaw',NULL,'104.23.213.128','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUWJ3eHczNVNKR0p2OXIyb2FSa2t0NnE1TkFodWZRSHNHbUxkNWUwdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770609919),
('cAOkq6AE0cXZF4ouqKuDbfXrlmFM1Cs286KoxZn1',NULL,'172.70.38.229','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiOGRvejY0MkdRcnNvTkI1SXdFQmFDbjlRWDhzWU9YVWxWT3pmY3lROCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770608078),
('fAKz2MUJJWRfb5FCbORtg9xaXHlhnHaVTmmLwSEd',NULL,'172.68.244.180','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiblRMQU1MWTdvU0NNSDlOaDJpcEZZd1lBcmcxREhhMkJEcExVbDdTOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770612379),
('fKMxc8X4Wz7VNhhsLhWnpe4QZYcpqfIGWMSH9TSh',NULL,'104.23.243.138','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMnI3NEd6dE1NRkpna3gzTUJEcUcyR0NyY2pMMEJzVFdvZ2xxUGo5bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770601624),
('fZmjvOPDEgxoneZC1TorrcIb4FGHBYA7YWPMYW8p',NULL,'172.70.35.165','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoidXEzelM0VlRnVTFvaXhibWcwSm1oUnJxbWZ2c3IyRHNnaHMzRUxTMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770609308),
('GDPkic8FHXpvY2Cv8nnNffOdbgEnI0w5gUZ5xhEw',NULL,'104.23.197.132','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ3RUaUtyMVZGT2ZUOW8ycnR4ZUxSQ0dESUhYMFpROHdxbGs0VVN2WCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770608995),
('hC68wNVyjPaWYRD5cyuFcATN0NQC03mSnRLijFAq',NULL,'104.23.197.133','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiT0xhclVJUmZva2dkWXFDbTByaTdHREhndm10OGE5Y0JoMDI5Q1NNMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770605925),
('HWwBGvb5mnYQS2b6pBtq4rjgbeemuWRlQmWBKbfK',NULL,'172.71.194.24','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3JnYWt2b2xDZVBnZWcwVm9QTjhSTmFEaERlN1EySjhNR01wd0NjQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770609613),
('IUFErytgWwDtvI35Qs5ZDWlnKE4DfzudzEJL5y1k',NULL,'104.23.243.139','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMlVjR1EySUc1bDRzRGJmN0tQV2hNaDAyM0x1T2J2ZWNsZlRZZnFkVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770607771),
('k00KeuYwJUQX2e2Ws5pyilU0RQqSlNbkPtkUhcnf',NULL,'172.71.194.25','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoidW1hVktpMlBqaDJSSmlUZ3djbFUyYXlReWNGeXJBVEI5UzBYNHE2eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770610530),
('Ln7MTBv06EnIxvMXndHrGgM1lqvNzxQAsi1PIdqY',NULL,'172.68.245.82','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmlQRTFQMEN3SGg4dEVSa2ZYSmR2THZiT2NaMFRRUm0xanNUVGFWMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770606848),
('mgOh82TzorRoCOLGTg900xEc2t2VcnBSzopyRHAc',NULL,'104.23.211.100','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoibFdnTjNsWm0wN2F0bE9rUjlTRURZQXFrazNUU0dvY2R5VFJzNTZuciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770601928),
('MyCMZqFQ2tqCuLG3gofzwIM2Dw81C65C8ioQgCB3',NULL,'104.23.197.133','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoicnVvYnVXNzVldTMzVTNPaFBmWm9OSWVWWGFsVUxrSlNIVmtnQkJFcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770606230),
('NRae75vtRMVeHgM7ih34SCIl0hFuSPpCrSMXhhfw',NULL,'172.71.194.24','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMUhXR3JFbVV5ZklORkt3RThKcVFkM1VIbXh6QVRVcjNVdWJrUlJhbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770610836),
('OLGWvlU3xidsk90gNC5zBPWObEGifQaFhkBAaT5c',NULL,'104.23.211.101','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiOU9SdGU1c1NXcFFlSlJlUHdCUlI4UmxwMFM4Y3dPSktRRENtenozWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770608690),
('padAD8VBTarsUBs3rG6ZkfnZMBYrIFYUi309F6Wd',NULL,'104.23.197.132','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWUVORmZWRk9qYXBCMkljOGc2UmZrMGJFVE9UR1BrYXJUUmxMUkY1ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770600682),
('QshbNPjxDO7FEI82Ant49UiASuijSxjnYoWjc7xg',NULL,'172.71.223.160','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZHB1YVZXWDJNak1nakY3NmJpa0dKTE1vemMxQVVmQ0ZjOVQ0Z3dGRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770602843),
('qzHLsrdJsCheJgREEVRePxhyJte9BkPIb30ncn6D',NULL,'172.71.223.159','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiblVROHZjWURyZzB0ZDJ3R1llYTRiMWU3bUNzOElwTlc1MVUwdzZBNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770612685),
('r0QhBoiSVY1WxVOpwWN7jnQYGKGstC1e8TGUlA26',NULL,'172.70.35.165','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiNmdpMTZvaUdPM0FDQmdzNGlLVmx6VG90QkpOOWphOURtQ3dtZ0FmVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770610224),
('SNr0hqlK4v7snCFR4RKvKKrVRZ2x0jUliFUpPMgS',NULL,'172.70.38.228','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoic3pzUnZlN0VoQU52Y1JGVFY0SnlOQnJLalZVQ2Z2OEZ1dzR1eDlPTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770607466),
('T2x9r0ttTN1SNh8D66p9z50MrAkxFmlZNdM3k5i5',NULL,'172.68.244.180','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQmJhZ3NGSmxOTUcxWlJDZXdwT2FHdmJmelZOemQxakp3RTQ3SHhaSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770601300),
('tcwSR2LQieZy8tiLR7lzqba75x6aaeCeMlSu5XuC',NULL,'172.71.191.81','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1NUR1hURnNUQ3ZXSnNWU0NqNkhGRHNmMlg0MkZPeEpHZFZBalBMRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770606543),
('TCzffPcBHbtkDcSTw5MvGvGppGCEKcPeeZMyD6ao',NULL,'104.23.243.139','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRXl5UEhEM2lzM3h3NjR0S3duajZxTGZsbWpWR1h0VWhaUVRXdlI4MyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770600377),
('tMneFOX8h7zXYneWHvMUgw6Jjn7LAaSQeHTXGTgV',NULL,'172.71.223.160','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiV0RoRmM3NlV1ZGkzRTFpWU01Z2RIQUx0WDdzN3VCMEt3cDVkZXBobyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770604994),
('uEDC3l6U8gMlFdI7g49OzvmIzQwXvLNqG1FgO8QL',NULL,'172.70.38.228','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiR0ZiS0tDSjRpV2tmQlNYVGFBdnBHWHFwVjBhamxwQWVuMWxtTk5kNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770602235),
('UTiKmznMq9toTrmUXVIioUoL5oQbjV4Rn2Y0WgE8',NULL,'172.70.134.213','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRWlvdTJSMGo0ak54YnRlVU5QQjA3bjM5MUF1VXVJM05YZ1F5RTNoUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770605299),
('w2u5JM6Urn76e5dPoQZMnG0pIOVRRcJRQXqH6gM1',NULL,'104.23.243.138','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMjBzYmh4ZXdrSTRjZHBpTHVabXBpcEtmTE9ObVFRTExxN0dNYnpsOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770603764),
('w9YBRVaUUbqrkUifPiUsXrVxGV51co11uxbsNb1L',NULL,'104.23.243.139','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiVW9ZR0NVZ1A4YlR5aE1ZNDY4bXJlMjd1NjdRcXNadW5JZGdlSUtZNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770607162),
('waRPb2E7pJzCqUKyQt1yexEhfTF8N0GnoE0fkJuQ',NULL,'172.68.245.82','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiT3RSNGxoYXRndklPd3BkclJjWUZ6ZkhSYmFXOUZ3S1FUaHVodnVmeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770611445),
('WLctJ4jhkZxL9GXF8qSc4QcZQXlifbUuc079xYs5',NULL,'172.70.43.54','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoibExaeGRURXhpSzVTMmx2dkdkMEdPYThZdkJtUHh0WnBuazJSZjNyaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770603149),
('XtIoj3oekD4bgLdmKsLkwT7uI8Vmkpxql5C3bFx9',NULL,'172.71.95.146','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGszRERYMFN5eTZhVkh6MmlEcWROYmJoNEY4Y0NLUXo3YVRoRGcwdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vc3BhcnRhLm15LmlkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770603639),
('ZdiP8URe5P8HM8juGBGqvMlFN4yyTUpJbPOs9DVg',NULL,'104.23.211.100','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSjF1anNNNWllN244eFRqOTRyUm5LQzQ3Tm9Gb0k3N2I0REJubTNTbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770611761),
('ZX1wAmKagPyjcKhHswUuLfgBW6iVUXhJD18VUyNX',NULL,'172.71.194.25','Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWlRiOFF1OFRDdXlUcUhyZExvS2pONEl0M29iRmRIREJZRW1oVlh6NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770605613);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL DEFAULT 0,
  `available` int(10) unsigned NOT NULL DEFAULT 0,
  `borrowed` int(10) unsigned NOT NULL DEFAULT 0,
  `lost` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `damaged` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES
(1,1,175,139,36,0,'2026-01-02 08:44:19','2026-01-05 02:57:42',0),
(2,2,171,151,20,0,'2026-01-02 08:44:19','2026-01-05 02:50:30',0),
(3,3,171,148,23,0,'2026-01-02 08:44:19','2026-01-05 03:03:44',0),
(4,4,171,151,20,0,'2026-01-02 08:44:19','2026-01-05 02:47:37',0),
(5,5,384,368,16,0,'2026-01-02 08:44:19','2026-01-05 02:41:39',0),
(6,6,154,154,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(7,7,174,174,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(8,8,174,174,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(9,9,12,12,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(10,10,45,45,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(11,11,8,8,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(12,12,50,49,1,0,'2026-01-02 08:44:19','2026-01-05 02:19:48',0),
(13,13,15,15,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(14,14,30,30,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(15,15,20,20,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(16,16,25,25,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(17,17,18,18,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(18,18,40,40,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(19,19,10,10,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(20,20,22,22,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(21,21,14,14,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(22,22,15,15,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(23,23,25,25,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(24,24,35,35,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(25,25,9,9,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(26,26,28,28,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(27,27,30,30,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(28,28,20,20,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(29,29,10,10,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(30,30,8,8,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(31,31,15,12,3,0,'2026-01-02 08:44:19','2026-01-05 02:19:47',0),
(32,32,25,25,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(33,33,30,30,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(34,34,40,40,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(35,35,100,100,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(36,36,85,85,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(37,37,5,5,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0),
(38,38,12,12,0,0,'2026-01-02 08:44:19','2026-01-02 08:44:19',0);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `nisn` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kelas_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`nisn`),
  KEY `users_kelas_id_foreign` (`kelas_id`),
  CONSTRAINT `users_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(0,'Wulan Grasella ruma gorga','gandamanalu@gmail.com',NULL,'$2y$12$Tn2hHsiHg8jEhupk.wQ4zuapAimbEUAtz1yi/7D49fWbLZ6zo/BYC',NULL,'2026-01-05 02:03:59','2026-01-05 02:03:59',NULL),
(66,'Putrianitaelisabetlumbantobing','putrianitaelisabet@gmail.com',NULL,'$2y$12$JyVXMAdk6AlgVUOXbVPrf.xcmDtev38mdGJHOrDWlpVWK0CD7AmrG','7FVetFu62jb4WsIwjLQAn1cWhopXhrvI4rVWa9NNMgGZDhbD5FMqyl2WtE7H','2026-01-05 02:08:02','2026-01-05 02:08:02',2),
(7000,'Abel sidabutar','lasmamanalu2411@gemail.com',NULL,'$2y$12$EiMEiiGrFDGlepHwtiQIU.hgfBM3Fs49FBgTDlC6bO8io7.z6W7hC',NULL,'2026-01-05 02:08:31','2026-01-05 02:08:31',NULL),
(400066,'Sarma ito hutabarat','sarmaitohutabarat567@gmail.com',NULL,'$2y$12$nRxNNGFnbTZXrVu9X9fXy.8o/jzRCjFkja11M3gySZF1VLhFwnJBC',NULL,'2026-01-05 02:12:24','2026-01-05 02:12:24',2),
(500000,'Given lasro bakara','shelasitumeang@gmail.com',NULL,'$2y$12$8anHLOVGfZ97PEQCl1kmregq9YFctkNFBVBy6b4cEhRHaYeVE.65C',NULL,'2026-01-05 02:12:13','2026-01-05 02:12:13',NULL),
(101010101,'Markus Lefran Sipahutar','lisbethutagalung022@gmail.com',NULL,'$2y$12$xKeX3audJ1TB9j9LOKB0O.70EeCjMjbAHkO7Jz89ZL6I1wNnbO6nq',NULL,'2026-01-05 02:13:06','2026-01-05 02:13:06',2),
(101126703,'Kezia Margarita Eklesia','wenkexing0710@gmail.com',NULL,'$2y$12$OEiF3plNuH/.DYXLDKFMYOMkjAj1v3KLP0DDz/8VzKYGEZaKiGTBq',NULL,'2026-01-05 02:45:17','2026-01-05 02:45:17',3),
(103942364,'LAMBOK BERUNTUNG PATOLU SITORUS','lambok.beruntung32@smp.belajar.id',NULL,'$2y$12$GAGSLqBdND5LfDo0I/PtzO/AfUxepF1tVwZDHt0nlDuDvuBqhtO1K',NULL,'2026-01-05 02:45:21','2026-01-05 02:45:21',3),
(105146468,'Juni Lumbantoruan','junilumbantoruan34@gmail.com',NULL,'$2y$12$1cUIWk5gwcdkdydwTffi2.0wrfPqA6HZAV0rRE8zO7qkzSpdthx76',NULL,'2026-01-05 02:46:51','2026-01-05 02:46:51',NULL),
(108569443,'Jesyka Hutauruk','jessyhtrk@gmail.com',NULL,'$2y$12$Nu4Ert0zKuqnEaHHfXYz3Ox35ldgRZD62jw5B2yQ9zZTDFeYP.ln2',NULL,'2026-01-05 02:45:32','2026-01-05 02:45:32',3),
(109651990,'Intan syaputri Hutasoit','intanhutasoit2011@gmail.com',NULL,'$2y$12$gG.p6PRVkkQT/EPZTkTYcOBkuHZ3tj4Q9hhqYEL80HdETGO1YLdoW',NULL,'2026-01-05 02:46:37','2026-01-05 02:46:37',NULL),
(111691116,'Crisvan Sinaga','crisvanbotak1245@gmail.com',NULL,'$2y$12$mdnB1ItAtXMeVmUHupqxyOfEhlMurrfpLY65fPxJq33JiS1iA90M6',NULL,'2026-01-05 02:48:23','2026-01-05 02:48:23',NULL),
(111719311,'Clara Genova Aritonang','clraritonang@gmail.com',NULL,'$2y$12$LXj.zDNZVuVJgJaRkiW5Z.1uaOGi91Mbrk7jWsObvNcaIe1rreZwu',NULL,'2026-01-05 02:38:17','2026-01-05 02:38:17',3),
(112018823,'winner Amstrong Situmorang','winner@gmail.com',NULL,'$2y$12$/sbXo3GKPtwh7/JsLwJ7NOygIivEK9mD.hyvZ3UnxtNxxt57YsEcK',NULL,'2026-01-05 02:47:48','2026-01-05 02:47:48',NULL),
(112303920,'Nirvana Lumban Tobing','nirvanabondol25@gmail.com',NULL,'$2y$12$Rv9Dqoot7VcNi72cJFtrL.TEitHDQFtxmS6q9CCqbPI7gXpzTxgcC',NULL,'2026-01-05 02:45:47','2026-01-05 02:45:47',NULL),
(112419239,'Devi ayu octa viani','octadeviayu@gmail.com',NULL,'$2y$12$zO/GBiVX95U1EDRyDMIgI.qTUxfLY5wQnfhrt/o3ZL9fvrcTqB8tG',NULL,'2026-01-05 02:02:55','2026-01-05 02:02:55',1),
(113139823,'George William Rafael Hutapea','htpeawiliamrafael@gmail.com',NULL,'$2y$12$knyRysMvLi5E54RI2/L9xuFwfrCM.stEeP8eedbQhmdsMCAeHnwsa',NULL,'2026-01-05 02:50:09','2026-01-05 02:50:09',3),
(114297558,'Daniello Lumban Gaol','lgello570@gmail.com',NULL,'$2y$12$U3ttpJkS0IHwTpvGTVQ39O5cgQAtDfdvLPPuKoZPZby9FWT8NYg3S',NULL,'2026-01-05 02:10:40','2026-01-05 02:10:40',NULL),
(116506176,'Sonya Gita sela Lumbantobing','sonyagitasela@gmail.com',NULL,'$2y$12$6bV6tReUgJkObMVJZpZZbulQC/L6c4KsH3uKjftOc0zrjbTMDs.4m',NULL,'2026-01-05 02:42:48','2026-01-05 02:42:48',NULL),
(117724276,'Tiara Anjeli Lumbantobing','tiara@gmail.com',NULL,'$2y$12$uePNF.r3eTGFaICF6zWzO.Nd5QS8ucNUO8VFLq6KSwNJtF5BgYoEm',NULL,'2026-01-05 02:41:24','2026-01-05 02:41:24',3),
(118053102,'Nofelita Simanungkalit','ruhutsimanungkalit41@gmail.com',NULL,'$2y$12$w1fdUaENdyFYflpnTmqv.eCDflSNoMHKaXXNT7aWeq7jyVHE2CkAe',NULL,'2026-01-05 02:11:47','2026-01-05 02:11:47',NULL),
(118345378,'Indra Hartono Pasaribu','indrahartonopasaribu1010@gmail.com',NULL,'$2y$12$bB5ETEPUcz/j1t4.4tx3YutEe2ylaDu19H5qgSA6c9PWo4xr97Ad2',NULL,'2026-01-05 02:42:56','2026-01-05 02:42:56',NULL),
(118584370,'Vanrey Batubara','vanreybatubara77@gmail.com',NULL,'$2y$12$ZfcrgZF96/pto135He94A.FjG4xyDr2YC0ewYf7SscL.C4lFM32Q6',NULL,'2026-01-05 02:08:33','2026-01-05 02:08:33',2),
(118882376,'ARIANA GRANDE','arianagrande@gmail.com',NULL,'$2y$12$0htJDcg8VMbfyrAqyOVCu.Sv282xNdg4p/V9Mk4M8Pspa078nVovC',NULL,'2026-01-05 02:50:13','2026-01-05 02:50:13',3),
(119500374,'Rahel Raisa Nadeak','rahelnadeak@gmail.com',NULL,'$2y$12$sF8MqEdRPFwVeCWAwFq8JOP7vru7OknSACOpqxp8XUoc/K6Up//om',NULL,'2026-01-05 02:43:48','2026-01-05 02:43:48',3),
(119832414,'TULUS MICHAEL NAPITUPULU','tulusmichael305@gmail.com',NULL,'$2y$12$BFa3jq7ErinRidC7kR7qx.XiNSGmNk8LKysOUntPglbpq8W8w4wEu','iHVdeiLGaGJo1zgUeOy9P7eB9OyHcO5plNsWROUz7mFlv5u6M25eVA1hO1QF','2026-01-05 02:39:00','2026-01-05 02:39:00',NULL),
(119955185,'thrisna Kesya simamora','thrisnakesyasimamora@gmail.com',NULL,'$2y$12$2tphQ1iuBvqJoJiLS6Y31uXaUg0kfvj6oxAJhLJ4nz1OK8EKhw5nG',NULL,'2026-01-05 02:39:19','2026-01-05 02:39:19',NULL),
(123087907,'Ruth anungrah hutagalung','ruth@gmail.com',NULL,'$2y$12$DIqvPsOiqfhSjNhem4wENuvaPQIi72XUMrfedVJTGY8fkooJ9/DCu',NULL,'2026-01-05 02:16:20','2026-01-05 02:16:20',NULL),
(123456789,'Test','adm1in@example.com',NULL,'$2y$12$AvbpPcCUPRpoubZTB18R7u3iwQEw2wNBYkGosbU/veghlVszXBZyO',NULL,'2026-01-05 01:57:47','2026-01-05 01:57:47',NULL),
(123617657,'Novitha marsauli sianturi','hutagurgurpartangga@gmail.com',NULL,'$2y$12$RV6PfWbWdK2ZSX5VbyLMaOri7uxb93S/ogPuvDvIgguMdunUnaxv2',NULL,'2026-01-05 02:02:20','2026-01-05 02:02:20',NULL),
(123710110,'Anggun Muramonika Hutapea','anggun@gmail.com',NULL,'$2y$12$OM0uS9eJ1ukQW.pyaP3hMupf2.eJTIFNO9ZBnns7I.c7Jl7nqozIK',NULL,'2026-01-05 02:12:09','2026-01-05 02:12:09',2),
(123755789,'Jeanette Gultom','yovitaaagltm14@gmail.com',NULL,'$2y$12$Vz/iOgmiWl7FbuOtLKxkjOQBWOGQMXOIJZAE7F33iZKAC1fX5WyOG',NULL,'2026-01-05 02:15:12','2026-01-05 02:15:12',2),
(125643218,'Amandaevelinpasaribu','evelinamanda@gmail.com',NULL,'$2y$12$XsRXy3MoQTzR7aZQZbSrMeFK0haDFjT8BhSdVJlx1MQyThpEt9qXO',NULL,'2026-01-05 02:15:56','2026-01-05 02:15:56',1),
(126921352,'MEGI YANTO NAPITUPULU','napitupulutulus74@gmail.com',NULL,'$2y$12$dUn9FLX.N59BwCi1zNlIeOvtV5MrcP7Rv8j0/2VIIUIaO9OJKRbXy',NULL,'2026-01-05 02:43:10','2026-01-05 02:43:10',NULL),
(127245455,'naomi kesya sihotang','naomi@gmail.com',NULL,'$2y$12$cYA/Q8UWL68CjPHfutwrt.wsg1UnZh/9XBaz9y.GXKcXnRYhKU43W',NULL,'2026-01-05 02:12:22','2026-01-05 02:12:22',NULL),
(129310087,'Abelia phepyhosa gultom','abheliagultom@gmail.com',NULL,'$2y$12$whu/DeOkab9.QAnlaUn17u/CHKLCfmitI1N4lC7MwkON0kcAlyfRO',NULL,'2026-01-05 02:11:17','2026-01-05 02:11:17',1),
(129720857,'Esra mutiara sipahutar','kaylamanis640@gmail.com',NULL,'$2y$12$/w/mypeYaicVZvqPNid8Te89Ty0aUmFdc96YlWRYScXIkQWgtrGQi',NULL,'2026-01-05 02:12:27','2026-01-05 02:12:27',NULL),
(139096242,'Citra anggicha hutagalung','citrahutagalung@gmail.com',NULL,'$2y$12$bFVNIGWGBEg5SZUbrPxewOuyG4AouSr9oNSRMVAjwsw2iqq5NWH1y',NULL,'2026-01-05 02:11:18','2026-01-05 02:11:18',1),
(207201212,'Amsal Trieven Manik','mesaksimorangkir19@gmail.com',NULL,'$2y$12$H9W2o3Zh/.FxFU8b9zQUu.zemU1o/clFdTpqKLxuewnWfQIDrk88S',NULL,'2026-01-05 02:35:03','2026-01-05 02:35:03',2),
(312456987,'Cristabel kanaya parapat','kanayaparapat@gmail.com',NULL,'$2y$12$42bZQqNm0QTeOo4kFkwnMe4UXI/f8XtM.U9zoUujUlGqKZXgqFhnm',NULL,'2026-01-05 02:44:13','2026-01-05 02:44:13',1),
(987654321,'Isabella batubara','batubaraisabella@gmail.com',NULL,'$2y$12$ExPCkj.zcoU03BTSl4Xcnuifqbo5FZTXwbcw3lDxWg839hdK3ZuxS',NULL,'2026-01-05 02:11:09','2026-01-05 02:11:09',NULL),
(1010101010,'Jeremy panjaitan','jeremypanjaitane88@gmail.com',NULL,'$2y$12$85nWTLDA4nwBLd0F3HDPouucBNTc90tXAcZhOV7uSSoWbVjAUcyXW',NULL,'2026-01-05 02:12:04','2026-01-05 02:12:04',2),
(1011458012,'Neymar polll','turuuuu@gmail.com',NULL,'$2y$12$sg34eLdPe8nbMZSI4tPprO8YT5wYFXuI/9d.kt0Y8Qf1sn7DMgSEW',NULL,'2026-01-05 02:35:16','2026-01-05 02:35:16',2),
(1096564321,'Rayen','erikrayen@gmail.com',NULL,'$2y$12$0ZC9JvjPaJHDb9JoQ6YcwOrXwSZl3MoaCX9huK7h73Wknqj2fsq/6',NULL,'2026-01-05 02:36:13','2026-01-05 02:36:13',1),
(1111122222,'Anisa Felisa Tampubolon','anisatampubolon366@gmail.com',NULL,'$2y$12$sZI10fQWEfZhGTcOVLf03ePMAFwldqNMEzpUmd2zuEo37sK0IVLwu',NULL,'2026-01-05 02:34:06','2026-01-05 02:34:06',NULL),
(1112223334,'Mona nikeyla sipahutar','esramutiarasipahutar@gmail.com',NULL,'$2y$12$RAxwAOW9HRbnYON7WI2hEuUsB8xcoGAE0p0npq.QmBfQ5lKtwLTZi',NULL,'2026-01-05 02:34:51','2026-01-05 02:34:51',NULL),
(1122334451,'Midukhartonolumbantobing','midukhartonolumbantobing@gmail.com',NULL,'$2y$12$0NCKzpTUl5vGqig4hejC/e.e82xVZi9Ne1segGsIdcX4qtk0jlJlC',NULL,'2026-01-05 02:39:07','2026-01-05 02:39:07',2),
(1122334453,'Midukhartonolumbantobing','midutkhartonolumbantobing@gmail.com',NULL,'$2y$12$8MGXT3fXwIkD3RVkw4z63uYZWh/gkidYWn06t.M9EDXqZ2XnlYVcS',NULL,'2026-01-05 02:42:35','2026-01-05 02:42:35',2),
(1122334455,'Oktovian Sitompul','riyan.5221122012@mhs.unimed.ac.id',NULL,'$2y$12$nMVouUtGTHoTrL5jh10RSeS8v0Z3NRGrb4tKM/oWwOjDNyQwHgeTi',NULL,'2026-01-05 02:12:58','2026-01-05 02:12:58',2),
(1122334466,'Falen Tino Rosci manik','falentinoroscanik234@gmail.com',NULL,'$2y$12$TLe470Kkn3xNhmgO/4uGpuoEcXOYsT7mivpEpVVc6tjpNIuhZZ33y',NULL,'2026-01-05 02:16:57','2026-01-05 02:16:57',2),
(1200192311,'Hartono Silaban','hartonoslb@gmail.com',NULL,'$2y$12$cpZpQ8TrQqlf3S2P/zl/FeJZDKfFF25NxmyaoTvWzLaMQV29Xoewu',NULL,'2026-02-05 11:37:09','2026-02-05 11:37:09',2),
(1230047820,'nunut  Sihombing','juandasihombing683@gmail.com',NULL,'$2y$12$MbhT5Hw.7A43KjAXwtk.CuO4fckyghm/8f4/T7ULc5GOP2YNGOzGC',NULL,'2026-01-05 02:35:27','2026-01-05 02:35:27',1),
(1230062122,'Tasya S Sibagariang','tasyasibagariang708@gmail.com',NULL,'$2y$12$KyrOZKjBlFCh6jCsT/95zOHmbIHgRtt9JdOeAeuLOqvREkDupL.S.',NULL,'2026-01-05 02:11:22','2026-01-05 02:11:22',2),
(1234567123,'hotbin andreas sihotang','hotbin@gmail.com',NULL,'$2y$12$i5Q3pdIEdGd/rfSykeVypeA7sU7PKR/1P.ZLN0qCOXfkw3bhpfF1S',NULL,'2026-01-05 02:42:06','2026-01-05 02:42:06',NULL),
(1234567789,'Stiven sitompuo','stiven@gmail.com',NULL,'$2y$12$22JO4/xN6zlkmlzsyil8QudqJH2T2YsvEES.PmZdsALdC4Dlgkg.S',NULL,'2026-01-05 02:33:27','2026-01-05 02:33:27',2),
(1234567890,'Chris gideon Lumban Tobing','chrisgideon17@gmail.com',NULL,'$2y$12$yzYIIgMPp/Bo14ZL4sMzqufVnmEh3wx/YWVH5B/kRBQ/4QT6dxNum',NULL,'2026-01-05 02:09:46','2026-01-05 02:09:46',2),
(1234567891,'Very Indra Gunawan Simanjuntak','gunawansimanjuntak25@gmail.com',NULL,'$2y$12$b4463GcaFtsDTdFXq0UAVeTF7mjvuNK5LQbMEtA/U6gnWkQGnB09e',NULL,'2026-01-05 02:11:35','2026-01-05 02:11:35',NULL),
(1234567892,'Jodi batubara','jodi@gmail.com',NULL,'$2y$12$DOB6dUd8h4i0pxjrdL/I6umnqvh2T/lJl0lKhXioUml8NiuEJoEGC',NULL,'2026-01-05 02:35:14','2026-01-05 02:35:14',2),
(1234567895,'Irfan m sinaga@gmail.com','irfan@gmail.com',NULL,'$2y$12$fdz2JndrRboqZNaOiaJz9umFvxaSPVQWZwwJKL/mvwq9kfNndXsWG',NULL,'2026-01-05 02:36:17','2026-01-05 02:36:17',2),
(1234759306,'Paulina sitompul','paulinasitompul15@gmail.com',NULL,'$2y$12$4iD2/QNR8tMnrRT1tlZF4.nn3V/FZTEkp//Lhbh10LmCFrjZzbhe2',NULL,'2026-01-05 02:13:08','2026-01-05 02:13:08',2),
(1243576092,'Santi Rani Vincent Silalahi','malaumutiara8@gmail.com',NULL,'$2y$12$YcosAbvqdwoY5vx1mIasyupXq9vahdteFB8CJAFRsicIEp9lbv/xm',NULL,'2026-01-05 02:11:28','2026-01-05 02:11:28',2),
(1245816513,'Regina Putri Hutauruk','reginahutauruk82@gmail.com',NULL,'$2y$12$sPDXfmjJy7H1Ckf3HV.atOw4YohOWspd9WetxBlxK6CZf3meIHn72',NULL,'2026-01-05 02:13:33','2026-01-05 02:13:33',2),
(1272819201,'Adrian Sinaga','adriansng12@gmail.com',NULL,'$2y$12$T3bF9gMyw9.MGo1TzZurZ.5m20fTDZTqoEJnhOJHHMpCY1TbC2mi6',NULL,'2026-02-08 04:14:55','2026-02-08 04:14:55',1),
(1287459834,'Rita snowi batubara','ritasnowibatubara14@gmail.com',NULL,'$2y$12$IpMreoJfU/84jzsUgAbs5O3OSksmHiqFvZoBRExB/DEpLrf.WYlfC',NULL,'2026-01-05 02:33:44','2026-01-05 02:33:44',NULL),
(1324658723,'Gracia purba','deborahutabarat398@gmail.com',NULL,'$2y$12$DGSglYLKezyCoyqTOVht1.QG.h/LDA9fIEDIV6mEB/KJ6qOmMSZcK',NULL,'2026-01-05 02:13:39','2026-01-05 02:13:39',2),
(1345678910,'paskah maria lumbantobing','paskahtobing@gmail.com',NULL,'$2y$12$kjeRa.UuveLnK.AWSwMf9OhHvr69z53/YSfulOCWx9WvBr.MSllW6',NULL,'2026-01-05 02:11:49','2026-01-05 02:11:49',NULL),
(1370198567,'Test Admin','admin@example.com','2026-01-02 08:12:51','$2y$12$1cq5t6DgCO.YpaWM2BLm9epEJDM6pNyyiIARGr6JaiZdSwW2lx4ma','72CwahcubcZSVquQxcK3Q6G47Ecw2qj3kmqemWoJX7784DKXg9Y0Wa43zGIx','2026-01-02 08:12:51','2026-01-02 08:12:51',NULL),
(1562378950,'Nayra Lumaban Tobing','lumbantobingnayra@gmail.com',NULL,'$2y$12$XplBScukpinALygNeb1uOuL6LZI7j0B0FgsSEwYGNHWYXrG0QIEVm',NULL,'2026-01-05 02:35:34','2026-01-05 02:35:34',NULL),
(1568293682,'Terang munthe','malaumutiara8@gmail.co',NULL,'$2y$12$vhOaXWcoW2ffdxSrfbYjnOVOl1tqzwLgo3vkX65ZFTb2tXh/f81ri',NULL,'2026-01-05 02:32:59','2026-01-05 02:32:59',2),
(1765423980,'Fany Febyolah Hutagalung','fanihutagalung2025@gmail.com',NULL,'$2y$12$FgNmE1zSzmceUTwmFE8eYOpp7HGctuGGnG.883D2kBrkCRlEHVp3q',NULL,'2026-01-05 02:12:11','2026-01-05 02:12:11',2),
(1918171615,'Roni Alexander sitinjak','rony08alexander@gmail.com',NULL,'$2y$12$ShCpfpYmtjo7A0br4bNGD.V9Azxolgl7T1lJG7c5J0TOJ24V/8x1y',NULL,'2026-01-05 02:12:37','2026-01-05 02:12:37',2),
(1937496374,'anton','anton@gmail.com',NULL,'$2y$12$TF/pe4Vk6/vEbwmOh9sLoOhF6wZo30ozVP0e.XZsgQ2PTt.LMn/1W',NULL,'2026-01-05 02:41:25','2026-01-05 02:41:25',NULL),
(2167284722,'Test Member','member@example.com','2026-01-02 08:12:51','$2y$12$eUixzJ7NFgSZIXO4zfnh1ux1qEcpr1WVDRFKsoVN3pue90y6HxAze','zcSXIbj6g8','2026-01-02 08:12:52','2026-01-02 08:12:52',NULL),
(2233441109,'Messi batubara','messi@gmail.com',NULL,'$2y$12$YiKEHapBud.gOeLoKj6xz.bvp5Xv965awZgQHA4Ag7hNmhHkmqGs6',NULL,'2026-01-05 02:38:55','2026-01-05 02:38:55',2),
(2315685432,'Megi winata lumbantobing','nama@gmail.com',NULL,'$2y$12$ett174mbBV2XahhOAzxP2.eBGEzUcp3exCQrxMmlRg7/5VKJaEDhK',NULL,'2026-01-05 02:06:37','2026-01-05 02:06:37',2),
(2341523467,'Amara stella','ribka@gmail.com',NULL,'$2y$12$pcnn3vvTH9ht4NaCauIYeOHAR7ZEDpoWOABxfgNR.H96nuoK/WM6W',NULL,'2026-01-05 02:30:48','2026-01-05 02:30:48',2),
(2345678910,'Ridho Lumban Tobing','chrismonton122@gmail.com',NULL,'$2y$12$lOob0oHJE2FO.OsJFUdL4eqoR4LS0BNMOpOh.PO1YyJcveBmW9lr2',NULL,'2026-01-05 02:32:49','2026-01-05 02:32:49',2),
(2358964186,'Laura Tasya siregar','llaurasiregar@gmail.com',NULL,'$2y$12$mot7fvh8nuX6I3KcRqaaw.fWOxjyjoU/idtcx7dYon7f.zEvTiJrW',NULL,'2026-01-05 02:13:32','2026-01-05 02:13:32',2),
(2470742246,'Lorentino Sinaga','loren125@gmail.com',NULL,'$2y$12$ppeAKgNl.XjhSkMbeIAk9O0HVzKOZYO9jqvyYfTtksZys512vDila',NULL,'2026-01-05 02:41:53','2026-01-05 02:41:53',1),
(2563710856,'Tamariska tarihoran','tama@gmail.com',NULL,'$2y$12$dlnG47esPfBWf.74s7MLK.axwiaCDR7.TC8GFiuLlblbxUnrHtfb.',NULL,'2026-01-05 02:34:38','2026-01-05 02:34:38',NULL),
(3138020474,'Maria amanda Simanjuntak','amandasimanjuntak01@gmail.com',NULL,'$2y$12$h09jpKzpIAD4HjnHyN8UAeQ2UImUTgfycOFuenY8Mo8vXMvUIvbP.',NULL,'2026-01-05 02:11:51','2026-01-05 02:11:51',1),
(3245098765,'Iren Marito Hutauruk','iren23@gmail.com',NULL,'$2y$12$pB9yjtQn1/uV6JBCmwT7Z.1ngtUCbVx6k4OB8oTCWi1O.3cWljen6',NULL,'2026-01-05 02:35:05','2026-01-05 02:35:05',1),
(3245790012,'Kronika','kronika12@gmail.com',NULL,'$2y$12$M6tepmabRTXrs7vChUJqF.7h1XhaENIII7GjqbRphhnkG06/tROnm',NULL,'2026-01-05 02:35:06','2026-01-05 02:35:06',3),
(3269168362,'andre nicholas','andre@gmail.com',NULL,'$2y$12$7zVdhwVMbvvGuLTPhhaFdeAE7PhN9pcFhfwR57eR/YgDsR1Yd0pJ6',NULL,'2026-01-05 02:30:03','2026-01-05 02:30:03',NULL),
(3457092341,'Brenda Lumban Tobing','brendalumbantobing36@gmail.com',NULL,'$2y$12$CMfs/lvkN8mbJEZU3JVgWOxUE8EXRVglsRx0oSai0ksQfbkx9zGhi',NULL,'2026-01-05 02:37:06','2026-01-05 02:37:06',NULL),
(3468543678,'Chelsea Maria Valent Sinaga','lamrenta18@gmail.com',NULL,'$2y$12$Z4A7RHfVzaeCF71L2T3uf.hwq5N1Mu4CLhQWX123S8vuT2NFtcofi',NULL,'2026-01-05 02:14:47','2026-01-05 02:14:47',2),
(4545454545,'Hazard silaen','mituu@gmail.com',NULL,'$2y$12$hcJGApF8pKA.JC4o616RsOFGyFnH1FgihGR2Vabir2ydu97C/Uqy6',NULL,'2026-01-05 02:36:09','2026-01-05 02:36:09',2),
(4671839207,'Elia ana sitinjak','sitinjakana30@gmail.com',NULL,'$2y$12$fmy22KTgpKfD9TzHFcmNRebLugvXpUotuEpzPCBxEiZahf5PhzxLS',NULL,'2026-01-05 02:15:17','2026-01-05 02:15:17',2),
(5432167890,'Lamini yamal','tuaktabo@gmail.com',NULL,'$2y$12$YYN9.T5.CggxiZL.hEqI1OrIiyGCG6TTgBzlGaGjtpy5cuHPI8Vna',NULL,'2026-01-05 02:36:06','2026-01-05 02:36:06',NULL),
(5463728190,'Renta','krisnaardianto72@gmail.com',NULL,'$2y$12$R0ImuOfJZBgKt.L4ppht5OtaRl5A/75IKR8P./XehTJ6B2HBxkqMK',NULL,'2026-01-05 02:38:51','2026-01-05 02:38:51',2),
(5671384920,'Viona Pasaribu','valengultom00@gmail.com',NULL,'$2y$12$l1TzHu6pXTDDJ7f/rBvbiu53pTkQA4MMFHsM2FQVahdcJD7PYq70G',NULL,'2026-01-05 02:46:01','2026-01-05 02:46:01',2),
(5839486284,'Valerin Sinaga','antonysinaga2024@gmail.com',NULL,'$2y$12$YbASB3dnUHo7Fc5RCt5gv.OdpyislghUY13zso8Kd5YQziwES5KHS',NULL,'2026-01-05 02:11:32','2026-01-05 02:11:32',2),
(5912343816,'BOYS','manalu@gmail.com',NULL,'$2y$12$znrmuDVW/f2IzUtcLblhYukEOIDYctgP8SB4qlOiXHGD/0rbPVzMS',NULL,'2026-01-05 02:34:56','2026-01-05 02:34:56',NULL),
(5912347691,'Johan marsello manalu','manaluumar923@gmail.com',NULL,'$2y$12$3V.Tcj.LjacgPEmQzGvszuolHLimlDjN.IpDwSa39vczM3WfGX7we',NULL,'2026-01-05 02:11:18','2026-01-05 02:11:18',NULL),
(6281683573,'Diva trlsenda manalu','divamanalu@gmail.com',NULL,'$2y$12$d/hSZeWkGS06K1tqoYsc9eb7E694EF73LDB.A2OJDBuDgq8Q41xxS',NULL,'2026-01-05 02:33:37','2026-01-05 02:33:37',NULL),
(7354891538,'Gabriella tampubolon','elianasitinjak52@gmail.com',NULL,'$2y$12$jtyIYjrfKEjr1WMy9iAZmOLk/5fGXYgJWZ/GLuniJHxmKRxxqtFaa',NULL,'2026-01-05 02:41:13','2026-01-05 02:41:13',2),
(7645892340,'Melsia Aura Lumban Tobing','melsia736@gmail.com',NULL,'$2y$12$MLrvNpWZA24oSgaRtZUZFOIHuyowqNEgZVdSZOWkM98k1CzJscqOK',NULL,'2026-01-05 02:13:32','2026-01-05 02:13:32',2),
(7777777777,'Tohap','tuhap@gmail.com',NULL,'$2y$12$mwoSp09ZYxg3mbY2CKIYH.T9rRLkZI65Aa/lf6sQ9ajTJ1bmsz1o6',NULL,'2026-01-05 02:35:29','2026-01-05 02:35:29',3),
(8301730183,'Natasya Siahaan','natasyasiahaan321@gmail.com',NULL,'$2y$12$NcSgR.kspeD1kawAcOE5B.jM9.nflLprjCRVqMsc8D.fdHQbqIOR2',NULL,'2026-01-05 02:33:09','2026-01-05 02:33:09',NULL),
(8765433190,'Jokowi  dodo','jokowi@gmail.com',NULL,'$2y$12$S4pixkorA0mSDrtjZfeKLe7MySSyBL85YaKWVLMBjuen/B3PpY3Uq',NULL,'2026-01-05 02:33:27','2026-01-05 02:33:27',NULL),
(9238475612,'Gania Hutagalung','laurasiregar@gmail.com',NULL,'$2y$12$iTFgFamq5syvCPUtqstvg.JzO3tGL/sjk6X0ioTEn/6V2f.M0kqVK',NULL,'2026-01-05 02:37:24','2026-01-05 02:37:24',2),
(9284610847,'Angga hutasoit','angga@gmail.com',NULL,'$2y$12$f/ngoNXuJ4IwgO8R3uBrhOdV29CwY8JJZt.3LgJ7BXWJ3TyWTEj46',NULL,'2026-01-05 02:44:30','2026-01-05 02:44:30',NULL),
(9874213695,'Vanzz Sinaga','ardaguler@gmail.com',NULL,'$2y$12$PCXtcU8zSq6OGgHFyndV6OmXXbxzu7GXq554I98uZ8ow.MOEtw9re',NULL,'2026-01-05 02:39:20','2026-01-05 02:39:20',NULL),
(9990001112,'Ronaldo','given@gmail.com',NULL,'$2y$12$KawZ8Gvq/BtsmFocyjDLyeyHJhEGlTeO0hroiGreeBSXm4xo4hZh2',NULL,'2026-01-05 02:36:50','2026-01-05 02:36:50',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-09  4:57:38
