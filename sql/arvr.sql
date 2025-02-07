-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ry-vue
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_content`
--

DROP TABLE IF EXISTS `ar_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_content` (
  `ar_content_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usage_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `qr_code_id` int DEFAULT NULL,
  PRIMARY KEY (`ar_content_id`) USING BTREE,
  KEY `qr_code_id` (`qr_code_id`) USING BTREE,
  CONSTRAINT `ar_content_ibfk_1` FOREIGN KEY (`qr_code_id`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_content`
--

LOCK TABLES `ar_content` WRITE;
/*!40000 ALTER TABLE `ar_content` DISABLE KEYS */;
INSERT INTO `ar_content` VALUES (7,'虚拟现实体验','纯文本','http://example.com/vr_experience','一个沉浸式虚拟现实体验平台。','1',NULL),(8,'增强现实教育','视频','http://example.com/ar_education','基于AR技术的互动教育应用。','0',NULL),(9,'3D建模软件','图文','http://example.com/3d_modeling','用于创建3D模型的专业软件。','0',NULL),(10,'虚拟旅游','3D场景','http://example.com/virtual_tour','带你环游世界的虚拟旅游应用。','0',NULL),(11,'增强现实游戏','游戏','http://example.com/ar_game','一款支持增强现实的互动游戏。','0',NULL);
/*!40000 ALTER TABLE `ar_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooperation_case`
--

DROP TABLE IF EXISTS `cooperation_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooperation_case` (
  `case_id` int NOT NULL AUTO_INCREMENT,
  `case_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cooperation_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`case_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooperation_case`
--

LOCK TABLES `cooperation_case` WRITE;
/*!40000 ALTER TABLE `cooperation_case` DISABLE KEYS */;
INSERT INTO `cooperation_case` VALUES (1,'智慧医疗平台合作','绿色能源科技有限公司','本案例展示了与绿色能源科技有限公司的合作，共同推进环保能源项目。我们联合研发了高效太阳能发电技术，该技术不仅提高了能源转换效率，还降低了生产成本。通过此次合作，我们成功推动了可再生能源的发展，为环境保护做出了积极贡献。'),(2,'智慧城市交通解决方案合作','未来交通科技有限公司','本案例展示了与未来交通科技有限公司的合作，共同开发智慧城市交通解决方案。通过引入先进的传感技术和数据分析系统，我们成功缓解了城市交通拥堵问题，提高了道路通行效率，为市民提供了更加便捷、安全的出行环境。');
/*!40000 ALTER TABLE `cooperation_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `device_number` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `qr_code_number` int DEFAULT NULL,
  `factory_number` int DEFAULT NULL,
  PRIMARY KEY (`device_number`) USING BTREE,
  UNIQUE KEY `device_name_uindex` (`name`) USING BTREE,
  KEY `qr_code_id` (`qr_code_number`) USING BTREE,
  KEY `factory_id` (`factory_number`) USING BTREE,
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_ibfk_2` FOREIGN KEY (`factory_number`) REFERENCES `factory` (`factory_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (15,'高效离心泵','高效离心泵是一种用于液体输送的设备，广泛应用于化工、制药和食品加工等行业。它具有高效、节能、运行稳定等特点。','1',4,2),(16,'自动化装配线','自动化装配线是一种用于大规模生产的设备，能够自动完成产品的组装、检测和包装等工序。它具有高效、精准、稳定等特点。','0',5,5);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `energy_consumption`
--

DROP TABLE IF EXISTS `energy_consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `energy_consumption` (
  `id` int NOT NULL AUTO_INCREMENT,
  `energy_consumed` decimal(10,2) NOT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` int NOT NULL,
  `month` tinyint NOT NULL,
  `factory_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energy_consumption`
--

LOCK TABLES `energy_consumption` WRITE;
/*!40000 ALTER TABLE `energy_consumption` DISABLE KEYS */;
INSERT INTO `energy_consumption` VALUES (3,5000.00,'kWh','1',2025,5,'4'),(4,3000.00,'m³','2',2024,1,'3'),(5,10000.00,'t','0',2025,1,'5');
/*!40000 ALTER TABLE `energy_consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `equipment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `qr_code_id` int DEFAULT NULL,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`equipment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factory` (
  `factory_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`factory_id`) USING BTREE,
  UNIQUE KEY `factory_name_uindex` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (1,'广东工业大学','大学','lazy','123456','黄山'),(2,'GreenTech','专注于环保产品','张三','13800138000','生态路123号'),(3,'TechInnovate','尖端技术解决方案','李四','13900139000','科技路456号'),(4,'BioLife','有机食品和饮料','王五','13700137000','健康街789号'),(5,'SolarCo','可再生能源解决方案','赵六','13600136000','太阳大道101号');
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (3,'tb_course','课程管理',NULL,NULL,'TbCourse','crud','element-ui','com.ruoyi.system','system','course','课程管理','ruoyi','0','/','{\"parentMenuId\":0}','admin','2025-01-04 16:35:40','','2025-01-07 21:08:04',NULL),(4,'cooperation_case','合作案例',NULL,NULL,'CooperationCase','crud','element-ui','com.ruoyi.school','school','case','合作案例','lazy','0','/','{\"parentMenuId\":2100}','admin','2025-01-09 14:25:40','','2025-01-20 16:33:42',NULL),(6,'factory','工厂',NULL,NULL,'Factory','crud','element-ui','com.ruoyi.ar','ar','factory','工厂','lazy','0','/','{\"parentMenuId\":0}','admin','2025-01-09 14:25:40','','2025-01-24 19:58:08','工厂'),(8,'sandbox_zone','沙盘分区',NULL,NULL,'SandboxZone','crud','element-ui','com.ruoyi.ar','ar','zone','沙盘分区','lazy','0','/','{\"parentMenuId\":0}','admin','2025-01-09 14:25:40','','2025-01-20 17:02:15','沙盘分区'),(9,'vr_carrier','载体',NULL,NULL,'VrCarrier','crud','element-ui','com.ruoyi.vr','vr','carrier','载体','lazy','0','/','{\"parentMenuId\":0}','admin','2025-01-09 14:25:40','','2025-01-24 14:57:58',NULL),(12,'vr_scene','VR场景',NULL,NULL,'VrScene','crud','element-ui','com.ruoyi.school','school','scene','VR场景','lazy','0','/','{\"parentMenuId\":2100}','admin','2025-01-09 14:25:41','','2025-01-20 16:32:55','VR场景'),(13,'work','作品',NULL,NULL,'Work','crud','element-ui','com.ruoyi.vr','vr','work','作品','lazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-09 14:25:41','','2025-01-24 15:23:59','作品'),(21,'vr_exhibit_zone','VR展区',NULL,NULL,'VrExhibitZone','crud','element-ui','com.ruoyi.vr','vr','exhibitZone','VR展区','laazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-09 14:26:34','','2025-01-20 17:03:41',NULL),(22,'vr_showroom','VR展厅',NULL,NULL,'VrShowroom','crud','element-ui','com.ruoyi.vr','vr','showroom','VR展厅','laazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-09 14:26:34','','2025-01-20 17:03:57',NULL),(23,'warehouse_zone','库区',NULL,NULL,'WarehouseZone','crud','element-ui','com.ruoyi.ar','ar','warehouse','库区','laazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-09 14:26:34','','2025-01-20 17:04:17',NULL),(25,'maintenance_record','运维记录',NULL,NULL,'MaintenanceRecord','crud','element-ui','com.ruoyi.ar','ar','maintenance','运维记录','laazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-09 14:26:56','','2025-01-20 17:04:26',NULL),(26,'material','材料',NULL,NULL,'Material','crud','element-ui','com.ruoyi.ar','ar','material','材料信息','lazy','0','/','{\"parentMenuId\":2229}','admin','2025-01-09 14:26:56','','2025-02-06 11:34:16',NULL),(27,'material_transaction','材料出入库单',NULL,NULL,'MaterialTransaction','crud','element-ui','com.ruoyi.ar','ar','materialTransaction','材料出入库单','laazy','0','/','{\"parentMenuId\":2229}','admin','2025-01-09 14:26:56','','2025-01-20 16:43:52',NULL),(28,'material_transaction_detail','材料清单明细',NULL,NULL,'MaterialTransactionDetail','crud','element-ui','com.ruoyi.ar','ar','materialTransactionDetail','材料清单明细','laazy','0','/','{\"parentMenuId\":2216}','admin','2025-01-09 14:26:56','','2025-01-20 16:44:20',NULL),(29,'product','产品',NULL,NULL,'Product','crud','element-ui','com.ruoyi.ar','ar','product','产品信息','laazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-09 14:26:56','','2025-01-20 17:05:02',NULL),(30,'product_transaction','产品出入库单',NULL,NULL,'ProductTransaction','crud','element-ui','com.ruoyi.ar','ar','productTransaction','产品出入库单','laazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-09 14:26:56','','2025-01-20 16:56:08',NULL),(31,'product_transaction_detail','产品清单明细',NULL,NULL,'ProductTransactionDetail','crud','element-ui','com.ruoyi.ar','ar','productTransactionDetail','产品清单明细','laazy','0','/','{\"parentMenuId\":2216}','admin','2025-01-09 14:26:56','','2025-02-06 11:58:44',NULL),(33,'supply_batch','供应批次',NULL,NULL,'SupplyBatch','crud','element-ui','com.ruoyi.ar','ar','supplyBatch','供应批次','laazy','0','/','{\"parentMenuId\":2216}','admin','2025-01-09 14:26:56','','2025-01-20 17:07:22',NULL),(35,'device','设备',NULL,NULL,'Device','crud','element-ui','com.ruoyi.ar','ar','device','设备','lazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-13 11:43:55','','2025-01-22 23:54:36','设备'),(36,'vr_content','VR内容',NULL,NULL,'VrContent','crud','element-ui','com.ruoyi.vr','vr','content','VR内容','lazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-20 14:45:59','','2025-02-07 17:33:06',NULL),(37,'ar_content','AR内容',NULL,NULL,'ArContent','crud','element-ui','com.ruoyi.ar','ar','content','AR内容','lazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-20 15:10:26','','2025-01-22 21:02:04',NULL),(38,'production_batch','生产批次',NULL,NULL,'ProductionBatch','crud','element-ui','com.ruoyi.ar','ar','batch','生产批次','lazy','0','/','{\"parentMenuId\":2229}','admin','2025-01-20 15:10:26','','2025-01-20 17:08:29',NULL),(39,'qr_code','二维码',NULL,NULL,'QrCode','crud','element-ui','com.ruoyi.ar','ar','code','二维码','lazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-20 15:10:26','','2025-01-25 20:27:04',NULL),(40,'vr_material','VR素材',NULL,NULL,'VrMaterial','crud','element-ui','com.ruoyi.school','school','material','VR素材','lazy','0','/','{\"parentMenuId\":2100}','admin','2025-01-20 15:10:26','','2025-02-07 17:42:31','VR素材'),(41,'energy_consumption','能耗清单',NULL,NULL,'EnergyConsumption','crud','element-ui','com.ruoyi.ar','ar','consumption','能耗清单','ruoyi','0','/','{\"parentMenuId\":2044}','admin','2025-01-22 22:22:22','','2025-01-24 22:21:01','能耗清单');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (13,3,'id','课程id','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(14,3,'code','课程编码','varchar(32)','String','code','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(15,3,'subject','课程学科','varchar(32)','String','subject','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(16,3,'name','课程名称','varchar(64)','String','name','0','0','0','1','1','1','1','LIKE','select','',4,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(17,3,'price','价格（元）','int','Long','price','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(18,3,'applicable_person','适用人群','varchar(32)','String','applicablePerson','0','0','0','1','1','1','1','EQ','select','',6,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(19,3,'info','课程介绍','varchar(255)','String','info','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(20,3,'create_time','创建时间','timestamp','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(21,3,'update_time','更新时间','timestamp','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(22,4,'case_id','案例编号','int','Long','caseId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-20 16:33:42'),(23,4,'case_name','案例名称','varchar(255)','String','caseName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-20 16:33:42'),(24,4,'cooperation_unit','合作单位','varchar(255)','String','cooperationUnit','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2025-01-09 14:25:40','','2025-01-20 16:33:42'),(25,4,'description','简介','text','String','description','0','0','0','1','1','1','0','EQ','textarea','',4,'admin','2025-01-09 14:25:40','','2025-01-20 16:33:42'),(33,6,'factory_id','工厂编号','int','Long','factoryId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-24 19:58:08'),(34,6,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-24 19:58:08'),(35,6,'description','简介','text','String','description','0','0','1','1','1','1','0','LIKE','textarea','',3,'admin','2025-01-09 14:25:40','','2025-01-24 19:58:08'),(36,6,'contact_person','联系人','varchar(255)','String','contactPerson','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:25:40','','2025-01-24 19:58:08'),(37,6,'contact_phone','联系电话','varchar(20)','String','contactPhone','0','0','1','1','1','1','0','LIKE','input','',5,'admin','2025-01-09 14:25:40','','2025-01-24 19:58:08'),(38,6,'address','地址','varchar(255)','String','address','0','0','1','1','1','1','1','LIKE','input','',6,'admin','2025-01-09 14:25:40','','2025-01-24 19:58:08'),(41,8,'zone_id','分区编号','int','Long','zoneId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-20 17:02:15'),(42,8,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-20 17:02:15'),(43,8,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:25:40','','2025-01-20 17:02:15'),(44,8,'qr_code_id','二维码编号','int','Long','qrCodeId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:25:40','','2025-01-20 17:02:15'),(45,8,'factory_id','工厂编号','int','Long','factoryId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:25:40','','2025-01-20 17:02:15'),(46,9,'carrier_id','载体编号','int','Long','carrierId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-24 14:57:58'),(47,9,'carrier_name','载体名称','varchar(255)','String','carrierName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-24 14:57:58'),(48,9,'carrier_type','载体类型','int','Long','carrierType','0','0','1','1','1','1','1','EQ','select','vr_carrier_type',3,'admin','2025-01-09 14:25:41','','2025-01-24 14:57:58'),(49,9,'status','载体状态','varchar(50)','String','status','0','0','0','1','1','1','1','EQ','radio','vr_carrier_status',4,'admin','2025-01-09 14:25:41','','2025-01-24 14:57:58'),(50,9,'specifications','规格','text','String','specifications','0','0','1','1','1','1','1','EQ','textarea','',5,'admin','2025-01-09 14:25:41','','2025-01-24 14:57:58'),(51,9,'exhibit_zone_id','展区编号','int','Long','exhibitZoneId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:25:41','','2025-01-24 14:57:58'),(65,12,'scene_id','场景编号','int','Long','sceneId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:41','','2025-01-20 16:32:55'),(66,12,'scene_name','场景名称','varchar(255)','String','sceneName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:41','','2025-01-20 16:32:55'),(67,12,'file_url','文件URL','varchar(255)','String','fileUrl','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:25:41','','2025-01-20 16:32:55'),(68,12,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',4,'admin','2025-01-09 14:25:41','','2025-01-20 16:32:55'),(69,12,'case_id','案例编号','int','Long','caseId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:25:41','','2025-01-20 16:32:55'),(70,13,'work_id','作品编号','int','Long','workId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:41','','2025-01-24 15:23:59'),(71,13,'title','标题','varchar(255)','String','title','0','0','1','1','1','1','1','BETWEEN','input','',2,'admin','2025-01-09 14:25:41','','2025-01-24 15:23:59'),(72,13,'authors','作者列表','text','String','authors','0','0','1','1','1','1','1','BETWEEN','textarea','',3,'admin','2025-01-09 14:25:41','','2025-01-24 15:23:59'),(73,13,'instructor','指导教师','varchar(255)','String','instructor','0','0','1','1','1','1','1','BETWEEN','input','',4,'admin','2025-01-09 14:25:41','','2025-01-24 15:23:59'),(74,13,'award_info','获奖情况','text','String','awardInfo','0','0','1','1','1','1','1','BETWEEN','textarea','',5,'admin','2025-01-09 14:25:41','','2025-01-24 15:23:59'),(75,13,'description','简介','text','String','description','0','0','1','1','1','1','0','BETWEEN','textarea','',6,'admin','2025-01-09 14:25:41','','2025-01-24 15:23:59'),(142,21,'exhibit_zone_id','展区编号','int','Long','exhibitZoneId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:41'),(143,21,'exhibit_zone_name','展区名称','varchar(255)','String','exhibitZoneName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:41'),(144,21,'description','简介','text','String','description','0','0','1','1','1','1','0','EQ','textarea','',3,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:41'),(145,21,'showroom_id','展厅编号','int','Long','showroomId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:41'),(146,22,'showroom_id','展厅编号','int','Long','showroomId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:57'),(147,22,'showroom_name','展厅名称','varchar(255)','String','showroomName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:57'),(148,22,'description','简介','text','String','description','0','0','1','1','1','1','0','EQ','textarea','',3,'admin','2025-01-09 14:26:34','','2025-01-20 17:03:57'),(149,23,'zone_id','库区编号','int','Long','zoneId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','','2025-01-20 17:04:17'),(150,23,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','','2025-01-20 17:04:17'),(151,23,'description','简介','text','String','description','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:26:34','','2025-01-20 17:04:17'),(152,23,'factory_id','工厂编号','int','Long','factoryId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:26:34','','2025-01-20 17:04:17'),(159,25,'record_id','运维记录编号','int','Long','recordId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-01-20 17:04:26'),(160,25,'maintenance_log','运维日记','text','String','maintenanceLog','0','0','1','1','1','1','1','EQ','textarea','',2,'admin','2025-01-09 14:26:56','','2025-01-20 17:04:26'),(161,25,'date','日期','date','Date','date','0','0','1','1','1','1','1','BETWEEN','datetime','',3,'admin','2025-01-09 14:26:56','','2025-01-20 17:04:26'),(162,25,'maintainer_name','维护负责人','varchar(255)','String','maintainerName','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:26:56','','2025-01-20 17:04:26'),(163,25,'equipment_id','设备编号','int','Long','equipmentId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','','2025-01-20 17:04:26'),(164,26,'material_id','材料编号','int','Long','materialId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-02-06 11:34:16'),(165,26,'material_name','材料名称','varchar(255)','String','materialName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:56','','2025-02-06 11:34:16'),(166,26,'material_model','材料型号','varchar(255)','String','materialModel','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','','2025-02-06 11:34:16'),(167,26,'material_description','材料简介','text','String','materialDescription','0','0','1','1','1','1','0','EQ','textarea','',4,'admin','2025-01-09 14:26:56','','2025-02-06 11:34:16'),(168,26,'stock_amount','库存量','int','Long','stockAmount','0','0','0','1','0','1','0','EQ','input','',5,'admin','2025-01-09 14:26:56','','2025-02-06 11:34:16'),(169,26,'warehouse_zone_id','库区编号','int','Long','warehouseZoneId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','','2025-02-06 11:34:16'),(170,27,'transaction_id','单号','int','Long','transactionId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-01-20 16:43:52'),(171,27,'transaction_type','出入库类型','int','Long','transactionType','0','0','1','1','1','1','1','EQ','select','transaction_type',2,'admin','2025-01-09 14:26:56','','2025-01-20 16:43:52'),(172,27,'operator_name','经办人','varchar(255)','String','operatorName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-01-09 14:26:56','','2025-01-20 16:43:52'),(173,27,'warehouse_admin_name','库区管理员','varchar(255)','String','warehouseAdminName','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:26:56','','2025-01-20 16:43:52'),(174,28,'material_id','材料编号','int','Long','materialId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-01-20 16:44:20'),(175,28,'transaction_id','单号','int','Long','transactionId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','','2025-01-20 16:44:20'),(176,28,'quantity','数量','int','Long','quantity','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','','2025-01-20 16:44:20'),(177,28,'transaction_date','日期','date','Date','transactionDate','0','0','1','1','1','1','1','EQ','datetime','',4,'admin','2025-01-09 14:26:56','','2025-01-20 16:44:20'),(178,29,'product_id','产品编号','int','Long','productId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-01-20 17:05:02'),(179,29,'product_name','产品名称','varchar(255)','String','productName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:56','','2025-01-20 17:05:02'),(180,29,'product_model','产品型号','varchar(255)','String','productModel','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','','2025-01-20 17:05:02'),(181,29,'product_description','产品简介','text','String','productDescription','0','0','0','1','1','1','0','EQ','textarea','',4,'admin','2025-01-09 14:26:56','','2025-01-20 17:05:02'),(182,29,'stock_amount','库存量','int','Long','stockAmount','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','','2025-01-20 17:05:02'),(183,29,'warehouse_zone_id','库区编号','int','Long','warehouseZoneId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','','2025-01-20 17:05:02'),(184,30,'transaction_id','单号','int','Long','transactionId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-01-20 16:56:08'),(185,30,'transaction_type','出入库','int','Long','transactionType','0','0','1','1','1','1','1','EQ','select','transaction_type',2,'admin','2025-01-09 14:26:56','','2025-01-20 16:56:08'),(186,30,'operator_name','经办人','varchar(255)','String','operatorName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-01-09 14:26:56','','2025-01-20 16:56:08'),(187,30,'warehouse_admin_name','库区管理员','varchar(255)','String','warehouseAdminName','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:26:56','','2025-01-20 16:56:08'),(188,31,'product_id','产品编号','int','Long','productId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-02-06 11:58:44'),(189,31,'transaction_id','单号','int','Long','transactionId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','','2025-02-06 11:58:44'),(190,31,'quantity','数量','int','Long','quantity','0','0','1','1','1','1','0','EQ','input','',3,'admin','2025-01-09 14:26:56','','2025-02-06 11:58:44'),(191,31,'transaction_date','日期','date','Date','transactionDate','0','0','1','1','1','1','1','EQ','datetime','',4,'admin','2025-01-09 14:26:56','','2025-02-06 11:58:44'),(197,33,'batch_id','批号','int','Long','batchId','1','0','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(198,33,'quantity','数量','int','Long','quantity','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(199,33,'unit','计量单位','varchar(50)','String','unit','0','0','1','1','1','1','0','EQ','input','',3,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(200,33,'production_date','生产日期','date','Date','productionDate','0','0','1','1','1','1','1','BETWEEN','datetime','',4,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(201,33,'shelf_life','保质期','int','Long','shelfLife','0','0','1','1','1','1','0','EQ','input','',5,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(202,33,'manufacturer','生产厂家','varchar(255)','String','manufacturer','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(203,33,'material_id','材料编号','int','Long','materialId','0','0','1','1','1','1','1','EQ','input','',7,'admin','2025-01-09 14:26:56','','2025-01-20 17:07:22'),(211,35,'device_number','设备编号','int','Long','deviceNumber','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-13 11:43:55','','2025-01-22 23:54:36'),(212,35,'name','名称','varchar(100)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-13 11:43:55','','2025-01-22 23:54:36'),(213,35,'description','简介','text','String','description','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2025-01-13 11:43:55','','2025-01-22 23:54:36'),(214,35,'status','设备状态','varchar(20)','String','status','0','0','0','1','1','1','1','EQ','radio','device_status',4,'admin','2025-01-13 11:43:55','','2025-01-22 23:54:36'),(215,35,'qr_code_number','二维码编号','varchar(100)','String','qrCodeNumber','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-13 11:43:55','','2025-01-22 23:54:36'),(216,35,'factory_number','工厂编号','varchar(50)','String','factoryNumber','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-13 11:43:55','','2025-01-22 23:54:36'),(217,36,'vr_content_id','VR内容编号','int','Long','vrContentId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(218,36,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(219,36,'category','类别','enum(\'文本\',\'图片\',\'动画\',\'声音和视频\',\'3D模型\',\'VR场景\')','String','category','0','0','1','1','1','1','1','EQ','select','vr_content_category',3,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(220,36,'file_url','文件URL','varchar(500)','String','fileUrl','0','0','1','1','1','1','0','EQ','textarea','',4,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(221,36,'description','简介','text','String','description','0','0','1','1','1','1','1','LIKE','textarea','',5,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(222,36,'usage_status','使用情况','varchar(50)','String','usageStatus','0','0','0','1','1','1','1','EQ','radio','use_status',6,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(223,36,'carrier_id','载体编号','int','Long','carrierId','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(224,36,'work_id','作品编号','int','Long','workId','0','0','0','1','1','1','1','EQ','input','',8,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(225,36,'created_at','创建时间','timestamp','Date','createdAt','0','0','0','0','0','0','0','EQ','datetime','',9,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(226,36,'updated_at','更新时间','timestamp','Date','updatedAt','0','0','0','0','0','0','0','EQ','datetime','',10,'admin','2025-01-20 14:45:59','','2025-02-07 17:33:06'),(227,37,'ar_content_id','AR内容编号','int','Long','arContentId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(228,37,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(229,37,'category','类别','enum(\'文本\',\'图片\',\'动画\',\'声音和视频\',\'3D模型\',\'VR场景\')','String','category','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(230,37,'file_url','文件URL','varchar(500)','String','fileUrl','0','0','1','1','1','1','0','EQ','textarea','',4,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(231,37,'description','简介','text','String','description','0','0','1','1','1','1','0','EQ','textarea','',5,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(232,37,'usage_status','使用情况','varchar(50)','String','usageStatus','0','0','0','1','1','1','1','EQ','select','use_status',6,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(233,37,'qr_code_id','二维码编号','int','Long','qrCodeId','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-01-20 15:10:26','','2025-01-22 21:02:04'),(234,38,'batch_id','批号','int','Long','batchId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-20 15:10:26','','2025-01-20 17:08:29'),(235,38,'quantity','数量','int','Long','quantity','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-20 15:10:26','','2025-01-20 17:08:29'),(236,38,'unit','计量单位','varchar(50)','String','unit','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-20 15:10:26','','2025-01-20 17:08:29'),(237,38,'production_date','生产日期','date','Date','productionDate','0','0','1','1','1','1','1','EQ','datetime','',4,'admin','2025-01-20 15:10:26','','2025-01-20 17:08:29'),(238,38,'shelf_life','保质期','int','Long','shelfLife','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-20 15:10:26','','2025-01-20 17:08:29'),(239,38,'product_id','产品编号','int','Long','productId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-20 15:10:26','','2025-01-20 17:08:29'),(240,39,'qr_code_id','二维码编号','int','Long','qrCodeId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-20 15:10:26','','2025-01-25 20:27:04'),(241,39,'qr_code','二维码内容','varchar(255)','String','qrCode','0','0','1','1','1','1','1','EQ','imageUpload','',3,'admin','2025-01-20 15:10:26','','2025-01-25 20:27:04'),(242,39,'usage_status','使用情况','varchar(50)','String','usageStatus','0','0','1','1','1','1','1','EQ','radio','use_status',4,'admin','2025-01-20 15:10:26','','2025-01-25 20:27:04'),(243,40,'vr_material_id','VR素材编号','int','Long','vrMaterialId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-20 15:10:26','','2025-02-07 17:42:31'),(244,40,'name','素材名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-20 15:10:26','','2025-02-07 17:42:31'),(245,40,'category','类别','enum(\'文本\',\'图片\',\'动画\',\'声音和视频\',\'3D模型\',\'VR场景\')','String','category','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-20 15:10:26','','2025-02-07 17:42:31'),(246,40,'file_url','文件URL','varchar(500)','String','fileUrl','0','0','1','1','1','1','1','EQ','textarea','',4,'admin','2025-01-20 15:10:26','','2025-02-07 17:42:31'),(247,40,'description','简介','text','String','description','0','0','1','1','1','1','1','EQ','textarea','',5,'admin','2025-01-20 15:10:26','','2025-02-07 17:42:31'),(248,40,'scene_id','场景编号','int','Long','sceneId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-20 15:10:26','','2025-02-07 17:42:31'),(251,41,'unit','计量单位','varchar(50)','String','unit','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-22 22:22:22','','2025-01-24 22:21:01'),(254,41,'factory_id','工厂编号','int','String','factoryId','0','0','1','1','1','1','1','EQ','input','',7,'admin','2025-01-22 22:22:22','','2025-01-24 22:21:02'),(255,41,'id','编号','int','Long','id','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'','2025-01-22 23:11:38','','2025-01-24 22:21:01'),(256,41,'energy_consumed','能耗','decimal(10,2)','BigDecimal','energyConsumed','0','0','1','1','1','1','1','EQ','input','',2,'','2025-01-22 23:11:38','','2025-01-24 22:21:01'),(257,41,'type','类型','varchar(50)','String','type','0','0','1','1','1','1','1','EQ','select','ar_energy_type',4,'','2025-01-22 23:11:38','','2025-01-24 22:21:02'),(258,41,'year','年度','date','Long','year','0','0','1','1','1','1','1','EQ','input','',5,'','2025-01-22 23:11:38','','2025-01-24 22:21:02'),(259,41,'month','月份','tinyint','Long','month','0','0','1','1','1','1','1','EQ','input','',6,'','2025-01-22 23:11:38','','2025-01-24 22:21:02'),(260,39,'qr_code_name','二维码名称','varchar(50)','String','qrCodeName','0','0','1','1','1','1','1','LIKE','input','',2,'','2025-01-25 20:25:31','','2025-01-25 20:27:04');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_record`
--

DROP TABLE IF EXISTS `maintenance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `maintenance_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date` date DEFAULT NULL,
  `maintainer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `equipment_id` int DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_record`
--

LOCK TABLES `maintenance_record` WRITE;
/*!40000 ALTER TABLE `maintenance_record` DISABLE KEYS */;
INSERT INTO `maintenance_record` VALUES (1,'对高效离心泵进行了常规检查，确认各项参数正常，无异常振动或噪音。更换了润滑油和过滤器，确保设备运行顺畅。','2025-01-14','张三',15),(3,'对高效离心泵进行了深度维护，包括更换磨损的密封件和检查电机状态。调整了泵的运行参数，以确保其在最佳工况下运行。清理了泵体周围的环境，确保通风良好。','2025-01-13','李四',15);
/*!40000 ALTER TABLE `maintenance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `material_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `material_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `stock_amount` int DEFAULT '0',
  `warehouse_zone_id` int DEFAULT NULL,
  PRIMARY KEY (`material_id`) USING BTREE,
  KEY `warehouse_zone_id` (`warehouse_zone_id`) USING BTREE,
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_transaction`
--

DROP TABLE IF EXISTS `material_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` int DEFAULT NULL,
  `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `warehouse_admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_transaction`
--

LOCK TABLES `material_transaction` WRITE;
/*!40000 ALTER TABLE `material_transaction` DISABLE KEYS */;
INSERT INTO `material_transaction` VALUES (1,1,'张三','李五');
/*!40000 ALTER TABLE `material_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_transaction_detail`
--

DROP TABLE IF EXISTS `material_transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_transaction_detail` (
  `material_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  KEY `material_id` (`material_id`) USING BTREE,
  KEY `transaction_id` (`transaction_id`) USING BTREE,
  CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `material_transaction_detail_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `material_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_transaction_detail`
--

LOCK TABLES `material_transaction_detail` WRITE;
/*!40000 ALTER TABLE `material_transaction_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `product_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `product_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `stock_amount` int DEFAULT '0',
  `warehouse_zone_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `warehouse_zone_id` (`warehouse_zone_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'是',' 啊',NULL,1,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_transaction`
--

DROP TABLE IF EXISTS `product_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` int DEFAULT NULL,
  `operator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `warehouse_admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_transaction`
--

LOCK TABLES `product_transaction` WRITE;
/*!40000 ALTER TABLE `product_transaction` DISABLE KEYS */;
INSERT INTO `product_transaction` VALUES (1,1,'李二','王五');
/*!40000 ALTER TABLE `product_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_transaction_detail`
--

DROP TABLE IF EXISTS `product_transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_transaction_detail` (
  `product_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `transaction_id` (`transaction_id`) USING BTREE,
  CONSTRAINT `product_transaction_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_transaction_detail_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `product_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_transaction_detail`
--

LOCK TABLES `product_transaction_detail` WRITE;
/*!40000 ALTER TABLE `product_transaction_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_batch`
--

DROP TABLE IF EXISTS `production_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_batch` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `production_date` date NOT NULL,
  `shelf_life` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`batch_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  CONSTRAINT `production_batch_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_batch`
--

LOCK TABLES `production_batch` WRITE;
/*!40000 ALTER TABLE `production_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_code`
--

DROP TABLE IF EXISTS `qr_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_code` (
  `qr_code_id` int NOT NULL AUTO_INCREMENT,
  `qr_code_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usage_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  PRIMARY KEY (`qr_code_id`) USING BTREE,
  UNIQUE KEY `qr_code_name` (`qr_code_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_code`
--

LOCK TABLES `qr_code` WRITE;
/*!40000 ALTER TABLE `qr_code` DISABLE KEYS */;
INSERT INTO `qr_code` VALUES (4,'建模','https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a58442555494c5a76e8776.png','1'),(5,'游戏','https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a5bb28555497ab2a1d23a8.png','1');
/*!40000 ALTER TABLE `qr_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sandbox_zone`
--

DROP TABLE IF EXISTS `sandbox_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sandbox_zone` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qr_code_id` int DEFAULT NULL,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`zone_id`) USING BTREE,
  UNIQUE KEY `sandbox_zone_name_uindex` (`name`) USING BTREE,
  KEY `qr_code_id` (`qr_code_id`) USING BTREE,
  KEY `factory_id` (`factory_id`) USING BTREE,
  CONSTRAINT `sandbox_zone_ibfk_1` FOREIGN KEY (`qr_code_id`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sandbox_zone_ibfk_2` FOREIGN KEY (`factory_id`) REFERENCES `factory` (`factory_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sandbox_zone`
--

LOCK TABLES `sandbox_zone` WRITE;
/*!40000 ALTER TABLE `sandbox_zone` DISABLE KEYS */;
INSERT INTO `sandbox_zone` VALUES (5,'生产沙盘','这是一个用于模拟和测试各种工业过程的沙盘分区。通过这个沙盘，我们可以更好地理解和优化生产流程，提高生产效率。',4,1);
/*!40000 ALTER TABLE `sandbox_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply_batch`
--

DROP TABLE IF EXISTS `supply_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_batch` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `shelf_life` int DEFAULT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  PRIMARY KEY (`batch_id`) USING BTREE,
  KEY `material_id` (`material_id`) USING BTREE,
  CONSTRAINT `supply_batch_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_batch`
--

LOCK TABLES `supply_batch` WRITE;
/*!40000 ALTER TABLE `supply_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `supply_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-12-24 16:55:23','admin','2025-02-06 14:26:34','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-12-24 16:55:23','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-light','Y','admin','2024-12-24 16:55:23','admin','2025-02-06 14:27:01','深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-12-24 16:55:23','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-12-24 16:55:23','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-12-24 16:55:23','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-12-24 16:55:22','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-12-24 16:55:23','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-12-24 16:55:23','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-12-24 16:55:23','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-12-24 16:55:23','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-12-24 16:55:23','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-12-24 16:55:23','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-12-24 16:55:23','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-12-24 16:55:23','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-12-24 16:55:23','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-12-24 16:55:23','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-12-24 16:55:23','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-12-24 16:55:23','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-12-24 16:55:23','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-12-24 16:55:23','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'停用状态'),(100,0,'JavaEE','0','course_subject',NULL,'default','N','0','ry','2025-01-07 21:06:13','ry','2025-01-07 21:06:45',NULL),(101,1,'Python+大数据','1','course_subject',NULL,'default','N','0','ry','2025-01-07 21:07:03','',NULL,NULL),(102,2,'鸿蒙应用开发','2','course_subject',NULL,'default','N','0','ry','2025-01-07 21:07:25','',NULL,NULL),(103,0,'小白学员','0','course_user',NULL,'default','N','0','ry','2025-01-07 21:23:24','',NULL,NULL),(104,1,'初级开发者','1','course_user',NULL,'default','N','0','ry','2025-01-07 21:23:36','',NULL,NULL),(105,2,'中级开发者','2','course_user',NULL,'default','N','0','ry','2025-01-07 21:23:51','',NULL,NULL),(106,3,'高级开发者','3','course_user',NULL,'default','N','0','ry','2025-01-07 21:24:07','',NULL,NULL),(107,0,'入库','0','transaction_type',NULL,'primary','N','0','admin','2025-01-14 17:40:38','admin','2025-01-21 21:06:37',NULL),(108,1,'出库','1','transaction_type',NULL,'success','N','0','admin','2025-01-14 17:41:05','admin','2025-01-14 19:53:44',NULL),(109,0,'水','0','ar_energy_type',NULL,'default','N','0','admin','2025-01-21 21:06:04','admin','2025-01-21 21:07:46',NULL),(110,1,'电力','1','ar_energy_type',NULL,'default','N','0','admin','2025-01-21 21:06:52','',NULL,NULL),(111,2,'天然气','2','ar_energy_type',NULL,'default','N','0','admin','2025-01-21 21:07:09','',NULL,NULL),(112,0,'展台','0','vr_carrier_type',NULL,'default','N','0','admin','2025-01-21 21:13:21','admin','2025-01-21 21:18:37',NULL),(113,1,'展板','1','vr_carrier_type',NULL,'default','N','0','admin','2025-01-21 21:13:32','admin','2025-01-21 21:18:47',NULL),(114,0,'空置','0','vr_carrier_status',NULL,'primary','N','0','admin','2025-01-21 21:15:01','admin','2025-01-21 21:15:05',NULL),(115,1,'展出','1','vr_carrier_status',NULL,'warning','N','0','admin','2025-01-21 21:15:15','admin','2025-01-21 21:17:47',NULL),(116,0,'未使用','0','use_status',NULL,'info','N','0','admin','2025-01-22 20:46:49','',NULL,NULL),(117,1,'已使用','1','use_status',NULL,'warning','N','0','admin','2025-01-22 20:47:08','admin','2025-01-22 20:47:18',NULL),(118,0,'正常使用','0','device_status',NULL,'primary','N','0','admin','2025-01-22 23:53:46','',NULL,NULL),(119,0,'检修','1','device_status',NULL,'danger','N','0','admin','2025-01-22 23:54:00','',NULL,NULL),(120,0,'文本','文本','vr_content_category',NULL,'default','N','0','admin','2025-01-24 14:26:51','admin','2025-01-24 14:44:01',NULL),(121,0,'图片','图片','vr_content_category',NULL,'default','N','0','admin','2025-01-24 14:27:03','admin','2025-01-24 14:44:09',NULL),(122,0,'动画','动画','vr_content_category',NULL,'default','N','0','admin','2025-01-24 14:27:11','admin','2025-01-24 14:44:14',NULL),(123,0,'声音和视频','声音和视频','vr_content_category',NULL,'default','N','0','admin','2025-01-24 14:27:23','admin','2025-01-24 14:44:22',NULL),(124,0,'3D模型','3D模型','vr_content_category',NULL,'default','N','0','admin','2025-01-24 14:27:39','admin','2025-01-24 14:44:37',NULL),(125,0,'VR场景','VR场景','vr_content_category',NULL,'default','N','0','admin','2025-01-24 14:28:07','admin','2025-01-24 14:44:47',NULL),(126,0,'纯文本','纯文本','ar_content_category',NULL,'default','N','0','admin','2025-01-24 22:02:27','',NULL,NULL),(127,0,'图文','图文','ar_content_category',NULL,'default','N','0','admin','2025-01-24 22:02:37','',NULL,NULL),(128,0,'视频','视频','ar_content_category',NULL,'default','N','0','admin','2025-01-24 22:02:44','',NULL,NULL),(129,0,'3D场景','3D场景','ar_content_category',NULL,'default','N','0','admin','2025-01-24 22:02:56','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-12-24 16:55:23','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-12-24 16:55:23','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-12-24 16:55:23','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-12-24 16:55:23','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-12-24 16:55:23','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-12-24 16:55:23','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-12-24 16:55:23','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-12-24 16:55:23','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-12-24 16:55:23','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-12-24 16:55:23','',NULL,'登录状态列表'),(100,'课程学科','course_subject','0','ry','2025-01-07 21:04:30','ry','2025-01-07 21:22:54','课程学科'),(101,'适用人群','course_user','0','ry','2025-01-07 21:21:59','ry','2025-01-07 21:22:25','适用人群'),(102,'出入库类型','transaction_type','0','admin','2025-01-14 17:36:15','admin','2025-01-21 21:08:07','出入库类型'),(103,'能耗清单类型','ar_energy_type','0','admin','2025-01-21 21:05:15','admin','2025-01-21 21:05:25','能耗清单类型'),(104,'载体类型','vr_carrier_type','0','admin','2025-01-21 21:12:49','admin','2025-01-21 21:14:44','载体类型\n'),(105,'载体状态','vr_carrier_status','0','admin','2025-01-21 21:14:21','',NULL,'载体状态'),(106,'使用情况','use_status','0','admin','2025-01-22 20:46:26','',NULL,'使用情况'),(107,'设备状态','device_status','0','admin','2025-01-22 23:53:29','',NULL,'设备状态'),(108,'VR内容类别','vr_content_category','0','admin','2025-01-24 14:25:15','',NULL,'VR内容类别'),(109,'AR内容类别','ar_content_category','0','admin','2025-01-24 22:02:03','',NULL,'AR内容类别');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-12-24 16:55:24','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-12-24 16:55:24','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-12-24 16:55:24','',NULL,''),(101,'showTime','DEFAULT','mytask.showTime()','0/5 * * * * ?','1','1','1','admin','2025-02-06 14:54:43','','2025-02-06 14:55:52','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (1,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：3毫秒','0','','2025-02-06 14:55:05'),(2,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:05'),(3,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:05'),(4,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:05'),(5,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:05'),(6,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:10'),(7,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:15'),(8,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:20'),(9,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:25'),(10,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：2毫秒','0','','2025-02-06 14:55:30'),(11,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:35'),(12,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:40'),(13,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:45'),(14,'showTime','DEFAULT','mytask.showTime()','showTime 总共耗时：0毫秒','0','','2025-02-06 14:55:50');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2024-12-25 10:57:40'),(101,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-25 10:57:45'),(102,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2024-12-25 16:52:45'),(103,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-25 16:52:48'),(104,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-25 18:28:39'),(105,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-26 14:46:52'),(106,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 15:54:59'),(107,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-03 16:37:05'),(108,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 16:38:09'),(109,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 18:12:51'),(110,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-04 11:03:00'),(111,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-04 16:23:35'),(112,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:09:52'),(113,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:22:50'),(114,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:25:15'),(115,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 20:37:08'),(116,'lazy','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:37:18'),(117,'lazy','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 20:37:33'),(118,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:37:40'),(119,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:38:05'),(120,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:38:40'),(121,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-07 20:38:49'),(122,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:38:54'),(123,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 20:39:55'),(124,'ry','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:40:07'),(125,'ry','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:41:30'),(126,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 12:06:04'),(127,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 14:23:11'),(128,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 16:46:22'),(129,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 18:29:29'),(130,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-10 17:11:42'),(131,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-13 09:40:22'),(132,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-13 13:57:25'),(133,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-13 15:15:57'),(134,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2025-01-14 11:33:00'),(135,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-14 11:33:04'),(136,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-14 11:33:10'),(137,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-16 20:45:19'),(138,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-17 09:18:03'),(139,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-20 14:26:27'),(140,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-20 19:40:10'),(141,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-20 19:40:36'),(142,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-21 19:35:01'),(143,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-21 20:17:07'),(144,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-21 20:17:36'),(145,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-22 09:38:28'),(146,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-24 10:23:14'),(147,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-25 10:24:08'),(148,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-25 15:43:19'),(149,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-26 09:29:43'),(150,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-07 09:14:54'),(151,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-02-07 15:13:17'),(152,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-07 15:14:11'),(153,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-02-07 17:31:43'),(154,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-02-07 17:31:49');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-12-24 16:55:23','',NULL,'系统管理目录'),(2,'系统监控',0,4,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-12-24 16:55:23','admin','2025-01-13 12:01:39','系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-12-24 16:55:23','admin','2025-01-13 12:01:36','系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2024-12-24 16:55:23','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-12-24 16:55:23','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-12-24 16:55:23','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-12-24 16:55:23','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-12-24 16:55:23','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-12-24 16:55:23','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-12-24 16:55:23','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-12-24 16:55:23','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-12-24 16:55:23','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-12-24 16:55:23','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-12-24 16:55:23','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-12-24 16:55:23','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-12-24 16:55:23','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-12-24 16:55:23','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-12-24 16:55:23','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-12-24 16:55:23','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-12-24 16:55:23','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-12-24 16:55:23','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-12-24 16:55:23','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-12-24 16:55:23','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-12-24 16:55:23','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-12-24 16:55:23','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-12-24 16:55:23','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-12-24 16:55:23','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-12-24 16:55:23','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-12-24 16:55:23','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-12-24 16:55:23','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-12-24 16:55:23','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-12-24 16:55:23','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-12-24 16:55:23','',NULL,''),(2035,'课程管理',0,4,'course','course/index',NULL,'',1,0,'C','0','0','course:list','cascader','admin','2025-01-04 17:19:22','admin','2025-02-06 15:16:43','课程管理菜单'),(2036,'课程管理查询',2035,1,'#','',NULL,'',1,0,'F','0','0','system:course:query','#','admin','2025-01-04 17:19:22','',NULL,''),(2037,'课程管理新增',2035,2,'#','',NULL,'',1,0,'F','0','1','system:course:add','#','admin','2025-01-04 17:19:22','admin','2025-02-06 15:21:42',''),(2038,'课程管理修改',2035,3,'#','',NULL,'',1,0,'F','0','0','system:course:edit','#','admin','2025-01-04 17:19:22','',NULL,''),(2039,'课程管理删除',2035,4,'#','',NULL,'',1,0,'F','0','0','system:course:remove','#','admin','2025-01-04 17:19:22','',NULL,''),(2040,'课程管理导出',2035,5,'#','',NULL,'',1,0,'F','0','0','system:course:export','#','admin','2025-01-04 17:19:22','',NULL,''),(2041,'统计分析',0,4,'stasticss',NULL,NULL,'',1,0,'M','0','0','','excel','admin','2025-01-04 17:23:23','admin','2025-01-13 12:01:28',''),(2043,'客户统计',2041,1,'FSFDFSDF',NULL,NULL,'',1,0,'M','0','0','','404','admin','2025-01-04 17:28:01','admin','2025-01-07 20:26:54',''),(2044,'工厂沙盘AR资源',0,1,'arcontent',NULL,NULL,'',1,0,'M','0','0','','chart','admin','2025-01-09 12:12:12','admin','2025-01-20 15:04:04',''),(2099,'学生作品VR应用',0,2,'stuvr',NULL,NULL,'',1,0,'M','0','0','','dict','admin','2025-01-13 10:39:45','admin','2025-01-20 15:04:11',''),(2100,'校企合作应用',0,3,'schooluser',NULL,NULL,'',1,0,'M','0','0','','documentation','admin','2025-01-13 10:40:30','admin','2025-01-13 12:01:20',''),(2149,'运维记录',2044,5,'maintenance','ar/maintenance/index',NULL,'',1,0,'C','0','0','ar:maintenance:list','log','admin','2025-01-14 14:49:08','admin','2025-01-21 20:03:45','运维记录菜单'),(2150,'运维记录查询',2149,1,'#','',NULL,'',1,0,'F','0','0','ar:maintenance:query','#','admin','2025-01-14 14:49:08','',NULL,''),(2151,'运维记录新增',2149,2,'#','',NULL,'',1,0,'F','0','0','ar:maintenance:add','#','admin','2025-01-14 14:49:08','',NULL,''),(2152,'运维记录修改',2149,3,'#','',NULL,'',1,0,'F','0','0','ar:maintenance:edit','#','admin','2025-01-14 14:49:08','',NULL,''),(2153,'运维记录删除',2149,4,'#','',NULL,'',1,0,'F','0','0','ar:maintenance:remove','#','admin','2025-01-14 14:49:08','',NULL,''),(2154,'运维记录导出',2149,5,'#','',NULL,'',1,0,'F','0','0','ar:maintenance:export','#','admin','2025-01-14 14:49:08','',NULL,''),(2162,'库区管理',2044,8,'warehouse','ar/warehouse/index',NULL,'',1,0,'C','0','0','ar:warehouse:list','redis','admin','2025-01-14 17:10:04','admin','2025-01-21 20:04:08','库区菜单'),(2163,'库区查询',2162,1,'#','',NULL,'',1,0,'F','0','0','ar:warehouse:query','#','admin','2025-01-14 17:10:04','',NULL,''),(2164,'库区新增',2162,2,'#','',NULL,'',1,0,'F','0','0','ar:warehouse:add','#','admin','2025-01-14 17:10:04','',NULL,''),(2165,'库区修改',2162,3,'#','',NULL,'',1,0,'F','0','0','ar:warehouse:edit','#','admin','2025-01-14 17:10:04','',NULL,''),(2166,'库区删除',2162,4,'#','',NULL,'',1,0,'F','0','0','ar:warehouse:remove','#','admin','2025-01-14 17:10:04','',NULL,''),(2167,'库区导出',2162,5,'#','',NULL,'',1,0,'F','0','0','ar:warehouse:export','#','admin','2025-01-14 17:10:04','',NULL,''),(2180,'材料信息',2229,1,'material','ar/material/index',NULL,'',1,0,'C','0','0','ar:material:list','date-range','admin','2025-01-14 18:33:39','admin','2025-01-25 22:53:34','材料信息菜单'),(2181,'材料信息查询',2180,1,'#','',NULL,'',1,0,'F','0','0','ar:material:query','#','admin','2025-01-14 18:33:39','',NULL,''),(2182,'材料信息新增',2180,2,'#','',NULL,'',1,0,'F','0','0','ar:material:add','#','admin','2025-01-14 18:33:39','',NULL,''),(2183,'材料信息修改',2180,3,'#','',NULL,'',1,0,'F','0','0','ar:material:edit','#','admin','2025-01-14 18:33:39','',NULL,''),(2184,'材料信息删除',2180,4,'#','',NULL,'',1,0,'F','0','0','ar:material:remove','#','admin','2025-01-14 18:33:39','',NULL,''),(2185,'材料信息导出',2180,5,'#','',NULL,'',1,0,'F','0','0','ar:material:export','#','admin','2025-01-14 18:33:39','',NULL,''),(2186,'材料出入库单',2229,1,'materialTransaction','ar/materialTransaction/index',NULL,'',1,0,'C','0','0','ar:materialTransaction:list','link','admin','2025-01-14 18:33:46','admin','2025-01-25 22:53:56','材料出入库单菜单'),(2187,'材料出入库单查询',2186,1,'#','',NULL,'',1,0,'F','0','0','ar:materialTransaction:query','#','admin','2025-01-14 18:33:46','',NULL,''),(2188,'材料出入库单新增',2186,2,'#','',NULL,'',1,0,'F','0','0','ar:materialTransaction:add','#','admin','2025-01-14 18:33:46','',NULL,''),(2189,'材料出入库单修改',2186,3,'#','',NULL,'',1,0,'F','0','0','ar:materialTransaction:edit','#','admin','2025-01-14 18:33:46','',NULL,''),(2190,'材料出入库单删除',2186,4,'#','',NULL,'',1,0,'F','0','0','ar:materialTransaction:remove','#','admin','2025-01-14 18:33:46','',NULL,''),(2191,'材料出入库单导出',2186,5,'#','',NULL,'',1,0,'F','0','0','ar:materialTransaction:export','#','admin','2025-01-14 18:33:46','',NULL,''),(2198,'供应批次',2229,2,'supplyBatch','ar/supplyBatch/index',NULL,'',1,0,'C','0','0','ar:supplyBatch:list','form','admin','2025-01-14 19:15:33','admin','2025-01-25 22:54:12','供应批次菜单'),(2199,'供应批次查询',2198,1,'#','',NULL,'',1,0,'F','0','0','ar:supplyBatch:query','#','admin','2025-01-14 19:15:33','',NULL,''),(2200,'供应批次新增',2198,2,'#','',NULL,'',1,0,'F','0','0','ar:supplyBatch:add','#','admin','2025-01-14 19:15:33','',NULL,''),(2201,'供应批次修改',2198,3,'#','',NULL,'',1,0,'F','0','0','ar:supplyBatch:edit','#','admin','2025-01-14 19:15:33','',NULL,''),(2202,'供应批次删除',2198,4,'#','',NULL,'',1,0,'F','0','0','ar:supplyBatch:remove','#','admin','2025-01-14 19:15:33','',NULL,''),(2203,'供应批次导出',2198,5,'#','',NULL,'',1,0,'F','0','0','ar:supplyBatch:export','#','admin','2025-01-14 19:15:33','',NULL,''),(2204,'产品信息',2216,1,'product','ar/product/index',NULL,'',1,0,'C','0','0','ar:product:list','log','admin','2025-01-14 19:48:05','admin','2025-01-25 22:54:44','产品信息菜单'),(2205,'产品信息查询',2204,1,'#','',NULL,'',1,0,'F','0','0','ar:product:query','#','admin','2025-01-14 19:48:05','',NULL,''),(2206,'产品信息新增',2204,2,'#','',NULL,'',1,0,'F','0','0','ar:product:add','#','admin','2025-01-14 19:48:05','',NULL,''),(2207,'产品信息修改',2204,3,'#','',NULL,'',1,0,'F','0','0','ar:product:edit','#','admin','2025-01-14 19:48:05','',NULL,''),(2208,'产品信息删除',2204,4,'#','',NULL,'',1,0,'F','0','0','ar:product:remove','#','admin','2025-01-14 19:48:05','',NULL,''),(2209,'产品信息导出',2204,5,'#','',NULL,'',1,0,'F','0','0','ar:product:export','#','admin','2025-01-14 19:48:05','',NULL,''),(2210,'产品出入库单',2216,1,'productTransaction','ar/productTransaction/index',NULL,'',1,0,'C','0','0','ar:productTransaction:list','link','admin','2025-01-14 19:48:12','admin','2025-01-25 22:55:04','产品出入库单菜单'),(2211,'产品出入库单查询',2210,1,'#','',NULL,'',1,0,'F','0','0','ar:productTransaction:query','#','admin','2025-01-14 19:48:12','',NULL,''),(2212,'产品出入库单新增',2210,2,'#','',NULL,'',1,0,'F','0','0','ar:productTransaction:add','#','admin','2025-01-14 19:48:12','',NULL,''),(2213,'产品出入库单修改',2210,3,'#','',NULL,'',1,0,'F','0','0','ar:productTransaction:edit','#','admin','2025-01-14 19:48:12','',NULL,''),(2214,'产品出入库单删除',2210,4,'#','',NULL,'',1,0,'F','0','0','ar:productTransaction:remove','#','admin','2025-01-14 19:48:12','',NULL,''),(2215,'产品出入库单导出',2210,5,'#','',NULL,'',1,0,'F','0','0','ar:productTransaction:export','#','admin','2025-01-14 19:48:12','',NULL,''),(2216,'产品管理',2044,10,'productManagement',NULL,NULL,'',1,0,'M','0','0','','component','admin','2025-01-14 20:14:06','admin','2025-01-25 18:21:22',''),(2229,'材料管理',2044,9,'materialManagement',NULL,NULL,'',1,0,'M','0','0','','table','admin','2025-01-14 20:38:57','admin','2025-01-25 18:21:18',''),(2254,'AR内容',2044,1,'content','ar/content/index',NULL,'',1,0,'C','0','0','ar:content:list','language','admin','2025-01-20 16:00:19','admin','2025-01-21 20:16:17','AR内容菜单'),(2255,'AR内容查询',2254,1,'#','',NULL,'',1,0,'F','0','0','ar:content:query','#','admin','2025-01-20 16:00:19','',NULL,''),(2256,'AR内容新增',2254,2,'#','',NULL,'',1,0,'F','0','0','ar:content:add','#','admin','2025-01-20 16:00:19','',NULL,''),(2257,'AR内容修改',2254,3,'#','',NULL,'',1,0,'F','0','0','ar:content:edit','#','admin','2025-01-20 16:00:19','',NULL,''),(2258,'AR内容删除',2254,4,'#','',NULL,'',1,0,'F','0','0','ar:content:remove','#','admin','2025-01-20 16:00:19','',NULL,''),(2259,'AR内容导出',2254,5,'#','',NULL,'',1,0,'F','0','0','ar:content:export','#','admin','2025-01-20 16:00:19','',NULL,''),(2290,'载体',2099,3,'carrier','vr/carrier/index',NULL,'',1,0,'C','0','0','vr:carrier:list','example','admin','2025-01-20 17:22:20','admin','2025-01-21 20:44:47','载体菜单'),(2291,'载体查询',2290,1,'#','',NULL,'',1,0,'F','0','0','vr:carrier:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2292,'载体新增',2290,2,'#','',NULL,'',1,0,'F','0','0','vr:carrier:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2293,'载体修改',2290,3,'#','',NULL,'',1,0,'F','0','0','vr:carrier:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2294,'载体删除',2290,4,'#','',NULL,'',1,0,'F','0','0','vr:carrier:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2295,'载体导出',2290,5,'#','',NULL,'',1,0,'F','0','0','vr:carrier:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2296,'合作案例',2100,1,'case','school/case/index',NULL,'',1,0,'C','0','0','school:case:list','question','admin','2025-01-20 17:22:20','admin','2025-01-21 20:16:31','合作案例菜单'),(2298,'合作案例新增',2296,2,'#','',NULL,'',1,0,'F','0','0','school:case:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2299,'合作案例修改',2296,3,'#','',NULL,'',1,0,'F','0','0','school:case:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2300,'合作案例删除',2296,4,'#','',NULL,'',1,0,'F','0','0','school:case:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2301,'合作案例导出',2296,5,'#','',NULL,'',1,0,'F','0','0','school:case:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2302,'能耗清单',2044,7,'consumption','ar/consumption/index',NULL,'',1,0,'C','0','0','ar:consumption:list','education','admin','2025-01-20 17:22:20','admin','2025-01-21 20:14:34','能耗清单菜单'),(2303,'能耗清单查询',2302,1,'#','',NULL,'',1,0,'F','0','0','ar:consumption:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2304,'能耗清单新增',2302,2,'#','',NULL,'',1,0,'F','0','0','ar:consumption:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2305,'能耗清单修改',2302,3,'#','',NULL,'',1,0,'F','0','0','ar:consumption:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2306,'能耗清单删除',2302,4,'#','',NULL,'',1,0,'F','0','0','ar:consumption:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2307,'能耗清单导出',2302,5,'#','',NULL,'',1,0,'F','0','0','ar:consumption:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2308,'VR展区',2099,2,'exhibitZone','vr/exhibitZone/index',NULL,'',1,0,'C','0','0','vr:exhibitZone:list','select','admin','2025-01-20 17:22:20','admin','2025-01-21 20:44:42','VR展区菜单'),(2309,'VR展区查询',2308,1,'#','',NULL,'',1,0,'F','0','0','vr:exhibitZone:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2310,'VR展区新增',2308,2,'#','',NULL,'',1,0,'F','0','0','vr:exhibitZone:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2311,'VR展区修改',2308,3,'#','',NULL,'',1,0,'F','0','0','vr:exhibitZone:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2312,'VR展区删除',2308,4,'#','',NULL,'',1,0,'F','0','0','vr:exhibitZone:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2313,'VR展区导出',2308,5,'#','',NULL,'',1,0,'F','0','0','vr:exhibitZone:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2314,'工厂',2044,6,'factory','ar/factory/index',NULL,'',1,0,'C','0','0','ar:factory:list','link','admin','2025-01-20 17:22:20','admin','2025-01-21 20:14:27','工厂菜单'),(2315,'工厂查询',2314,1,'#','',NULL,'',1,0,'F','0','0','ar:factory:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2316,'工厂新增',2314,2,'#','',NULL,'',1,0,'F','0','0','ar:factory:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2317,'工厂修改',2314,3,'#','',NULL,'',1,0,'F','0','0','ar:factory:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2318,'工厂删除',2314,4,'#','',NULL,'',1,0,'F','0','0','ar:factory:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2319,'工厂导出',2314,5,'#','',NULL,'',1,0,'F','0','0','ar:factory:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2320,'VR场景',2100,2,'scene','school/scene/index',NULL,'',1,0,'C','0','0','school:scene:list','textarea','admin','2025-01-20 17:22:20','admin','2025-01-21 20:45:18','VR场景菜单'),(2321,'VR场景查询',2320,1,'#','',NULL,'',1,0,'F','0','0','school:scene:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2322,'VR场景新增',2320,2,'#','',NULL,'',1,0,'F','0','0','school:scene:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2323,'VR场景修改',2320,3,'#','',NULL,'',1,0,'F','0','0','school:scene:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2324,'VR场景删除',2320,4,'#','',NULL,'',1,0,'F','0','0','school:scene:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2325,'VR场景导出',2320,5,'#','',NULL,'',1,0,'F','0','0','school:scene:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2326,'VR展厅',2099,1,'showroom','vr/showroom/index',NULL,'',1,0,'C','0','0','vr:showroom:list','star','admin','2025-01-20 17:22:20','admin','2025-01-21 20:15:35','VR展厅菜单'),(2327,'VR展厅查询',2326,1,'#','',NULL,'',1,0,'F','0','0','vr:showroom:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2328,'VR展厅新增',2326,2,'#','',NULL,'',1,0,'F','0','0','vr:showroom:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2329,'VR展厅修改',2326,3,'#','',NULL,'',1,0,'F','0','0','vr:showroom:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2330,'VR展厅删除',2326,4,'#','',NULL,'',1,0,'F','0','0','vr:showroom:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2331,'VR展厅导出',2326,5,'#','',NULL,'',1,0,'F','0','0','vr:showroom:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2332,'作品',2099,5,'work','vr/work/index',NULL,'',1,0,'C','0','0','vr:work:list','button','admin','2025-01-20 17:22:20','admin','2025-01-21 20:45:00','作品菜单'),(2333,'作品查询',2332,1,'#','',NULL,'',1,0,'F','0','0','vr:work:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2334,'作品新增',2332,2,'#','',NULL,'',1,0,'F','0','0','vr:work:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2335,'作品修改',2332,3,'#','',NULL,'',1,0,'F','0','0','vr:work:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2336,'作品删除',2332,4,'#','',NULL,'',1,0,'F','0','0','vr:work:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2337,'作品导出',2332,5,'#','',NULL,'',1,0,'F','0','0','vr:work:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2338,'沙盘分区',2044,3,'zone','ar/zone/index',NULL,'',1,0,'C','0','0','ar:zone:list','cascader','admin','2025-01-20 17:22:20','admin','2025-01-21 20:14:01','沙盘分区菜单'),(2339,'沙盘分区查询',2338,1,'#','',NULL,'',1,0,'F','0','0','ar:zone:query','#','admin','2025-01-20 17:22:20','',NULL,''),(2340,'沙盘分区新增',2338,2,'#','',NULL,'',1,0,'F','0','0','ar:zone:add','#','admin','2025-01-20 17:22:20','',NULL,''),(2341,'沙盘分区修改',2338,3,'#','',NULL,'',1,0,'F','0','0','ar:zone:edit','#','admin','2025-01-20 17:22:20','',NULL,''),(2342,'沙盘分区删除',2338,4,'#','',NULL,'',1,0,'F','0','0','ar:zone:remove','#','admin','2025-01-20 17:22:20','',NULL,''),(2343,'沙盘分区导出',2338,5,'#','',NULL,'',1,0,'F','0','0','ar:zone:export','#','admin','2025-01-20 17:22:20','',NULL,''),(2344,'设备',2044,4,'device','ar/device/index',NULL,'',1,0,'C','0','0','ar:device:list','icon','admin','2025-01-20 17:25:22','admin','2025-01-21 20:14:10','设备菜单'),(2345,'设备查询',2344,1,'#','',NULL,'',1,0,'F','0','0','ar:device:query','#','admin','2025-01-20 17:25:22','',NULL,''),(2346,'设备新增',2344,2,'#','',NULL,'',1,0,'F','0','0','ar:device:add','#','admin','2025-01-20 17:25:22','',NULL,''),(2347,'设备修改',2344,3,'#','',NULL,'',1,0,'F','0','0','ar:device:edit','#','admin','2025-01-20 17:25:22','',NULL,''),(2348,'设备删除',2344,4,'#','',NULL,'',1,0,'F','0','0','ar:device:remove','#','admin','2025-01-20 17:25:22','',NULL,''),(2349,'设备导出',2344,5,'#','',NULL,'',1,0,'F','0','0','ar:device:export','#','admin','2025-01-20 17:25:22','',NULL,''),(2380,'产品清单明细',2216,1,'productTransactionDetail','ar/productTransactionDetail/index',NULL,'',1,0,'C','0','0','ar:productTransactionDetail:list','documentation','admin','2025-01-20 17:25:22','admin','2025-01-25 22:54:22','产品清单明细菜单'),(2381,'产品清单明细查询',2380,1,'#','',NULL,'',1,0,'F','0','0','ar:productTransactionDetail:query','#','admin','2025-01-20 17:25:22','',NULL,''),(2382,'产品清单明细新增',2380,2,'#','',NULL,'',1,0,'F','0','0','ar:productTransactionDetail:add','#','admin','2025-01-20 17:25:22','',NULL,''),(2383,'产品清单明细修改',2380,3,'#','',NULL,'',1,0,'F','0','0','ar:productTransactionDetail:edit','#','admin','2025-01-20 17:25:22','',NULL,''),(2384,'产品清单明细删除',2380,4,'#','',NULL,'',1,0,'F','0','0','ar:productTransactionDetail:remove','#','admin','2025-01-20 17:25:22','',NULL,''),(2385,'产品清单明细导出',2380,5,'#','',NULL,'',1,0,'F','0','0','ar:productTransactionDetail:export','#','admin','2025-01-20 17:25:22','',NULL,''),(2410,'二维码',2044,2,'code','ar/code/index',NULL,'',1,0,'C','0','0','ar:code:list','dashboard','admin','2025-01-20 17:25:43','admin','2025-01-21 20:13:43','二维码菜单'),(2411,'二维码查询',2410,1,'#','',NULL,'',1,0,'F','0','0','ar:code:query','#','admin','2025-01-20 17:25:44','',NULL,''),(2412,'二维码新增',2410,2,'#','',NULL,'',1,0,'F','0','0','ar:code:add','#','admin','2025-01-20 17:25:44','',NULL,''),(2413,'二维码修改',2410,3,'#','',NULL,'',1,0,'F','0','0','ar:code:edit','#','admin','2025-01-20 17:25:44','',NULL,''),(2414,'二维码删除',2410,4,'#','',NULL,'',1,0,'F','0','0','ar:code:remove','#','admin','2025-01-20 17:25:44','',NULL,''),(2415,'二维码导出',2410,5,'#','',NULL,'',1,0,'F','0','0','ar:code:export','#','admin','2025-01-20 17:25:44','',NULL,''),(2416,'VR内容',2099,4,'content','vr/content/index',NULL,'',1,0,'C','0','0','vr:content:list','language','admin','2025-01-20 17:25:44','admin','2025-01-21 20:44:54','VR内容菜单'),(2417,'VR内容查询',2416,1,'#','',NULL,'',1,0,'F','0','0','vr:content:query','#','admin','2025-01-20 17:25:44','',NULL,''),(2418,'VR内容新增',2416,2,'#','',NULL,'',1,0,'F','0','0','vr:content:add','#','admin','2025-01-20 17:25:44','',NULL,''),(2419,'VR内容修改',2416,3,'#','',NULL,'',1,0,'F','0','0','vr:content:edit','#','admin','2025-01-20 17:25:44','',NULL,''),(2420,'VR内容删除',2416,4,'#','',NULL,'',1,0,'F','0','0','vr:content:remove','#','admin','2025-01-20 17:25:44','',NULL,''),(2421,'VR内容导出',2416,5,'#','',NULL,'',1,0,'F','0','0','vr:content:export','#','admin','2025-01-20 17:25:44','',NULL,''),(2428,'材料清单明细',2229,1,'materialTransactionDetail','ar/materialTransactionDetail/index',NULL,'',1,0,'C','0','0','ar:materialTransactionDetail:list','documentation','admin','2025-01-21 20:07:02','admin','2025-01-25 10:26:02','材料清单明细菜单'),(2429,'材料清单明细查询',2428,1,'#','',NULL,'',1,0,'F','0','0','ar:materialTransactionDetail:query','#','admin','2025-01-21 20:07:02','',NULL,''),(2430,'材料清单明细新增',2428,2,'#','',NULL,'',1,0,'F','0','0','ar:materialTransactionDetail:add','#','admin','2025-01-21 20:07:02','',NULL,''),(2431,'材料清单明细修改',2428,3,'#','',NULL,'',1,0,'F','0','0','ar:materialTransactionDetail:edit','#','admin','2025-01-21 20:07:02','',NULL,''),(2432,'材料清单明细删除',2428,4,'#','',NULL,'',1,0,'F','0','0','ar:materialTransactionDetail:remove','#','admin','2025-01-21 20:07:02','',NULL,''),(2433,'材料清单明细导出',2428,5,'#','',NULL,'',1,0,'F','0','0','ar:materialTransactionDetail:export','#','admin','2025-01-21 20:07:02','',NULL,''),(2434,'生产批次',2216,1,'batch','ar/batch/index',NULL,'',1,0,'C','0','0','ar:batch:list','date-range','admin','2025-01-21 20:07:08','admin','2025-02-06 15:30:49','生产批次菜单'),(2435,'生产批次查询',2434,1,'#','',NULL,'',1,0,'F','0','0','ar:batch:query','#','admin','2025-01-21 20:07:08','',NULL,''),(2436,'生产批次新增',2434,2,'#','',NULL,'',1,0,'F','0','0','ar:batch:add','#','admin','2025-01-21 20:07:08','',NULL,''),(2437,'生产批次修改',2434,3,'#','',NULL,'',1,0,'F','0','0','ar:batch:edit','#','admin','2025-01-21 20:07:08','',NULL,''),(2438,'生产批次删除',2434,4,'#','',NULL,'',1,0,'F','0','0','ar:batch:remove','#','admin','2025-01-21 20:07:08','',NULL,''),(2439,'生产批次导出',2434,5,'#','',NULL,'',1,0,'F','0','0','ar:batch:export','#','admin','2025-01-21 20:07:08','',NULL,''),(2452,'VR素材',2100,3,'material','school/material/index',NULL,'',1,0,'C','0','0','school:material:list','theme','admin','2025-01-21 20:49:05','admin','2025-01-21 20:51:52','VR素材菜单'),(2453,'VR素材查询',2452,1,'#','',NULL,'',1,0,'F','0','0','school:material:query','#','admin','2025-01-21 20:49:05','',NULL,''),(2454,'VR素材新增',2452,2,'#','',NULL,'',1,0,'F','0','0','school:material:add','#','admin','2025-01-21 20:49:05','',NULL,''),(2455,'VR素材修改',2452,3,'#','',NULL,'',1,0,'F','0','0','school:material:edit','#','admin','2025-01-21 20:49:05','',NULL,''),(2456,'VR素材删除',2452,4,'#','',NULL,'',1,0,'F','0','0','school:material:remove','#','admin','2025-01-21 20:49:05','',NULL,''),(2457,'VR素材导出',2452,5,'#','',NULL,'',1,0,'F','0','0','school:material:export','#','admin','2025-01-21 20:49:05','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-12-24 16:55:24','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-12-24 16:55:24','',NULL,'管理员'),(10,'春节放假通知','1',_binary '<p><strong>春节不放假</strong></p>','0','admin','2025-02-06 14:27:47','',NULL,NULL);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.ruoyi.web.controller.monitor.SysOperlogController.clean()','DELETE',1,'admin','研发部门','/monitor/operlog/clean','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:28:15',59),(2,'账户解锁',0,'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()','GET',1,'admin','研发部门','/monitor/logininfor/unlock/admin','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:28:39',2),(3,'账户解锁',0,'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()','GET',1,'admin','研发部门','/monitor/logininfor/unlock/admin','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:28:45',2),(4,'定时任务',1,'com.ruoyi.quartz.controller.SysJobController.add()','POST',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"mytask.mytask()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-02-06 14:51:40\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:51:36',36),(5,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.changeStatus()','PUT',1,'admin','研发部门','/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:51:39',18),(6,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.changeStatus()','PUT',1,'admin','研发部门','/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:53:43',66),(7,'定时任务',1,'com.ruoyi.quartz.controller.SysJobController.add()','POST',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"mytask.showTime()\",\"jobGroup\":\"DEFAULT\",\"jobId\":101,\"jobName\":\"showTime\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-02-06 14:54:45\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:54:43',100),(8,'调度日志',9,'com.ruoyi.quartz.controller.SysJobLogController.clean()','DELETE',1,'admin','研发部门','/monitor/jobLog/clean','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:54:51',29),(9,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.changeStatus()','PUT',1,'admin','研发部门','/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":101,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:55:05',20),(10,'定时任务',3,'com.ruoyi.quartz.controller.SysJobController.remove()','DELETE',1,'admin','研发部门','/monitor/job/100','127.0.0.1','内网IP','[100]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:55:09',22),(11,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.changeStatus()','PUT',1,'admin','研发部门','/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":101,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 14:55:52',19),(12,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"add\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course/add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:13:56',28),(13,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"course/add\",\"createTime\":\"2025-02-06 15:13:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2482,\"menuName\":\"添加课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course/add\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:14:30',13),(14,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"course/add\",\"createTime\":\"2025-02-06 15:13:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2482,\"menuName\":\"添加课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:15:16',23),(15,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"course/index\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:16:44',13),(16,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"course/add\",\"createTime\":\"2025-02-06 15:13:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2482,\"menuName\":\"添加课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"course:add:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:17:07',22),(17,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"course/add\",\"createTime\":\"2025-02-06 15:13:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2482,\"menuName\":\"添加课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:17:25',10),(18,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2482','127.0.0.1','内网IP','2482','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:20:52',18),(19,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2040','127.0.0.1','内网IP','2040','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:03',7),(20,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','2036','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:06',7),(21,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','2036','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:07',7),(22,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','2036','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:08',13),(23,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','2036','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:09',5),(24,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:10',4),(25,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:11',6),(26,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','2036','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:14',10),(27,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2036','127.0.0.1','内网IP','2036','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:22',6),(28,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2040','127.0.0.1','内网IP','2040','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:29',9),(29,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:37',6),(30,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"课程管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2035,\"path\":\"#\",\"perms\":\"system:course:add\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:21:42',8),(31,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:44',6),(32,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:46',4),(33,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:46',4),(34,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:47',7),(35,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:47',3),(36,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:47',8),(37,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:47',16),(38,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:47',6),(39,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2037','127.0.0.1','内网IP','2037','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 15:21:47',5),(40,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"ar/batch/add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:25:12',8),(41,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2434,\"path\":\"batch\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:26:23',17),(42,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:26:35',20),(43,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch\",\"perms\":\"\",\"query\":\"ar:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:26:53',11),(44,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch\",\"perms\":\"ar:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:27:11',26),(45,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:28:39',12),(46,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch/batch\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:29:33',21),(47,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"add\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:30:31',29),(48,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/index\",\"createTime\":\"2025-01-21 20:07:08\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2434,\"menuName\":\"生产批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch\",\"perms\":\"ar:batch:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:30:49',25),(49,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"batch/add\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:31:57',9),(50,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/batch/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"add\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:35:33',6),(51,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/add/add\",\"createTime\":\"2025-02-06 15:25:12\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2483,\"menuName\":\"wwwww\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2216,\"path\":\"add\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:35:43',12),(52,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2483','127.0.0.1','内网IP','2483','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:37:09',7),(53,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/add/add\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"111111111\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"add\",\"query\":\"ar:add:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:37:53',16),(54,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/add/add\",\"createTime\":\"2025-02-06 15:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2484,\"menuName\":\"111111111\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"add\",\"perms\":\"ar:add:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:38:08',8),(55,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/add/index\",\"createTime\":\"2025-02-06 15:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2484,\"menuName\":\"111111111\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"add\",\"perms\":\"ar:add:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:39:18',13),(56,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"ar/add/index\",\"createTime\":\"2025-02-06 15:37:53\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2484,\"menuName\":\"111111111\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"add\",\"perms\":\"ar:add:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:39:52',10),(57,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2484','127.0.0.1','内网IP','2484','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-06 15:41:03',12),(58,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2040','127.0.0.1','内网IP','2040','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-02-06 16:05:15',9),(59,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/1','127.0.0.1','内网IP','[1]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`ar_content`, CONSTRAINT `ar_content_ibfk_1` FOREIGN KEY (`qr_code_id`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\QrCodeMapper.xml]\r\n### The error may involve com.ruoyi.ar.mapper.QrCodeMapper.deleteQrCodeByQrCodeIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from qr_code where qr_code_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`ar_content`, CONSTRAINT `ar_content_ibfk_1` FOREIGN KEY (`qr_code_id`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`ar_content`, CONSTRAINT `ar_content_ibfk_1` FOREIGN KEY (`qr_code_id`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`ar_content`, CONSTRAINT `ar_content_ibfk_1` FOREIGN KEY (`qr_code_id`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 11:52:48',176),(60,'二维码',1,'com.ruoyi.ar.controller.QrCodeController.add()','POST',1,'admin','研发部门','/ar/code','127.0.0.1','内网IP','{\"params\":{},\"qrCode\":\"https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a58431555494c5a76e8775.png\",\"qrCodeId\":3,\"qrCodeName\":\"1\",\"usageStatus\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 11:55:35',119),(61,'二维码',1,'com.ruoyi.ar.controller.QrCodeController.add()','POST',1,'admin','研发部门','/ar/code','127.0.0.1','内网IP','{\"params\":{},\"qrCode\":\"https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a58442555494c5a76e8776.png\",\"qrCodeId\":4,\"qrCodeName\":\"2\",\"usageStatus\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 11:55:50',8),(62,'载体',1,'com.ruoyi.vr.controller.VrCarrierController.add()','POST',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierName\":\"1\",\"carrierType\":0,\"exhibitZoneId\":2,\"params\":{},\"specifications\":\"100cm*250cm\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:31:36',47),(63,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/7','127.0.0.1','内网IP','[7]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:33:20',26),(64,'VR内容',2,'com.ruoyi.vr.controller.VrContentController.edit()','PUT',1,'admin','研发部门','/vr/content','127.0.0.1','内网IP','{\"carrierId\":5,\"category\":\"eee\",\"createdAt\":\"2025-01-24 17:34:45\",\"description\":\"dd\",\"fileUrl\":\"sadf\",\"name\":\"asdfa\",\"params\":{},\"updatedAt\":\"2025-01-24 17:34:45\",\"usageStatus\":\"1\",\"vrContentId\":16}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:48:12',55),(65,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/16','127.0.0.1','内网IP','[16]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:49:30',48),(66,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/19','127.0.0.1','内网IP','[19]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:51:22',35),(67,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/18','127.0.0.1','内网IP','[18]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:51:58',12),(68,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/17,15','127.0.0.1','内网IP','[17,15]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:52:52',29),(69,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:54:40',67890),(70,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-02-07 14:54:42',4629),(71,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/5','127.0.0.1','内网IP','[5]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:56:57',128133),(72,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/8','127.0.0.1','内网IP','[8]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 14:58:58',91866),(73,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/6','127.0.0.1','内网IP','[6]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:00:03',9850),(74,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/8','127.0.0.1','内网IP','[8]',NULL,1,'Cannot invoke \"com.ruoyi.vr.domain.VrContent.getUsageStatus()\" because \"vrContent\" is null','2025-02-07 15:01:13',6976),(75,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/6','127.0.0.1','内网IP','[6]',NULL,1,'Cannot invoke \"com.ruoyi.vr.domain.VrContent.getUsageStatus()\" because \"vrContent\" is null','2025-02-07 15:01:45',3397),(76,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/9','127.0.0.1','内网IP','[9]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:02:20',42),(77,'VR内容',2,'com.ruoyi.vr.controller.VrContentController.edit()','PUT',1,'admin','研发部门','/vr/content','127.0.0.1','内网IP','{\"category\":\"ccc\",\"createdAt\":\"2025-01-24 17:27:06\",\"description\":\"啊啊啊啊啊啊啊啊啊\",\"fileUrl\":\"啊啊啊啊啊啊啊啊啊\",\"name\":\"阿是莱肯囧啊零分\",\"params\":{},\"updatedAt\":\"2025-01-24 17:27:06\",\"usageStatus\":\"1\",\"vrContentId\":13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:02:36',20),(78,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/13','127.0.0.1','内网IP','[13]','{\"msg\":\"存在正在使用的VR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:02:39',12),(79,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/13','127.0.0.1','内网IP','[13]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:14:26',28),(80,'VR内容',2,'com.ruoyi.vr.controller.VrContentController.edit()','PUT',1,'admin','研发部门','/vr/content','127.0.0.1','内网IP','{\"carrierId\":5,\"category\":\"ddd\",\"createdAt\":\"2025-01-24 17:32:11\",\"description\":\"sdaf\",\"fileUrl\":\"asdfasdf\",\"name\":\"www\",\"params\":{},\"updatedAt\":\"2025-01-24 17:32:11\",\"usageStatus\":\"1\",\"vrContentId\":14,\"workId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:16:28',18),(81,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/14','127.0.0.1','内网IP','[14]','{\"msg\":\"存在正在使用的VR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:16:30',8),(82,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/1','127.0.0.1','内网IP','[1]','{\"msg\":\"存在正在使用的AR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:39:50',9),(83,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/14','127.0.0.1','内网IP','[14]','{\"msg\":\"存在正在使用的VR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:39:57',10),(84,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/14','127.0.0.1','内网IP','[14]','{\"msg\":\"存在正在使用的VR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:42:15',20),(85,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/1','127.0.0.1','内网IP','[1]','{\"msg\":\"存在正在使用的AR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:42:27',5),(86,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/3','127.0.0.1','内网IP','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:48:36',42),(87,'二维码',1,'com.ruoyi.ar.controller.QrCodeController.add()','POST',1,'admin','研发部门','/ar/code','127.0.0.1','内网IP','{\"params\":{},\"qrCode\":\"https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a5bb28555497ab2a1d23a8.png\",\"qrCodeId\":5,\"qrCodeName\":\"1\",\"usageStatus\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 15:50:07',27),(88,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/5','127.0.0.1','内网IP','[5]','{\"msg\":\"存在正在使用的二维码，无法删除\",\"code\":500}',0,NULL,'2025-02-07 15:50:12',11),(89,'沙盘分区',1,'com.ruoyi.ar.controller.SandboxZoneController.add()','POST',1,'admin','研发部门','/ar/zone','127.0.0.1','内网IP','{\"description\":\"啊\",\"factoryId\":1,\"name\":\"大\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:39:53',167),(90,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1},{\"materialId\":2,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:41:03',155),(91,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1},{\"materialId\":2,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:41:09',11),(92,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1},{\"materialId\":2,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:41:20',12),(93,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1},{\"materialId\":2,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-25\",\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:41:22',9),(94,'材料清单明细',2,'com.ruoyi.ar.controller.MaterialTransactionDetailController.edit()','PUT',1,'admin','研发部门','/ar/materialTransactionDetail','127.0.0.1','内网IP','{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-02\",\"transactionId\":1}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-02-07 16:41:32',20),(95,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-23\",\"transactionId\":1},{\"params\":{},\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:41:50',19),(96,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-23\",\"transactionId\":1},{\"params\":{},\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:41:53',9),(97,'材料出入库单',2,'com.ruoyi.ar.controller.MaterialTransactionController.edit()','PUT',1,'admin','研发部门','/ar/materialTransaction','127.0.0.1','内网IP','{\"materialTransactionDetailList\":[{\"materialId\":1,\"params\":{},\"quantity\":1,\"transactionDate\":\"2025-02-23\",\"transactionId\":1},{\"params\":{},\"transactionId\":1}],\"operatorName\":\"张三\",\"params\":{},\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"李五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\MaterialTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into material_transaction_detail( material_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)          ,              ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`material_transaction_detail`, CONSTRAINT `material_transaction_detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:42:11',17),(98,'产品清单明细',2,'com.ruoyi.ar.controller.ProductTransactionDetailController.edit()','PUT',1,'admin','研发部门','/ar/productTransactionDetail','127.0.0.1','内网IP','{\"params\":{},\"productId\":1,\"quantity\":1,\"transactionDate\":\"2025-01-27\",\"transactionId\":1}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2025-02-07 16:43:32',9),(99,'产品出入库单',2,'com.ruoyi.ar.controller.ProductTransactionController.edit()','PUT',1,'admin','研发部门','/ar/productTransaction','127.0.0.1','内网IP','{\"operatorName\":\"李二\",\"params\":{},\"productTransactionDetailList\":[{\"params\":{},\"productId\":1,\"quantity\":1,\"transactionDate\":\"2025-02-24\",\"transactionId\":1}],\"transactionId\":1,\"transactionType\":1,\"warehouseAdminName\":\"王五\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`product_transaction_detail`, CONSTRAINT `product_transaction_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\ProductTransactionMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into product_transaction_detail( product_id, transaction_id, quantity, transaction_date) values                        ( ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`product_transaction_detail`, CONSTRAINT `product_transaction_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE)\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`product_transaction_detail`, CONSTRAINT `product_transaction_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`product_transaction_detail`, CONSTRAINT `product_transaction_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE)','2025-02-07 16:43:43',12),(100,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/5','127.0.0.1','内网IP','[5]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:48:02',21),(101,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":7,\"category\":\"科技\",\"description\":\"一个沉浸式虚拟现实体验平台。\",\"fileUrl\":\"http://example.com/vr_experience\",\"name\":\"虚拟现实体验\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:53:33',13),(102,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/6','127.0.0.1','内网IP','[6]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:53:40',16),(103,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/1','127.0.0.1','内网IP','[1]','{\"msg\":\"存在正在使用的AR内容，无法删除\",\"code\":500}',0,NULL,'2025-02-07 16:53:42',5),(104,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":1,\"category\":\"图片\",\"description\":\"s\",\"fileUrl\":\"s\",\"name\":\"s\",\"params\":{},\"qrCodeId\":2,\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:53:46',8),(105,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":7,\"category\":\"纯文本\",\"description\":\"一个沉浸式虚拟现实体验平台。\",\"fileUrl\":\"http://example.com/vr_experience\",\"name\":\"虚拟现实体验\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:53:58',6),(106,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":8,\"category\":\"视频\",\"description\":\"基于AR技术的互动教育应用。\",\"fileUrl\":\"http://example.com/ar_education\",\"name\":\"增强现实教育\",\"params\":{},\"usageStatus\":\"待发布\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:03',11),(107,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:08',6),(108,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:09',7),(109,'AR内容',3,'com.ruoyi.ar.controller.ArContentController.remove()','DELETE',1,'admin','研发部门','/ar/content/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:10',6),(110,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":8,\"category\":\"纯文本\",\"description\":\"基于AR技术的互动教育应用。\",\"fileUrl\":\"http://example.com/ar_education\",\"name\":\"增强现实教育\",\"params\":{},\"usageStatus\":\"待发布\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:15',6),(111,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":8,\"category\":\"纯文本\",\"description\":\"基于AR技术的互动教育应用。\",\"fileUrl\":\"http://example.com/ar_education\",\"name\":\"增强现实教育\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:19',5),(112,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":9,\"category\":\"纯文本\",\"description\":\"用于创建3D模型的专业软件。\",\"fileUrl\":\"http://example.com/3d_modeling\",\"name\":\"3D建模软件\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:25',4),(113,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":9,\"category\":\"图文\",\"description\":\"用于创建3D模型的专业软件。\",\"fileUrl\":\"http://example.com/3d_modeling\",\"name\":\"3D建模软件\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:31',3),(114,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":8,\"category\":\"视频\",\"description\":\"基于AR技术的互动教育应用。\",\"fileUrl\":\"http://example.com/ar_education\",\"name\":\"增强现实教育\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:35',3),(115,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":10,\"category\":\"游戏\",\"description\":\"带你环游世界的虚拟旅游应用。\",\"fileUrl\":\"http://example.com/virtual_tour\",\"name\":\"虚拟旅游\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:41',4),(116,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":11,\"category\":\"游戏\",\"description\":\"一款支持增强现实的互动游戏。\",\"fileUrl\":\"http://example.com/ar_game\",\"name\":\"增强现实游戏\",\"params\":{},\"usageStatus\":\"待发布\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:47',2),(117,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":10,\"category\":\"3D场景\",\"description\":\"带你环游世界的虚拟旅游应用。\",\"fileUrl\":\"http://example.com/virtual_tour\",\"name\":\"虚拟旅游\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:51',10),(118,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":11,\"category\":\"游戏\",\"description\":\"一款支持增强现实的互动游戏。\",\"fileUrl\":\"http://example.com/ar_game\",\"name\":\"增强现实游戏\",\"params\":{},\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:54:58',16),(119,'AR内容',2,'com.ruoyi.ar.controller.ArContentController.edit()','PUT',1,'admin','研发部门','/ar/content','127.0.0.1','内网IP','{\"arContentId\":7,\"category\":\"纯文本\",\"description\":\"一个沉浸式虚拟现实体验平台。\",\"fileUrl\":\"http://example.com/vr_experience\",\"name\":\"虚拟现实体验\",\"params\":{},\"usageStatus\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:55:05',15),(120,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/1','127.0.0.1','内网IP','[1]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\QrCodeMapper.xml]\r\n### The error may involve com.ruoyi.ar.mapper.QrCodeMapper.deleteQrCodeByQrCodeIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from qr_code where qr_code_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 16:57:01',31),(121,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/1','127.0.0.1','内网IP','[1]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\QrCodeMapper.xml]\r\n### The error may involve com.ruoyi.ar.mapper.QrCodeMapper.deleteQrCodeByQrCodeIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from qr_code where qr_code_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`device`, CONSTRAINT `device_ibfk_1` FOREIGN KEY (`qr_code_number`) REFERENCES `qr_code` (`qr_code_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 16:57:18',8),(122,'沙盘分区',3,'com.ruoyi.ar.controller.SandboxZoneController.remove()','DELETE',1,'admin','研发部门','/ar/zone/3','127.0.0.1','内网IP','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:27',11),(123,'沙盘分区',3,'com.ruoyi.ar.controller.SandboxZoneController.remove()','DELETE',1,'admin','研发部门','/ar/zone/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:28',8),(124,'沙盘分区',3,'com.ruoyi.ar.controller.SandboxZoneController.remove()','DELETE',1,'admin','研发部门','/ar/zone/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:30',8),(125,'沙盘分区',3,'com.ruoyi.ar.controller.SandboxZoneController.remove()','DELETE',1,'admin','研发部门','/ar/zone/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:32',7),(126,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/5','127.0.0.1','内网IP','[5]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:41',10),(127,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/11','127.0.0.1','内网IP','[11]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:45',7),(128,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/9','127.0.0.1','内网IP','[9]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:46',10),(129,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/2','127.0.0.1','内网IP','[2]','{\"msg\":\"存在正在使用的二维码，无法删除\",\"code\":500}',0,NULL,'2025-02-07 16:59:50',10),(130,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 16:59:54',18),(131,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/2','127.0.0.1','内网IP','[2]','{\"msg\":\"存在正在使用的二维码，无法删除\",\"code\":500}',0,NULL,'2025-02-07 16:59:59',3),(132,'二维码',2,'com.ruoyi.ar.controller.QrCodeController.edit()','PUT',1,'admin','研发部门','/ar/code','127.0.0.1','内网IP','{\"params\":{},\"qrCode\":\"/profile/upload/2025/01/22/Snipaste_2025-01-22_21-08-01_20250122211034A002.png\",\"qrCodeId\":2,\"qrCodeName\":\"bbb\",\"usageStatus\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:00:13',11),(133,'二维码',3,'com.ruoyi.ar.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/ar/code/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:00:16',17),(134,'二维码',2,'com.ruoyi.ar.controller.QrCodeController.edit()','PUT',1,'admin','研发部门','/ar/code','127.0.0.1','内网IP','{\"params\":{},\"qrCode\":\"https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a58442555494c5a76e8776.png\",\"qrCodeId\":4,\"qrCodeName\":\"建模\",\"usageStatus\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:01:37',31),(135,'二维码',2,'com.ruoyi.ar.controller.QrCodeController.edit()','PUT',1,'admin','研发部门','/ar/code','127.0.0.1','内网IP','{\"params\":{},\"qrCode\":\"https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a5bb28555497ab2a1d23a8.png\",\"qrCodeId\":5,\"qrCodeName\":\"游戏\",\"usageStatus\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:01:43',10),(136,'工厂',3,'com.ruoyi.ar.controller.FactoryController.remove()','DELETE',1,'admin','研发部门','/ar/factory/6','127.0.0.1','内网IP','[6]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:09:30',15),(137,'沙盘分区',1,'com.ruoyi.ar.controller.SandboxZoneController.add()','POST',1,'admin','研发部门','/ar/zone','127.0.0.1','内网IP','{\"description\":\"这是一个用于模拟和测试各种工业过程的沙盘分区。通过这个沙盘，我们可以更好地理解和优化生产流程，提高生产效率。\",\"factoryId\":1,\"name\":\"生产\",\"params\":{},\"qrCodeId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:11:55',8),(138,'沙盘分区',2,'com.ruoyi.ar.controller.SandboxZoneController.edit()','PUT',1,'admin','研发部门','/ar/zone','127.0.0.1','内网IP','{\"description\":\"这是一个用于模拟和测试各种工业过程的沙盘分区。通过这个沙盘，我们可以更好地理解和优化生产流程，提高生产效率。\",\"factoryId\":1,\"name\":\"生产沙盘\",\"params\":{},\"qrCodeId\":4,\"zoneId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:12:02',9),(139,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/14','127.0.0.1','内网IP','[14]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:12:12',8),(140,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/3','127.0.0.1','内网IP','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:12:18',11),(141,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:12:40',9),(142,'设备',3,'com.ruoyi.ar.controller.DeviceController.remove()','DELETE',1,'admin','研发部门','/ar/device/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:12:41',12),(143,'设备',1,'com.ruoyi.ar.controller.DeviceController.add()','POST',1,'admin','研发部门','/ar/device','127.0.0.1','内网IP','{\"description\":\"高效离心泵是一种用于液体输送的设备，广泛应用于化工、制药和食品加工等行业。它具有高效、节能、运行稳定等特点。\",\"deviceNumber\":15,\"factoryNumber\":\"2\",\"name\":\"高效离心泵\",\"params\":{},\"qrCodeNumber\":\"4\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:13:51',54),(144,'设备',1,'com.ruoyi.ar.controller.DeviceController.add()','POST',1,'admin','研发部门','/ar/device','127.0.0.1','内网IP','{\"description\":\"自动化装配线是一种用于大规模生产的设备，能够自动完成产品的组装、检测和包装等工序。它具有高效、精准、稳定等特点。\",\"deviceNumber\":16,\"factoryNumber\":\"5\",\"name\":\"自动化装配线\",\"params\":{},\"qrCodeNumber\":\"5\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:14:24',6),(145,'运维记录',2,'com.ruoyi.ar.controller.MaintenanceRecordController.edit()','PUT',1,'admin','研发部门','/ar/maintenance','127.0.0.1','内网IP','{\"date\":\"2025-01-14\",\"equipmentId\":15,\"maintainerName\":\"a师傅\",\"maintenanceLog\":\"中午维修\",\"params\":{},\"recordId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:14:47',35),(146,'运维记录',2,'com.ruoyi.ar.controller.MaintenanceRecordController.edit()','PUT',1,'admin','研发部门','/ar/maintenance','127.0.0.1','内网IP','{\"date\":\"2025-01-14\",\"equipmentId\":15,\"maintainerName\":\"a师傅\",\"maintenanceLog\":\"对高效离心泵进行了常规检查，确认各项参数正常，无异常振动或噪音。更换了润滑油和过滤器，确保设备运行顺畅。\",\"params\":{},\"recordId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:16:58',14),(147,'运维记录',2,'com.ruoyi.ar.controller.MaintenanceRecordController.edit()','PUT',1,'admin','研发部门','/ar/maintenance','127.0.0.1','内网IP','{\"date\":\"2025-01-13\",\"equipmentId\":15,\"maintainerName\":\"李四\",\"maintenanceLog\":\"对高效离心泵进行了深度维护，包括更换磨损的密封件和检查电机状态。调整了泵的运行参数，以确保其在最佳工况下运行。清理了泵体周围的环境，确保通风良好。\",\"params\":{},\"recordId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:17:39',8),(148,'运维记录',2,'com.ruoyi.ar.controller.MaintenanceRecordController.edit()','PUT',1,'admin','研发部门','/ar/maintenance','127.0.0.1','内网IP','{\"date\":\"2025-01-14\",\"equipmentId\":15,\"maintainerName\":\"张三\",\"maintenanceLog\":\"对高效离心泵进行了常规检查，确认各项参数正常，无异常振动或噪音。更换了润滑油和过滤器，确保设备运行顺畅。\",\"params\":{},\"recordId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:17:46',15),(149,'能耗清单',3,'com.ruoyi.ar.controller.EnergyConsumptionController.remove()','DELETE',1,'admin','研发部门','/ar/consumption/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:18:06',6),(150,'能耗清单',3,'com.ruoyi.ar.controller.EnergyConsumptionController.remove()','DELETE',1,'admin','研发部门','/ar/consumption/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:18:08',6),(151,'能耗清单',1,'com.ruoyi.ar.controller.EnergyConsumptionController.add()','POST',1,'admin','研发部门','/ar/consumption','127.0.0.1','内网IP','{\"energyConsumed\":5000,\"factoryId\":\"4\",\"id\":3,\"month\":5,\"params\":{},\"type\":\"1\",\"unit\":\"kWh\",\"year\":2025}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:18:42',27),(152,'能耗清单',1,'com.ruoyi.ar.controller.EnergyConsumptionController.add()','POST',1,'admin','研发部门','/ar/consumption','127.0.0.1','内网IP','{\"energyConsumed\":3000,\"factoryId\":\"3\",\"id\":4,\"month\":1,\"params\":{},\"type\":\"0\",\"unit\":\"m³\",\"year\":2024}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:19:22',7),(153,'能耗清单',2,'com.ruoyi.ar.controller.EnergyConsumptionController.edit()','PUT',1,'admin','研发部门','/ar/consumption','127.0.0.1','内网IP','{\"energyConsumed\":3000,\"factoryId\":\"3\",\"id\":4,\"month\":1,\"params\":{},\"type\":\"2\",\"unit\":\"m³\",\"year\":2024}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:19:33',8),(154,'能耗清单',1,'com.ruoyi.ar.controller.EnergyConsumptionController.add()','POST',1,'admin','研发部门','/ar/consumption','127.0.0.1','内网IP','{\"energyConsumed\":10000,\"factoryId\":\"5\",\"id\":5,\"month\":1,\"params\":{},\"type\":\"0\",\"unit\":\"t\",\"year\":2025}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:20:03',11),(155,'库区',3,'com.ruoyi.ar.controller.WarehouseZoneController.remove()','DELETE',1,'admin','研发部门','/ar/warehouse/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:20:20',10),(156,'库区',3,'com.ruoyi.ar.controller.WarehouseZoneController.remove()','DELETE',1,'admin','研发部门','/ar/warehouse/5','127.0.0.1','内网IP','[5]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\WarehouseZoneMapper.xml]\r\n### The error may involve com.ruoyi.ar.mapper.WarehouseZoneMapper.deleteWarehouseZoneByZoneIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from warehouse_zone where zone_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:20:22',9),(157,'库区',3,'com.ruoyi.ar.controller.WarehouseZoneController.remove()','DELETE',1,'admin','研发部门','/ar/warehouse/5','127.0.0.1','内网IP','[5]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\ar\\WarehouseZoneMapper.xml]\r\n### The error may involve com.ruoyi.ar.mapper.WarehouseZoneMapper.deleteWarehouseZoneByZoneIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from warehouse_zone where zone_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`material`, CONSTRAINT `material_ibfk_1` FOREIGN KEY (`warehouse_zone_id`) REFERENCES `warehouse_zone` (`zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:20:29',7),(158,'库区',2,'com.ruoyi.ar.controller.WarehouseZoneController.edit()','PUT',1,'admin','研发部门','/ar/warehouse','127.0.0.1','内网IP','{\"description\":\"原料仓库A区主要用于存放生产所需的主要原材料，包括化学品、生物制剂等。该区域配备有温湿度控制系统，确保材料质量稳定。\",\"factoryId\":4,\"name\":\"原料仓库A区\",\"params\":{},\"zoneId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:22:06',15),(159,'库区',2,'com.ruoyi.ar.controller.WarehouseZoneController.edit()','PUT',1,'admin','研发部门','/ar/warehouse','127.0.0.1','内网IP','{\"description\":\"成品仓库B区主要用于存放生产完成后的产品，包括包装好的药品、试剂盒等。该区域同样配备有温湿度控制系统，确保产品质量不受影响。\",\"factoryId\":1,\"name\":\"成品仓库B区\",\"params\":{},\"zoneId\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:22:31',17),(160,'材料信息',3,'com.ruoyi.ar.controller.MaterialController.remove()','DELETE',1,'admin','研发部门','/ar/material/3','127.0.0.1','内网IP','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:22:43',20),(161,'材料信息',3,'com.ruoyi.ar.controller.MaterialController.remove()','DELETE',1,'admin','研发部门','/ar/material/6','127.0.0.1','内网IP','[6]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:22:44',11),(162,'材料信息',3,'com.ruoyi.ar.controller.MaterialController.remove()','DELETE',1,'admin','研发部门','/ar/material/7','127.0.0.1','内网IP','[7]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:22:45',7),(163,'材料信息',3,'com.ruoyi.ar.controller.MaterialController.remove()','DELETE',1,'admin','研发部门','/ar/material/9','127.0.0.1','内网IP','[9]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:22:46',6),(164,'VR展厅',3,'com.ruoyi.vr.controller.VrShowroomController.remove()','DELETE',1,'admin','研发部门','/vr/showroom/1','127.0.0.1','内网IP','[1]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\vr\\VrShowroomMapper.xml]\r\n### The error may involve com.ruoyi.vr.mapper.VrShowroomMapper.deleteVrShowroomByShowroomIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from vr_showroom where showroom_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:23:00',13),(165,'VR展厅',2,'com.ruoyi.vr.controller.VrShowroomController.edit()','PUT',1,'admin','研发部门','/vr/showroom','127.0.0.1','内网IP','{\"description\":\"虚拟现实体验中心提供了多种VR设备和互动体验，让参观者能够身临其境地感受虚拟世界的魅力。该展厅设有多个主题区域，包括游戏区、教育区和创意区，每个区域都有独特的VR内容供参观者探索。\",\"params\":{},\"showroomId\":1,\"showroomName\":\"虚拟现实体验中心\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:23:42',14),(166,'VR展厅',3,'com.ruoyi.vr.controller.VrShowroomController.remove()','DELETE',1,'admin','研发部门','/vr/showroom/4','127.0.0.1','内网IP','[4]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\vr\\VrShowroomMapper.xml]\r\n### The error may involve com.ruoyi.vr.mapper.VrShowroomMapper.deleteVrShowroomByShowroomIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from vr_showroom where showroom_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:24:05',9),(167,'VR展厅',3,'com.ruoyi.vr.controller.VrShowroomController.remove()','DELETE',1,'admin','研发部门','/vr/showroom/3','127.0.0.1','内网IP','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:24:07',12),(168,'VR展厅',3,'com.ruoyi.vr.controller.VrShowroomController.remove()','DELETE',1,'admin','研发部门','/vr/showroom/2','127.0.0.1','内网IP','[2]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\vr\\VrShowroomMapper.xml]\r\n### The error may involve com.ruoyi.vr.mapper.VrShowroomMapper.deleteVrShowroomByShowroomIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from vr_showroom where showroom_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_exhibit_zone`, CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:24:09',11),(169,'VR展厅',2,'com.ruoyi.vr.controller.VrShowroomController.edit()','PUT',1,'admin','研发部门','/vr/showroom','127.0.0.1','内网IP','{\"description\":\"互动VR乐园是一个以家庭娱乐为主题的VR展览空间。这里提供了多种适合所有年龄段人群的VR游戏和互动体验，让参观者能够在轻松愉快的氛围中享受虚拟现实的乐趣。\",\"params\":{},\"showroomId\":2,\"showroomName\":\"互动VR乐园\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:24:23',12),(170,'VR展厅',2,'com.ruoyi.vr.controller.VrShowroomController.edit()','PUT',1,'admin','研发部门','/vr/showroom','127.0.0.1','内网IP','{\"description\":\"VR未来实验室是一个专注于虚拟现实技术研发和应用的展览空间。这里汇聚了来自全球的最新VR技术和产品，让参观者能够亲身体验到虚拟现实技术的无限可能。\",\"params\":{},\"showroomId\":4,\"showroomName\":\"VR未来实验室\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:24:36',5),(171,'VR展区',2,'com.ruoyi.vr.controller.VrExhibitZoneController.edit()','PUT',1,'admin','研发部门','/vr/exhibitZone','127.0.0.1','内网IP','{\"description\":\"未来科技互动区是虚拟现实体验中心内的一个特色展区，它展示了最新的VR技术和互动体验设备。参观者可以在这里体验到前沿的虚拟现实游戏、教育应用以及创意作品，感受科技带来的无限可能。\",\"exhibitZoneId\":2,\"exhibitZoneName\":\"未来科技互动区\",\"params\":{},\"showroomId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:25:55',11),(172,'VR展区',3,'com.ruoyi.vr.controller.VrExhibitZoneController.remove()','DELETE',1,'admin','研发部门','/vr/exhibitZone/3','127.0.0.1','内网IP','[3]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_carrier`, CONSTRAINT `vr_carrier_ibfk_1` FOREIGN KEY (`exhibit_zone_id`) REFERENCES `vr_exhibit_zone` (`exhibit_zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\vr\\VrExhibitZoneMapper.xml]\r\n### The error may involve com.ruoyi.vr.mapper.VrExhibitZoneMapper.deleteVrExhibitZoneByExhibitZoneIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from vr_exhibit_zone where exhibit_zone_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_carrier`, CONSTRAINT `vr_carrier_ibfk_1` FOREIGN KEY (`exhibit_zone_id`) REFERENCES `vr_exhibit_zone` (`exhibit_zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_carrier`, CONSTRAINT `vr_carrier_ibfk_1` FOREIGN KEY (`exhibit_zone_id`) REFERENCES `vr_exhibit_zone` (`exhibit_zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_carrier`, CONSTRAINT `vr_carrier_ibfk_1` FOREIGN KEY (`exhibit_zone_id`) REFERENCES `vr_exhibit_zone` (`exhibit_zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:26:05',8),(173,'载体',3,'com.ruoyi.vr.controller.VrCarrierController.remove()','DELETE',1,'admin','研发部门','/vr/carrier/7','127.0.0.1','内网IP','[7]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:26:16',14),(174,'载体',3,'com.ruoyi.vr.controller.VrCarrierController.remove()','DELETE',1,'admin','研发部门','/vr/carrier/8','127.0.0.1','内网IP','[8]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:26:18',5),(175,'载体',3,'com.ruoyi.vr.controller.VrCarrierController.remove()','DELETE',1,'admin','研发部门','/vr/carrier/10','127.0.0.1','内网IP','[10]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:26:20',7),(176,'VR展区',2,'com.ruoyi.vr.controller.VrExhibitZoneController.edit()','PUT',1,'admin','研发部门','/vr/exhibitZone','127.0.0.1','内网IP','{\"description\":\"智能生活体验区是科技创新展示厅内的一个亮点展区，它聚焦于智能家居、可穿戴设备、人工智能等前沿科技在日常生活中的应用。参观者可以在这里亲身体验智能化带来的便捷与舒适，感受未来生活的无限可能。\",\"exhibitZoneId\":3,\"exhibitZoneName\":\"智能生活体验区\",\"params\":{},\"showroomId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:26:56',13),(177,'VR展区',2,'com.ruoyi.vr.controller.VrExhibitZoneController.edit()','PUT',1,'admin','研发部门','/vr/exhibitZone','127.0.0.1','内网IP','{\"description\":\"智能生活体验区是科技创新展示厅内的一个亮点展区，它聚焦于智能家居、可穿戴设备、人工智能等前沿科技在日常生活中的应用。参观者可以在这里亲身体验智能化带来的便捷与舒适，感受未来生活的无限可能。\",\"exhibitZoneId\":3,\"exhibitZoneName\":\"智能生活体验区\",\"params\":{},\"showroomId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:27:04',5),(178,'VR展区',2,'com.ruoyi.vr.controller.VrExhibitZoneController.edit()','PUT',1,'admin','研发部门','/vr/exhibitZone','127.0.0.1','内网IP','{\"description\":\"未来科技互动区是虚拟现实体验中心内的一个特色展区，它展示了最新的VR技术和互动体验设备。参观者可以在这里体验到前沿的虚拟现实游戏、教育应用以及创意作品，感受科技带来的无限可能。\",\"exhibitZoneId\":2,\"exhibitZoneName\":\"未来科技互动区\",\"params\":{},\"showroomId\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:27:09',16),(179,'VR展区',3,'com.ruoyi.vr.controller.VrExhibitZoneController.remove()','DELETE',1,'admin','研发部门','/vr/exhibitZone/6','127.0.0.1','内网IP','[6]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:27:27',10),(180,'VR展区',3,'com.ruoyi.vr.controller.VrExhibitZoneController.remove()','DELETE',1,'admin','研发部门','/vr/exhibitZone/7','127.0.0.1','内网IP','[7]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:27:29',8),(181,'载体',2,'com.ruoyi.vr.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierId\":5,\"carrierName\":\"a\",\"carrierType\":1,\"exhibitZoneId\":3,\"params\":{},\"specifications\":\"eee\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:27:42',14),(182,'载体',2,'com.ruoyi.vr.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierId\":6,\"carrierName\":\"aa\",\"carrierType\":1,\"exhibitZoneId\":2,\"params\":{},\"specifications\":\"300cm*200cm\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:27:54',18),(183,'载体',2,'com.ruoyi.vr.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierId\":5,\"carrierName\":\"a\",\"carrierType\":1,\"exhibitZoneId\":3,\"params\":{},\"specifications\":\"300cm*200cm\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:28:00',7),(184,'载体',2,'com.ruoyi.vr.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierId\":5,\"carrierName\":\"环保主题\",\"carrierType\":1,\"exhibitZoneId\":3,\"params\":{},\"specifications\":\"300cm*200cm\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:28:40',22),(185,'载体',2,'com.ruoyi.vr.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierId\":6,\"carrierName\":\"科技主题\",\"carrierType\":1,\"exhibitZoneId\":2,\"params\":{},\"specifications\":\"300cm*200cm\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:28:48',4),(186,'载体',2,'com.ruoyi.vr.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/vr/carrier','127.0.0.1','内网IP','{\"carrierId\":11,\"carrierName\":\"未来主题\",\"carrierType\":0,\"exhibitZoneId\":2,\"params\":{},\"specifications\":\"100cm*250cm\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:28:58',6),(187,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/10','127.0.0.1','内网IP','[10]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:29:05',16),(188,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/11','127.0.0.1','内网IP','[11]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:29:06',12),(189,'VR内容',3,'com.ruoyi.vr.controller.VrContentController.remove()','DELETE',1,'admin','研发部门','/vr/content/12','127.0.0.1','内网IP','[12]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:29:07',6),(190,'作品',2,'com.ruoyi.vr.controller.WorkController.edit()','PUT',1,'admin','研发部门','/vr/work','127.0.0.1','内网IP','{\"authors\":\"张三, 李四, 王五\",\"awardInfo\":\"获得校级科技创新大赛一等奖\",\"description\":\"本作品探讨了绿色能源的发展趋势，通过实验和数据分析，提出了一种新型的能源转换方案。\",\"instructor\":\"赵六\",\"params\":{},\"title\":\"《绿色能源的未来》\",\"workId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:30:24',24),(191,'作品',2,'com.ruoyi.vr.controller.WorkController.edit()','PUT',1,'admin','研发部门','/vr/work','127.0.0.1','内网IP','{\"authors\":\"张三, 李四, 王五\",\"awardInfo\":\"获得校级科技创新大赛一等奖\",\"description\":\"本作品探讨了绿色能源的发展趋势，通过实验和数据分析，提出了一种新型的能源转换方案。\",\"instructor\":\"赵六\",\"params\":{},\"title\":\"《绿色能源的未来》\",\"workId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:30:31',5),(192,'作品',2,'com.ruoyi.vr.controller.WorkController.edit()','PUT',1,'admin','研发部门','/vr/work','127.0.0.1','内网IP','{\"authors\":\"陈小明, 李大华, 王小丽\",\"awardInfo\":\"荣获全国大学生创新设计竞赛二等奖\",\"description\":\"本作品旨在解决城市交通拥堵问题，通过引入智能算法和物联网技术，实现了交通流的优化调度。作品经过多次实验验证，证明能有效减少交通延误，提高道路通行效率。同时，该方案还考虑了环保因素，有助于降低城市碳排放。\",\"instructor\":\"张教授\",\"params\":{},\"title\":\"《智能城市交通解决方案》\",\"workId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:31:19',16),(193,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"content\",\"className\":\"VrContent\",\"columns\":[{\"capJavaField\":\"VrContentId\",\"columnComment\":\"VR内容编号\",\"columnId\":217,\"columnName\":\"vr_content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 14:45:59\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"vrContentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":36,\"updateBy\":\"\",\"updateTime\":\"2025-01-24 14:53:50\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":218,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 14:45:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":36,\"updateBy\":\"\",\"updateTime\":\"2025-01-24 14:53:50\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":219,\"columnName\":\"category\",\"columnType\":\"enum(\'文本\',\'图片\',\'动画\',\'声音和视频\',\'3D模型\',\'VR场景\')\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 14:45:59\",\"dictType\":\"vr_content_category\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":36,\"updateBy\":\"\",\"updateTime\":\"2025-01-24 14:53:50\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":220,\"columnName\":\"file_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 14:45:59\",\"dictType','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:33:06',74),(194,'VR内容',2,'com.ruoyi.vr.controller.VrContentController.edit()','PUT',1,'admin','研发部门','/vr/content','127.0.0.1','内网IP','{\"carrierId\":5,\"category\":\"声音和视频\",\"createdAt\":\"2025-01-24 17:32:11\",\"description\":\"本VR内容带领用户穿梭于2050年的未来城市，体验高科技与自然环境的完美融合。从智能建筑到绿色能源，感受未来生活的无限可能。\",\"fileUrl\":\"http://example.com/vr_content.mp4\",\"name\":\"未来城市漫游\",\"params\":{},\"updatedAt\":\"2025-01-24 17:32:11\",\"usageStatus\":\"1\",\"vrContentId\":14,\"workId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:35:58',22),(195,'合作案例',3,'com.ruoyi.school.controller.CooperationCaseController.remove()','DELETE',1,'admin','研发部门','/school/case/1','127.0.0.1','内网IP','[1]',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_scene`, CONSTRAINT `vr_scene_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cooperation_case` (`case_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\22222\\ruoyi-admin\\target\\classes\\mapper\\school\\CooperationCaseMapper.xml]\r\n### The error may involve com.ruoyi.school.mapper.CooperationCaseMapper.deleteCooperationCaseByCaseIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from cooperation_case where case_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_scene`, CONSTRAINT `vr_scene_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cooperation_case` (`case_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_scene`, CONSTRAINT `vr_scene_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cooperation_case` (`case_id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry-vue`.`vr_scene`, CONSTRAINT `vr_scene_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cooperation_case` (`case_id`) ON DELETE RESTRICT ON UPDATE RESTRICT)','2025-02-07 17:36:07',13),(196,'合作案例',2,'com.ruoyi.school.controller.CooperationCaseController.edit()','PUT',1,'admin','研发部门','/school/case','127.0.0.1','内网IP','{\"caseId\":1,\"caseName\":\"智慧医疗平台合作\",\"cooperationUnit\":\"绿色能源科技有限公司\",\"description\":\"本案例展示了与绿色能源科技有限公司的合作，共同推进环保能源项目。我们联合研发了高效太阳能发电技术，该技术不仅提高了能源转换效率，还降低了生产成本。通过此次合作，我们成功推动了可再生能源的发展，为环境保护做出了积极贡献。\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:37:13',12),(197,'合作案例',2,'com.ruoyi.school.controller.CooperationCaseController.edit()','PUT',1,'admin','研发部门','/school/case','127.0.0.1','内网IP','{\"caseId\":2,\"caseName\":\"智慧城市交通解决方案合作\",\"cooperationUnit\":\"未来交通科技有限公司\",\"description\":\"本案例展示了与未来交通科技有限公司的合作，共同开发智慧城市交通解决方案。通过引入先进的传感技术和数据分析系统，我们成功缓解了城市交通拥堵问题，提高了道路通行效率，为市民提供了更加便捷、安全的出行环境。\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:37:35',8),(198,'合作案例',3,'com.ruoyi.school.controller.CooperationCaseController.remove()','DELETE',1,'admin','研发部门','/school/case/4','127.0.0.1','内网IP','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:37:41',4),(199,'合作案例',3,'com.ruoyi.school.controller.CooperationCaseController.remove()','DELETE',1,'admin','研发部门','/school/case/5','127.0.0.1','内网IP','[5]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:37:43',9),(200,'VR场景',2,'com.ruoyi.school.controller.VrSceneController.edit()','PUT',1,'admin','研发部门','/school/scene','127.0.0.1','内网IP','{\"caseId\":1,\"description\":\"本VR场景为用户呈现了一个高度仿真的虚拟手术室环境，通过佩戴VR设备，医学生和实习生可以在虚拟环境中进行手术操作练习，感受真实的手术氛围。场景中包含了各种手术器械和模拟患者，帮助用户熟悉手术流程，提高手术技能。\",\"fileUrl\":\"http://example.com/vr_scene.zip\",\"params\":{},\"sceneId\":1,\"sceneName\":\"虚拟手术室体验\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:38:31',15),(201,'VR场景',2,'com.ruoyi.school.controller.VrSceneController.edit()','PUT',1,'admin','研发部门','/school/scene','127.0.0.1','内网IP','{\"caseId\":2,\"description\":\"本VR场景带您走进未来智慧城市的交通管控中心，感受高科技如何助力城市交通管理。通过虚拟现实技术，您可以亲身体验智能交通系统的运作，包括实时交通监控、数据分析和自动调度等功能，展现科技如何让城市交通更加高效、安全和便捷。\",\"fileUrl\":\"http://example.com/vr_scene_traffic.zip\",\"params\":{},\"sceneId\":2,\"sceneName\":\"智能交通管控中心体验\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:39:13',7),(202,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"VrMaterial\",\"columns\":[{\"capJavaField\":\"VrMaterialId\",\"columnComment\":\"VR素材编号\",\"columnId\":243,\"columnName\":\"vr_material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"vrMaterialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":40,\"updateBy\":\"\",\"updateTime\":\"2025-01-21 20:52:59\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"素材名称\",\"columnId\":244,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":40,\"updateBy\":\"\",\"updateTime\":\"2025-01-21 20:52:59\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":245,\"columnName\":\"category\",\"columnType\":\"enum(\'文本\',\'图片\',\'动画\',\'声音和视频\',\'3D模型\',\'VR场景\')\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":40,\"updateBy\":\"\",\"updateTime\":\"2025-01-21 20:52:59\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":246,\"columnName\":\"file_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"text','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:40:03',23),(203,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"VrMaterial\",\"columns\":[{\"capJavaField\":\"VrMaterialId\",\"columnComment\":\"VR素材编号\",\"columnId\":243,\"columnName\":\"vr_material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"vrMaterialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":40,\"updateBy\":\"\",\"updateTime\":\"2025-02-07 17:40:03\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"素材名称\",\"columnId\":244,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":40,\"updateBy\":\"\",\"updateTime\":\"2025-02-07 17:40:03\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":245,\"columnName\":\"category\",\"columnType\":\"enum(\'文本\',\'图片\',\'动画\',\'声音和视频\',\'3D模型\',\'VR场景\')\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":40,\"updateBy\":\"\",\"updateTime\":\"2025-02-07 17:40:03\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":246,\"columnName\":\"file_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-20 15:10:26\",\"dictType\":\"\",\"edit\":tr','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:42:31',36),(204,'VR素材',2,'com.ruoyi.school.controller.VrMaterialController.edit()','PUT',1,'admin','研发部门','/school/material','127.0.0.1','内网IP','{\"category\":\"文本\",\"description\":\"本VR素材包含高精度的手术器械模型，适用于虚拟手术室场景。这些模型细节丰富，质感逼真，能够为用户提供近乎真实的手术操作体验。通过集成到VR环境中，医学生和实习医生可以在安全的环境中练习手术技巧，熟悉各种手术器械的使用。\",\"fileUrl\":\"http://example.com/vr_materials_surgery.zip\",\"name\":\"手术器械模型\",\"params\":{},\"sceneId\":1,\"vrMaterialId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:47:01',13),(205,'VR素材',2,'com.ruoyi.school.controller.VrMaterialController.edit()','PUT',1,'admin','研发部门','/school/material','127.0.0.1','内网IP','{\"category\":\"文本\",\"description\":\"本VR素材精心设计了一套智能交通管控中心的监控大屏界面，为用户提供沉浸式的虚拟现实体验。界面中包含了实时交通流量图、事故报警点、路况信息等关键数据展示，帮助用户更好地理解和学习智能交通系统的运作原理和功能布局。通过与VR场景的结合，使用户仿佛置身于真实的交通管控中心之中。\",\"fileUrl\":\"http://example.com/vr_materials_traffic_monitor.zip\",\"name\":\"交通监控大屏界面\",\"params\":{},\"sceneId\":2,\"vrMaterialId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-07 17:47:55',7);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-12-24 16:55:22','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-12-24 16:55:22','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-12-24 16:55:22','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-12-24 16:55:22','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-12-24 16:55:22','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-12-24 16:55:22','',NULL,'普通角色'),(100,'课研人员','research',3,'1',1,1,'0','0','admin','2025-01-07 20:34:08','admin','2025-01-07 20:36:04',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,2035),(100,2036),(100,2037),(100,2038),(100,2039),(100,2040),(100,2041),(100,2043);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','小明','00','xiaoming@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-02-07 17:31:50','admin','2024-12-24 16:55:22','','2025-02-07 17:31:49','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-01-07 20:41:30','admin','2024-12-24 16:55:22','','2025-01-07 20:41:30','测试员'),(100,NULL,'lazy','懒酱','00','','','0','','$2a$10$bfxb1pIgr5VGlSi9324Ff.7HkY98ZMqxpnMmqCevfYPwjdZk0IhIO','0','0','127.0.0.1','2025-01-07 20:37:19','admin','2025-01-07 20:37:01','','2025-01-07 20:37:18',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_course` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '课程编码',
  `subject` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '课程学科',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '课程名称',
  `price` int DEFAULT NULL COMMENT '价格（元）',
  `applicable_person` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '适用人群',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '课程介绍',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='课程管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES (1,'cp123456','javaEE','JavaSE基础',199,'小白学员','JavaSE基础','2024-04-20 09:57:35','2024-04-20 09:57:35'),(2,'cp123457','javaEE','JavaWeb',188,'初级开发者','JavaWeb','2024-04-20 09:57:35','2024-04-20 09:57:35'),(3,'cp123458','Python+大数据','Python入门',555,'小白学员','Python入门','2024-04-20 09:57:35','2024-04-20 09:57:35'),(4,'cp123459','Python+大数据','PythonWeb',88,'初级开发者','PythonWeb','2024-04-20 09:57:35','2024-04-20 09:57:35'),(5,'cp123460','鸿蒙应用开发','鸿蒙入门',99,'小白学员','鸿蒙入门','2024-04-20 09:57:35','2024-04-20 09:57:35');
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_carrier`
--

DROP TABLE IF EXISTS `vr_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_carrier` (
  `carrier_id` int NOT NULL AUTO_INCREMENT,
  `carrier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `carrier_type` int NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `specifications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `exhibit_zone_id` int DEFAULT NULL,
  PRIMARY KEY (`carrier_id`) USING BTREE,
  UNIQUE KEY `vr_carrier_carrier_name_uindex` (`carrier_name`) USING BTREE,
  KEY `exhibit_zone_id` (`exhibit_zone_id`) USING BTREE,
  CONSTRAINT `vr_carrier_ibfk_1` FOREIGN KEY (`exhibit_zone_id`) REFERENCES `vr_exhibit_zone` (`exhibit_zone_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_carrier`
--

LOCK TABLES `vr_carrier` WRITE;
/*!40000 ALTER TABLE `vr_carrier` DISABLE KEYS */;
INSERT INTO `vr_carrier` VALUES (5,'环保主题',1,'0','300cm*200cm',3),(6,'科技主题',1,'0','300cm*200cm',2),(11,'未来主题',0,'0','100cm*250cm',2);
/*!40000 ALTER TABLE `vr_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_content`
--

DROP TABLE IF EXISTS `vr_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_content` (
  `vr_content_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `usage_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `carrier_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vr_content_id`) USING BTREE,
  KEY `carrier_id` (`carrier_id`) USING BTREE,
  KEY `work_id` (`work_id`) USING BTREE,
  CONSTRAINT `vr_content_ibfk_1` FOREIGN KEY (`carrier_id`) REFERENCES `vr_carrier` (`carrier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vr_content_ibfk_2` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_content`
--

LOCK TABLES `vr_content` WRITE;
/*!40000 ALTER TABLE `vr_content` DISABLE KEYS */;
INSERT INTO `vr_content` VALUES (14,'未来城市漫游','声音和视频','http://example.com/vr_content.mp4','本VR内容带领用户穿梭于2050年的未来城市，体验高科技与自然环境的完美融合。从智能建筑到绿色能源，感受未来生活的无限可能。','1',5,1,'2025-01-24 09:32:11','2025-01-24 09:32:11');
/*!40000 ALTER TABLE `vr_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_exhibit_zone`
--

DROP TABLE IF EXISTS `vr_exhibit_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_exhibit_zone` (
  `exhibit_zone_id` int NOT NULL AUTO_INCREMENT,
  `exhibit_zone_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `showroom_id` int DEFAULT NULL,
  PRIMARY KEY (`exhibit_zone_id`) USING BTREE,
  UNIQUE KEY `vr_exhibit_zone_exhibit_zone_name_uindex` (`exhibit_zone_name`) USING BTREE,
  KEY `showroom_id` (`showroom_id`) USING BTREE,
  CONSTRAINT `vr_exhibit_zone_ibfk_1` FOREIGN KEY (`showroom_id`) REFERENCES `vr_showroom` (`showroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_exhibit_zone`
--

LOCK TABLES `vr_exhibit_zone` WRITE;
/*!40000 ALTER TABLE `vr_exhibit_zone` DISABLE KEYS */;
INSERT INTO `vr_exhibit_zone` VALUES (2,'未来科技互动区','未来科技互动区是虚拟现实体验中心内的一个特色展区，它展示了最新的VR技术和互动体验设备。参观者可以在这里体验到前沿的虚拟现实游戏、教育应用以及创意作品，感受科技带来的无限可能。',4),(3,'智能生活体验区','智能生活体验区是科技创新展示厅内的一个亮点展区，它聚焦于智能家居、可穿戴设备、人工智能等前沿科技在日常生活中的应用。参观者可以在这里亲身体验智能化带来的便捷与舒适，感受未来生活的无限可能。',1);
/*!40000 ALTER TABLE `vr_exhibit_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_material`
--

DROP TABLE IF EXISTS `vr_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_material` (
  `vr_material_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` enum('文本','图片','动画','声音和视频','3D模型','VR场景') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `scene_id` int NOT NULL,
  PRIMARY KEY (`vr_material_id`) USING BTREE,
  KEY `scene_id` (`scene_id`) USING BTREE,
  CONSTRAINT `vr_material_ibfk_1` FOREIGN KEY (`scene_id`) REFERENCES `vr_scene` (`scene_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_material`
--

LOCK TABLES `vr_material` WRITE;
/*!40000 ALTER TABLE `vr_material` DISABLE KEYS */;
INSERT INTO `vr_material` VALUES (1,'手术器械模型','文本','http://example.com/vr_materials_surgery.zip','本VR素材包含高精度的手术器械模型，适用于虚拟手术室场景。这些模型细节丰富，质感逼真，能够为用户提供近乎真实的手术操作体验。通过集成到VR环境中，医学生和实习医生可以在安全的环境中练习手术技巧，熟悉各种手术器械的使用。',1),(2,'交通监控大屏界面','文本','http://example.com/vr_materials_traffic_monitor.zip','本VR素材精心设计了一套智能交通管控中心的监控大屏界面，为用户提供沉浸式的虚拟现实体验。界面中包含了实时交通流量图、事故报警点、路况信息等关键数据展示，帮助用户更好地理解和学习智能交通系统的运作原理和功能布局。通过与VR场景的结合，使用户仿佛置身于真实的交通管控中心之中。',2);
/*!40000 ALTER TABLE `vr_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_scene`
--

DROP TABLE IF EXISTS `vr_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_scene` (
  `scene_id` int NOT NULL AUTO_INCREMENT,
  `scene_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `case_id` int DEFAULT NULL,
  PRIMARY KEY (`scene_id`) USING BTREE,
  KEY `case_id` (`case_id`) USING BTREE,
  CONSTRAINT `vr_scene_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cooperation_case` (`case_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_scene`
--

LOCK TABLES `vr_scene` WRITE;
/*!40000 ALTER TABLE `vr_scene` DISABLE KEYS */;
INSERT INTO `vr_scene` VALUES (1,'虚拟手术室体验','http://example.com/vr_scene.zip','本VR场景为用户呈现了一个高度仿真的虚拟手术室环境，通过佩戴VR设备，医学生和实习生可以在虚拟环境中进行手术操作练习，感受真实的手术氛围。场景中包含了各种手术器械和模拟患者，帮助用户熟悉手术流程，提高手术技能。',1),(2,'智能交通管控中心体验','http://example.com/vr_scene_traffic.zip','本VR场景带您走进未来智慧城市的交通管控中心，感受高科技如何助力城市交通管理。通过虚拟现实技术，您可以亲身体验智能交通系统的运作，包括实时交通监控、数据分析和自动调度等功能，展现科技如何让城市交通更加高效、安全和便捷。',2);
/*!40000 ALTER TABLE `vr_scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_showroom`
--

DROP TABLE IF EXISTS `vr_showroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_showroom` (
  `showroom_id` int NOT NULL AUTO_INCREMENT,
  `showroom_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`showroom_id`) USING BTREE,
  UNIQUE KEY `vr_showroom_showroom_name_uindex` (`showroom_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_showroom`
--

LOCK TABLES `vr_showroom` WRITE;
/*!40000 ALTER TABLE `vr_showroom` DISABLE KEYS */;
INSERT INTO `vr_showroom` VALUES (1,'虚拟现实体验中心','虚拟现实体验中心提供了多种VR设备和互动体验，让参观者能够身临其境地感受虚拟世界的魅力。该展厅设有多个主题区域，包括游戏区、教育区和创意区，每个区域都有独特的VR内容供参观者探索。'),(2,'互动VR乐园','互动VR乐园是一个以家庭娱乐为主题的VR展览空间。这里提供了多种适合所有年龄段人群的VR游戏和互动体验，让参观者能够在轻松愉快的氛围中享受虚拟现实的乐趣。'),(4,'VR未来实验室','VR未来实验室是一个专注于虚拟现实技术研发和应用的展览空间。这里汇聚了来自全球的最新VR技术和产品，让参观者能够亲身体验到虚拟现实技术的无限可能。');
/*!40000 ALTER TABLE `vr_showroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_zone`
--

DROP TABLE IF EXISTS `warehouse_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_zone` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`zone_id`) USING BTREE,
  KEY `factory_id` (`factory_id`) USING BTREE,
  CONSTRAINT `warehouse_zone_ibfk_1` FOREIGN KEY (`factory_id`) REFERENCES `factory` (`factory_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_zone`
--

LOCK TABLES `warehouse_zone` WRITE;
/*!40000 ALTER TABLE `warehouse_zone` DISABLE KEYS */;
INSERT INTO `warehouse_zone` VALUES (5,'原料仓库A区','原料仓库A区主要用于存放生产所需的主要原材料，包括化学品、生物制剂等。该区域配备有温湿度控制系统，确保材料质量稳定。',4),(6,'成品仓库B区','成品仓库B区主要用于存放生产完成后的产品，包括包装好的药品、试剂盒等。该区域同样配备有温湿度控制系统，确保产品质量不受影响。',1);
/*!40000 ALTER TABLE `warehouse_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work` (
  `work_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `authors` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instructor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `award_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`work_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'《绿色能源的未来》','张三, 李四, 王五','赵六','获得校级科技创新大赛一等奖','本作品探讨了绿色能源的发展趋势，通过实验和数据分析，提出了一种新型的能源转换方案。'),(2,'《智能城市交通解决方案》','陈小明, 李大华, 王小丽','张教授','荣获全国大学生创新设计竞赛二等奖','本作品旨在解决城市交通拥堵问题，通过引入智能算法和物联网技术，实现了交通流的优化调度。作品经过多次实验验证，证明能有效减少交通延误，提高道路通行效率。同时，该方案还考虑了环保因素，有助于降低城市碳排放。');
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 17:48:24
