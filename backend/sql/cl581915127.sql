-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: cl581915127
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl581915127`
--

/*!40000 DROP DATABASE IF EXISTS `cl581915127`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl581915127` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl581915127`;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COLLATE utf8mb4_unicode_ci COMMENT '提问内容',
  `reply` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ai问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'2025-07-09 02:33:52',1,'提问内容1','回复内容1',1,1),(2,'2025-07-09 02:33:52',2,'提问内容2','回复内容2',2,2),(3,'2025-07-09 02:33:52',3,'提问内容3','回复内容3',3,3),(4,'2025-07-09 02:33:52',4,'提问内容4','回复内容4',4,4),(5,'2025-07-09 02:33:52',5,'提问内容5','回复内容5',5,5),(6,'2025-07-09 02:33:52',6,'提问内容6','回复内容6',6,6),(7,'2025-07-09 02:33:52',7,'提问内容7','回复内容7',7,7),(8,'2025-07-09 02:33:52',8,'提问内容8','回复内容8',8,8),(9,'2025-07-09 02:33:52',9,'提问内容9','回复内容9',9,9),(10,'2025-07-09 02:33:52',10,'提问内容10','回复内容10',10,10);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chathelper`
--

DROP TABLE IF EXISTS `chathelper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chathelper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ask` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提问内容',
  `reply` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聊天助手';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chathelper`
--

LOCK TABLES `chathelper` WRITE;
/*!40000 ALTER TABLE `chathelper` DISABLE KEYS */;
INSERT INTO `chathelper` VALUES (1,'2025-07-09 02:33:52','提问内容1','回复内容1'),(2,'2025-07-09 02:33:52','提问内容2','回复内容2'),(3,'2025-07-09 02:33:52','提问内容3','回复内容3'),(4,'2025-07-09 02:33:52','提问内容4','回复内容4'),(5,'2025-07-09 02:33:52','提问内容5','回复内容5'),(6,'2025-07-09 02:33:52','提问内容6','回复内容6'),(7,'2025-07-09 02:33:52','提问内容7','回复内容7'),(8,'2025-07-09 02:33:52','提问内容8','回复内容8'),(9,'2025-07-09 02:33:52','提问内容9','回复内容9'),(10,'2025-07-09 02:33:52','提问内容10','回复内容10');
/*!40000 ALTER TABLE `chathelper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `value` longtext COLLATE utf8mb4_unicode_ci COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'2025-07-09 02:33:52','swiper1','file/swiperPicture1.jpg'),(2,'2025-07-09 02:33:52','swiper2','file/swiperPicture2.jpg'),(3,'2025-07-09 02:33:52','swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiankangshuju`
--

DROP TABLE IF EXISTS `jiankangshuju`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiankangshuju` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `nianling` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年龄',
  `tizhong` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '体重（kg）',
  `xueya` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '血压（mmHg）',
  `xuetang` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '血糖（mg/dL）',
  `xinlv` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '心率（次/分）',
  `xuezhi` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '血脂（mmol/L）',
  `shuimianshijian` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '睡眠时间（天/小时）',
  `zongdanguchun` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '总胆固醇（mg/dL）',
  `xueyang` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '血氧（ bpm）',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='健康数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiankangshuju`
--

LOCK TABLES `jiankangshuju` WRITE;
/*!40000 ALTER TABLE `jiankangshuju` DISABLE KEYS */;
INSERT INTO `jiankangshuju` VALUES (1,'2025-07-09 02:33:52','用户账号1','用户姓名1','性别1','年龄1','体重（kg）1','血压（mmHg）1','血糖（mg/dL）1','心率（次/分）1','血脂（mmol/L）1','睡眠时间（天/小时）1','总胆固醇（mg/dL）1','血氧（ bpm）1','2025-07-09 10:33:52'),(2,'2025-07-09 02:33:52','用户账号2','用户姓名2','性别2','年龄2','体重（kg）2','血压（mmHg）2','血糖（mg/dL）2','心率（次/分）2','血脂（mmol/L）2','睡眠时间（天/小时）2','总胆固醇（mg/dL）2','血氧（ bpm）2','2025-07-09 10:33:52'),(3,'2025-07-09 02:33:52','用户账号3','用户姓名3','性别3','年龄3','体重（kg）3','血压（mmHg）3','血糖（mg/dL）3','心率（次/分）3','血脂（mmol/L）3','睡眠时间（天/小时）3','总胆固醇（mg/dL）3','血氧（ bpm）3','2025-07-09 10:33:52'),(4,'2025-07-09 02:33:52','用户账号4','用户姓名4','性别4','年龄4','体重（kg）4','血压（mmHg）4','血糖（mg/dL）4','心率（次/分）4','血脂（mmol/L）4','睡眠时间（天/小时）4','总胆固醇（mg/dL）4','血氧（ bpm）4','2025-07-09 10:33:52'),(5,'2025-07-09 02:33:52','用户账号5','用户姓名5','性别5','年龄5','体重（kg）5','血压（mmHg）5','血糖（mg/dL）5','心率（次/分）5','血脂（mmol/L）5','睡眠时间（天/小时）5','总胆固醇（mg/dL）5','血氧（ bpm）5','2025-07-09 10:33:52'),(6,'2025-07-09 02:33:52','用户账号6','用户姓名6','性别6','年龄6','体重（kg）6','血压（mmHg）6','血糖（mg/dL）6','心率（次/分）6','血脂（mmol/L）6','睡眠时间（天/小时）6','总胆固醇（mg/dL）6','血氧（ bpm）6','2025-07-09 10:33:52'),(7,'2025-07-09 02:33:52','用户账号7','用户姓名7','性别7','年龄7','体重（kg）7','血压（mmHg）7','血糖（mg/dL）7','心率（次/分）7','血脂（mmol/L）7','睡眠时间（天/小时）7','总胆固醇（mg/dL）7','血氧（ bpm）7','2025-07-09 10:33:52'),(8,'2025-07-09 02:33:52','用户账号8','用户姓名8','性别8','年龄8','体重（kg）8','血压（mmHg）8','血糖（mg/dL）8','心率（次/分）8','血脂（mmol/L）8','睡眠时间（天/小时）8','总胆固醇（mg/dL）8','血氧（ bpm）8','2025-07-09 10:33:52'),(9,'2025-07-09 02:33:52','用户账号9','用户姓名9','性别9','年龄9','体重（kg）9','血压（mmHg）9','血糖（mg/dL）9','心率（次/分）9','血脂（mmol/L）9','睡眠时间（天/小时）9','总胆固醇（mg/dL）9','血氧（ bpm）9','2025-07-09 10:33:52'),(10,'2025-07-09 02:33:52','用户账号10','用户姓名10','性别10','年龄10','体重（kg）10','血压（mmHg）10','血糖（mg/dL）10','心率（次/分）10','血脂（mmol/L）10','睡眠时间（天/小时）10','总胆固醇（mg/dL）10','血氧（ bpm）10','2025-07-09 10:33:52');
/*!40000 ALTER TABLE `jiankangshuju` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keshi`
--

DROP TABLE IF EXISTS `keshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `keshi` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '科室',
  `keshiweizhi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科室位置',
  `yishengzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '医生账号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keshi` (`keshi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='科室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keshi`
--

LOCK TABLES `keshi` WRITE;
/*!40000 ALTER TABLE `keshi` DISABLE KEYS */;
INSERT INTO `keshi` VALUES (1,'2025-07-09 02:33:52','科室1','科室位置1','医生账号1'),(2,'2025-07-09 02:33:52','科室2','科室位置2','医生账号2'),(3,'2025-07-09 02:33:52','科室3','科室位置3','医生账号3'),(4,'2025-07-09 02:33:52','科室4','科室位置4','医生账号4'),(5,'2025-07-09 02:33:52','科室5','科室位置5','医生账号5'),(6,'2025-07-09 02:33:52','科室6','科室位置6','医生账号6'),(7,'2025-07-09 02:33:52','科室7','科室位置7','医生账号7'),(8,'2025-07-09 02:33:52','科室8','科室位置8','医生账号8'),(9,'2025-07-09 02:33:52','科室9','科室位置9','医生账号9'),(10,'2025-07-09 02:33:52','科室10','科室位置10','医生账号10');
/*!40000 ALTER TABLE `keshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2025-07-09 02:33:52','[{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-explore\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"users\",\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"}],\"fontClass\":\"icon-common13\",\"menu\":\"管理员管理\",\"unicode\":\"&#xedf7;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"keshi\",\"menu\":\"科室\",\"menuJump\":\"列表\",\"tableName\":\"keshi\"}],\"fontClass\":\"icon-common20\",\"menu\":\"科室管理\",\"unicode\":\"&#xee02;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"yonghu\",\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"classname\":\"yiliaojigou\",\"menu\":\"医疗机构\",\"menuJump\":\"列表\",\"tableName\":\"yiliaojigou\"}],\"fontClass\":\"icon-user1\",\"menu\":\"用户管理\",\"unicode\":\"&#xef97;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"tijianleixing\",\"menu\":\"体检类型\",\"menuJump\":\"列表\",\"tableName\":\"tijianleixing\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"预约\"],\"appFrontIcon\":\"cuIcon-pic\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"审核\"],\"classname\":\"tijianxiangmu\",\"menu\":\"体检项目\",\"menuJump\":\"列表\",\"tableName\":\"tijianxiangmu\"}],\"fontClass\":\"icon-common3\",\"menu\":\"体检项目管理\",\"unicode\":\"&#xeda5;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"news\",\"menu\":\"健康科普\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common18\",\"menu\":\"健康科普管理\",\"unicode\":\"&#xedff;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"体检人数\",\"首页总数\",\"首页统计\",\"体检\",\"取消\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"删除\",\"体检人数\",\"首页总数\",\"首页统计\",\"修改\"],\"classname\":\"tijianyuyue\",\"menu\":\"体检预约\",\"menuJump\":\"列表\",\"tableName\":\"tijianyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"体检报告\"],\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"删除\",\"修改\"],\"classname\":\"tijianxinxi\",\"menu\":\"体检信息\",\"menuJump\":\"列表\",\"tableName\":\"tijianxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\",\"删除\",\"修改\"],\"classname\":\"tijianbaogao\",\"menu\":\"体检报告\",\"menuJump\":\"列表\",\"tableName\":\"tijianbaogao\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"查看\",\"删除\",\"修改\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"}],\"fontClass\":\"icon-common43\",\"menu\":\"体检信息管理\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"挂号数量\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"挂号数量\",\"首页总数\",\"首页统计\"],\"classname\":\"yuyueguahao\",\"menu\":\"预约挂号\",\"menuJump\":\"列表\",\"tableName\":\"yuyueguahao\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"挂号\"],\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"yishengzuozhen\",\"menu\":\"医生坐诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengzuozhen\"}],\"fontClass\":\"icon-common28\",\"menu\":\"预约挂号管理\",\"unicode\":\"&#xee2d;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"config\",\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common33\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"jiankangshuju\",\"menu\":\"健康数据\",\"menuJump\":\"列表\",\"tableName\":\"jiankangshuju\"}],\"fontClass\":\"icon-common4\",\"menu\":\"健康数据管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-pay\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"systemNotice\",\"menu\":\"消息通知\",\"menuJump\":\"列表\",\"tableName\":\"system_notice\"}],\"fontClass\":\"icon-common16\",\"menu\":\"消息通知管理\",\"unicode\":\"&#xedfd;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"popupRemind\",\"menu\":\"吃药提醒\",\"menuJump\":\"列表\",\"tableName\":\"popup_remind\"}],\"fontClass\":\"icon-common29\",\"menu\":\"吃药提醒管理\",\"unicode\":\"&#xee2e;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"健康科普\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"ai问答\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"预约\"],\"classname\":\"tijianxiangmu\",\"menu\":\"体检项目\",\"menuJump\":\"列表\",\"tableName\":\"tijianxiangmu\"}],\"menu\":\"健康体检管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"挂号\"],\"classname\":\"yishengzuozhen\",\"menu\":\"医生坐诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengzuozhen\"}],\"menu\":\"医生坐诊管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"users\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"体检人数\",\"首页总数\",\"首页统计\",\"体检\",\"取消\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"支付\",\"取消\"],\"classname\":\"tijianyuyue\",\"menu\":\"体检预约\",\"menuJump\":\"列表\",\"tableName\":\"tijianyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"体检报告\"],\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"tijianxinxi\",\"menu\":\"体检信息\",\"menuJump\":\"列表\",\"tableName\":\"tijianxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"tijianbaogao\",\"menu\":\"体检报告\",\"menuJump\":\"列表\",\"tableName\":\"tijianbaogao\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"}],\"fontClass\":\"icon-common43\",\"menu\":\"体检信息管理\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"挂号数量\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"支付\"],\"classname\":\"yuyueguahao\",\"menu\":\"预约挂号\",\"menuJump\":\"列表\",\"tableName\":\"yuyueguahao\"}],\"fontClass\":\"icon-common28\",\"menu\":\"预约挂号管理\",\"unicode\":\"&#xee2d;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\"],\"classname\":\"storeup\",\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common8\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xedb6;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"jiankangshuju\",\"menu\":\"健康数据\",\"menuJump\":\"列表\",\"tableName\":\"jiankangshuju\"}],\"fontClass\":\"icon-common4\",\"menu\":\"健康数据管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"popupRemind\",\"menu\":\"吃药提醒\",\"menuJump\":\"列表\",\"tableName\":\"popup_remind\"}],\"fontClass\":\"icon-common29\",\"menu\":\"吃药提醒管理\",\"unicode\":\"&#xee2e;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"健康科普\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"ai问答\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"预约\"],\"classname\":\"tijianxiangmu\",\"menu\":\"体检项目\",\"menuJump\":\"列表\",\"tableName\":\"tijianxiangmu\"}],\"menu\":\"健康体检管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"挂号\"],\"classname\":\"yishengzuozhen\",\"menu\":\"医生坐诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengzuozhen\"}],\"menu\":\"医生坐诊管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"pathName\":\"yonghu\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"预约\"],\"appFrontIcon\":\"cuIcon-pic\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"tijianxiangmu\",\"menu\":\"体检项目\",\"menuJump\":\"列表\",\"tableName\":\"tijianxiangmu\"}],\"fontClass\":\"icon-common3\",\"menu\":\"体检项目管理\",\"unicode\":\"&#xeda5;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"体检人数\",\"首页总数\",\"首页统计\",\"体检\",\"取消\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"删除\",\"体检人数\",\"首页总数\",\"首页统计\",\"体检\"],\"classname\":\"tijianyuyue\",\"menu\":\"体检预约\",\"menuJump\":\"列表\",\"tableName\":\"tijianyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"体检报告\"],\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"删除\",\"体检报告\"],\"classname\":\"tijianxinxi\",\"menu\":\"体检信息\",\"menuJump\":\"列表\",\"tableName\":\"tijianxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"tijianbaogao\",\"menu\":\"体检报告\",\"menuJump\":\"列表\",\"tableName\":\"tijianbaogao\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"}],\"fontClass\":\"icon-common43\",\"menu\":\"体检信息管理\",\"unicode\":\"&#xef27;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"挂号数量\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"删除\",\"挂号数量\",\"首页总数\",\"首页统计\"],\"classname\":\"yuyueguahao\",\"menu\":\"预约挂号\",\"menuJump\":\"列表\",\"tableName\":\"yuyueguahao\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"挂号\"],\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"yishengzuozhen\",\"menu\":\"医生坐诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengzuozhen\"}],\"fontClass\":\"icon-common28\",\"menu\":\"预约挂号管理\",\"unicode\":\"&#xee2d;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"jiankangshuju\",\"menu\":\"健康数据\",\"menuJump\":\"列表\",\"tableName\":\"jiankangshuju\"}],\"fontClass\":\"icon-common4\",\"menu\":\"健康数据管理\",\"unicode\":\"&#xedab;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"健康科普\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"ai问答\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"预约\"],\"classname\":\"tijianxiangmu\",\"menu\":\"体检项目\",\"menuJump\":\"列表\",\"tableName\":\"tijianxiangmu\"}],\"menu\":\"健康体检管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\",\"挂号\"],\"classname\":\"yishengzuozhen\",\"menu\":\"医生坐诊\",\"menuJump\":\"列表\",\"tableName\":\"yishengzuozhen\"}],\"menu\":\"医生坐诊管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"yiliaojigou\",\"roleName\":\"医疗机构\",\"tableName\":\"yiliaojigou\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `introduction` longtext COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `picture` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='健康科普';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'2025-07-09 02:33:51','余生，愿你活出自己的精彩','曾几何时，为了让自己显得合群，选择去做自己不喜欢的事;为了讨好喜欢的人，一次次地委屈自己;甚至，为了陌生人的一个眼神，就陷入了深深的自我怀疑。','file/newsPicture1.jpg','可是，这样小心翼翼的你，一定很累吧。你以为照顾了所有人的想法，就能得到他们的喜欢;你以为逼着自己合群，就能真的合群。直到后来才发现，在日复一日对自己的为难中，你逐渐弄丢了真实的自己.\n殊不知，人生在世，最不值得的事情，就是在别人的眼光中，迷失自己。其实，正如世界上没有十全十美的人，你也同样无法做到让每个人满意。\n世上没有不快乐的人，只有不肯让自己快乐的心。有一句话说:\n如果一段关系让你变得卑微，你可以选择抽身离去;如果一个人总是让你悲伤哭泣，你要学会放手。\n始终相信，每个人最初的样子，都是最美好的。真正喜欢你的人，会喜欢你原来的样子:真正爱你的从来不需要你的委曲求全。\n后半生，请把身上的枷锁，全部解除。去做喜欢的事，去听自己内心的声音。你会发现，这世上没有什么事情比活出自己更加幸福。\n要相信，真实的自己亦是一道风景线。你若盛开，清风自来。愿你此生尽兴，不负韶华，'),(2,'2025-07-09 02:33:51','岁月无常，好好珍惜','常听到这样的话，如果一切可以重新开始，我一定改掉任性，学会坚持，如果有下辈子，我一定好好珍惜，不会再弄丢原本属于自己的幸福。','file/newsPicture2.jpg','然而，世上有很多事情没有再来一次的机会，一旦错失就意味着无法弥补，正如人与人之间，有的只是一世的缘分，一旦转身，就意味着再无可能。\n这一生只活一次，有些人也只爱一回。\n所以，在拥有时就好好把握，对于来世，可以适当憧憬，但不要一昧去幻想，活着，唯有珍惜身边做好眼前事，才能让明天少一些遗憾。人，\n既然有幸来到这个世上，那就要努力把这辈子活好。岁月其实远没有想象中的那么漫长，若是能爱就好好爱，别让说好相伴一生的人，中途散走;若是当下能相知相守，就别去等待虚无缥缈的未来。\n就像一位网友留言说的:我从来不去期待下辈子，我要的只有今生，世事无常，来世是怎样的光景，谁都无法预知。对我来说，在有限的时光里，善待爱自己及自己爱的人，用心珍惜相聚的每一时刻，努力过好当下就足够了。\n时光匆匆，韶华似水，每个人都只有这短暂的一生。\n有些事，如果喜欢就坚定努力的去做，有些人，如果爱就真诚用心地去爱，别幻想着重来，别总是寄希望于下辈子。\n下辈子，彼此也许再也不会遇见，就算遇见了，谁还会记得谁，今生相互承诺的两个人，来生也许相见不相识。\n想起之前看过的一句话:人生没有假如，我们没有来世，下辈子，你我也许只是大千世界里互不相识的两个陌生人。\n的确，生命只有一次，今生有幸相遇的人，下辈子不一定能遇见，就算能遇见，谁能把谁陪伴，谁又是谁的谁?\n余生不长，趁着岁月未老，好好珍惜这辈子的缘分吧，别等到失去了才悔不该当初。'),(3,'2025-07-09 02:33:51','与其背着烦恼活，不如带着美好过','一直觉得，感情里，无疾而终并不可怕，可怕的是结束后，你还抱着回忆不肯放;岁月中，失去并不可怕，可怕的是失去后，你还揪着曾经不肯忘。\n有些事，明知道不应该继续，却始终没有转身的勇气;有些人，明知道已经成为过去，却还是舍不得放手;有时候，明知道纠缠于往事旧人只会徒增伤悲，却仍然执着的去回忆，去留恋。','file/newsPicture3.jpg','人生短短几十年，为什么要蹉跎浪费在无可挽回的失去上，为什么不酒脱一点，看开一点，活得轻松快乐一点。\n这世间，没有谁的人生是十全十美的，总要面对一些离别，总要经历一些失去，如果总对身边的一切执念太深，只会越活越累。\n时间不停向前，人也不可避免的要向前看。面对一些不如意、不顺心的事，该放的就放，该忘的就忘，别总把自己困在失败的悲伤中。\n生而为人，放不是无能，而是一种洒脱，忘更不是懦弱，而是一种智慧。\n在来去匆匆，聚散不定的现实里，放下不属于自己的感情，才能有新的开始，忘记心中的烦恼，才能收获愉快的心情。\n所以，有些离开的人，该放就放下吧，一直念念不忘，伤害的是自己，有些烦心事，该忘就忘了吧一直耿耿于怀，痛苦的是自己。\n-辈子本就不长，何必让自己活得那么累，过去的情就让它过去，别再留恋，想不通的事就算了，别再纠结。\n人生的旅途，总有些事让人烦，总有些情让人伤。只有学会忘记过往的不如意，忘记一些不必要的烦恼，以轻盈的身心重新出发，才不会被旧人旧事所累。\n记得，每个人心灵的空间都是有限的，当装多了纠结与伤感，就装不下自在与欢快了。要想日子过得简单轻松一点，就要懂得放下执念，忘掉痛苦，清除伤。'),(4,'2025-07-09 02:33:51','理想很丰满，现实很骨感','游戏里的你帅气无比，乘风御剑，通关杀敌无所不能，你满足于那其中的成就感，你满足于通关的畅快淋漓。','file/newsPicture4.jpg','年轻人，可那毕竟不是现实，理想很丰满，现实很骨感这不是玩笑，你不走出来，怎么会知\n你真的想等到某天喜欢上一个姑娘时，才去纠结咖啡钱电影钱你要如何与爸妈张口，才去苦恼为她买礼物你要怎样省吃俭用节衣缩食?\n你没有挥金如土的.魄力，没有殷实的家境，没有既定的光芒锦绣的前程，二十出头的年纪，你不努力，你想拿什么报答那个在你身边用最好的青春陪伴你的姑娘?你又拿什么报答含辛茹苦养育你这么多年的父母?\n生活不是游戏，不会给你那么多反复再来的机会，青春年少风华正茂，年轻人，你不努力，你想指望什么?\n年轻人，走出来奋斗吧!累也好苦也罢。如果你现在对自己各种放纵，你指望以后你用什么条件来放松?\n年轻人，你要努力赚钱，为了自己，也为了你爸妈。为了他们在以后逛商场的时候，可以给自己买东西像给你买东西一样毫不犹豫。为了他们可以在同老友谈起你时可以一脸安详，而不是想着，这个月，儿子交了房租还有钱吃饭么。我们这个年龄的人，已经像吸血鬼一样巴着父母活了二十多年了，还真的要继续吸着他们的血活下去么?\n年轻人，停止期望凡事简单容易。如果总是挑简单的事情做，那你永远成不了大器，生活总会在始料不及时考验你，所以你必须挑战困难，保持坚强，世上任何值得拥有的东西都需要付诸努力，勤奋与自律，倘若自甘平庸，那你就会变得庸碌无为。\n年轻人，与我们一起，挑战一下自己，拥抱一下梦想。你想要的生活，跳起来，一定够得到!'),(5,'2025-07-09 02:33:51','理想是一种精神上的追求','如果前方是一片黑暗，理想是否会黯淡?黑暗终究不能限制理想的步伐，只是需要时间。','file/newsPicture5.jpg','是否会撕裂黑暗的结界?给理想一点时间，是否会完成理想的目标?太多时候，黑给黑暗一缕曙光，暗限制了理想的脚步，时间成了撕裂黑暗的曙光。社会的压抑，未知的迷茫，甚至是事实的打击，都成了所谓的黑暗。\n理想应该是一种精神上的追求，一种我们内心深处的渴望。也许理想的种类太多，不一样的人也有不一样的理想。但唯一的共同点就是我们在追求，追求自己精神上亦或是心中的目标。但总是不尽人意，一来存在太多不确定因素，二来时间还不够。理想并不是一而就的空话。\n想过放弃，因为理想与现实的差距。但又不想放弃，因为理想是精神上的追求心中的渴望。纠结了太多，却是否想过在纠结的时候，已经选择了错过。被刻意选择的错过是什么?是路过。我们在不经意间路过了多少理想，只是因为纠结。如果坚定自己的理想，用时间去行动，是否会少几次刻意的错过:-次，与一位朋友谈到如何乐观，然后追求理想。朋友想了一会儿，给我的回答是正能量与时间。他说，想要乐观就要不断给自己正能量。事物有阴阳两面，如果阳代表乐观，那在我们看待一件事时要看阳面千万别看阴面。这样自己不会消极，某种程度上来说就是一种正能量。想要追求理想，务必要花费时间。正如没有风平浪静的大海，想要追求理想，要时间。给理想一点时间，让自己去追求，不顾切的追求。\n点点滴滴的小事构成了我们的生活，点点滴滴的努力给理想铺平了路。每一次小成功都为理想迈进了一步。每一次失败，都告诉我们一些教训，反方向来说为下一次成功提供了经验。不要觉得失败是可怕的，长远来看，正是失败才有了成功。\n时间在流逝。如果安于现状，就会乐不思。理想需要时间不代表我们可以挥霍，我们能做的是珍惜时间，去为理想拼搏。\n间接意义上讲，理想的时间是我们的努力。\n如果正在路上，一直任性向前走，忘记时间不回头。'),(6,'2025-07-09 02:33:51','人生如梦，梦想是帆','人生如梦，梦想是帆，每个人都有一个只属于自己的梦，但我们同属一个国家，所以每个人的梦又与国家的兴衰荣辱紧密相连。先哲顾炎武曾说:天下兴亡，匹夫有责。只有国家好，大家才能好。','file/newsPicture6.jpg','我依然清楚的记得:\n当甲午战争战败，日寇无礼踏破中国的门户;当八国联军侵入北京，无情掠夺中国的财产:当七七事变发生，中国的老人、妇孺被残忍杀害的时候，我在想那时中国的梦是怎样的!\n我虽不曾亲眼看到，但那却是铁一般的事实。因为从老人们那深邃的眼神中可以感到无尽的愤懑;从他们干瘪的脸颊可以看到深情的泪水，从他们嘹亮的军歌中可以想到那奋勇杀敌时的豪迈;从他们激昂话语中听到那誓要捍卫家园振兴中华的誓言。作为新一代青年的我们难道不应该树立远大的理想，付之以踏实的行动，去继承先辈们的使命。去实现中华民族的伟大崛起和复兴吗?\n有梦才能使中国繁荣!\n在改革开放以来中国取得了一系列的可以载入中国史册的成就。香港、澳门的回归，经济特区的建立，使中国成为发展国家中的经济大国，科技先进国和军事强国。当中国成功举办奥运的时候，当神九飞天的时候，当蛟龙入海的时候，当航母下水的时候，当莫言荣获诺贝尔文学奖的时候。我相信每个人都感觉到了无比的自豪。但是现在的中国与其他发达国家还有很大差距。作为新一代的我们，难道不应该志存高远吗?\n我想有的人会说，我们的力量是有限的。的确个人的力量很渺小，但是中国梦就是因一个个微不足道的个人的梦一直汇集、汇集，然后凝聚成的一个巨大的梦。冯至在《十四行诗》中写道，我们准备着，深深领受，那些意想不到的奇迹，在漫长的岁月里，忽然有彗星的出现，狂风乍起。\n梦想是美丽的，它是美的期望;梦想是阳光的，它使人由浮躁走向踏实;梦想是充满力量的，它可以激发人身体里无限的潜能。我们期盼的是国泰民安、经济发展、政治清明、文化繁荣、社会和谐、生态良\n好、公平正义。这才是中国人伟大的梦'),(7,'2025-07-09 02:33:51','若月亮没来-王宇宙Leto，乔浚丞','《若月亮没来(若是月亮还没来)》是王宇宙Leto，乔浚丞演唱的歌曲，于2024年1月22日上线发行。','file/newsPicture7.jpg','风吹过山 船靠了岸  风光呀 一点点看  我走向北 你去往南\n故事呀 一篇篇翻  好烦 又加班到很晚  你搭上空荡的 地铁已是末班\n好烦 很爱却要分开  恋爱谈不明白  好烦 接近理想好难 却又还很不甘\n如何拥抱平淡  如果 最难得到圆满  不如选择坦然 若是月亮还没来\n路灯也可照窗台  照着白色的山茶花微微开  若是晨风还没来\n晚风也可吹入怀  吹着那一地树影温柔摇摆  你总以为你不够好\n不够苗条和美貌  可是完美谁能达到  做你自己就很好\n烦恼烦恼拥有太少  没有房车没有钞票  可爱你的人永远会 \n把你当做心尖珍宝  我也懂大多数的时候  你只想逃离这世界\n我也懂太多的情绪在  一个人失眠的深夜 你可以是悲伤或者埋怨\n但请不要放弃明天  这一直灰暗的世界  我想看见你的笑脸\n若是月亮还没来  路灯也可照窗台  照着白色的山茶花微微开\n若是晨风还没来  晚风也可吹入怀  吹着那一地树影温柔摇摆\n若是月亮还没来  路灯也可照窗台  照着白色的山茶花微微开\n若是晨风还没来  晚风也可吹入怀  吹着那一地树影温柔摇摆\n李哲今年1月份创作了《若月亮没来》这首歌。随着歌曲的热度不断上升，约他写歌的人越来越多，他的工作变得更加繁忙。\n近年来，李哲凭借对音乐的热爱和不懈的努力，创作了几百首音乐作品，其中不乏广为人知的佳作，例如王栎鑫的《一个人》、何赛飞与叶炫清在央视演唱的《木兰诗》等歌曲，都是由李哲作曲。\n如今，李哲的音乐才华和努力得到了业界的广泛认可，他的音乐作品多次登上各大音乐平台的热歌榜，成为备受瞩目的新生代音乐人。现在，走在街头、坐在车里，经常会听到自己的作品。看到自己的音乐作品受到如此广泛的喜爱和认可，我感到非常有成就感。李哲笑着说，他会努力创作更多优秀音乐作品，为家乡争光。'),(8,'2025-07-09 02:33:51','-米阳光传递一份温暖','黑暗中跌倒，坚强里苦笑。只是因为青春还在，所以梦想一直在路上。当年华未曾老去，青春没有散场，留给幽暗的岁月，还有几分值得珍藏?孤独无助时、伤心难过时总爱恣意挥霍愤怒。伤了、痛了原本以为就都结束了;可是心里还不甘愿放弃，就只为一个理由，有梦想的人永不孤单。','file/newsPicture8.jpg','放进去了的青春，走不出来的悲伤却总是给年少时的我们留下太多无法割舍的情怀。记录岁月的足迹，聆听时光的故事。然轻吟浅唱出，青春嘉年华。\n故事里总会有，那些太多感慨于时间的无情，太多对往事的追忆，太多的太多，而今刻在了心里也停泻在了流年里。一段无法抹去的回忆，也只不过是一场烟火燃放的瞬间，却也一辈子在脑海里兜兜转转。很是怀念那些相遇的日子，邂逅了幸福也留在了时间轨迹里。时而想起，那些曾肩并肩奋斗的日子，那些写满感动与快乐的岁月。\n如今，我们似乎渐行渐远，彼此奋斗着青春的轮回。渐渐的，我们都长大了，时间改变了我们时刻分享彼此快乐与不快乐的习惯，青春的渐逝，岁月的更迭让我们变得都不再联系，身边的朋友也越来越少;那些欢笑，那些幸福的流年也随着我们的陌生而变得更加奢侈。也许多年以后，我们都有了自己的朋友，有了自己关心的人。那时，我们再细数那些癫狂在你生命里一辈子的记忆故事，蓦然发现一切都停留在了回忆里。'),(9,'2025-07-09 02:33:51','自己的路自己走，自己的心自己懂','岛上书店》中有句话:每个人的生命里，都有最艰难的那一年，将人生变得美好而辽阔。\n你有没有经历过那么一年，在走过的岁月中跋涉得异常艰难困苦，却仍无法灭前行的勇气。哪怕所有人都极力劝阻，也要不甘心地试一试;哪怕前方已没有道路，却还在坚定前行;哪怕再看不到任何希望，也要竭尽全力地为自己争取一个机会。','file/newsPicture9.jpg','你开始不动声色的扮演着一个大人，经历着生活日复一日的打。\n每天醒在天还没亮的五六点，挤过早高峰的地下铁，面对成山的工作，加班到深夜倒下就睡更成为了日常，还要应付各色的人际关系，逐渐开始接受努力也不一定有回报的道理。\n这段日子也许很长，但你没有放弃对生活的信心，始终相信人生总会变得一帆风顺，更坚信每件事的最后都会有一个好的结局，如果不是，说明还没到最后。\n于是你树立新的目标，让这一年的奔波更有方向。\n虽然永远无法预料明天是晴是雨，也无法预知你在乎的人是否还在身边，你一直以来的坚持究竟能换来什么。\n但你能决定的是，今天有没有备好雨伞，有没有好好爱人以及是否为自己追求的理想拼尽全力。\n永远不要只看见前方路途遥远而忘了从前的自己坚持了多久才走到了这里，\n今天拼尽全力虽然艰辛万分，在未来都将成为落在你身上的礼物。'),(10,'2025-07-09 02:33:51','愿你有明天可奔赴，有过往可回头','此去经年，用一张离家的车票，换一段有故事可说的人生。\n大概就是那时候怀揣着梦想，背上了行囊，一腔热血决定远行的你。独自拎着一只行李箱，背着双肩包在深夜抵达一个陌生的城市，站在人潮涌动的车站出口，望着宽敞公路上车水马龙的喧嚣，城市里亮如白昼的繁华。','file/newsPicture10.jpg','这世界上的人们都活的匆匆忙忙，每个人看起来都很焦虑，每个人都有自己的苦楚，却往往找不到人可以诉说。也许你的倾诉，对别人来说是一种打扰，而且别人没经历过你的经历，所以无法体会你的心情。我们总是在心情不好的时候拿着手机，翻翻通讯录，然后再默默放下手机，压住心中那股想要找人说说话的想法。\n等到低落的情绪慢慢有些好转，才开始明白，人这一生，无论是什么样的路，都是自己的选择，冲动也好，深思熟虑也罢，自己选的路，不管多难，都要自己走下去。心中的感受，不管是复杂还是简单，都只能自己来懂，别人帮不了你，也安慰不了你，顶多给你一些无济于事的劝告，最后还得靠自己想开。你选的幸福，你自己享受;你选的眼泪，你自己来流，生活就是如此，自己的路，自己走;自己的心，自己懂。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popup_remind`
--

DROP TABLE IF EXISTS `popup_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popup_remind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '发布人用户ID',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '私人' COMMENT '类型',
  `brief` longtext COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `remind_time` datetime DEFAULT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='吃药提醒';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup_remind`
--

LOCK TABLES `popup_remind` WRITE;
/*!40000 ALTER TABLE `popup_remind` DISABLE KEYS */;
INSERT INTO `popup_remind` VALUES (1,'2025-07-09 02:33:52',1,'标题1','私人','简介1','内容1','2025-07-09 10:33:52'),(2,'2025-07-09 02:33:52',2,'标题2','私人','简介2','内容2','2025-07-09 10:33:52'),(3,'2025-07-09 02:33:52',3,'标题3','私人','简介3','内容3','2025-07-09 10:33:52'),(4,'2025-07-09 02:33:52',4,'标题4','私人','简介4','内容4','2025-07-09 10:33:52'),(5,'2025-07-09 02:33:52',5,'标题5','私人','简介5','内容5','2025-07-09 10:33:52'),(6,'2025-07-09 02:33:52',6,'标题6','私人','简介6','内容6','2025-07-09 10:33:52'),(7,'2025-07-09 02:33:52',7,'标题7','私人','简介7','内容7','2025-07-09 10:33:52'),(8,'2025-07-09 02:33:52',8,'标题8','私人','简介8','内容8','2025-07-09 10:33:52'),(9,'2025-07-09 02:33:52',9,'标题9','私人','简介9','内容9','2025-07-09 10:33:52'),(10,'2025-07-09 02:33:52',10,'标题10','私人','简介10','内容10','2025-07-09 10:33:52');
/*!40000 ALTER TABLE `popup_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quxiaoyuyue`
--

DROP TABLE IF EXISTS `quxiaoyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quxiaoyuyue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tijianxiangmu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检项目',
  `tijianleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检类型',
  `tijiandidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检地点',
  `tijianfeiyong` int(11) DEFAULT NULL COMMENT '体检费用',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `quxiaoyuanyin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取消原因',
  `quxiaoshijian` datetime DEFAULT NULL COMMENT '取消时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='取消预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quxiaoyuyue`
--

LOCK TABLES `quxiaoyuyue` WRITE;
/*!40000 ALTER TABLE `quxiaoyuyue` DISABLE KEYS */;
INSERT INTO `quxiaoyuyue` VALUES (1,'2025-07-09 02:33:52','体检项目1','体检类型1','体检地点1',1,'用户账号1','用户姓名1','性别1','机构账号1','机构名称1','取消原因1','2025-07-09 10:33:52'),(2,'2025-07-09 02:33:52','体检项目2','体检类型2','体检地点2',2,'用户账号2','用户姓名2','性别2','机构账号2','机构名称2','取消原因2','2025-07-09 10:33:52'),(3,'2025-07-09 02:33:52','体检项目3','体检类型3','体检地点3',3,'用户账号3','用户姓名3','性别3','机构账号3','机构名称3','取消原因3','2025-07-09 10:33:52'),(4,'2025-07-09 02:33:52','体检项目4','体检类型4','体检地点4',4,'用户账号4','用户姓名4','性别4','机构账号4','机构名称4','取消原因4','2025-07-09 10:33:52'),(5,'2025-07-09 02:33:52','体检项目5','体检类型5','体检地点5',5,'用户账号5','用户姓名5','性别5','机构账号5','机构名称5','取消原因5','2025-07-09 10:33:52'),(6,'2025-07-09 02:33:52','体检项目6','体检类型6','体检地点6',6,'用户账号6','用户姓名6','性别6','机构账号6','机构名称6','取消原因6','2025-07-09 10:33:52'),(7,'2025-07-09 02:33:52','体检项目7','体检类型7','体检地点7',7,'用户账号7','用户姓名7','性别7','机构账号7','机构名称7','取消原因7','2025-07-09 10:33:52'),(8,'2025-07-09 02:33:52','体检项目8','体检类型8','体检地点8',8,'用户账号8','用户姓名8','性别8','机构账号8','机构名称8','取消原因8','2025-07-09 10:33:52'),(9,'2025-07-09 02:33:52','体检项目9','体检类型9','体检地点9',9,'用户账号9','用户姓名9','性别9','机构账号9','机构名称9','取消原因9','2025-07-09 10:33:52'),(10,'2025-07-09 02:33:52','体检项目10','体检类型10','体检地点10',10,'用户账号10','用户姓名10','性别10','机构账号10','机构名称10','取消原因10','2025-07-09 10:33:52');
/*!40000 ALTER TABLE `quxiaoyuyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notice`
--

LOCK TABLES `system_notice` WRITE;
/*!40000 ALTER TABLE `system_notice` DISABLE KEYS */;
INSERT INTO `system_notice` VALUES (1,'2025-07-09 02:33:52','公告信息...');
/*!40000 ALTER TABLE `system_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijianbaogao`
--

DROP TABLE IF EXISTS `tijianbaogao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijianbaogao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tijianxiangmu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检项目',
  `tijianleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检类型',
  `tijiandidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检地点',
  `tijianfeiyong` int(11) DEFAULT NULL COMMENT '体检费用',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `baogaoxiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '报告详情',
  `baogaoshijian` datetime DEFAULT NULL COMMENT '报告时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='体检报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijianbaogao`
--

LOCK TABLES `tijianbaogao` WRITE;
/*!40000 ALTER TABLE `tijianbaogao` DISABLE KEYS */;
INSERT INTO `tijianbaogao` VALUES (1,'2025-07-09 02:33:52','体检项目1','体检类型1','体检地点1',1,'用户账号1','用户姓名1','机构账号1','机构名称1','','2025-07-09 10:33:52'),(2,'2025-07-09 02:33:52','体检项目2','体检类型2','体检地点2',2,'用户账号2','用户姓名2','机构账号2','机构名称2','','2025-07-09 10:33:52'),(3,'2025-07-09 02:33:52','体检项目3','体检类型3','体检地点3',3,'用户账号3','用户姓名3','机构账号3','机构名称3','','2025-07-09 10:33:52'),(4,'2025-07-09 02:33:52','体检项目4','体检类型4','体检地点4',4,'用户账号4','用户姓名4','机构账号4','机构名称4','','2025-07-09 10:33:52'),(5,'2025-07-09 02:33:52','体检项目5','体检类型5','体检地点5',5,'用户账号5','用户姓名5','机构账号5','机构名称5','','2025-07-09 10:33:52'),(6,'2025-07-09 02:33:52','体检项目6','体检类型6','体检地点6',6,'用户账号6','用户姓名6','机构账号6','机构名称6','','2025-07-09 10:33:52'),(7,'2025-07-09 02:33:52','体检项目7','体检类型7','体检地点7',7,'用户账号7','用户姓名7','机构账号7','机构名称7','','2025-07-09 10:33:52'),(8,'2025-07-09 02:33:52','体检项目8','体检类型8','体检地点8',8,'用户账号8','用户姓名8','机构账号8','机构名称8','','2025-07-09 10:33:52'),(9,'2025-07-09 02:33:52','体检项目9','体检类型9','体检地点9',9,'用户账号9','用户姓名9','机构账号9','机构名称9','','2025-07-09 10:33:52'),(10,'2025-07-09 02:33:52','体检项目10','体检类型10','体检地点10',10,'用户账号10','用户姓名10','机构账号10','机构名称10','','2025-07-09 10:33:52');
/*!40000 ALTER TABLE `tijianbaogao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijianleixing`
--

DROP TABLE IF EXISTS `tijianleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijianleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tijianleixing` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '体检类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tijianleixing` (`tijianleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='体检类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijianleixing`
--

LOCK TABLES `tijianleixing` WRITE;
/*!40000 ALTER TABLE `tijianleixing` DISABLE KEYS */;
INSERT INTO `tijianleixing` VALUES (1,'2025-07-09 02:33:51','体检类型1'),(2,'2025-07-09 02:33:51','体检类型2'),(3,'2025-07-09 02:33:52','体检类型3'),(4,'2025-07-09 02:33:52','体检类型4'),(5,'2025-07-09 02:33:52','体检类型5'),(6,'2025-07-09 02:33:52','体检类型6'),(7,'2025-07-09 02:33:52','体检类型7'),(8,'2025-07-09 02:33:52','体检类型8'),(9,'2025-07-09 02:33:52','体检类型9'),(10,'2025-07-09 02:33:52','体检类型10');
/*!40000 ALTER TABLE `tijianleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijianxiangmu`
--

DROP TABLE IF EXISTS `tijianxiangmu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijianxiangmu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tijianxiangmu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检项目',
  `tijianleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检类型',
  `tijiantupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '体检图片',
  `tijiandidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检地点',
  `keyuerenshu` int(11) DEFAULT NULL COMMENT '可约人数',
  `tijianfeiyong` double DEFAULT NULL COMMENT '体检费用',
  `tijianliucheng` longtext COLLATE utf8mb4_unicode_ci COMMENT '体检流程',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `storeup_number` int(11) DEFAULT '0' COMMENT '收藏数',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='体检项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijianxiangmu`
--

LOCK TABLES `tijianxiangmu` WRITE;
/*!40000 ALTER TABLE `tijianxiangmu` DISABLE KEYS */;
INSERT INTO `tijianxiangmu` VALUES (1,'2025-07-09 02:33:52','体检项目1','体检类型1','file/tijianxiangmuTijiantupian1.jpg,file/tijianxiangmuTijiantupian2.jpg,file/tijianxiangmuTijiantupian3.jpg','体检地点1',1,1,'体检流程1','2025-07-09 10:33:52','机构账号1','机构名称1','是','',1,'2025-07-09 10:33:52'),(2,'2025-07-09 02:33:52','体检项目2','体检类型2','file/tijianxiangmuTijiantupian2.jpg,file/tijianxiangmuTijiantupian3.jpg,file/tijianxiangmuTijiantupian4.jpg','体检地点2',2,2,'体检流程2','2025-07-09 10:33:52','机构账号2','机构名称2','是','',2,'2025-07-09 10:33:52'),(3,'2025-07-09 02:33:52','体检项目3','体检类型3','file/tijianxiangmuTijiantupian3.jpg,file/tijianxiangmuTijiantupian4.jpg,file/tijianxiangmuTijiantupian5.jpg','体检地点3',3,3,'体检流程3','2025-07-09 10:33:52','机构账号3','机构名称3','是','',3,'2025-07-09 10:33:52'),(4,'2025-07-09 02:33:52','体检项目4','体检类型4','file/tijianxiangmuTijiantupian4.jpg,file/tijianxiangmuTijiantupian5.jpg,file/tijianxiangmuTijiantupian6.jpg','体检地点4',4,4,'体检流程4','2025-07-09 10:33:52','机构账号4','机构名称4','是','',4,'2025-07-09 10:33:52'),(5,'2025-07-09 02:33:52','体检项目5','体检类型5','file/tijianxiangmuTijiantupian5.jpg,file/tijianxiangmuTijiantupian6.jpg,file/tijianxiangmuTijiantupian7.jpg','体检地点5',5,5,'体检流程5','2025-07-09 10:33:52','机构账号5','机构名称5','是','',5,'2025-07-09 10:33:52'),(6,'2025-07-09 02:33:52','体检项目6','体检类型6','file/tijianxiangmuTijiantupian6.jpg,file/tijianxiangmuTijiantupian7.jpg,file/tijianxiangmuTijiantupian8.jpg','体检地点6',6,6,'体检流程6','2025-07-09 10:33:52','机构账号6','机构名称6','是','',6,'2025-07-09 10:33:52'),(7,'2025-07-09 02:33:52','体检项目7','体检类型7','file/tijianxiangmuTijiantupian7.jpg,file/tijianxiangmuTijiantupian8.jpg,file/tijianxiangmuTijiantupian9.jpg','体检地点7',7,7,'体检流程7','2025-07-09 10:33:52','机构账号7','机构名称7','是','',7,'2025-07-09 10:33:52'),(8,'2025-07-09 02:33:52','体检项目8','体检类型8','file/tijianxiangmuTijiantupian8.jpg,file/tijianxiangmuTijiantupian9.jpg,file/tijianxiangmuTijiantupian10.jpg','体检地点8',8,8,'体检流程8','2025-07-09 10:33:52','机构账号8','机构名称8','是','',8,'2025-07-09 10:33:52'),(9,'2025-07-09 02:33:52','体检项目9','体检类型9','file/tijianxiangmuTijiantupian9.jpg,file/tijianxiangmuTijiantupian10.jpg,file/tijianxiangmuTijiantupian11.jpg','体检地点9',9,9,'体检流程9','2025-07-09 10:33:52','机构账号9','机构名称9','是','',9,'2025-07-09 10:33:52'),(10,'2025-07-09 02:33:52','体检项目10','体检类型10','file/tijianxiangmuTijiantupian10.jpg,file/tijianxiangmuTijiantupian11.jpg,file/tijianxiangmuTijiantupian12.jpg','体检地点10',10,10,'体检流程10','2025-07-09 10:33:52','机构账号10','机构名称10','是','',10,'2025-07-09 10:33:52');
/*!40000 ALTER TABLE `tijianxiangmu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijianxinxi`
--

DROP TABLE IF EXISTS `tijianxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tijianxiangmu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检项目',
  `tijianleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检类型',
  `tijiandidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检地点',
  `tijianfeiyong` int(11) DEFAULT NULL COMMENT '体检费用',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `tijianshijian` datetime DEFAULT NULL COMMENT '体检时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='体检信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijianxinxi`
--

LOCK TABLES `tijianxinxi` WRITE;
/*!40000 ALTER TABLE `tijianxinxi` DISABLE KEYS */;
INSERT INTO `tijianxinxi` VALUES (1,'2025-07-09 02:33:52','体检项目1','体检类型1','体检地点1',1,'用户账号1','用户姓名1','机构账号1','机构名称1','2025-07-09 10:33:52'),(2,'2025-07-09 02:33:52','体检项目2','体检类型2','体检地点2',2,'用户账号2','用户姓名2','机构账号2','机构名称2','2025-07-09 10:33:52'),(3,'2025-07-09 02:33:52','体检项目3','体检类型3','体检地点3',3,'用户账号3','用户姓名3','机构账号3','机构名称3','2025-07-09 10:33:52'),(4,'2025-07-09 02:33:52','体检项目4','体检类型4','体检地点4',4,'用户账号4','用户姓名4','机构账号4','机构名称4','2025-07-09 10:33:52'),(5,'2025-07-09 02:33:52','体检项目5','体检类型5','体检地点5',5,'用户账号5','用户姓名5','机构账号5','机构名称5','2025-07-09 10:33:52'),(6,'2025-07-09 02:33:52','体检项目6','体检类型6','体检地点6',6,'用户账号6','用户姓名6','机构账号6','机构名称6','2025-07-09 10:33:52'),(7,'2025-07-09 02:33:52','体检项目7','体检类型7','体检地点7',7,'用户账号7','用户姓名7','机构账号7','机构名称7','2025-07-09 10:33:52'),(8,'2025-07-09 02:33:52','体检项目8','体检类型8','体检地点8',8,'用户账号8','用户姓名8','机构账号8','机构名称8','2025-07-09 10:33:52'),(9,'2025-07-09 02:33:52','体检项目9','体检类型9','体检地点9',9,'用户账号9','用户姓名9','机构账号9','机构名称9','2025-07-09 10:33:52'),(10,'2025-07-09 02:33:52','体检项目10','体检类型10','体检地点10',10,'用户账号10','用户姓名10','机构账号10','机构名称10','2025-07-09 10:33:52');
/*!40000 ALTER TABLE `tijianxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijianyuyue`
--

DROP TABLE IF EXISTS `tijianyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijianyuyue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tijianxiangmu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检项目',
  `tijianleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检类型',
  `tijiandidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检地点',
  `tijianfeiyong` int(11) DEFAULT NULL COMMENT '体检费用',
  `keyuerenshu` int(11) NOT NULL COMMENT '预约数',
  `yuyueshijian` datetime DEFAULT NULL COMMENT '预约时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  `ispay` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否支付',
  `tijianzhuangtai` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '体检状态',
  `yuyuexiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '预约详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='体检预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijianyuyue`
--

LOCK TABLES `tijianyuyue` WRITE;
/*!40000 ALTER TABLE `tijianyuyue` DISABLE KEYS */;
INSERT INTO `tijianyuyue` VALUES (1,'2025-07-09 02:33:52','体检项目1','体检类型1','体检地点1',1,1,'2025-07-09 10:33:52','用户账号1','用户姓名1','机构账号1','机构名称1','未支付','已体检','预约详情1'),(2,'2025-07-09 02:33:52','体检项目2','体检类型2','体检地点2',2,2,'2025-07-09 10:33:52','用户账号2','用户姓名2','机构账号2','机构名称2','未支付','已体检','预约详情2'),(3,'2025-07-09 02:33:52','体检项目3','体检类型3','体检地点3',3,3,'2025-07-09 10:33:52','用户账号3','用户姓名3','机构账号3','机构名称3','未支付','已体检','预约详情3'),(4,'2025-07-09 02:33:52','体检项目4','体检类型4','体检地点4',4,4,'2025-07-09 10:33:52','用户账号4','用户姓名4','机构账号4','机构名称4','未支付','已体检','预约详情4'),(5,'2025-07-09 02:33:52','体检项目5','体检类型5','体检地点5',5,5,'2025-07-09 10:33:52','用户账号5','用户姓名5','机构账号5','机构名称5','未支付','已体检','预约详情5'),(6,'2025-07-09 02:33:52','体检项目6','体检类型6','体检地点6',6,6,'2025-07-09 10:33:52','用户账号6','用户姓名6','机构账号6','机构名称6','未支付','已体检','预约详情6'),(7,'2025-07-09 02:33:52','体检项目7','体检类型7','体检地点7',7,7,'2025-07-09 10:33:52','用户账号7','用户姓名7','机构账号7','机构名称7','未支付','已体检','预约详情7'),(8,'2025-07-09 02:33:52','体检项目8','体检类型8','体检地点8',8,8,'2025-07-09 10:33:52','用户账号8','用户姓名8','机构账号8','机构名称8','未支付','已体检','预约详情8'),(9,'2025-07-09 02:33:52','体检项目9','体检类型9','体检地点9',9,9,'2025-07-09 10:33:52','用户账号9','用户姓名9','机构账号9','机构名称9','未支付','已体检','预约详情9'),(10,'2025-07-09 02:33:52','体检项目10','体检类型10','体检地点10',10,10,'2025-07-09 10:33:52','用户账号10','用户姓名10','机构账号10','机构名称10','未支付','已体检','预约详情10');
/*!40000 ALTER TABLE `tijianyuyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `tupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2025-07-09 02:33:52','admin','admin','管理员',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiliaojigou`
--

DROP TABLE IF EXISTS `yiliaojigou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yiliaojigou` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构账号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机构名称',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '营业执照',
  `lianxidianhua` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jigouzhanghao` (`jigouzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医疗机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiliaojigou`
--

LOCK TABLES `yiliaojigou` WRITE;
/*!40000 ALTER TABLE `yiliaojigou` DISABLE KEYS */;
INSERT INTO `yiliaojigou` VALUES (51,'2025-07-09 02:33:51','机构账号1','123456','机构名称1','file/yiliaojigouTouxiang1.jpg','19819881111','是',''),(52,'2025-07-09 02:33:51','机构账号2','123456','机构名称2','file/yiliaojigouTouxiang2.jpg','19819881112','是',''),(53,'2025-07-09 02:33:51','机构账号3','123456','机构名称3','file/yiliaojigouTouxiang3.jpg','19819881113','是',''),(54,'2025-07-09 02:33:51','机构账号4','123456','机构名称4','file/yiliaojigouTouxiang4.jpg','19819881114','是',''),(55,'2025-07-09 02:33:51','机构账号5','123456','机构名称5','file/yiliaojigouTouxiang5.jpg','19819881115','是',''),(56,'2025-07-09 02:33:51','机构账号6','123456','机构名称6','file/yiliaojigouTouxiang6.jpg','19819881116','是',''),(57,'2025-07-09 02:33:51','机构账号7','123456','机构名称7','file/yiliaojigouTouxiang7.jpg','19819881117','是',''),(58,'2025-07-09 02:33:51','机构账号8','123456','机构名称8','file/yiliaojigouTouxiang8.jpg','19819881118','是',''),(59,'2025-07-09 02:33:51','机构账号9','123456','机构名称9','file/yiliaojigouTouxiang9.jpg','19819881119','是',''),(60,'2025-07-09 02:33:51','机构账号10','123456','机构名称10','file/yiliaojigouTouxiang10.jpg','198198811110','是','');
/*!40000 ALTER TABLE `yiliaojigou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yishengzuozhen`
--

DROP TABLE IF EXISTS `yishengzuozhen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yishengzuozhen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `yishenggonghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '医生姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `zhicheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职称',
  `keshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科室',
  `shanzhanglingyu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '擅长领域',
  `lianxifangshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `zuozhenshijian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '坐诊时间',
  `guahaofei` double DEFAULT NULL COMMENT '挂号费',
  `keguashuliang` int(11) DEFAULT NULL COMMENT '可挂数量',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='医生坐诊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yishengzuozhen`
--

LOCK TABLES `yishengzuozhen` WRITE;
/*!40000 ALTER TABLE `yishengzuozhen` DISABLE KEYS */;
INSERT INTO `yishengzuozhen` VALUES (1,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang1.jpg,file/yishengzuozhenTouxiang2.jpg,file/yishengzuozhenTouxiang3.jpg','医生工号1','医生姓名1','男','职称1','科室1','擅长领域1','联系方式1','坐诊时间1',1,1,'机构账号1','机构名称1'),(2,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang2.jpg,file/yishengzuozhenTouxiang3.jpg,file/yishengzuozhenTouxiang4.jpg','医生工号2','医生姓名2','男','职称2','科室2','擅长领域2','联系方式2','坐诊时间2',2,2,'机构账号2','机构名称2'),(3,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang3.jpg,file/yishengzuozhenTouxiang4.jpg,file/yishengzuozhenTouxiang5.jpg','医生工号3','医生姓名3','男','职称3','科室3','擅长领域3','联系方式3','坐诊时间3',3,3,'机构账号3','机构名称3'),(4,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang4.jpg,file/yishengzuozhenTouxiang5.jpg,file/yishengzuozhenTouxiang6.jpg','医生工号4','医生姓名4','男','职称4','科室4','擅长领域4','联系方式4','坐诊时间4',4,4,'机构账号4','机构名称4'),(5,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang5.jpg,file/yishengzuozhenTouxiang6.jpg,file/yishengzuozhenTouxiang7.jpg','医生工号5','医生姓名5','男','职称5','科室5','擅长领域5','联系方式5','坐诊时间5',5,5,'机构账号5','机构名称5'),(6,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang6.jpg,file/yishengzuozhenTouxiang7.jpg,file/yishengzuozhenTouxiang8.jpg','医生工号6','医生姓名6','男','职称6','科室6','擅长领域6','联系方式6','坐诊时间6',6,6,'机构账号6','机构名称6'),(7,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang7.jpg,file/yishengzuozhenTouxiang8.jpg,file/yishengzuozhenTouxiang9.jpg','医生工号7','医生姓名7','男','职称7','科室7','擅长领域7','联系方式7','坐诊时间7',7,7,'机构账号7','机构名称7'),(8,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang8.jpg,file/yishengzuozhenTouxiang9.jpg,file/yishengzuozhenTouxiang10.jpg','医生工号8','医生姓名8','男','职称8','科室8','擅长领域8','联系方式8','坐诊时间8',8,8,'机构账号8','机构名称8'),(9,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang9.jpg,file/yishengzuozhenTouxiang10.jpg,file/yishengzuozhenTouxiang11.jpg','医生工号9','医生姓名9','男','职称9','科室9','擅长领域9','联系方式9','坐诊时间9',9,9,'机构账号9','机构名称9'),(10,'2025-07-09 02:33:52','file/yishengzuozhenTouxiang10.jpg,file/yishengzuozhenTouxiang11.jpg,file/yishengzuozhenTouxiang12.jpg','医生工号10','医生姓名10','男','职称10','科室10','擅长领域10','联系方式10','坐诊时间10',10,10,'机构账号10','机构名称10');
/*!40000 ALTER TABLE `yishengzuozhen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `nianling` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年龄',
  `zhuzhi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (41,'2025-07-09 02:33:51','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111','年龄1','住址1'),(42,'2025-07-09 02:33:51','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112','年龄2','住址2'),(43,'2025-07-09 02:33:51','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113','年龄3','住址3'),(44,'2025-07-09 02:33:51','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114','年龄4','住址4'),(45,'2025-07-09 02:33:51','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115','年龄5','住址5'),(46,'2025-07-09 02:33:51','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116','年龄6','住址6'),(47,'2025-07-09 02:33:51','用户账号7','123456','用户姓名7','file/yonghuTouxiang7.jpg','男','19819881117','年龄7','住址7'),(48,'2025-07-09 02:33:51','用户账号8','123456','用户姓名8','file/yonghuTouxiang8.jpg','男','19819881118','年龄8','住址8'),(49,'2025-07-09 02:33:51','用户账号9','123456','用户姓名9','file/yonghuTouxiang9.jpg','男','19819881119','年龄9','住址9'),(50,'2025-07-09 02:33:51','用户账号10','123456','用户姓名10','file/yonghuTouxiang10.jpg','男','198198811110','年龄10','住址10');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuyueguahao`
--

DROP TABLE IF EXISTS `yuyueguahao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuyueguahao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuebianhao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预约编号',
  `yishenggonghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '医生姓名',
  `guahaofei` double DEFAULT NULL COMMENT '挂号费',
  `keguashuliang` int(11) DEFAULT NULL COMMENT '挂号数',
  `yuyueshijian` datetime DEFAULT NULL COMMENT '预约时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `ispay` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否支付',
  `jiwangbingshi` longtext COLLATE utf8mb4_unicode_ci COMMENT '既往病史',
  `jigouzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构账号',
  `jigoumingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机构名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yuyuebianhao` (`yuyuebianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='预约挂号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuyueguahao`
--

LOCK TABLES `yuyueguahao` WRITE;
/*!40000 ALTER TABLE `yuyueguahao` DISABLE KEYS */;
INSERT INTO `yuyueguahao` VALUES (1,'2025-07-09 02:33:52','1111111111','医生工号1','医生姓名1',1,1,'2025-07-09 10:33:52','用户账号1','用户姓名1','未支付','既往病史1','机构账号1','机构名称1'),(2,'2025-07-09 02:33:52','2222222222','医生工号2','医生姓名2',2,2,'2025-07-09 10:33:52','用户账号2','用户姓名2','未支付','既往病史2','机构账号2','机构名称2'),(3,'2025-07-09 02:33:52','3333333333','医生工号3','医生姓名3',3,3,'2025-07-09 10:33:52','用户账号3','用户姓名3','未支付','既往病史3','机构账号3','机构名称3'),(4,'2025-07-09 02:33:52','4444444444','医生工号4','医生姓名4',4,4,'2025-07-09 10:33:52','用户账号4','用户姓名4','未支付','既往病史4','机构账号4','机构名称4'),(5,'2025-07-09 02:33:52','5555555555','医生工号5','医生姓名5',5,5,'2025-07-09 10:33:52','用户账号5','用户姓名5','未支付','既往病史5','机构账号5','机构名称5'),(6,'2025-07-09 02:33:52','6666666666','医生工号6','医生姓名6',6,6,'2025-07-09 10:33:52','用户账号6','用户姓名6','未支付','既往病史6','机构账号6','机构名称6'),(7,'2025-07-09 02:33:52','7777777777','医生工号7','医生姓名7',7,7,'2025-07-09 10:33:52','用户账号7','用户姓名7','未支付','既往病史7','机构账号7','机构名称7'),(8,'2025-07-09 02:33:52','8888888888','医生工号8','医生姓名8',8,8,'2025-07-09 10:33:52','用户账号8','用户姓名8','未支付','既往病史8','机构账号8','机构名称8'),(9,'2025-07-09 02:33:52','9999999999','医生工号9','医生姓名9',9,9,'2025-07-09 10:33:52','用户账号9','用户姓名9','未支付','既往病史9','机构账号9','机构名称9'),(10,'2025-07-09 02:33:52','11111111110','医生工号10','医生姓名10',10,10,'2025-07-09 10:33:52','用户账号10','用户姓名10','未支付','既往病史10','机构账号10','机构名称10');
/*!40000 ALTER TABLE `yuyueguahao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09 14:17:27
