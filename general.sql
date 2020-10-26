USE general;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `currency_code`
--

DROP TABLE IF EXISTS `currency_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '貨幣名稱',
  `country` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '國家',
  `rate` double NOT NULL DEFAULT '1' COMMENT '台幣匯率',
  `commision_rate` double NOT NULL DEFAULT '0' COMMENT '收款幣種為此幣別時收的手續費(以匯出幣種為計價單位)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='國家可使用貨幣幣別,比如越南可收美金和越南盾';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_code`
--

LOCK TABLES `currency_code` WRITE;
/*!40000 ALTER TABLE `currency_code` DISABLE KEYS */;
INSERT INTO `currency_code` VALUES (1,'TWD','TW',1,0),(2,'USD','US',1,0),(3,'VND','VN',1,0),(4,'USD','VN',1,0);
/*!40000 ALTER TABLE `currency_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `often_beneficiar`
--

DROP TABLE IF EXISTS `often_beneficiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `often_beneficiar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 NOT NULL COMMENT '收款人姓名',
  `payee_address` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '根據type有不同格式\n',
  `payee_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '收款人的ID',
  `note` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '備註',
  `user_id` int(11) NOT NULL,
  `receive_bank_id` int(11) DEFAULT NULL COMMENT '對應receive_bank的pk(收款方銀行代號)\\n',
  `payee_type_id` int(11) NOT NULL COMMENT '對照payee_type的pk(收款方式)',
  `payee_relation_id` int(11) NOT NULL DEFAULT '0' COMMENT '對應payee_relation_type的pk(與收款人的關係)\n',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_often_beneficiar_user1_idx` (`user_id`),
  KEY `fk_often_beneficiar_payee_type1_idx` (`payee_type_id`),
  KEY `fk_often_beneficiar_payee_relation_idx` (`payee_relation_id`),
  CONSTRAINT `fk_often_beneficiar_payee_relation` FOREIGN KEY (`payee_relation_id`) REFERENCES `payee_relation_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_often_beneficiar_payee_type` FOREIGN KEY (`payee_type_id`) REFERENCES `payee_type` (`id`),
  CONSTRAINT `fk_often_beneficiar_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='常用收款人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `often_beneficiar`
--

LOCK TABLES `often_beneficiar` WRITE;
/*!40000 ALTER TABLE `often_beneficiar` DISABLE KEYS */;
/*!40000 ALTER TABLE `often_beneficiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payee_relation_type`
--

DROP TABLE IF EXISTS `payee_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payee_relation_type` (
  `id` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收款人關係';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payee_relation_type`
--

LOCK TABLES `payee_relation_type` WRITE;
/*!40000 ALTER TABLE `payee_relation_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `payee_relation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payee_type`
--

DROP TABLE IF EXISTS `payee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payee_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '收款方式\n0:銀行',
  `description` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收款方式描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收款方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payee_type`
--

LOCK TABLES `payee_type` WRITE;
/*!40000 ALTER TABLE `payee_type` DISABLE KEYS */;
INSERT INTO `payee_type` VALUES (1,0,'銀行帳號匯款');
/*!40000 ALTER TABLE `payee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receive_bank`
--

DROP TABLE IF EXISTS `receive_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receive_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `swift_code` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT 'Swift Code',
  `code` varchar(5) CHARACTER SET utf8 NOT NULL COMMENT '台灣銀行代碼',
  `viet_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '名稱(越南)',
  `en_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '名稱(英文)',
  `tw_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '名稱(繁体中文)',
  `sort_num` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_swift_code` (`swift_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='可收款银行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receive_bank`
--

LOCK TABLES `receive_bank` WRITE;
/*!40000 ALTER TABLE `receive_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `receive_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remit_record`
--

DROP TABLE IF EXISTS `remit_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `arc_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `arc_no` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `payee_type` tinyint(4) NOT NULL COMMENT '收款方式,對應table:payee_type\n',
  `id_image_a` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `id_image_b` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `id_image_c` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `real_time_pic` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '即時拍照',
  `e-signature` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '電子簽名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payee_address` varchar(45) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '根據payee_type此欄位有不同格式\\n若payee_type為銀行匯款方式\\n則此欄位即為銀行帳號',
  `receive_bank_id` int(11) NOT NULL,
  `from_currency_id` int(11) NOT NULL COMMENT '匯出國家幣(對應currency_code的pk)',
  `to_currency_id` int(11) NOT NULL COMMENT '收款國家幣(對應currency_code的pk)',
  `from_amount` double NOT NULL,
  `apply_exchange_rate` double NOT NULL COMMENT '使用者申請時當下匯率\n',
  `transaction_exchange_rate` double NOT NULL COMMENT '實際匯款時的匯率\n',
  `fee` double NOT NULL COMMENT '手續費要搭配fee_type\n',
  `fee_type` tinyint(1) NOT NULL COMMENT '手續費計算方式\n0:數量\n1:百分比',
  `discount_id` int(11) DEFAULT NULL,
  `discount_amount` double DEFAULT NULL COMMENT '總折扣金額',
  `transaction_status` tinyint(4) NOT NULL COMMENT '-9:其他錯誤\n-1: 拒絕\n0: 待繳款\n1: 已繳款\n2: 已匯款',
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_remit_record_user1_idx` (`user_id`),
  CONSTRAINT `fk_remit_record_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='匯款紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remit_record`
--

LOCK TABLES `remit_record` WRITE;
/*!40000 ALTER TABLE `remit_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `remit_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '手機號碼',
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '信箱',
  `password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '密碼',
  `gender` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:其他(包括未填)\\n1:男\\n2:女\\n',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `birthday` date DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '會員狀態\\\\n0:草稿會員\\\\n1:正式會員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'','',NULL,0,'2020-10-23 12:50:38','2020-10-23 12:50:38',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_arc`
--

DROP TABLE IF EXISTS `user_arc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_arc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '對應user的pk',
  `country` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '國家',
  `arc_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'ARC姓名',
  `arc_no` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'ARC ID',
  `passport_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '護照號碼',
  `back_sequence` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '背面序號',
  `arc_issue_date` date DEFAULT NULL COMMENT '發證日期',
  `id_image_a` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '證件正面',
  `id_image_b` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '證件反面',
  `id_image_c` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '手持證件照',
  `kyc_status` tinyint(2) DEFAULT '0' COMMENT 'KYC審核狀態, \\\\r\\\\n-1:未通過, \\\\r\\\\n0:未認證,\\\\r\\\\n1:待審核,\\\\r\\\\n2:審核通過;',
  `kyc_status_update_time` timestamp NULL DEFAULT NULL COMMENT 'LV2审核通过时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `fk_user_arc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='使用者KYC資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_arc`
--

LOCK TABLES `user_arc` WRITE;
/*!40000 ALTER TABLE `user_arc` DISABLE KEYS */;
INSERT INTO `user_arc` VALUES (9,11,'','','','','',NULL,'','','',0,NULL,'2020-10-23 12:50:38','2020-10-23 12:50:38');
/*!40000 ALTER TABLE `user_arc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_info_view`
--

DROP TABLE IF EXISTS `user_info_view`;
/*!50001 DROP VIEW IF EXISTS `user_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_info_view` AS SELECT 
 1 AS `id`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `gender`,
 1 AS `birthday`,
 1 AS `status`,
 1 AS `create_time`,
 1 AS `update_time`,
 1 AS `country`,
 1 AS `arc_name`,
 1 AS `arc_no`,
 1 AS `passport_id`,
 1 AS `back_sequence`,
 1 AS `id_image_a`,
 1 AS `id_image_b`,
 1 AS `id_image_c`,
 1 AS `kyc_status`,
 1 AS `kyc_status_update_time`,
 1 AS `register_time`,
 1 AS `auth_platform_id`,
 1 AS `register_type`,
 1 AS `login_platform_emal`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT 'login地區',
  `login_type` tinyint(2) NOT NULL COMMENT '0:平台本身\\n1:FB\\n2:apple\\n3:google\\n4:zalo',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登入時間',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_user_login_log_user_idx` (`user_id`),
  CONSTRAINT `fk_user_login_log_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用戶登入紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_register_type`
--

DROP TABLE IF EXISTS `user_register_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_register_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '對應user的pk',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '平台的名字',
  `auth_platform_id` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '不同平台(FB,Apple...)的id',
  `register_type` tinyint(2) NOT NULL COMMENT '註冊方式\\\\n0:平台本身\\n1:FB\\n2:apple\\n3:google\\n4:zalo\n',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `register_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_user_id_platform_id` (`user_id`,`auth_platform_id`),
  CONSTRAINT `fk_user_register` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='使用者註冊的方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_register_type`
--

LOCK TABLES `user_register_type` WRITE;
/*!40000 ALTER TABLE `user_register_type` DISABLE KEYS */;
INSERT INTO `user_register_type` VALUES (9,11,'Trần ông Minh','3843216462356131',0,'',NULL,'2020-10-23 12:50:38','2020-10-23 12:50:38');
/*!40000 ALTER TABLE `user_register_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `user_info_view`
--

/*!50001 DROP VIEW IF EXISTS `user_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_info_view` AS select `u`.`id` AS `id`,`u`.`phone` AS `phone`,`u`.`email` AS `email`,`u`.`gender` AS `gender`,`u`.`birthday` AS `birthday`,`u`.`status` AS `status`,`u`.`create_time` AS `create_time`,`u`.`update_time` AS `update_time`,`ua`.`country` AS `country`,`ua`.`arc_name` AS `arc_name`,`ua`.`arc_no` AS `arc_no`,`ua`.`passport_id` AS `passport_id`,`ua`.`back_sequence` AS `back_sequence`,`ua`.`id_image_a` AS `id_image_a`,`ua`.`id_image_b` AS `id_image_b`,`ua`.`id_image_c` AS `id_image_c`,`ua`.`kyc_status` AS `kyc_status`,`ua`.`kyc_status_update_time` AS `kyc_status_update_time`,`ur`.`register_time` AS `register_time`,`ur`.`auth_platform_id` AS `auth_platform_id`,`ur`.`register_type` AS `register_type`,`ur`.`email` AS `login_platform_emal`,`ur`.`name` AS `name` from ((`user` `u` join `user_arc` `ua` on((`u`.`id` = `ua`.`user_id`))) join `user_register_type` `ur` on((`u`.`id` = `ur`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
