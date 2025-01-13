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
  `content_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `qr_code_id` int DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_content`
--

LOCK TABLES `ar_content` WRITE;
/*!40000 ALTER TABLE `ar_content` DISABLE KEYS */;
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
  `case_name` varchar(255) DEFAULT NULL,
  `cooperation_unit` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooperation_case`
--

LOCK TABLES `cooperation_case` WRITE;
/*!40000 ALTER TABLE `cooperation_case` DISABLE KEYS */;
INSERT INTO `cooperation_case` VALUES (1,'案例1','广东工业大学','这是一个测试用例'),(2,'案例2','个体','这是一个测试用例');
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
  `name` varchar(100) NOT NULL,
  `description` text,
  `status` varchar(20) DEFAULT NULL,
  `qr_code_number` varchar(100) DEFAULT NULL,
  `factory_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`device_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `energy_consumption`
--

DROP TABLE IF EXISTS `energy_consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `energy_consumption` (
  `energy_id` int NOT NULL AUTO_INCREMENT,
  `energy_amount` decimal(10,2) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `energy_type` varchar(50) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`energy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energy_consumption`
--

LOCK TABLES `energy_consumption` WRITE;
/*!40000 ALTER TABLE `energy_consumption` DISABLE KEYS */;
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
  `name` varchar(255) NOT NULL,
  `description` text,
  `equipment_status` varchar(50) DEFAULT NULL,
  `qr_code_id` int DEFAULT NULL,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `description` text,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`factory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
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
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (3,'tb_course','课程管理',NULL,NULL,'TbCourse','crud','element-ui','com.ruoyi.system','system','course','课程管理','ruoyi','0','/','{\"parentMenuId\":0}','admin','2025-01-04 16:35:40','','2025-01-07 21:08:04',NULL),(4,'cooperation_case','合作案例',NULL,NULL,'CooperationCase','crud','element-ui','com.ruoyi.system','system','case','合作案例','lazy','0','/','{}','admin','2025-01-09 14:25:40','','2025-01-09 14:31:09',NULL),(5,'energy_consumption','能耗清单',NULL,NULL,'EnergyConsumption','crud','element-ui','com.ruoyi.system','system','consumption','能耗清单','lazy','0','/','{}','admin','2025-01-09 14:25:40','','2025-01-13 09:46:47','能耗清单'),(6,'factory','工厂',NULL,NULL,'Factory','crud','element-ui','com.ruoyi.system','system','factory','工厂','lazy','0','/','{}','admin','2025-01-09 14:25:40','','2025-01-13 09:49:55','工厂'),(7,'qr_code','二维码',NULL,NULL,'QrCode','crud','element-ui','com.ruoyi.system','system','code','二维码','lazy','0','/','{}','admin','2025-01-09 14:25:40','','2025-01-13 09:51:09','二维码'),(8,'sandbox_zone','沙盘分区',NULL,NULL,'SandboxZone','crud','element-ui','com.ruoyi.system','system','zone','沙盘分区','lazy','0','/','{}','admin','2025-01-09 14:25:40','','2025-01-13 09:52:49','沙盘分区'),(9,'vr_carrier','载体',NULL,NULL,'VrCarrier','crud','element-ui','com.ruoyi.system','system','carrier','载体','lazy','0','/','{}','admin','2025-01-09 14:25:40','','2025-01-13 09:58:02',NULL),(10,'vr_content','VR内容',NULL,NULL,'VrContent','crud','element-ui','com.ruoyi.system','system','content','VR内容','lazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-09 14:25:41','','2025-01-13 11:11:51','VR内容'),(11,'vr_material','VR素材',NULL,NULL,'VrMaterial','crud','element-ui','com.ruoyi.system','system','material','VR素材','lazy','0','/','{\"parentMenuId\":2100}','admin','2025-01-09 14:25:41','','2025-01-13 11:20:25','VR素材'),(12,'vr_scene','VR场景',NULL,NULL,'VrScene','crud','element-ui','com.ruoyi.system','system','scene','VR场景','lazy','0','/','{\"parentMenuId\":2100}','admin','2025-01-09 14:25:41','','2025-01-13 11:28:25','VR场景'),(13,'work','作品',NULL,NULL,'Work','crud','element-ui','com.ruoyi.system','system','work','作品','lazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-09 14:25:41','','2025-01-13 11:35:48','作品'),(14,'ar_content','AR内容',NULL,NULL,'ArContent','crud','element-ui','com.ruoyi.system.ar','ar','arcontent','AR内容','lazy','0','/','{\"parentMenuId\":2044}','admin','2025-01-09 14:26:34','','2025-01-13 11:56:52','AR内容'),(21,'vr_exhibit_zone','',NULL,NULL,'VrExhibitZone','crud','','com.ruoyi.system','system','zone',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:34','',NULL,NULL),(22,'vr_showroom','',NULL,NULL,'VrShowroom','crud','','com.ruoyi.system','system','showroom',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:34','',NULL,NULL),(23,'warehouse_zone','',NULL,NULL,'WarehouseZone','crud','','com.ruoyi.system','system','zone',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:34','',NULL,NULL),(24,'equipment','',NULL,NULL,'Equipment','crud','','com.ruoyi.system','system','equipment',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(25,'maintenance_record','',NULL,NULL,'MaintenanceRecord','crud','','com.ruoyi.system','system','record',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(26,'material','',NULL,NULL,'Material','crud','','com.ruoyi.system','system','material',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(27,'material_transaction','',NULL,NULL,'MaterialTransaction','crud','','com.ruoyi.system','system','transaction',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(28,'material_transaction_detail','',NULL,NULL,'MaterialTransactionDetail','crud','','com.ruoyi.system','system','detail',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(29,'product','',NULL,NULL,'Product','crud','','com.ruoyi.system','system','product',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(30,'product_transaction','',NULL,NULL,'ProductTransaction','crud','','com.ruoyi.system','system','transaction',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(31,'product_transaction_detail','',NULL,NULL,'ProductTransactionDetail','crud','','com.ruoyi.system','system','detail',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(32,'production_batch','',NULL,NULL,'ProductionBatch','crud','','com.ruoyi.system','system','batch',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(33,'supply_batch','',NULL,NULL,'SupplyBatch','crud','','com.ruoyi.system','system','batch',NULL,'ruoyi','0','/',NULL,'admin','2025-01-09 14:26:56','',NULL,NULL),(35,'device','设备',NULL,NULL,'Device','crud','element-ui','com.ruoyi.system','system','device','设备','lazy','0','/','{\"parentMenuId\":2099}','admin','2025-01-13 11:43:55','','2025-01-13 11:45:00','设备');
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
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (13,3,'id','课程id','bigint','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(14,3,'code','课程编码','varchar(32)','String','code','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(15,3,'subject','课程学科','varchar(32)','String','subject','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(16,3,'name','课程名称','varchar(64)','String','name','0','0','0','1','1','1','1','LIKE','select','',4,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(17,3,'price','价格（元）','int','Long','price','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(18,3,'applicable_person','适用人群','varchar(32)','String','applicablePerson','0','0','0','1','1','1','1','EQ','select','',6,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(19,3,'info','课程介绍','varchar(255)','String','info','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(20,3,'create_time','创建时间','timestamp','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(21,3,'update_time','更新时间','timestamp','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2025-01-04 16:35:40','','2025-01-07 21:08:04'),(22,4,'case_id','案例编号','int','Long','caseId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-09 14:31:09'),(23,4,'case_name','案例名称','varchar(255)','String','caseName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-09 14:31:09'),(24,4,'cooperation_unit','合作单位','varchar(255)','String','cooperationUnit','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2025-01-09 14:25:40','','2025-01-09 14:31:09'),(25,4,'description','简介','text','String','description','0','0','0','1','1','1','0','EQ','textarea','',4,'admin','2025-01-09 14:25:40','','2025-01-09 14:31:09'),(26,5,'energy_id','编号','int','Long','energyId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(27,5,'energy_amount','能耗','decimal(10,2)','BigDecimal','energyAmount','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(28,5,'unit','计量单位','varchar(50)','String','unit','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(29,5,'energy_type','类型','varchar(50)','String','energyType','0','0','0','1','1','1','1','EQ','select','',4,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(30,5,'year','年度','int','Long','year','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(31,5,'month','月份','int','Long','month','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(32,5,'factory_id','工厂编号','int','Long','factoryId','0','0','1','1','1','1','1','EQ','input','',7,'admin','2025-01-09 14:25:40','','2025-01-13 09:46:47'),(33,6,'factory_id','工厂编号','int','Long','factoryId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-13 09:49:55'),(34,6,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-13 09:49:55'),(35,6,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:25:40','','2025-01-13 09:49:55'),(36,6,'contact_person','联系人','varchar(255)','String','contactPerson','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:25:40','','2025-01-13 09:49:55'),(37,6,'contact_phone','联系电话','varchar(20)','String','contactPhone','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:25:40','','2025-01-13 09:49:55'),(38,6,'address','地址','varchar(255)','String','address','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:25:40','','2025-01-13 09:49:55'),(39,7,'qr_code_id','二维码编号','int','Long','qrCodeId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-13 09:51:09'),(40,7,'qr_code_image_url','二维码','varchar(255)','String','qrCodeImageUrl','0','0','1','1','1','1','0','EQ','input','',2,'admin','2025-01-09 14:25:40','','2025-01-13 09:51:09'),(41,8,'zone_id','分区编号','int','Long','zoneId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-13 09:52:49'),(42,8,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-13 09:52:49'),(43,8,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:25:40','','2025-01-13 09:52:49'),(44,8,'qr_code_id','二维码编号','int','Long','qrCodeId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:25:40','','2025-01-13 09:52:49'),(45,8,'factory_id','工厂编号','int','Long','factoryId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:25:40','','2025-01-13 09:52:49'),(46,9,'carrier_id','载体编号','int','Long','carrierId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:40','','2025-01-13 09:58:02'),(47,9,'carrier_name','载体名称','varchar(255)','String','carrierName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:40','','2025-01-13 09:58:02'),(48,9,'carrier_type','载体类型','int','Long','carrierType','0','0','0','1','1','1','1','EQ','select','',3,'admin','2025-01-09 14:25:41','','2025-01-13 09:58:02'),(49,9,'status','状态','varchar(50)','String','status','0','0','0','1','1','1','1','EQ','radio','',4,'admin','2025-01-09 14:25:41','','2025-01-13 09:58:02'),(50,9,'specifications','规格','text','String','specifications','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-01-09 14:25:41','','2025-01-13 09:58:02'),(51,9,'exhibit_zone_id','展区编号','int','Long','exhibitZoneId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:25:41','','2025-01-13 09:58:02'),(52,10,'content_id','VR内容编号','int','Long','contentId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(53,10,'content_name','名称','varchar(255)','String','contentName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(54,10,'category','类别','varchar(100)','String','category','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(55,10,'file_url','文件URL','varchar(255)','String','fileUrl','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(56,10,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(57,10,'carrier_id','载体编号','int','Long','carrierId','0','0','1','1','1','1','0','EQ','input','',6,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(58,10,'work_id','作品编号','int','Long','workId','0','0','1','1','1','1','0','EQ','input','',7,'admin','2025-01-09 14:25:41','','2025-01-13 11:11:51'),(59,11,'material_id','VR素材编号','int','Long','materialId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:41','','2025-01-13 11:20:25'),(60,11,'material_name','名称','varchar(255)','String','materialName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:41','','2025-01-13 11:20:25'),(61,11,'category','类别','varchar(100)','String','category','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:25:41','','2025-01-13 11:20:25'),(62,11,'file_url','文件URL','varchar(255)','String','fileUrl','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:25:41','','2025-01-13 11:20:25'),(63,11,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-01-09 14:25:41','','2025-01-13 11:20:25'),(64,11,'scene_id','场景编号','int','Long','sceneId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:25:41','','2025-01-13 11:20:25'),(65,12,'scene_id','场景编号','int','Long','sceneId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:41','','2025-01-13 11:28:25'),(66,12,'scene_name','场景名称','varchar(255)','String','sceneName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:25:41','','2025-01-13 11:28:25'),(67,12,'file_url','文件URL','varchar(255)','String','fileUrl','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:25:41','','2025-01-13 11:28:25'),(68,12,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',4,'admin','2025-01-09 14:25:41','','2025-01-13 11:28:25'),(69,12,'case_id','案例编号','int','Long','caseId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:25:41','','2025-01-13 11:28:25'),(70,13,'work_id','作品编号','int','Long','workId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:25:41','','2025-01-13 11:35:48'),(71,13,'title','标题','varchar(255)','String','title','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:25:41','','2025-01-13 11:35:48'),(72,13,'authors','作者列表','text','String','authors','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:25:41','','2025-01-13 11:35:48'),(73,13,'instructor','指导教师','varchar(255)','String','instructor','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:25:41','','2025-01-13 11:35:48'),(74,13,'award_info','获奖情况','text','String','awardInfo','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-01-09 14:25:41','','2025-01-13 11:35:48'),(75,13,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',6,'admin','2025-01-09 14:25:41','','2025-01-13 11:35:48'),(76,14,'content_id','内容编号','int','Long','contentId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','','2025-01-13 11:56:52'),(77,14,'name','名称','varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','','2025-01-13 11:56:52'),(78,14,'category','类别','varchar(100)','String','category','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:34','','2025-01-13 11:56:52'),(79,14,'url','URL','varchar(255)','String','url','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:26:34','','2025-01-13 11:56:52'),(80,14,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',5,'admin','2025-01-09 14:26:34','','2025-01-13 11:56:52'),(81,14,'qr_code_id','二维码编号','int','Long','qrCodeId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:34','','2025-01-13 11:56:52'),(142,21,'exhibit_zone_id',NULL,'int','Long','exhibitZoneId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','',NULL),(143,21,'exhibit_zone_name',NULL,'varchar(255)','String','exhibitZoneName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','',NULL),(144,21,'description',NULL,'text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:26:34','',NULL),(145,21,'showroom_id',NULL,'int','Long','showroomId','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:26:34','',NULL),(146,22,'showroom_id',NULL,'int','Long','showroomId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','',NULL),(147,22,'showroom_name',NULL,'varchar(255)','String','showroomName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','',NULL),(148,22,'description',NULL,'text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:26:34','',NULL),(149,23,'zone_id',NULL,'int','Long','zoneId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:34','',NULL),(150,23,'name',NULL,'varchar(255)','String','name','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:34','',NULL),(151,23,'description',NULL,'text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:26:34','',NULL),(152,23,'factory_id',NULL,'int','Long','factoryId','0','0','0','1','1','1','1','EQ','input','',4,'admin','2025-01-09 14:26:34','',NULL),(153,24,'equipment_id',NULL,'int','Long','equipmentId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(154,24,'name',NULL,'varchar(255)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:56','',NULL),(155,24,'description',NULL,'text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-09 14:26:56','',NULL),(156,24,'equipment_status',NULL,'varchar(50)','String','equipmentStatus','0','0','0','1','1','1','1','EQ','radio','',4,'admin','2025-01-09 14:26:56','',NULL),(157,24,'qr_code_id',NULL,'int','Long','qrCodeId','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','',NULL),(158,24,'factory_id',NULL,'int','Long','factoryId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','',NULL),(159,25,'record_id',NULL,'int','Long','recordId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(160,25,'maintenance_log',NULL,'text','String','maintenanceLog','0','0','0','1','1','1','1','EQ','textarea','',2,'admin','2025-01-09 14:26:56','',NULL),(161,25,'date',NULL,'date','Date','date','0','0','0','1','1','1','1','EQ','datetime','',3,'admin','2025-01-09 14:26:56','',NULL),(162,25,'maintainer_name',NULL,'varchar(255)','String','maintainerName','0','0','0','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:26:56','',NULL),(163,25,'equipment_id',NULL,'int','Long','equipmentId','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','',NULL),(164,26,'material_id',NULL,'int','Long','materialId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(165,26,'material_name',NULL,'varchar(255)','String','materialName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:56','',NULL),(166,26,'material_model',NULL,'varchar(255)','String','materialModel','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','',NULL),(167,26,'material_description',NULL,'text','String','materialDescription','0','0','0','1','1','1','1','EQ','textarea','',4,'admin','2025-01-09 14:26:56','',NULL),(168,26,'stock_amount',NULL,'int','Long','stockAmount','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','',NULL),(169,26,'warehouse_zone_id',NULL,'int','Long','warehouseZoneId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','',NULL),(170,27,'transaction_id',NULL,'int','Long','transactionId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(171,27,'transaction_type',NULL,'int','Long','transactionType','0','0','0','1','1','1','1','EQ','select','',2,'admin','2025-01-09 14:26:56','',NULL),(172,27,'operator_name',NULL,'varchar(255)','String','operatorName','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2025-01-09 14:26:56','',NULL),(173,27,'warehouse_admin_name',NULL,'varchar(255)','String','warehouseAdminName','0','0','0','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:26:56','',NULL),(174,28,'material_id',NULL,'int','Long','materialId','0','0','0','1','1','1','1','EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(175,28,'transaction_id',NULL,'int','Long','transactionId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','',NULL),(176,28,'quantity',NULL,'int','Long','quantity','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','',NULL),(177,28,'transaction_date',NULL,'date','Date','transactionDate','0','0','0','1','1','1','1','EQ','datetime','',4,'admin','2025-01-09 14:26:56','',NULL),(178,29,'product_id',NULL,'int','Long','productId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(179,29,'product_name',NULL,'varchar(255)','String','productName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2025-01-09 14:26:56','',NULL),(180,29,'product_model',NULL,'varchar(255)','String','productModel','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','',NULL),(181,29,'product_description',NULL,'text','String','productDescription','0','0','0','1','1','1','1','EQ','textarea','',4,'admin','2025-01-09 14:26:56','',NULL),(182,29,'stock_amount',NULL,'int','Long','stockAmount','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','',NULL),(183,29,'warehouse_zone_id',NULL,'int','Long','warehouseZoneId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','',NULL),(184,30,'transaction_id',NULL,'int','Long','transactionId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(185,30,'transaction_type',NULL,'int','Long','transactionType','0','0','0','1','1','1','1','EQ','select','',2,'admin','2025-01-09 14:26:56','',NULL),(186,30,'operator_name',NULL,'varchar(255)','String','operatorName','0','0','0','1','1','1','1','LIKE','input','',3,'admin','2025-01-09 14:26:56','',NULL),(187,30,'warehouse_admin_name',NULL,'varchar(255)','String','warehouseAdminName','0','0','0','1','1','1','1','LIKE','input','',4,'admin','2025-01-09 14:26:56','',NULL),(188,31,'product_id',NULL,'int','Long','productId','0','0','0','1','1','1','1','EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(189,31,'transaction_id',NULL,'int','Long','transactionId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','',NULL),(190,31,'quantity',NULL,'int','Long','quantity','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','',NULL),(191,31,'transaction_date',NULL,'date','Date','transactionDate','0','0','0','1','1','1','1','EQ','datetime','',4,'admin','2025-01-09 14:26:56','',NULL),(192,32,'batch_id',NULL,'int','Long','batchId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(193,32,'quantity',NULL,'int','Long','quantity','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','',NULL),(194,32,'unit',NULL,'varchar(50)','String','unit','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','',NULL),(195,32,'production_date',NULL,'date','Date','productionDate','0','0','0','1','1','1','1','EQ','datetime','',4,'admin','2025-01-09 14:26:56','',NULL),(196,32,'product_id',NULL,'int','Long','productId','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','',NULL),(197,33,'batch_id',NULL,'int','Long','batchId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-09 14:26:56','',NULL),(198,33,'quantity',NULL,'int','Long','quantity','0','0','0','1','1','1','1','EQ','input','',2,'admin','2025-01-09 14:26:56','',NULL),(199,33,'unit',NULL,'varchar(50)','String','unit','0','0','0','1','1','1','1','EQ','input','',3,'admin','2025-01-09 14:26:56','',NULL),(200,33,'production_date',NULL,'date','Date','productionDate','0','0','0','1','1','1','1','EQ','datetime','',4,'admin','2025-01-09 14:26:56','',NULL),(201,33,'shelf_life',NULL,'int','Long','shelfLife','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-09 14:26:56','',NULL),(202,33,'manufacturer',NULL,'varchar(255)','String','manufacturer','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-09 14:26:56','',NULL),(203,33,'material_id',NULL,'int','Long','materialId','0','0','0','1','1','1','1','EQ','input','',7,'admin','2025-01-09 14:26:56','',NULL),(211,35,'device_number','设备编号','int','Long','deviceNumber','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-13 11:43:55','','2025-01-13 11:45:00'),(212,35,'name','名称','varchar(100)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-01-13 11:43:55','','2025-01-13 11:45:00'),(213,35,'description','简介','text','String','description','0','0','0','1','1','1','1','EQ','textarea','',3,'admin','2025-01-13 11:43:55','','2025-01-13 11:45:00'),(214,35,'status','设备状态','varchar(20)','String','status','0','0','0','1','1','1','1','EQ','radio','',4,'admin','2025-01-13 11:43:55','','2025-01-13 11:45:00'),(215,35,'qr_code_number','二维码编号','varchar(100)','String','qrCodeNumber','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-01-13 11:43:55','','2025-01-13 11:45:00'),(216,35,'factory_number','工厂编号','varchar(50)','String','factoryNumber','0','0','0','1','1','1','1','EQ','input','',6,'admin','2025-01-13 11:43:55','','2025-01-13 11:45:00');
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
  `maintenance_log` text,
  `date` date DEFAULT NULL,
  `maintainer_name` varchar(255) DEFAULT NULL,
  `equipment_id` int DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_record`
--

LOCK TABLES `maintenance_record` WRITE;
/*!40000 ALTER TABLE `maintenance_record` DISABLE KEYS */;
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
  `material_name` varchar(255) DEFAULT NULL,
  `material_model` varchar(255) DEFAULT NULL,
  `material_description` text,
  `stock_amount` int DEFAULT NULL,
  `warehouse_zone_id` int DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `operator_name` varchar(255) DEFAULT NULL,
  `warehouse_admin_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_transaction`
--

LOCK TABLES `material_transaction` WRITE;
/*!40000 ALTER TABLE `material_transaction` DISABLE KEYS */;
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
  `transaction_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `product_name` varchar(255) DEFAULT NULL,
  `product_model` varchar(255) DEFAULT NULL,
  `product_description` text,
  `stock_amount` int DEFAULT NULL,
  `warehouse_zone_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
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
  `operator_name` varchar(255) DEFAULT NULL,
  `warehouse_admin_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_transaction`
--

LOCK TABLES `product_transaction` WRITE;
/*!40000 ALTER TABLE `product_transaction` DISABLE KEYS */;
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
  `transaction_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `quantity` int DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `qr_code_image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`qr_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_code`
--

LOCK TABLES `qr_code` WRITE;
/*!40000 ALTER TABLE `qr_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `qr_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
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
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
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
  `name` varchar(255) NOT NULL,
  `description` text,
  `qr_code_id` int DEFAULT NULL,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sandbox_zone`
--

LOCK TABLES `sandbox_zone` WRITE;
/*!40000 ALTER TABLE `sandbox_zone` DISABLE KEYS */;
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
  `unit` varchar(50) DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `shelf_life` int DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-12-24 16:55:23','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-12-24 16:55:23','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-12-24 16:55:23','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-12-24 16:55:23','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-12-24 16:55:23','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-12-24 16:55:23','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
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
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
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
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-12-24 16:55:23','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-12-24 16:55:23','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-12-24 16:55:23','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-12-24 16:55:23','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-12-24 16:55:23','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-12-24 16:55:23','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-12-24 16:55:23','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-12-24 16:55:23','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-12-24 16:55:23','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-12-24 16:55:23','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-12-24 16:55:23','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-12-24 16:55:23','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-12-24 16:55:23','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-12-24 16:55:23','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-12-24 16:55:23','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-12-24 16:55:23','',NULL,'停用状态'),(100,0,'JavaEE','0','course_subject',NULL,'default','N','0','ry','2025-01-07 21:06:13','ry','2025-01-07 21:06:45',NULL),(101,1,'Python+大数据','1','course_subject',NULL,'default','N','0','ry','2025-01-07 21:07:03','',NULL,NULL),(102,2,'鸿蒙应用开发','2','course_subject',NULL,'default','N','0','ry','2025-01-07 21:07:25','',NULL,NULL),(103,0,'小白学员','0','course_user',NULL,'default','N','0','ry','2025-01-07 21:23:24','',NULL,NULL),(104,1,'初级开发者','1','course_user',NULL,'default','N','0','ry','2025-01-07 21:23:36','',NULL,NULL),(105,2,'中级开发者','2','course_user',NULL,'default','N','0','ry','2025-01-07 21:23:51','',NULL,NULL),(106,3,'高级开发者','3','course_user',NULL,'default','N','0','ry','2025-01-07 21:24:07','',NULL,NULL);
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
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-12-24 16:55:23','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-12-24 16:55:23','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-12-24 16:55:23','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-12-24 16:55:23','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-12-24 16:55:23','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-12-24 16:55:23','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-12-24 16:55:23','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-12-24 16:55:23','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-12-24 16:55:23','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-12-24 16:55:23','',NULL,'登录状态列表'),(100,'课程学科','course_subject','0','ry','2025-01-07 21:04:30','ry','2025-01-07 21:22:54','课程学科'),(101,'适用人群','course_user','0','ry','2025-01-07 21:21:59','ry','2025-01-07 21:22:25','适用人群');
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
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-12-24 16:55:24','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-12-24 16:55:24','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-12-24 16:55:24','',NULL,'');
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
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
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
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2024-12-25 10:57:40'),(101,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-25 10:57:45'),(102,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2024-12-25 16:52:45'),(103,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-25 16:52:48'),(104,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-25 18:28:39'),(105,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-26 14:46:52'),(106,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 15:54:59'),(107,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-03 16:37:05'),(108,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 16:38:09'),(109,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 18:12:51'),(110,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-04 11:03:00'),(111,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-04 16:23:35'),(112,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:09:52'),(113,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:22:50'),(114,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:25:15'),(115,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 20:37:08'),(116,'lazy','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:37:18'),(117,'lazy','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 20:37:33'),(118,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:37:40'),(119,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:38:05'),(120,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:38:40'),(121,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-07 20:38:49'),(122,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:38:54'),(123,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 20:39:55'),(124,'ry','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 20:40:07'),(125,'ry','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 20:41:30'),(126,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 12:06:04'),(127,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 14:23:11'),(128,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 16:46:22'),(129,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 18:29:29'),(130,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-10 17:11:42'),(131,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-13 09:40:22');
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
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-12-24 16:55:23','',NULL,'系统管理目录'),(2,'系统监控',0,4,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-12-24 16:55:23','admin','2025-01-13 12:01:39','系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-12-24 16:55:23','admin','2025-01-13 12:01:36','系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2024-12-24 16:55:23','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-12-24 16:55:23','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-12-24 16:55:23','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-12-24 16:55:23','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-12-24 16:55:23','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-12-24 16:55:23','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-12-24 16:55:23','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-12-24 16:55:23','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-12-24 16:55:23','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-12-24 16:55:23','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-12-24 16:55:23','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-12-24 16:55:23','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-12-24 16:55:23','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-12-24 16:55:23','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-12-24 16:55:23','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-12-24 16:55:23','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-12-24 16:55:23','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-12-24 16:55:23','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-12-24 16:55:23','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-12-24 16:55:23','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-12-24 16:55:23','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-12-24 16:55:23','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-12-24 16:55:23','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-12-24 16:55:23','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-12-24 16:55:23','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-12-24 16:55:23','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-12-24 16:55:23','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-12-24 16:55:23','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-12-24 16:55:23','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-12-24 16:55:23','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-12-24 16:55:23','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-12-24 16:55:23','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-12-24 16:55:23','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-12-24 16:55:23','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-12-24 16:55:23','',NULL,''),(2034,'信息',1,10,'info','system/info/index',NULL,'',1,0,'C','0','0','system:info:list','#','admin','2025-01-04 17:06:57','admin','2025-01-04 17:09:48',''),(2035,'课程管理',0,4,'course','system/course/index',NULL,'',1,0,'C','0','0','system:course:list','cascader','admin','2025-01-04 17:19:22','admin','2025-01-13 12:01:32','课程管理菜单'),(2036,'课程管理查询',2035,1,'#','',NULL,'',1,0,'F','0','0','system:course:query','#','admin','2025-01-04 17:19:22','',NULL,''),(2037,'课程管理新增',2035,2,'#','',NULL,'',1,0,'F','0','0','system:course:add','#','admin','2025-01-04 17:19:22','',NULL,''),(2038,'课程管理修改',2035,3,'#','',NULL,'',1,0,'F','0','0','system:course:edit','#','admin','2025-01-04 17:19:22','',NULL,''),(2039,'课程管理删除',2035,4,'#','',NULL,'',1,0,'F','0','0','system:course:remove','#','admin','2025-01-04 17:19:22','',NULL,''),(2040,'课程管理导出',2035,5,'#','',NULL,'',1,0,'F','0','0','system:course:export','#','admin','2025-01-04 17:19:22','',NULL,''),(2041,'统计分析',0,4,'stasticss',NULL,NULL,'',1,0,'M','0','0','','excel','admin','2025-01-04 17:23:23','admin','2025-01-13 12:01:28',''),(2043,'客户统计',2041,1,'FSFDFSDF',NULL,NULL,'',1,0,'M','0','0','','404','admin','2025-01-04 17:28:01','admin','2025-01-07 20:26:54',''),(2044,'工厂沙盘AR资源',0,2,'arcontent',NULL,NULL,'',1,0,'M','0','0','','chart','admin','2025-01-09 12:12:12','admin','2025-01-13 12:01:13',''),(2045,'合作案例',2100,1,'case','system/case/index',NULL,'',1,0,'C','0','0','system:case:list','#','admin','2025-01-09 14:32:38','admin','2025-01-13 10:41:41','合作案例菜单'),(2046,'合作案例查询',2045,1,'#','',NULL,'',1,0,'F','0','0','system:case:query','#','admin','2025-01-09 14:32:38','',NULL,''),(2047,'合作案例新增',2045,2,'#','',NULL,'',1,0,'F','0','0','system:case:add','#','admin','2025-01-09 14:32:38','',NULL,''),(2048,'合作案例修改',2045,3,'#','',NULL,'',1,0,'F','0','0','system:case:edit','#','admin','2025-01-09 14:32:38','',NULL,''),(2049,'合作案例删除',2045,4,'#','',NULL,'',1,0,'F','0','0','system:case:remove','#','admin','2025-01-09 14:32:38','',NULL,''),(2050,'合作案例导出',2045,5,'#','',NULL,'',1,0,'F','0','0','system:case:export','#','admin','2025-01-09 14:32:38','',NULL,''),(2051,'载体',2099,1,'carrier','system/carrier/index',NULL,'',1,0,'C','0','0','system:carrier:list','#','admin','2025-01-13 10:11:57','admin','2025-01-13 10:40:53','载体菜单'),(2052,'载体查询',2051,1,'#','',NULL,'',1,0,'F','0','0','system:carrier:query','#','admin','2025-01-13 10:11:57','',NULL,''),(2053,'载体新增',2051,2,'#','',NULL,'',1,0,'F','0','0','system:carrier:add','#','admin','2025-01-13 10:11:57','',NULL,''),(2054,'载体修改',2051,3,'#','',NULL,'',1,0,'F','0','0','system:carrier:edit','#','admin','2025-01-13 10:11:57','',NULL,''),(2055,'载体删除',2051,4,'#','',NULL,'',1,0,'F','0','0','system:carrier:remove','#','admin','2025-01-13 10:11:57','',NULL,''),(2056,'载体导出',2051,5,'#','',NULL,'',1,0,'F','0','0','system:carrier:export','#','admin','2025-01-13 10:11:57','',NULL,''),(2057,'二维码',2044,1,'code','system/code/index',NULL,'',1,0,'C','0','0','system:code:list','#','admin','2025-01-13 10:12:18','admin','2025-01-13 10:42:01','二维码菜单'),(2058,'二维码查询',2057,1,'#','',NULL,'',1,0,'F','0','0','system:code:query','#','admin','2025-01-13 10:12:18','',NULL,''),(2059,'二维码新增',2057,2,'#','',NULL,'',1,0,'F','0','0','system:code:add','#','admin','2025-01-13 10:12:18','',NULL,''),(2060,'二维码修改',2057,3,'#','',NULL,'',1,0,'F','0','0','system:code:edit','#','admin','2025-01-13 10:12:18','',NULL,''),(2061,'二维码删除',2057,4,'#','',NULL,'',1,0,'F','0','0','system:code:remove','#','admin','2025-01-13 10:12:18','',NULL,''),(2062,'二维码导出',2057,5,'#','',NULL,'',1,0,'F','0','0','system:code:export','#','admin','2025-01-13 10:12:18','',NULL,''),(2063,'能耗清单',2044,1,'consumption','system/consumption/index',NULL,'',1,0,'C','0','0','system:consumption:list','#','admin','2025-01-13 10:12:24','admin','2025-01-13 10:42:09','能耗清单菜单'),(2064,'能耗清单查询',2063,1,'#','',NULL,'',1,0,'F','0','0','system:consumption:query','#','admin','2025-01-13 10:12:24','',NULL,''),(2065,'能耗清单新增',2063,2,'#','',NULL,'',1,0,'F','0','0','system:consumption:add','#','admin','2025-01-13 10:12:24','',NULL,''),(2066,'能耗清单修改',2063,3,'#','',NULL,'',1,0,'F','0','0','system:consumption:edit','#','admin','2025-01-13 10:12:24','',NULL,''),(2067,'能耗清单删除',2063,4,'#','',NULL,'',1,0,'F','0','0','system:consumption:remove','#','admin','2025-01-13 10:12:24','',NULL,''),(2068,'能耗清单导出',2063,5,'#','',NULL,'',1,0,'F','0','0','system:consumption:export','#','admin','2025-01-13 10:12:24','',NULL,''),(2069,'工厂',2044,1,'factory','system/factory/index',NULL,'',1,0,'C','0','0','system:factory:list','#','admin','2025-01-13 10:12:31','admin','2025-01-13 10:42:15','工厂菜单'),(2070,'工厂查询',2069,1,'#','',NULL,'',1,0,'F','0','0','system:factory:query','#','admin','2025-01-13 10:12:31','',NULL,''),(2071,'工厂新增',2069,2,'#','',NULL,'',1,0,'F','0','0','system:factory:add','#','admin','2025-01-13 10:12:31','',NULL,''),(2072,'工厂修改',2069,3,'#','',NULL,'',1,0,'F','0','0','system:factory:edit','#','admin','2025-01-13 10:12:31','',NULL,''),(2073,'工厂删除',2069,4,'#','',NULL,'',1,0,'F','0','0','system:factory:remove','#','admin','2025-01-13 10:12:31','',NULL,''),(2074,'工厂导出',2069,5,'#','',NULL,'',1,0,'F','0','0','system:factory:export','#','admin','2025-01-13 10:12:31','',NULL,''),(2075,'沙盘分区',2044,1,'zone','system/zone/index',NULL,'',1,0,'C','0','0','system:zone:list','#','admin','2025-01-13 10:12:44','admin','2025-01-13 10:42:35','沙盘分区菜单'),(2076,'沙盘分区查询',2075,1,'#','',NULL,'',1,0,'F','0','0','system:zone:query','#','admin','2025-01-13 10:12:44','',NULL,''),(2077,'沙盘分区新增',2075,2,'#','',NULL,'',1,0,'F','0','0','system:zone:add','#','admin','2025-01-13 10:12:44','',NULL,''),(2078,'沙盘分区修改',2075,3,'#','',NULL,'',1,0,'F','0','0','system:zone:edit','#','admin','2025-01-13 10:12:44','',NULL,''),(2079,'沙盘分区删除',2075,4,'#','',NULL,'',1,0,'F','0','0','system:zone:remove','#','admin','2025-01-13 10:12:44','',NULL,''),(2080,'沙盘分区导出',2075,5,'#','',NULL,'',1,0,'F','0','0','system:zone:export','#','admin','2025-01-13 10:12:44','',NULL,''),(2099,'学生作品VR应用',0,1,'stuvr',NULL,NULL,'',1,0,'M','0','0',NULL,'dict','admin','2025-01-13 10:39:45','',NULL,''),(2100,'校企合作应用',0,3,'schooluser',NULL,NULL,'',1,0,'M','0','0','','documentation','admin','2025-01-13 10:40:30','admin','2025-01-13 12:01:20',''),(2101,'VR内容',2099,1,'content','system/content/index',NULL,'',1,0,'C','0','0','system:content:list','#','admin','2025-01-13 11:12:51','',NULL,'VR内容菜单'),(2102,'VR内容查询',2101,1,'#','',NULL,'',1,0,'F','0','0','system:content:query','#','admin','2025-01-13 11:12:51','',NULL,''),(2103,'VR内容新增',2101,2,'#','',NULL,'',1,0,'F','0','0','system:content:add','#','admin','2025-01-13 11:12:51','',NULL,''),(2104,'VR内容修改',2101,3,'#','',NULL,'',1,0,'F','0','0','system:content:edit','#','admin','2025-01-13 11:12:51','',NULL,''),(2105,'VR内容删除',2101,4,'#','',NULL,'',1,0,'F','0','0','system:content:remove','#','admin','2025-01-13 11:12:51','',NULL,''),(2106,'VR内容导出',2101,5,'#','',NULL,'',1,0,'F','0','0','system:content:export','#','admin','2025-01-13 11:12:51','',NULL,''),(2107,'VR素材',2100,1,'material','system/material/index',NULL,'',1,0,'C','0','0','system:material:list','#','admin','2025-01-13 11:21:54','',NULL,'VR素材菜单'),(2108,'VR素材查询',2107,1,'#','',NULL,'',1,0,'F','0','0','system:material:query','#','admin','2025-01-13 11:21:54','',NULL,''),(2109,'VR素材新增',2107,2,'#','',NULL,'',1,0,'F','0','0','system:material:add','#','admin','2025-01-13 11:21:54','',NULL,''),(2110,'VR素材修改',2107,3,'#','',NULL,'',1,0,'F','0','0','system:material:edit','#','admin','2025-01-13 11:21:54','',NULL,''),(2111,'VR素材删除',2107,4,'#','',NULL,'',1,0,'F','0','0','system:material:remove','#','admin','2025-01-13 11:21:54','',NULL,''),(2112,'VR素材导出',2107,5,'#','',NULL,'',1,0,'F','0','0','system:material:export','#','admin','2025-01-13 11:21:54','',NULL,''),(2119,'VR场景',2100,1,'scene','system/scene/index',NULL,'',1,0,'C','0','0','system:scene:list','#','admin','2025-01-13 11:28:52','',NULL,'VR场景菜单'),(2120,'VR场景查询',2119,1,'#','',NULL,'',1,0,'F','0','0','system:scene:query','#','admin','2025-01-13 11:28:52','',NULL,''),(2121,'VR场景新增',2119,2,'#','',NULL,'',1,0,'F','0','0','system:scene:add','#','admin','2025-01-13 11:28:52','',NULL,''),(2122,'VR场景修改',2119,3,'#','',NULL,'',1,0,'F','0','0','system:scene:edit','#','admin','2025-01-13 11:28:52','',NULL,''),(2123,'VR场景删除',2119,4,'#','',NULL,'',1,0,'F','0','0','system:scene:remove','#','admin','2025-01-13 11:28:52','',NULL,''),(2124,'VR场景导出',2119,5,'#','',NULL,'',1,0,'F','0','0','system:scene:export','#','admin','2025-01-13 11:28:52','',NULL,''),(2125,'设备',2099,1,'device','system/device/index',NULL,'',1,0,'C','0','0','system:device:list','#','admin','2025-01-13 11:46:05','',NULL,'设备菜单'),(2126,'设备查询',2125,1,'#','',NULL,'',1,0,'F','0','0','system:device:query','#','admin','2025-01-13 11:46:05','',NULL,''),(2127,'设备新增',2125,2,'#','',NULL,'',1,0,'F','0','0','system:device:add','#','admin','2025-01-13 11:46:05','',NULL,''),(2128,'设备修改',2125,3,'#','',NULL,'',1,0,'F','0','0','system:device:edit','#','admin','2025-01-13 11:46:05','',NULL,''),(2129,'设备删除',2125,4,'#','',NULL,'',1,0,'F','0','0','system:device:remove','#','admin','2025-01-13 11:46:05','',NULL,''),(2130,'设备导出',2125,5,'#','',NULL,'',1,0,'F','0','0','system:device:export','#','admin','2025-01-13 11:46:05','',NULL,''),(2137,'作品',2099,1,'work','system/work/index',NULL,'',1,0,'C','0','0','system:work:list','#','admin','2025-01-13 11:46:19','',NULL,'作品菜单'),(2138,'作品查询',2137,1,'#','',NULL,'',1,0,'F','0','0','system:work:query','#','admin','2025-01-13 11:46:19','',NULL,''),(2139,'作品新增',2137,2,'#','',NULL,'',1,0,'F','0','0','system:work:add','#','admin','2025-01-13 11:46:19','',NULL,''),(2140,'作品修改',2137,3,'#','',NULL,'',1,0,'F','0','0','system:work:edit','#','admin','2025-01-13 11:46:19','',NULL,''),(2141,'作品删除',2137,4,'#','',NULL,'',1,0,'F','0','0','system:work:remove','#','admin','2025-01-13 11:46:19','',NULL,''),(2142,'作品导出',2137,5,'#','',NULL,'',1,0,'F','0','0','system:work:export','#','admin','2025-01-13 11:46:19','',NULL,''),(2143,'AR内容',2044,1,'arcontent','ar/arcontent/index',NULL,'',1,0,'C','0','0','ar:arcontent:list','#','admin','2025-01-13 11:57:20','',NULL,'AR内容菜单'),(2144,'AR内容查询',2143,1,'#','',NULL,'',1,0,'F','0','0','ar:arcontent:query','#','admin','2025-01-13 11:57:20','',NULL,''),(2145,'AR内容新增',2143,2,'#','',NULL,'',1,0,'F','0','0','ar:arcontent:add','#','admin','2025-01-13 11:57:20','',NULL,''),(2146,'AR内容修改',2143,3,'#','',NULL,'',1,0,'F','0','0','ar:arcontent:edit','#','admin','2025-01-13 11:57:20','',NULL,''),(2147,'AR内容删除',2143,4,'#','',NULL,'',1,0,'F','0','0','ar:arcontent:remove','#','admin','2025-01-13 11:57:20','',NULL,''),(2148,'AR内容导出',2143,5,'#','',NULL,'',1,0,'F','0','0','ar:arcontent:export','#','admin','2025-01-13 11:57:20','',NULL,'');
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
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-12-24 16:55:24','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-12-24 16:55:24','',NULL,'管理员');
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
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"qr_code\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-25 11:17:13',123),(101,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"qr_code\"}',NULL,0,NULL,'2024-12-25 11:17:21',334),(102,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"code\",\"className\":\"QrCode\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 11:17:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QrCodeImageUrl\",\"columnComment\":\"二维码（图片）\",\"columnId\":2,\"columnName\":\"qr_code_image_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 11:17:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qrCodeImageUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"url资源\",\"columnId\":3,\"columnName\":\"url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 11:17:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"url\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lazy\",\"functionName\":\"二维码管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"code\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.code\",\"params\":{},\"remark\":\"二维码表\",\"sub\":false,\"tableComment\":\"二维码管理\",\"tableId\":1,\"tableName\":\"qr_code\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-25 11:24:52',40),(103,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"qr_code\"}',NULL,0,NULL,'2024-12-25 11:24:57',51),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"code\",\"className\":\"QrCode\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 11:17:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-12-25 11:24:52\",\"usableColumn\":false},{\"capJavaField\":\"QrCodeImageUrl\",\"columnComment\":\"二维码（图片）\",\"columnId\":2,\"columnName\":\"qr_code_image_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 11:17:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"qrCodeImageUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-12-25 11:24:52\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"url资源\",\"columnId\":3,\"columnName\":\"url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 11:17:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"url\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-12-25 11:24:52\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lazy\",\"functionName\":\"二维码管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"code\",\"options\":\"{\\\"parentMenuId\\\":0}\",\"packageName\":\"com.ruoyi.code\",\"params\":{\"parentMenuId\":0},\"parentMenuId\":0,\"remark\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-25 17:11:55',91),(105,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"qr_code\"}',NULL,0,NULL,'2024-12-25 17:11:57',90),(106,'二维码管理',5,'com.ruoyi.code.controller.QrCodeController.export()','POST',1,'admin','研发部门','/code/code/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-12-25 17:27:25',3346),(107,'二维码管理',3,'com.ruoyi.code.controller.QrCodeController.remove()','DELETE',1,'admin','研发部门','/code/code/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-25 17:34:00',28),(108,'二维码管理',5,'com.ruoyi.code.controller.QrCodeController.export()','POST',1,'admin','研发部门','/code/code/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-12-25 17:34:06',102),(109,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-25 18:30:01',161),(110,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"TbCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":4,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程编码\",\"columnId\":5,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":6,\"columnName\":\"subject\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":7,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-25 18:30:15',80),(111,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2024-12-26 14:47:01',540),(112,'课程管理',3,'com.ruoyi.system.controller.TbCourseController.remove()','DELETE',1,'admin','研发部门','/system/course/6','127.0.0.1','内网IP','[6]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-12-26 15:17:30',26),(113,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2006','127.0.0.1','内网IP','2006','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-03 16:39:15',24),(114,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2000','127.0.0.1','内网IP','2000','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-03 16:39:23',6),(115,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2001','127.0.0.1','内网IP','2001','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:26',22),(116,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2002','127.0.0.1','内网IP','2002','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:29',21),(117,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2003','127.0.0.1','内网IP','2003','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:30',14),(118,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2004','127.0.0.1','内网IP','2004','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:32',18),(119,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2005','127.0.0.1','内网IP','2005','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:33',27),(120,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2000','127.0.0.1','内网IP','2000','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:35',24),(121,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2007','127.0.0.1','内网IP','2007','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:40',14),(122,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2008','127.0.0.1','内网IP','2008','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:43',24),(123,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2009','127.0.0.1','内网IP','2009','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:44',18),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2010','127.0.0.1','内网IP','2010','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:46',16),(125,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2011','127.0.0.1','内网IP','2011','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:48',23),(126,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2006','127.0.0.1','内网IP','2006','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:39:52',23),(127,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:41:04',28),(128,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:41:04\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:41:47',19),(129,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:43:36',21),(130,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:43:36\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:46:06',16),(131,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:41:04\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:46:52',17),(132,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:43:36\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"客户统计\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:48:18',16),(133,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:41:04\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics/customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:49:04',13),(134,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:43:36\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:49:36',21),(135,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2019','127.0.0.1','内网IP','2019','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:49:51',12),(136,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:50:37',12),(137,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:41:04\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:51:17',16),(138,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:50:37\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"/static/customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:52:03',16),(139,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:50:37\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"statistics/customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:52:13',13),(140,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2020','127.0.0.1','内网IP','2020','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:52:30',16),(141,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:52:55',7),(142,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:41:04\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:53:39',14),(143,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"statictics/customer/index\",\"createTime\":\"2025-01-03 16:52:55\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:55:34',8),(144,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-03 16:41:04\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statics\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:56:11',17),(145,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"statics/customer/index\",\"createTime\":\"2025-01-03 16:52:55\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:56:18',7),(146,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:58:07',8),(147,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"customer/course/index\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"course\",\"perms\":\"customer:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 17:09:09',10),(148,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"statics/course/index\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"course\",\"perms\":\"statics:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 17:09:32',20),(149,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 17:11:55',18),(150,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"\",\"query\":\"course/index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 17:12:36',11),(151,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2025-01-04 11:03:39',280),(152,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2021','127.0.0.1','内网IP','2021','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 11:13:50',55),(153,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"course\",\"perms\":\"\",\"query\":\"course/index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 11:14:10',36),(154,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"TbCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":4,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-12-25 18:30:15\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程编码\",\"columnId\":5,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-12-25 18:30:15\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":6,\"columnName\":\"subject\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-12-25 18:30:15\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":7,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-25 18:30:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 11:19:55',115),(155,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2025-01-04 11:19:58',141),(156,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2018','127.0.0.1','内网IP','2018','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-04 16:24:07',20),(157,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-12-26 14:49:46\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"\",\"query\":\"course/index\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:27:36',30),(158,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2018','127.0.0.1','内网IP','2018','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:05',31),(159,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2012','127.0.0.1','内网IP','2012','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-04 16:34:17',5),(160,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2013','127.0.0.1','内网IP','2013','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:22',21),(161,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2014','127.0.0.1','内网IP','2014','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:23',7),(162,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2015','127.0.0.1','内网IP','2015','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:25',16),(163,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2016','127.0.0.1','内网IP','2016','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:27',8),(164,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2017','127.0.0.1','内网IP','2017','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:31',10),(165,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2012','127.0.0.1','内网IP','2012','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:34:36',11),(166,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/1','127.0.0.1','内网IP','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:35:28',45),(167,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/2','127.0.0.1','内网IP','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:35:30',11),(168,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:35:40',77),(169,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"TbCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程编码\",\"columnId\":14,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":15,\"columnName\":\"subject\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":16,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"Str','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:35:52',34),(170,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2025-01-04 16:35:57',397),(171,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户统计\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"statics\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:40:54',121),(172,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-12-24 16:55:23\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:41:07',17),(173,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:42:01',17),(174,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"statics/customer\",\"createTime\":\"2025-01-04 16:42:01\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:42:36',17),(175,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-04 16:40:54\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"客户统计\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"excel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:44:27',12),(176,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"excel/customer\",\"createTime\":\"2025-01-04 16:42:01\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:44:36',19),(177,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"excel/bug/index\",\"createTime\":\"2025-01-04 16:42:01\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:45:40',12),(178,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"excel/bug/index\",\"createTime\":\"2025-01-04 16:42:01\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"bug\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:46:34',15),(179,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2025-01-04 16:42:01\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"bug\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:48:39',9),(180,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2029','127.0.0.1','内网IP','2029','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:48:56',15),(181,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:49:36',15),(182,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"excel/cascader/index\",\"createTime\":\"2025-01-04 16:49:36\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:50:18',9),(183,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-04 16:40:54\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"客户统计\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"excel\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:50:41',15),(184,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"excel/cascader/index\",\"createTime\":\"2025-01-04 16:49:36\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:50:51',15),(185,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2030','127.0.0.1','内网IP','2030','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:51:09',15),(186,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:51:37',9),(187,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2031','127.0.0.1','内网IP','2031','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:52:16',11),(188,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"/excel/cascader\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:53:09',9),(189,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/excel/cascader\",\"createTime\":\"2025-01-04 16:53:09\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:54:05',17),(190,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"excel/cascader/index\",\"createTime\":\"2025-01-04 16:53:09\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"perms\":\"excel:cascader:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:55:46',7),(191,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2025-01-04 16:53:09\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"统计分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"cascader\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 16:57:33',9),(192,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/student/test\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"特十大\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:00:43',17),(193,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2033','127.0.0.1','内网IP','2033','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:05:52',18),(194,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/info/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"信息\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"info\",\"perms\":\"system:info:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:06:57',15),(195,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/info/index\",\"createTime\":\"2025-01-04 17:06:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"信息\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"info\",\"perms\":\"system:info:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:09:48',15),(196,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2025-01-04 16:37:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:10:16',16),(197,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2025-01-04 16:37:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2028,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:15:01',33),(198,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2025-01-04 16:37:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:15:55',18),(199,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2028','127.0.0.1','内网IP','2028','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-04 17:16:18',7),(200,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2032','127.0.0.1','内网IP','2032','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:22',16),(201,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2028','127.0.0.1','内网IP','2028','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:24',14),(202,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2023','127.0.0.1','内网IP','2023','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:30',22),(203,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2024','127.0.0.1','内网IP','2024','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:32',16),(204,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2025','127.0.0.1','内网IP','2025','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:33',9),(205,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2026','127.0.0.1','内网IP','2026','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:36',8),(206,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2027','127.0.0.1','内网IP','2027','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:38',13),(207,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2022','127.0.0.1','内网IP','2022','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:16:42',14),(208,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"stasticss\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:23:23',94),(209,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stasticss/customer/index\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"customer\",\"perms\":\"stasticss:customer:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:25:54',21),(210,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"stasticss/customer/index\",\"createTime\":\"2025-01-04 17:25:54\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"客户分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:27:06',13),(211,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2025-01-04 17:25:54\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"客户分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"customer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:27:24',20),(212,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2042','127.0.0.1','内网IP','2042','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:27:37',16),(213,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"TJFXJJ\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"FSFDFSDF\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:28:01',13),(214,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-04 17:28:37',18),(215,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:26:38',28),(216,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-04 17:28:01\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"客户统计\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2041,\"path\":\"FSFDFSDF\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:26:54',9),(217,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2041,2043],\"params\":{},\"roleId\":100,\"roleKey\":\"research\",\"roleName\":\"科研人员\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:34:08',57),(218,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:35:05',16),(219,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-01-07 20:34:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2035,2036,2037,2038,2039,2040,2041,2043],\"params\":{},\"roleId\":100,\"roleKey\":\"research\",\"roleName\":\"科研人员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:35:24',36),(220,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-01-07 20:34:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2035,2036,2037,2038,2039,2040,2041,2043],\"params\":{},\"roleId\":100,\"roleKey\":\"research\",\"roleName\":\"课研人员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:35:48',35),(221,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2025-01-07 20:34:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"research\",\"roleName\":\"课研人员\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:36:04',20),(222,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"懒酱\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"lazy\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 20:37:01',114),(223,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"dictName\":\"课程学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:04:30',23),(224,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"dictName\":\"课程学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\"}','{\"msg\":\"新增字典\'课程学科\'失败，字典类型已存在\",\"code\":500}',0,NULL,'2025-01-07 21:05:07',2),(225,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:04:30\",\"dictId\":100,\"dictName\":\"课程学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:05:34',15),(226,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"JavaEE\",\"dictSort\":0,\"dictType\":\"course_subject\",\"dictValue\":\"Python+大数据\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:06:13',11),(227,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:06:13\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"JavaEE\",\"dictSort\":0,\"dictType\":\"course_subject\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:06:29',7),(228,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:06:13\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"JavaEE\",\"dictSort\":1,\"dictType\":\"course_subject\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:06:37',9),(229,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:06:13\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"JavaEE\",\"dictSort\":0,\"dictType\":\"course_subject\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:06:45',12),(230,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"Python+大数据\",\"dictSort\":1,\"dictType\":\"course_subject\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:07:03',9),(231,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"鸿蒙应用开发\",\"dictSort\":2,\"dictType\":\"course_subject\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:07:25',16),(232,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'ry','测试部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"TbCourse\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课程id\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-01-04 16:35:52\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程编码\",\"columnId\":14,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-01-04 16:35:52\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":15,\"columnName\":\"subject\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-01-04 16:35:52\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":16,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-04 16:35:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:08:04',30),(233,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"dictName\":\"适用人群\",\"dictType\":\"course_user\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:21:59',11),(234,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:04:30\",\"dictId\":100,\"dictName\":\"课程学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:22:17',10),(235,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:21:59\",\"dictId\":101,\"dictName\":\"适用人群\",\"dictType\":\"course_user\",\"params\":{},\"remark\":\"适用人群\",\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:22:25',9),(236,'字典类型',2,'com.ruoyi.web.controller.system.SysDictTypeController.edit()','PUT',1,'ry','测试部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"createTime\":\"2025-01-07 21:04:30\",\"dictId\":100,\"dictName\":\"课程学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\",\"updateBy\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:22:54',26),(237,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"小白学员\",\"dictSort\":0,\"dictType\":\"course_user\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:23:24',8),(238,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"初级开发者\",\"dictSort\":1,\"dictType\":\"course_user\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:23:36',8),(239,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"中级开发者\",\"dictSort\":2,\"dictType\":\"course_user\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:23:51',6),(240,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'ry','测试部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"ry\",\"default\":false,\"dictLabel\":\"高级开发者\",\"dictSort\":3,\"dictType\":\"course_user\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 21:24:07',11),(241,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工厂沙盘AR资源管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"arcontent\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 12:12:12',31),(242,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"qr_code,sandbox_zone,vr_material,cooperation_case,vr_content,vr_work,vr_scene,factory,vr_carrier,energy_consumption\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:25:41',395),(243,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"vr_exhibit_zone,vr_showroom,warehouse_zone,ar_content,device,sys_job,sys_job_log,sys_notice,sys_config,sys_dict_data\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:26:34',373),(244,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"equipment,maintenance_record,material,material_transaction,material_transaction_detail,product,product_transaction,product_transaction_detail,production_batch,supply_batch\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:26:56',118),(245,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/16','127.0.0.1','内网IP','[16]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:27:04',15),(246,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/17','127.0.0.1','内网IP','[17]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:27:06',11),(247,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/18','127.0.0.1','内网IP','[18]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:27:08',13),(248,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/19','127.0.0.1','内网IP','[19]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:27:10',7),(249,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/20','127.0.0.1','内网IP','[20]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:27:12',20),(250,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"case\",\"className\":\"CooperationCase\",\"columns\":[{\"capJavaField\":\"CaseId\",\"columnComment\":\"案例编号\",\"columnId\":22,\"columnName\":\"case_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CaseName\",\"columnComment\":\"案例名称\",\"columnId\":23,\"columnName\":\"case_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"caseName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CooperationUnit\",\"columnComment\":\"合作单位\",\"columnId\":24,\"columnName\":\"cooperation_unit\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"cooperationUnit\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":25,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:31:09',43),(251,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"cooperation_case\"}',NULL,0,NULL,'2025-01-09 14:31:27',338),(252,'合作案例',1,'com.ruoyi.system.controller.CooperationCaseController.add()','POST',1,'admin','研发部门','/system/case','127.0.0.1','内网IP','{\"caseName\":\"案例1\",\"cooperationUnit\":\"广东工业大学\",\"description\":\"这是一个测试案例\\n\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\v1.2RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CooperationCaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CooperationCaseMapper.insertCooperationCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cooperation_case          ( case_name,             cooperation_unit,             description )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'case_id\' doesn\'t have a default value\n; Field \'case_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_id\' doesn\'t have a default value','2025-01-09 14:52:14',281),(253,'合作案例',1,'com.ruoyi.system.controller.CooperationCaseController.add()','POST',1,'admin','研发部门','/system/case','127.0.0.1','内网IP','{\"caseName\":\"案例1\",\"cooperationUnit\":\"广东工业大学\",\"description\":\"这是一个测试案例\\n\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\v1.2RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CooperationCaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CooperationCaseMapper.insertCooperationCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cooperation_case          ( case_name,             cooperation_unit,             description )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'case_id\' doesn\'t have a default value\n; Field \'case_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_id\' doesn\'t have a default value','2025-01-09 14:52:19',3),(254,'合作案例',1,'com.ruoyi.system.controller.CooperationCaseController.add()','POST',1,'admin','研发部门','/system/case','127.0.0.1','内网IP','{\"caseName\":\"案例2\",\"cooperationUnit\":\"中山市市场监管所\",\"description\":\"测试\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'case_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\Java\\IdeaProjects\\v1.2RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CooperationCaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CooperationCaseMapper.insertCooperationCase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cooperation_case          ( case_name,             cooperation_unit,             description )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'case_id\' doesn\'t have a default value\n; Field \'case_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'case_id\' doesn\'t have a default value','2025-01-09 14:55:21',3),(255,'合作案例',1,'com.ruoyi.system.controller.CooperationCaseController.add()','POST',1,'admin','研发部门','/system/case','127.0.0.1','内网IP','{\"caseName\":\"案例2\",\"cooperationUnit\":\"中山市市场监管所\",\"description\":\"这是一个测试用例\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 14:58:53',9),(256,'合作案例',1,'com.ruoyi.system.controller.CooperationCaseController.add()','POST',1,'admin','研发部门','/system/case','127.0.0.1','内网IP','{\"caseName\":\"案例3\",\"cooperationUnit\":\"个体\",\"description\":\"这是一个测试用例\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 15:00:48',15),(257,'合作案例',3,'com.ruoyi.system.controller.CooperationCaseController.remove()','DELETE',1,'admin','研发部门','/system/case/3','127.0.0.1','内网IP','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 15:01:00',19),(258,'合作案例',2,'com.ruoyi.system.controller.CooperationCaseController.edit()','PUT',1,'admin','研发部门','/system/case','127.0.0.1','内网IP','{\"caseId\":2,\"caseName\":\"案例2\",\"cooperationUnit\":\"个体\",\"description\":\"这是一个测试用例\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 15:01:09',8),(259,'合作案例',5,'com.ruoyi.system.controller.CooperationCaseController.export()','POST',1,'admin','研发部门','/system/case/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2025-01-09 15:01:44',1643),(260,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-09 12:12:12\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"工厂沙盘AR资源管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2044,\"path\":\"arcontent\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"修改菜单\'工厂沙盘AR资源管理\'失败，上级菜单不能选择自己\",\"code\":500}',0,NULL,'2025-01-10 17:12:09',16),(261,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"consumption\",\"className\":\"EnergyConsumption\",\"columns\":[{\"capJavaField\":\"EnergyId\",\"columnComment\":\"编号\",\"columnId\":26,\"columnName\":\"energy_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"energyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnergyAmount\",\"columnComment\":\"能耗\",\"columnId\":27,\"columnName\":\"energy_amount\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"energyAmount\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Unit\",\"columnComment\":\"计量单位\",\"columnId\":28,\"columnName\":\"unit\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"unit\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnergyType\",\"columnComment\":\"类型\",\"columnId\":29,\"columnName\":\"energy_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQue','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 09:46:47',128),(262,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"factory\",\"className\":\"Factory\",\"columns\":[{\"capJavaField\":\"FactoryId\",\"columnComment\":\"工厂编号\",\"columnId\":33,\"columnName\":\"factory_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"factoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":34,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":35,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":36,\"columnName\":\"contact_person\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isReq','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 09:49:55',31),(263,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"code\",\"className\":\"QrCode\",\"columns\":[{\"capJavaField\":\"QrCodeId\",\"columnComment\":\"二维码编号\",\"columnId\":39,\"columnName\":\"qr_code_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"qrCodeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QrCodeImageUrl\",\"columnComment\":\"二维码\",\"columnId\":40,\"columnName\":\"qr_code_image_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"qrCodeImageUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lazy\",\"functionName\":\"二维码\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"remark\":\"二维码\",\"sub\":false,\"tableComment\":\"二维码\",\"tableId\":7,\"tableName\":\"qr_code\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 09:51:09',14),(264,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"zone\",\"className\":\"SandboxZone\",\"columns\":[{\"capJavaField\":\"ZoneId\",\"columnComment\":\"分区编号\",\"columnId\":41,\"columnName\":\"zone_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zoneId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":42,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":43,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QrCodeId\",\"columnComment\":\"二维码编号\",\"columnId\":44,\"columnName\":\"qr_code_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 09:52:50',27),(265,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carrier\",\"className\":\"VrCarrier\",\"columns\":[{\"capJavaField\":\"CarrierId\",\"columnComment\":\"载体编号\",\"columnId\":46,\"columnName\":\"carrier_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"carrierId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarrierName\",\"columnComment\":\"载体名称\",\"columnId\":47,\"columnName\":\"carrier_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carrierName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarrierType\",\"columnComment\":\"载体类型\",\"columnId\":48,\"columnName\":\"carrier_type\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"carrierType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":49,\"columnName\":\"status\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 09:58:02',33),(266,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"energy_consumption,factory,qr_code,sandbox_zone,vr_carrier\"}',NULL,0,NULL,'2025-01-13 09:58:17',330),(267,'载体',1,'com.ruoyi.system.controller.VrCarrierController.add()','POST',1,'admin','研发部门','/system/carrier','127.0.0.1','内网IP','{\"carrierName\":\"载体1\",\"exhibitZoneId\":1,\"params\":{},\"specifications\":\"大规格\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:19:05',187),(268,'载体',2,'com.ruoyi.system.controller.VrCarrierController.edit()','PUT',1,'admin','研发部门','/system/carrier','127.0.0.1','内网IP','{\"carrierId\":1,\"carrierName\":\"载体1\",\"exhibitZoneId\":5,\"params\":{},\"specifications\":\"大规格\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:19:13',11),(269,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"content\",\"className\":\"VrContent\",\"columns\":[{\"capJavaField\":\"ContentId\",\"columnComment\":\"VR内容编号\",\"columnId\":52,\"columnName\":\"content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContentName\",\"columnComment\":\"名称\",\"columnId\":53,\"columnName\":\"content_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":54,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":55,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:21:50',82),(270,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"VrMaterial\",\"columns\":[{\"capJavaField\":\"MaterialId\",\"columnComment\":\"VR素材编号\",\"columnId\":59,\"columnName\":\"material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"materialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MaterialName\",\"columnComment\":\"名称\",\"columnId\":60,\"columnName\":\"material_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"materialName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":61,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":62,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:25:49',18),(271,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"scene\",\"className\":\"VrScene\",\"columns\":[{\"capJavaField\":\"SceneId\",\"columnComment\":\"场景编号\",\"columnId\":65,\"columnName\":\"scene_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sceneId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SceneName\",\"columnComment\":\"场景名称\",\"columnId\":66,\"columnName\":\"scene_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sceneName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":67,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"fileUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":68,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:28:41',23),(272,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"VrMaterial\",\"columns\":[{\"capJavaField\":\"MaterialId\",\"columnComment\":\"VR素材编号\",\"columnId\":59,\"columnName\":\"material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"materialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:25:49\",\"usableColumn\":false},{\"capJavaField\":\"MaterialName\",\"columnComment\":\"名称\",\"columnId\":60,\"columnName\":\"material_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"materialName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:25:49\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":61,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:25:49\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":62,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:28:59',15),(273,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"content\",\"className\":\"VrContent\",\"columns\":[{\"capJavaField\":\"ContentId\",\"columnComment\":\"VR内容编号\",\"columnId\":52,\"columnName\":\"content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:21:50\",\"usableColumn\":false},{\"capJavaField\":\"ContentName\",\"columnComment\":\"名称\",\"columnId\":53,\"columnName\":\"content_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:21:50\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":54,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:21:50\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":55,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:29:12',16),(274,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vr_content,vr_material,vr_scene\"}',NULL,0,NULL,'2025-01-13 10:29:37',97),(275,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"VrMaterial\",\"columns\":[{\"capJavaField\":\"MaterialId\",\"columnComment\":\"VR素材编号\",\"columnId\":59,\"columnName\":\"material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"materialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:28:59\",\"usableColumn\":false},{\"capJavaField\":\"MaterialName\",\"columnComment\":\"名称\",\"columnId\":60,\"columnName\":\"material_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"materialName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:28:59\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":61,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:28:59\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":62,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:34:34',102),(276,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/vr_material','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:35:16',56),(277,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/vr_scene','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:35:20',39),(278,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/content/index\",\"createTime\":\"2025-01-13 10:30:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2081,\"menuName\":\"VR内容\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"content\",\"perms\":\"system:content:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:36:14',19),(279,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2088','127.0.0.1','内网IP','2088','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:37:48',21),(280,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2089','127.0.0.1','内网IP','2089','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:37:50',26),(281,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2091','127.0.0.1','内网IP','2091','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:37:53',13),(282,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2090','127.0.0.1','内网IP','2090','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:37:55',18),(283,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2092','127.0.0.1','内网IP','2092','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:37:57',10),(284,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2087','127.0.0.1','内网IP','2087','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:37:59',10),(285,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-09 12:12:12\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"工厂沙盘AR资源\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"arcontent\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:38:09',9),(286,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生作品VR应用\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"stuvr\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:39:45',18),(287,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"校企合作应用\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"schooluser\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:40:30',16),(288,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/carrier/index\",\"createTime\":\"2025-01-13 10:11:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2051,\"menuName\":\"载体\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2099,\"path\":\"carrier\",\"perms\":\"system:carrier:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:40:53',16),(289,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/scene/index\",\"createTime\":\"2025-01-13 10:30:20\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"VR场景\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2100,\"path\":\"scene\",\"perms\":\"system:scene:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:41:12',11),(290,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/case/index\",\"createTime\":\"2025-01-09 14:32:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2045,\"menuName\":\"合作案例\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2100,\"path\":\"case\",\"perms\":\"system:case:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:41:41',19),(291,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/code/index\",\"createTime\":\"2025-01-13 10:12:18\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2057,\"menuName\":\"二维码\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2044,\"path\":\"code\",\"perms\":\"system:code:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:42:01',9),(292,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/consumption/index\",\"createTime\":\"2025-01-13 10:12:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2063,\"menuName\":\"能耗清单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2044,\"path\":\"consumption\",\"perms\":\"system:consumption:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:42:09',17),(293,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/factory/index\",\"createTime\":\"2025-01-13 10:12:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2069,\"menuName\":\"工厂\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2044,\"path\":\"factory\",\"perms\":\"system:factory:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:42:15',17),(294,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/zone/index\",\"createTime\":\"2025-01-13 10:12:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"沙盘分区\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2044,\"path\":\"zone\",\"perms\":\"system:zone:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:42:35',21),(295,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2082','127.0.0.1','内网IP','2082','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:43:07',9),(296,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2083','127.0.0.1','内网IP','2083','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:43:09',11),(297,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2084','127.0.0.1','内网IP','2084','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:43:12',18),(298,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2085','127.0.0.1','内网IP','2085','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:43:14',11),(299,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2086','127.0.0.1','内网IP','2086','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:43:16',10),(300,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2081','127.0.0.1','内网IP','2081','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 10:43:19',12),(301,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2093','127.0.0.1','内网IP','2093','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:09:57',3),(302,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2094','127.0.0.1','内网IP','2094','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:10:01',14),(303,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2093','127.0.0.1','内网IP','2093','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:10:03',3),(304,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2095','127.0.0.1','内网IP','2095','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:10:09',11),(305,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2093','127.0.0.1','内网IP','2093','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:10:10',3),(306,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2096','127.0.0.1','内网IP','2096','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:10:13',8),(307,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2098','127.0.0.1','内网IP','2098','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:10:16',8),(308,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2093','127.0.0.1','内网IP','2093','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:10:18',5),(309,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2097','127.0.0.1','内网IP','2097','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:10:21',15),(310,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2093','127.0.0.1','内网IP','2093','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:10:24',12),(311,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"content\",\"className\":\"VrContent\",\"columns\":[{\"capJavaField\":\"ContentId\",\"columnComment\":\"VR内容编号\",\"columnId\":52,\"columnName\":\"content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:29:12\",\"usableColumn\":false},{\"capJavaField\":\"ContentName\",\"columnComment\":\"名称\",\"columnId\":53,\"columnName\":\"content_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contentName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:29:12\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":54,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:29:12\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":55,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:11:51',22),(312,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vr_content\"}',NULL,0,NULL,'2025-01-13 11:12:10',71),(313,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"material\",\"className\":\"VrMaterial\",\"columns\":[{\"capJavaField\":\"MaterialId\",\"columnComment\":\"VR素材编号\",\"columnId\":59,\"columnName\":\"material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"materialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:35:16\",\"usableColumn\":false},{\"capJavaField\":\"MaterialName\",\"columnComment\":\"名称\",\"columnId\":60,\"columnName\":\"material_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"materialName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:35:16\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":61,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:35:16\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":62,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:20:25',67),(314,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"scene\",\"className\":\"VrScene\",\"columns\":[{\"capJavaField\":\"SceneId\",\"columnComment\":\"场景编号\",\"columnId\":65,\"columnName\":\"scene_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sceneId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:35:20\",\"usableColumn\":false},{\"capJavaField\":\"SceneName\",\"columnComment\":\"场景名称\",\"columnId\":66,\"columnName\":\"scene_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sceneName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:35:20\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":67,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"fileUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 10:35:20\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":68,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:21:22',30),(315,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vr_scene,vr_material\"}',NULL,0,NULL,'2025-01-13 11:21:28',191),(316,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2114','127.0.0.1','内网IP','2114','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:27:48',52),(317,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2115','127.0.0.1','内网IP','2115','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:27:51',21),(318,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2116','127.0.0.1','内网IP','2116','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:27:53',10),(319,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2117','127.0.0.1','内网IP','2117','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:27:55',10),(320,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2118','127.0.0.1','内网IP','2118','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:27:58',23),(321,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2113','127.0.0.1','内网IP','2113','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:28:00',17),(322,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"scene\",\"className\":\"VrScene\",\"columns\":[{\"capJavaField\":\"SceneId\",\"columnComment\":\"场景编号\",\"columnId\":65,\"columnName\":\"scene_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sceneId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:21:22\",\"usableColumn\":false},{\"capJavaField\":\"SceneName\",\"columnComment\":\"场景名称\",\"columnId\":66,\"columnName\":\"scene_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sceneName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:21:22\",\"usableColumn\":false},{\"capJavaField\":\"FileUrl\",\"columnComment\":\"文件URL\",\"columnId\":67,\"columnName\":\"file_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fileUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:21:22\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":68,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:28:25',91),(323,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vr_scene\"}',NULL,0,NULL,'2025-01-13 11:28:29',477),(324,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"work\",\"className\":\"Work\",\"columns\":[{\"capJavaField\":\"WorkId\",\"columnComment\":\"作品编号\",\"columnId\":70,\"columnName\":\"work_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"workId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":71,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Authors\",\"columnComment\":\"作者列表\",\"columnId\":72,\"columnName\":\"authors\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"authors\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Instructor\",\"columnComment\":\"指导教师\",\"columnId\":73,\"columnName\":\"instructor\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:25:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"inst','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:35:49',56),(325,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"content\",\"className\":\"ArContent\",\"columns\":[{\"capJavaField\":\"ContentId\",\"columnComment\":\"内容编号\",\"columnId\":76,\"columnName\":\"content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":78,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"URL\",\"columnId\":79,\"columnName\":\"url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaFiel','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:37:32',26),(326,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/15','127.0.0.1','内网IP','[15]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:40:56',19),(327,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"device\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:41:04',55),(328,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/34','127.0.0.1','内网IP','[34]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:43:46',15),(329,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"device\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:43:55',32),(330,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"device\",\"className\":\"Device\",\"columns\":[{\"capJavaField\":\"DeviceNumber\",\"columnComment\":\"设备编号\",\"columnId\":211,\"columnName\":\"device_number\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-13 11:43:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deviceNumber\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":35,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":212,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-13 11:43:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":35,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"简介\",\"columnId\":213,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-01-13 11:43:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":35,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"设备状态\",\"columnId\":214,\"columnName\":\"status\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-13 11:43:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:45:00',16),(331,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"device\"}',NULL,0,NULL,'2025-01-13 11:45:04',150),(332,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"content\",\"className\":\"ArContent\",\"columns\":[{\"capJavaField\":\"ContentId\",\"columnComment\":\"内容编号\",\"columnId\":76,\"columnName\":\"content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:37:32\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:37:32\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":78,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:37:32\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"URL\",\"columnId\":79,\"columnName\":\"url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEd','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:45:24',33),(333,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"ar_content,work\"}',NULL,0,NULL,'2025-01-13 11:45:28',129),(334,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-04 17:23:23\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"stasticss\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:48:05',29),(335,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:48:18',10),(336,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2131','127.0.0.1','内网IP','2131','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:55:25',26),(337,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2132','127.0.0.1','内网IP','2132','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:55:31',14),(338,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2133','127.0.0.1','内网IP','2133','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:55:33',12),(339,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2134','127.0.0.1','内网IP','2134','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:55:36',15),(340,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2131','127.0.0.1','内网IP','2131','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:55:39',36),(341,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2131','127.0.0.1','内网IP','2131','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 11:55:41',4),(342,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2135','127.0.0.1','内网IP','2135','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:55:44',13),(343,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2136','127.0.0.1','内网IP','2136','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:55:46',12),(344,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2131','127.0.0.1','内网IP','2131','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:55:49',15),(345,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"arcontent\",\"className\":\"ArContent\",\"columns\":[{\"capJavaField\":\"ContentId\",\"columnComment\":\"内容编号\",\"columnId\":76,\"columnName\":\"content_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:45:24\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":77,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:45:24\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"类别\",\"columnId\":78,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2025-01-13 11:45:24\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"URL\",\"columnId\":79,\"columnName\":\"url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-09 14:26:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isE','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 11:56:52',90),(346,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"ar_content\"}',NULL,0,NULL,'2025-01-13 11:56:58',473),(347,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-09 12:12:12\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"工厂沙盘AR资源\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"arcontent\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 12:01:13',21),(348,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-13 10:40:30\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2100,\"menuName\":\"校企合作应用\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"schooluser\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 12:01:20',8),(349,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-04 17:23:23\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"统计分析\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"stasticss\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 12:01:28',8),(350,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2025-01-04 17:19:22\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 12:01:32',8),(351,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-12-24 16:55:23\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 12:01:36',7),(352,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-12-24 16:55:23\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 12:01:39',12);
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
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
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
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
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
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
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
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
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
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-01-13 09:40:23','admin','2024-12-24 16:55:22','','2025-01-13 09:40:22','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-01-07 20:41:30','admin','2024-12-24 16:55:22','','2025-01-07 20:41:30','测试员'),(100,NULL,'lazy','懒酱','00','','','0','','$2a$10$bfxb1pIgr5VGlSi9324Ff.7HkY98ZMqxpnMmqCevfYPwjdZk0IhIO','0','0','127.0.0.1','2025-01-07 20:37:19','admin','2025-01-07 20:37:01','','2025-01-07 20:37:18',NULL);
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
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
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
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='课程管理';
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
  `carrier_name` varchar(255) DEFAULT NULL,
  `carrier_type` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `specifications` text,
  `exhibit_zone_id` int DEFAULT NULL,
  PRIMARY KEY (`carrier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_carrier`
--

LOCK TABLES `vr_carrier` WRITE;
/*!40000 ALTER TABLE `vr_carrier` DISABLE KEYS */;
INSERT INTO `vr_carrier` VALUES (1,'载体1',NULL,NULL,'大规格',5);
/*!40000 ALTER TABLE `vr_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_content`
--

DROP TABLE IF EXISTS `vr_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `content_name` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `description` text,
  `carrier_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_content`
--

LOCK TABLES `vr_content` WRITE;
/*!40000 ALTER TABLE `vr_content` DISABLE KEYS */;
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
  `exhibit_zone_name` varchar(255) DEFAULT NULL,
  `description` text,
  `showroom_id` int DEFAULT NULL,
  PRIMARY KEY (`exhibit_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_exhibit_zone`
--

LOCK TABLES `vr_exhibit_zone` WRITE;
/*!40000 ALTER TABLE `vr_exhibit_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `vr_exhibit_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_material`
--

DROP TABLE IF EXISTS `vr_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `material_name` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `description` text,
  `scene_id` int DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_material`
--

LOCK TABLES `vr_material` WRITE;
/*!40000 ALTER TABLE `vr_material` DISABLE KEYS */;
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
  `scene_name` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `description` text,
  `case_id` int DEFAULT NULL,
  PRIMARY KEY (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_scene`
--

LOCK TABLES `vr_scene` WRITE;
/*!40000 ALTER TABLE `vr_scene` DISABLE KEYS */;
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
  `showroom_name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`showroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_showroom`
--

LOCK TABLES `vr_showroom` WRITE;
/*!40000 ALTER TABLE `vr_showroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `vr_showroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vr_work`
--

DROP TABLE IF EXISTS `vr_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vr_work` (
  `work_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `authors` text,
  `instructor` varchar(255) DEFAULT NULL,
  `award_info` text,
  `description` text,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vr_work`
--

LOCK TABLES `vr_work` WRITE;
/*!40000 ALTER TABLE `vr_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `vr_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_zone`
--

DROP TABLE IF EXISTS `warehouse_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_zone` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `factory_id` int DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_zone`
--

LOCK TABLES `warehouse_zone` WRITE;
/*!40000 ALTER TABLE `warehouse_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 12:05:41
