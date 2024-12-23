/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for osx10.20 (arm64)
--
-- Host: localhost    Database: vmarketcrud
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
(4,'2024_12_23_120918_create_suppliers_table',1),
(5,'2024_12_23_120929_create_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_supplier_product_id_foreign` (`product_id`),
  KEY `product_supplier_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `product_supplier_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_supplier_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
INSERT INTO `product_supplier` VALUES
(1,1,6),
(2,1,10),
(3,1,12),
(4,1,18),
(5,1,19),
(6,1,22),
(7,1,27),
(8,1,28),
(9,1,30),
(10,1,39),
(11,3,12),
(12,3,16),
(13,3,20),
(14,3,28),
(15,3,36),
(16,11,4),
(17,11,9),
(18,11,17),
(19,11,29),
(20,11,30),
(21,11,38);
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'ut','Et et sint vel eum error.',416.24,81,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(2,'maiores','Ut reprehenderit unde modi quis.',318.91,37,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(3,'architecto','Voluptatem architecto iure nemo ut in aut.',11.27,49,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(4,'accusamus','Adipisci aliquam iste exercitationem.',156.68,46,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(5,'exercitationem','Commodi magnam nesciunt sunt ut sint.',214.87,55,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(6,'dolorum','Quo quasi eius ipsum laudantium consequatur.',415.24,93,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(7,'voluptatem','Molestiae sint facilis accusamus rem sit repellendus.',451.77,71,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(8,'quo','Distinctio odio ad qui repudiandae in.',610.72,39,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(9,'deleniti','Illo at eum perspiciatis eum magnam dolorum ex quia.',485.70,90,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(10,'tempora','Omnis aliquam dolorum quis nemo eum voluptas nam.',444.76,80,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(11,'omnis','Tempore nobis laudantium reprehenderit facere molestiae.',897.85,70,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(12,'quisquam','Hic dolorem temporibus repellat corrupti officiis modi.',338.23,61,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(13,'atque','Officiis cumque eos itaque quaerat.',50.76,28,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(14,'vel','Ea corporis ea quia.',878.25,25,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(15,'veritatis','Sint est autem quidem temporibus rem libero saepe.',851.69,76,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(16,'ex','Corporis alias ut deserunt nam.',359.86,59,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(17,'suscipit','Voluptatem consectetur voluptatem omnis modi.',852.48,35,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(18,'aut','Fugit eos accusamus nemo.',609.95,95,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(19,'voluptate','Qui autem quia et nam.',728.73,5,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(20,'ipsum','Aut perspiciatis itaque cumque quia.',459.54,86,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(21,'adipisci','Optio repudiandae similique sint nisi deleniti est est.',376.99,20,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(22,'reiciendis','In sed nesciunt libero quis voluptatem sint quo.',564.11,43,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(23,'qui','Nihil voluptas itaque hic qui nobis minus velit.',205.33,31,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(24,'fuga','Velit cumque maiores quos dolorem aliquid.',75.77,56,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(25,'et','Officiis minima recusandae voluptatem facere consequuntur rerum doloremque.',364.50,5,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(26,'earum','Nostrum enim sint incidunt fugit iusto dolorem enim consequatur.',59.30,56,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(27,'cumque','Blanditiis quam earum voluptatem et.',208.84,49,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(28,'ipsam','Minus quia laudantium inventore aut sapiente hic explicabo quia.',632.21,78,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(29,'similique','Cumque sit voluptatem qui architecto voluptas atque.',95.96,76,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(30,'voluptas','Est dolorem non quibusdam nostrum quasi.',449.84,14,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(31,'voluptatem','Omnis enim veritatis magnam tempora.',899.52,22,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(32,'quidem','Fugiat earum officiis nihil hic.',726.65,92,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(33,'ut','Adipisci voluptas ducimus sapiente assumenda corporis libero.',27.21,100,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(34,'voluptate','Dignissimos officia et et ut.',306.35,100,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(35,'dolores','Quas tenetur necessitatibus officiis modi minus velit voluptates.',605.25,85,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(36,'assumenda','Earum eligendi est ut fuga nulla cupiditate est.',960.81,77,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(37,'non','Facere sint accusantium voluptatem voluptas quia sapiente.',369.80,28,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(38,'ipsum','Sit maxime at voluptatem perspiciatis deleniti tempore et.',919.63,81,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(39,'suscipit','Est vero perspiciatis enim.',314.36,19,'2024-12-23 23:26:06','2024-12-23 23:26:06'),
(40,'quam','Et optio dolorum molestiae perspiciatis minus sunt animi.',664.21,14,'2024-12-23 23:26:06','2024-12-23 23:26:06');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
('xZctwlkWWYk5D1ttUvuaYG51A309vEcejfQzcmJr',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiemRMT0djMEhoamFmVzFycWhVMXZRTGhiblJWMnA5cVFFaERybjVTZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdXBwbGllciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1734985683);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES
(1,'O\'Kon, Mayert and Huels','kellie69@example.net','234-456-3345','2594 Oscar Shoal\nStanleyton, LA 40401-2344','Gleichner-Stark','21.999.889/8605-85','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(2,'Schaefer Ltd','doyle.madison@example.net','859-685-9506','48765 Adams Lake Suite 003\nAniyahberg, ID 97898','Weissnat-Mueller','84.382.015/4248-69','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(3,'Keebler-Jenkins','pamela.kozey@example.net','(940) 378-8504','52032 Calista Common\nFunkview, MD 48377','Kuvalis-Windler','87.691.138/5577-90','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(4,'Torp LLC','llegros@example.org','478-254-2382','263 Hills Fort\nNew Graciela, WI 57589','Prosacco-Hammes','41.413.750/6483-35','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(5,'Dicki, Streich and Reynolds','toy.april@example.com','940-435-0869','71344 Lavern Views\nWest Letha, ID 39445-0104','Koelpin LLC','01.515.234/3008-01','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(6,'Feil PLC','rutherford.raegan@example.net','404.231.3674','58550 Rick Mission\nEast Cyrus, AZ 82555','Cruickshank-McGlynn','10.658.128/7752-14','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(7,'Wolff, Strosin and Pollich','aschumm@example.net','+12693257653','257 Stefan Mall Suite 621\nKenyonview, UT 46287','Mante-Wisozk','60.256.710/8302-78','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(8,'Bartoletti, Pagac and Hodkiewicz','bryce.koelpin@example.com','+1 (615) 532-3150','45413 Alice Mill Apt. 164\nLake Macy, FL 11859-8051','Hegmann, Emmerich and Howe','43.809.634/9775-49','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(9,'Kuhn-Beahan','schmeler.chasity@example.org','+1 (719) 352-3933','2154 Johnson Garden\nSouth Hopebury, OR 48656','Kautzer LLC','26.518.870/5682-88','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(10,'Pfannerstill Ltd','rowe.eulalia@example.org','1-857-403-6461','680 Torp Way\nPort Adalberto, WY 34962','Langosh, Pfeffer and Davis','78.714.511/6590-02','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(11,'Homenick Ltd','jayde.prosacco@example.net','662.842.2256','4654 D\'Amore Hollow\nNew Giovaniport, PA 25035','Fahey Group','01.686.600/7626-86','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(12,'Murazik, Goldner and Stoltenberg','lind.otha@example.com','+1-458-754-0068','4970 Koss Lights Suite 754\nNew Katrina, WI 73928','Hagenes-Beatty','60.557.157/1048-45','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(13,'Murray-McLaughlin','mkilback@example.org','240-568-6861','5454 Raegan Mountains\nSouth Calistamouth, MD 36648','Hickle, Morissette and Harris','99.955.872/4519-90','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(14,'Terry and Sons','hugh.skiles@example.net','505-623-4540','215 Lorine Pass\nNew Edwardo, ID 23767-0246','Kozey-VonRueden','48.454.615/2164-84','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(15,'Durgan, Ebert and Ebert','carmen.boyle@example.net','+1-872-299-8434','868 Jackeline Causeway\nLangworthborough, WV 19767-0989','Luettgen, Bernhard and Bayer','46.055.934/0949-56','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(16,'O\'Connell, Frami and Huel','keeling.janice@example.org','+17318752240','682 Adams Freeway Apt. 445\nNorth Hilariomouth, KS 31731-2494','Eichmann-Tillman','34.972.417/0616-19','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(17,'Hartmann Ltd','brenda.friesen@example.com','+1.240.476.4695','974 Dare Summit Suite 352\nSouth Chayabury, IL 99325','Romaguera-Huel','22.891.282/6102-85','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(18,'Ratke LLC','apfannerstill@example.net','1-317-586-2278','681 Erling Turnpike Apt. 201\nWest Dericktown, AK 29492-9238','Turcotte-Turcotte','49.383.094/6746-68','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(19,'Kuhn PLC','pouros.ardith@example.com','210.695.4605','624 Selmer Track\nConnfort, IL 24927','Medhurst-Nitzsche','88.246.248/6875-54','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(20,'Grady-Dooley','durgan.clifton@example.org','+14434239471','235 Goodwin Brooks\nLeschville, VT 29070-0097','Dooley, Wilkinson and Hintz','76.933.335/2890-28','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(21,'Pouros, Marvin and Bosco','roberto58@example.com','+1-321-771-1029','626 Ruecker Crescent\nPort Jessicaton, AL 89945','Marquardt, Upton and Johnson','02.965.192/8492-92','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(22,'Ruecker Ltd','mnader@example.org','+1 (319) 606-1677','77153 Gottlieb Crest Suite 137\nCreminshire, FL 02200-6154','Altenwerth, Reinger and Corwin','54.884.441/5328-04','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(23,'Runte-Connelly','lempi57@example.com','+12288066555','5704 Kenyon Prairie Suite 166\nLake Desiree, SD 26089','Schneider PLC','90.395.485/9997-61','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(24,'Moore-Lakin','cornelius.osinski@example.org','+1 (305) 974-5970','6362 Upton Square\nEast Mossie, MN 69711-1711','Dibbert-Bayer','37.817.572/7762-53','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(25,'Walter, Friesen and Adams','titus42@example.net','(680) 347-9409','479 Katarina Row Suite 423\nLake Marietta, AL 08510-0878','Hagenes, Zieme and Wyman','20.877.946/1539-80','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(26,'Mraz Ltd','rowena.corkery@example.com','1-520-757-0210','747 Marvin Row\nMadisynchester, FL 73156','Beahan Ltd','64.143.344/1160-72','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(27,'Jaskolski-Spinka','zlarson@example.org','878-429-2822','205 Chadd Mountain\nPort Dominique, MT 29557-0406','Armstrong LLC','57.101.661/3080-81','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(28,'Lindgren, Bechtelar and Batz','boehm.dorothy@example.net','+1-712-861-1513','123 Bruen Mountain\nSouth Verniceside, AZ 79172-2590','Weber-Krajcik','82.605.242/3847-17','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(29,'Purdy Inc','nikko40@example.org','+1-516-493-8256','35281 Schumm Island\nMiloberg, NE 23900-0189','Johnston, Hoppe and Gusikowski','81.768.349/8422-81','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(30,'Stroman, Bradtke and Pfannerstill','klocko.heloise@example.org','662-972-7807','16023 Erica Drives Apt. 672\nRhiannonview, TX 74772-1806','White, Bode and Kovacek','78.923.923/0328-03','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(31,'McClure, Nader and Bailey','nschultz@example.net','281.985.2987','338 Turner Forges Suite 449\nKochborough, HI 08020-9161','VonRueden, Cartwright and Dach','76.365.341/2624-82','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(32,'Beer Ltd','marietta16@example.org','901-383-5787','9472 Jeffery Skyway\nWest Seamus, IA 76845','Tromp, Gaylord and Boehm','96.873.767/0693-23','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(33,'Mohr Group','tkeeling@example.com','+1.530.212.4195','409 Royce Parks Apt. 761\nPort Hester, OR 27238','Greenfelder-Greenfelder','54.488.453/6463-32','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(34,'Brekke and Sons','sruecker@example.org','+1 (636) 686-4564','1745 Bernier Spring\nBarrowstown, NE 28320','Flatley, Hane and Kautzer','11.127.052/7727-64','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(35,'Barrows and Sons','wolff.katrine@example.org','240.442.2224','737 Matt View\nKirstenburgh, RI 18990','Ritchie-O\'Conner','99.666.585/5220-42','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(36,'Prosacco-Larkin','huels.robb@example.net','+17018208728','421 Elody Common\nSouth Agustin, AK 66769-2550','Reilly Group','97.469.488/2109-78','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(37,'Stehr PLC','liliana.stehr@example.net','(930) 733-7730','401 Schiller Isle\nEmmerichmouth, NJ 74820-5380','Wilkinson, Tremblay and Douglas','82.092.872/5656-58','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(38,'Swift PLC','flatley.hellen@example.com','+1.540.365.7721','776 Collins Shores Suite 927\nEstevanport, AZ 60166-6630','Beatty Ltd','03.169.280/3005-32','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(39,'Rosenbaum-Stracke','ohammes@example.net','(737) 926-8740','70984 Lucie Crest\nAlejandraland, HI 35924','Shields and Sons','28.157.581/8272-56','2024-12-23 23:26:06','2024-12-23 23:26:06'),
(40,'Gorczany-Collins','schuppe.courtney@example.org','469-545-6838','939 McLaughlin Cove Suite 184\nLake Hoyt, KY 35673','Pfeffer, Weissnat and Kuhn','40.589.190/0943-68','2024-12-23 23:26:06','2024-12-23 23:26:06');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vmarketcrud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-23 17:28:38
