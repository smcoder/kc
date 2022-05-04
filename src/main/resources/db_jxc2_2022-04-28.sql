# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.28)
# Database: db_jxc2
# Generation Time: 2022-04-28 12:29:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_customer` WRITE;
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;

INSERT INTO `t_customer` (`id`, `address`, `contact`, `name`, `number`, `remarks`)
VALUES
	(1,'福州新弯曲5号','小李子','福州艾玛超市','2132-23213421',''),
	(2,'天津兴达大街888号','小张','天津王大连锁酒店','23432222311','优质客户'),
	(3,'大凉山妥洛村','小爱','大凉山希望小学','233243211','照顾客户2'),
	(4,'南通通州新金路888号','王二小','南通通州综艺集团','1832132321','');

/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_customer_return_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_customer_return_list`;

CREATE TABLE `t_customer_return_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `customer_return_date` datetime DEFAULT NULL,
  `customer_return_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl0ahdwa8slkocbfe57opembfx` (`customer_id`),
  KEY `FKd55ju83f0ntixagdvdrsmw10c` (`user_id`),
  CONSTRAINT `FKd55ju83f0ntixagdvdrsmw10c` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKl0ahdwa8slkocbfe57opembfx` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_customer_return_list` WRITE;
/*!40000 ALTER TABLE `t_customer_return_list` DISABLE KEYS */;

INSERT INTO `t_customer_return_list` (`id`, `amount_paid`, `amount_payable`, `customer_return_date`, `customer_return_number`, `remarks`, `state`, `customer_id`, `user_id`)
VALUES
	(3,25,25,'2020-12-11 00:00:00','XT202012110003','cc',1,1,1),
	(4,13,13,'2020-12-12 00:00:00','XT202012120001','xx',1,1,1),
	(5,26,26,'2020-12-12 00:00:00','XT202012120002','cc',1,1,1);

/*!40000 ALTER TABLE `t_customer_return_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_customer_return_list_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_customer_return_list_goods`;

CREATE TABLE `t_customer_return_list_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `customer_return_list_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtqt67mbn96lxn8hvtl4piblhi` (`customer_return_list_id`),
  KEY `FK4sm5si4swbj3gae46jfk441yx` (`type_id`),
  CONSTRAINT `FK4sm5si4swbj3gae46jfk441yx` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKtqt67mbn96lxn8hvtl4piblhi` FOREIGN KEY (`customer_return_list_id`) REFERENCES `t_customer_return_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_customer_return_list_goods` WRITE;
/*!40000 ALTER TABLE `t_customer_return_list_goods` DISABLE KEYS */;

INSERT INTO `t_customer_return_list_goods` (`id`, `code`, `goods_id`, `model`, `name`, `num`, `price`, `total`, `unit`, `customer_return_list_id`, `type_id`)
VALUES
	(5,'0004',12,'2斤装','新疆红枣',1,25,25,'袋',3,10),
	(6,'0006',14,'300g装','冰糖金桔干',1,13,13,'盒',4,11),
	(7,'0006',14,'300g装','冰糖金桔干',2,13,26,'盒',5,11);

/*!40000 ALTER TABLE `t_customer_return_list_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_damage_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_damage_list`;

CREATE TABLE `t_damage_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `damage_date` datetime DEFAULT NULL,
  `damage_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpn094ma69sch1icjc2gu7xus` (`user_id`),
  CONSTRAINT `FKpn094ma69sch1icjc2gu7xus` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_damage_list` WRITE;
/*!40000 ALTER TABLE `t_damage_list` DISABLE KEYS */;

INSERT INTO `t_damage_list` (`id`, `damage_date`, `damage_number`, `remarks`, `user_id`)
VALUES
	(1,'2020-12-13 00:00:00','BS202012130001','cc',1),
	(2,'2020-12-13 00:00:00','BS202012130002','xx',1);

/*!40000 ALTER TABLE `t_damage_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_damage_list_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_damage_list_goods`;

CREATE TABLE `t_damage_list_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `damage_list_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbf5m8mm3gctrnuubr9xkjamj8` (`damage_list_id`),
  KEY `FKdbdfmp09hlf2raktincwroe9n` (`type_id`),
  CONSTRAINT `FKbf5m8mm3gctrnuubr9xkjamj8` FOREIGN KEY (`damage_list_id`) REFERENCES `t_damage_list` (`id`),
  CONSTRAINT `FKdbdfmp09hlf2raktincwroe9n` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_damage_list_goods` WRITE;
/*!40000 ALTER TABLE `t_damage_list_goods` DISABLE KEYS */;

INSERT INTO `t_damage_list_goods` (`id`, `code`, `goods_id`, `model`, `name`, `num`, `price`, `total`, `unit`, `damage_list_id`, `type_id`)
VALUES
	(1,'0003',11,'500g装','野生东北黑木耳',1,22,22,'袋',1,11),
	(2,'0006',14,'300g装','冰糖金桔干',2,4,8,'盒',1,11),
	(3,'0003',11,'500g装','野生东北黑木耳',2,22,44,'袋',2,11);

/*!40000 ALTER TABLE `t_damage_list_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_goods`;

CREATE TABLE `t_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `inventory_quantity` int NOT NULL,
  `last_purchasing_price` float NOT NULL,
  `min_num` int NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `producer` varchar(200) DEFAULT NULL,
  `purchasing_price` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `selling_price` float NOT NULL,
  `state` int NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlxnna5ngumghp4f279mmbjtyo` (`type_id`),
  CONSTRAINT `FKlxnna5ngumghp4f279mmbjtyo` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_goods` WRITE;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;

INSERT INTO `t_goods` (`id`, `code`, `inventory_quantity`, `last_purchasing_price`, `min_num`, `model`, `name`, `producer`, `purchasing_price`, `remarks`, `selling_price`, `state`, `unit`, `type_id`)
VALUES
	(1,'0001',171,8.5,1000,'红色装','陶华碧老干妈香辣脆油辣椒','贵州省贵阳南明老干妈风味食品有限公司',6.34,'好卖',8.5,2,'瓶',10),
	(2,'0002',140,2220,400,'Note8','华为荣耀Note8','华为计算机系统有限公司',1955.68,'热销',2200,2,'台',16),
	(11,'0003',2735,22,400,'500g装','野生东北黑木耳','辉南县博康土特产有限公司',23,'够黑2',38,2,'袋',11),
	(12,'0004',315,13,300,'2斤装','新疆红枣','沧州铭鑫食品有限公司',13,'好吃',25,2,'袋',10),
	(13,'0005',53,8,1000,'散装500克','麦片燕麦巧克力','福建省麦德好食品工业有限公司',8,'Goods',15,2,'袋',11),
	(14,'0006',17,4,1999,'300g装','冰糖金桔干','揭西县同心食品有限公司',4.95,'',13,2,'盒',11),
	(15,'0007',100650,4.5,400,'500g装','吉利人家牛肉味蛋糕','合肥吉利人家食品有限公司',4.5,'good',10,2,'袋',11),
	(16,'0008',197,2,500,'128g装','奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品','潮州市潮安区正大食品有限公司',2.99,'',10,2,'盒',11),
	(17,'0009',371,20,1000,'240g装','休闲零食坚果特产精品干果无漂白大个开心果','石家庄博群食品有限公司',20,'',33,2,'袋',11),
	(18,'0010',9,12,300,'250g装','劲仔小鱼干','湖南省华文食品有限公司',12,'',20,2,'袋',11),
	(19,'0011',12,3.2,300,'198g装','山楂条','临朐县七贤升利食品厂',3.2,'',10,2,'袋',11),
	(20,'0012',23,20,200,'500g装','大乌梅干','长春市鼎丰真食品有限责任公司',20,'',25,2,'袋',11),
	(21,'0013',400,3,100,'250g装','手工制作芝麻香酥麻通','桂林兰雨食品有限公司',3,'',8,2,'袋',11),
	(22,'0014',12,5,200,'250g装','美国青豆原味 蒜香','菲律宾',5,'',8,2,'袋',11),
	(24,'0015',47,8000,100,'X',' iPhone X','xx2',8000,'xxx2',9500,2,'台',16),
	(25,'0016',0,103,12,'X','21','32',103,'21',120,0,'盒',3),
	(26,'0017',-1,3000,100,'ILCE-A6000L','Sony/索尼 ILCE-A6000L WIFI微单数码相机高清单电','xxx',3000,'xxx',3650,2,'台',15),
	(27,'0018',-1,800,400,'IXUS 285 HS','Canon/佳能 IXUS 285 HS 数码相机 2020万像素高清拍摄','xx',800,'xxx',1299,2,'台',15),
	(28,'0019',0,60,300,'Q8','Golden Field/金河田 Q8电脑音响台式多媒体家用音箱低音炮重低音','xxxx',60,'',129,0,'台',17),
	(29,'0020',0,1000,50,'190WDPT','Haier/海尔冰箱BCD-190WDPT双门电冰箱大两门冷藏冷冻','cc',1000,'',1699,0,'台',14),
	(30,'0021',1000,721,320,'4A ','Xiaomi/小米 小米电视4A 32英寸 智能液晶平板电视机','cc',721,'',1199,0,'台',12),
	(31,'0022',0,400,40,'XQB55-36SP','TCL XQB55-36SP 5.5公斤全自动波轮迷你小型洗衣机家用单脱抗菌','cc',400,'',729,0,'台',13),
	(32,'0023',8,5,1000,'80g*2','台湾进口膨化零食品张君雅小妹妹日式串烧丸子80g*2','cc',4.25,'',15,2,'袋',9),
	(33,'0024',140,180,10,'A字裙','卓图女装立领针织格子印花拼接高腰A字裙2020秋冬新款碎花连衣裙','cc',172,'',298,2,'件',6),
	(34,'0025',0,189,10,'三件套秋','西服套装男三件套秋季新款商务修身职业正装男士西装新郎结婚礼服','cc',189,'',299,0,'件',7),
	(35,'0026',-1,60,10,'AFS JEEP','加绒加厚正品AFS JEEP/战地吉普男大码长裤植绒保暖男士牛仔裤子','c',60,'',89,2,'条',8),
	(44,'0029',0,0,31224,'32124','32124','31224',31224,'32124',32124,0,'个',4);

/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_goodstype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_goodstype`;

CREATE TABLE `t_goodstype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_goodstype` WRITE;
/*!40000 ALTER TABLE `t_goodstype` DISABLE KEYS */;

INSERT INTO `t_goodstype` (`id`, `icon`, `name`, `p_id`, `state`)
VALUES
	(1,'icon-folderOpen','所有类别',-1,1),
	(2,'icon-folder','服饰',1,1),
	(3,'icon-folder','食品',1,1),
	(4,'icon-folder','家电',1,1),
	(5,'icon-folder','数码',1,1),
	(6,'icon-folder','连衣裙',2,0),
	(7,'icon-folder','男士西装',2,0),
	(8,'icon-folder','牛仔裤',2,0),
	(9,'icon-folder','进口食品',3,0),
	(10,'icon-folder','地方特产',3,0),
	(11,'icon-folder','休闲食品',3,0),
	(12,'icon-folder','电视机',4,0),
	(13,'icon-folder','洗衣机',4,0),
	(14,'icon-folder','冰箱',4,0),
	(15,'icon-folder','相机',5,0),
	(16,'icon-folder','手机',5,0),
	(17,'icon-folder','音箱',5,0),
	(21,'icon-folder','测试',1,0);

/*!40000 ALTER TABLE `t_goodstype` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_goodsunit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_goodsunit`;

CREATE TABLE `t_goodsunit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_goodsunit` WRITE;
/*!40000 ALTER TABLE `t_goodsunit` DISABLE KEYS */;

INSERT INTO `t_goodsunit` (`id`, `name`)
VALUES
	(1,'个'),
	(2,'袋'),
	(3,'盒'),
	(4,'箱'),
	(5,'台'),
	(6,'包'),
	(11,'件'),
	(12,'条'),
	(15,'新');

/*!40000 ALTER TABLE `t_goodsunit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbvn5yabu3vqwvtjoh32i9r4ip` (`user_id`),
  CONSTRAINT `FKbvn5yabu3vqwvtjoh32i9r4ip` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_log` WRITE;
/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;

INSERT INTO `t_log` (`id`, `content`, `time`, `type`, `user_id`)
VALUES
	(2084,'用户登录','2022-04-28 17:01:11','登录操作',2),
	(2085,'查询商品信息','2022-04-28 17:01:13','查询操作',2),
	(2086,'用户登录','2022-04-28 17:03:14','登录操作',1),
	(2087,'查询商品信息','2022-04-28 17:03:14','查询操作',1),
	(2088,'查询角色信息','2022-04-28 17:03:17','查询操作',1),
	(2089,'查询角色信息','2022-04-28 17:03:17','查询操作',1),
	(2090,'查询商品信息','2022-04-28 17:05:53','查询操作',1),
	(2091,'查询用户信息','2022-04-28 17:06:32','查询操作',1),
	(2092,'查询用户信息','2022-04-28 17:06:32','查询操作',1),
	(2093,'查询所有角色信息','2022-04-28 17:06:35','查询操作',1),
	(2094,'查询角色信息','2022-04-28 17:06:37','查询操作',1),
	(2095,'查询角色信息','2022-04-28 17:06:37','查询操作',1),
	(2096,'查询商品信息','2022-04-28 17:06:54','查询操作',1),
	(2097,'查询商品信息','2022-04-28 17:08:12','查询操作',1),
	(2098,'查询商品信息','2022-04-28 17:08:12','查询操作',1),
	(2099,'用户注销','2022-04-28 17:08:19','注销操作',1),
	(2100,'用户登录','2022-04-28 17:08:31','登录操作',2),
	(2101,'查询商品信息','2022-04-28 17:08:33','查询操作',2),
	(2102,'查询货位信息','2022-04-28 17:08:39','查询操作',2),
	(2103,'查询所有商品类别信息','2022-04-28 17:08:39','查询操作',2),
	(2104,'查询货位信息','2022-04-28 17:08:39','查询操作',2),
	(2105,'查询所有商品类别信息','2022-04-28 17:09:34','查询操作',2),
	(2106,'查询商品信息','2022-04-28 17:10:48','查询操作',2),
	(2107,'查询货位信息','2022-04-28 17:10:49','查询操作',2),
	(2108,'查询货位信息','2022-04-28 17:10:49','查询操作',2),
	(2109,'查询所有商品类别信息','2022-04-28 17:10:49','查询操作',2),
	(2110,'用户登录','2022-04-28 17:11:29','登录操作',2),
	(2111,'查询商品信息','2022-04-28 17:11:31','查询操作',2),
	(2112,'查询所有商品类别信息','2022-04-28 17:11:32','查询操作',2),
	(2113,'查询货位信息','2022-04-28 17:11:32','查询操作',2),
	(2114,'查询货位信息','2022-04-28 17:11:32','查询操作',2),
	(2115,'查询所有商品类别信息','2022-04-28 17:11:35','查询操作',2),
	(2116,'用户登录','2022-04-28 17:13:00','登录操作',2),
	(2117,'查询商品信息','2022-04-28 17:13:02','查询操作',2),
	(2118,'查询货位信息','2022-04-28 17:13:03','查询操作',2),
	(2119,'查询货位信息','2022-04-28 17:13:03','查询操作',2),
	(2120,'查询所有商品类别信息','2022-04-28 17:13:03','查询操作',2),
	(2121,'查询所有商品类别信息','2022-04-28 17:13:06','查询操作',2),
	(2122,'用户登录','2022-04-28 17:14:22','登录操作',2),
	(2123,'查询商品信息','2022-04-28 17:14:24','查询操作',2),
	(2124,'查询货位信息','2022-04-28 17:14:35','查询操作',2),
	(2125,'查询货位信息','2022-04-28 17:14:35','查询操作',2),
	(2126,'查询所有商品类别信息','2022-04-28 17:14:35','查询操作',2),
	(2127,'查询所有商品类别信息','2022-04-28 17:14:39','查询操作',2),
	(2128,'添加货位信息com.mf.entity.Position@2af1c8fb','2022-04-28 17:14:59','添加操作',2),
	(2129,'查询货位信息','2022-04-28 17:15:00','查询操作',2),
	(2130,'更新货位信息com.mf.entity.Position@6eb807d1','2022-04-28 17:15:10','更新操作',2),
	(2131,'查询货位信息','2022-04-28 17:15:11','查询操作',2),
	(2132,'查询商品库存信息','2022-04-28 17:36:56','查询操作',2),
	(2133,'查询商品库存信息','2022-04-28 17:36:56','查询操作',2),
	(2134,'查询商品库存信息','2022-04-28 17:37:19','查询操作',2),
	(2135,'查询所有商品类别信息','2022-04-28 17:37:19','查询操作',2),
	(2136,'查询商品库存信息','2022-04-28 17:37:19','查询操作',2),
	(2137,'查询商品信息','2022-04-28 17:38:04','查询操作',2);

/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;

INSERT INTO `t_menu` (`id`, `icon`, `name`, `p_id`, `state`, `url`)
VALUES
	(1,'menu-plugin','系统菜单',-1,1,NULL),
	(10,'menu-1','进货管理',1,1,NULL),
	(20,'menu-2','销售管理',1,1,NULL),
	(30,'menu-3','库存管理',1,1,NULL),
	(40,'menu-4','统计报表',1,1,NULL),
	(50,'menu-5','基础资料',1,1,NULL),
	(60,'menu-6','系统管理',1,1,NULL),
	(1010,'menu-11','进货入库',10,0,'/purchase/purchase.html'),
	(1020,'menu-12','退货出库',10,0,'/purchase/return.html'),
	(1030,'menu-13','进货单据查询',10,0,'/purchase/purchaseSearch.html'),
	(1040,'menu-14','退货单据查询',10,0,'/purchase/returnSearch.html'),
	(1050,'menu-15','当前库存查询',10,0,'/common/stockSearch.html'),
	(2010,'menu-21','销售出库',20,0,'/sale/saleout.html'),
	(2020,'menu-22','客户退货',20,0,'/sale/salereturn.html'),
	(2030,'menu-23','销售单据查询',20,0,'/sale/saleSearch.html'),
	(2040,'menu-24','客户退货查询',20,0,'/sale/returnSearch.html'),
	(2050,'menu-25','当前库存查询',20,0,'/common/stockSearch.html'),
	(3010,'menu-31','商品报损',30,0,'/stock/damage.html'),
	(3020,'menu-32','商品报溢',30,0,'/stock/overflow.html'),
	(3030,'menu-33','库存报警',30,0,'/stock/alarm.html'),
	(3040,'menu-34','报损查询',30,0,'/stock/damageOverflowSearch.html'),
	(3050,'menu-35','当前库存查询',30,0,'/common/stockSearch.html'),
	(4010,'menu-41','供应商统计',40,0,'/count/supplier.html'),
	(4020,'menu-42','客户统计',40,0,'/count/customer.html'),
	(4030,'menu-43','商品采购统计',40,0,'/count/purchase.html'),
	(4040,'menu-44','商品销售统计',40,0,'/count/sale.html'),
	(4050,'menu-45','按日统计分析',40,0,'/count/saleDay.html'),
	(4060,'menu-46','按月统计分析',40,0,'/count/saleMonth.html'),
	(5010,'menu-51','供应商管理',50,0,'/basicData/supplier.html'),
	(5020,'menu-52','客户管理',50,0,'/basicData/customer.html'),
	(5030,'menu-53','商品管理',50,0,'/basicData/goods.html'),
	(5040,'menu-54','期初库存',50,0,'/basicData/stock.html'),
	(6010,'menu-61','角色管理',60,0,'/power/role.html'),
	(6020,'menu-62','用户管理',60,0,'/power/user.html'),
	(6030,'menu-65','系统日志',60,0,'/power/log.html'),
	(6040,'menu-63','修改密码',60,0,NULL),
	(6050,'menu-64','安全退出',60,0,NULL),
	(6051,'menu-100','货位管理',30,0,'/stock/position.html');

/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_overflow_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_overflow_list`;

CREATE TABLE `t_overflow_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `overflow_date` datetime DEFAULT NULL,
  `overflow_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3bu8hj2xniqwbrtg6ls6b8ej2` (`user_id`),
  CONSTRAINT `FK3bu8hj2xniqwbrtg6ls6b8ej2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_overflow_list` WRITE;
/*!40000 ALTER TABLE `t_overflow_list` DISABLE KEYS */;

INSERT INTO `t_overflow_list` (`id`, `overflow_date`, `overflow_number`, `remarks`, `user_id`)
VALUES
	(1,'2020-12-14 00:00:00','BY202012140001','cc',1),
	(2,'2020-12-14 00:00:00','BY202012140002','cc',1),
	(3,'2020-12-15 00:00:00','BY202012150001','cc',1),
	(4,'2020-12-15 00:00:00','BY202012150002','cccc',1);

/*!40000 ALTER TABLE `t_overflow_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_overflow_list_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_overflow_list_goods`;

CREATE TABLE `t_overflow_list_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `overflow_list_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd3s9761mgl456tn2xb0d164h7` (`overflow_list_id`),
  KEY `FK8t46iik5kpciki8fnqtiuq5q3` (`type_id`),
  CONSTRAINT `FK8t46iik5kpciki8fnqtiuq5q3` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKd3s9761mgl456tn2xb0d164h7` FOREIGN KEY (`overflow_list_id`) REFERENCES `t_overflow_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_overflow_list_goods` WRITE;
/*!40000 ALTER TABLE `t_overflow_list_goods` DISABLE KEYS */;

INSERT INTO `t_overflow_list_goods` (`id`, `code`, `goods_id`, `model`, `name`, `num`, `price`, `total`, `unit`, `overflow_list_id`, `type_id`)
VALUES
	(1,'0003',11,'500g装','野生东北黑木耳',1,22,22,'袋',1,11),
	(2,'0006',14,'300g装','冰糖金桔干',2,4,8,'盒',1,11),
	(3,'0005',13,'散装500克','麦片燕麦巧克力',1,8,8,'袋',2,11),
	(4,'0005',13,'散装500克','麦片燕麦巧克力',3,8,24,'袋',3,11),
	(5,'0008',16,'128g装','奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品',2,2,4,'盒',3,11),
	(6,'0006',14,'300g装','冰糖金桔干',2,4,8,'盒',4,11);

/*!40000 ALTER TABLE `t_overflow_list_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_position`;

CREATE TABLE `t_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeiuo63s29w2lkd1byir7jl3qq` (`type_id`),
  CONSTRAINT `FKeiuo63s29w2lkd1byir7jl3qq` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `t_position` WRITE;
/*!40000 ALTER TABLE `t_position` DISABLE KEYS */;

INSERT INTO `t_position` (`id`, `code`, `name`, `type_id`, `total`, `index`)
VALUES
	(1,'01','第一层',4,100,1),
	(2,'02','第二层',4,100,2),
	(3,'03','第三层',4,100,3);

/*!40000 ALTER TABLE `t_position` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_purchase_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_purchase_list`;

CREATE TABLE `t_purchase_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `purchase_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5j2dev8b2b5d0l69nb8vtr4yb` (`supplier_id`),
  KEY `FK69s6eyxr4wwvsywe9hbthef1h` (`user_id`),
  CONSTRAINT `FK5j2dev8b2b5d0l69nb8vtr4yb` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `FK69s6eyxr4wwvsywe9hbthef1h` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_purchase_list` WRITE;
/*!40000 ALTER TABLE `t_purchase_list` DISABLE KEYS */;

INSERT INTO `t_purchase_list` (`id`, `amount_paid`, `amount_payable`, `purchase_date`, `purchase_number`, `remarks`, `state`, `supplier_id`, `user_id`)
VALUES
	(6,4442,4442,'2020-12-04 00:00:00','JH202012040001','cc',2,1,1),
	(8,16,16,'2020-12-04 00:00:00','JH202012040003','',2,2,1);

/*!40000 ALTER TABLE `t_purchase_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_purchase_list_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_purchase_list_goods`;

CREATE TABLE `t_purchase_list_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` float NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `purchase_list_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `position_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfvdvgcebqkkokyn0o00idqnpy` (`purchase_list_id`),
  KEY `FK83ikbi2x3epn49fwcco8jlfwu` (`type_id`),
  CONSTRAINT `FK83ikbi2x3epn49fwcco8jlfwu` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKfvdvgcebqkkokyn0o00idqnpy` FOREIGN KEY (`purchase_list_id`) REFERENCES `t_purchase_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_purchase_list_goods` WRITE;
/*!40000 ALTER TABLE `t_purchase_list_goods` DISABLE KEYS */;

INSERT INTO `t_purchase_list_goods` (`id`, `code`, `goods_id`, `model`, `name`, `num`, `price`, `total`, `unit`, `purchase_list_id`, `type_id`, `position_id`, `position_index`)
VALUES
	(10,'0002',2,'Note8','华为荣耀Note8',2,2220,4440,'台',6,16,NULL,NULL),
	(11,'0008',16,'128g装','奕森奶油桃肉蜜饯果脯果干桃肉干休闲零食品',1,2,2,'盒',6,11,NULL,NULL),
	(13,'0006',14,'300g装','冰糖金桔干',4,4,16,'盒',8,11,NULL,NULL);

/*!40000 ALTER TABLE `t_purchase_list_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_return_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_return_list`;

CREATE TABLE `t_return_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `return_number` varchar(100) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4qxjj8bvj2etne243xluni0vn` (`supplier_id`),
  KEY `FK904juw2v1hm2av0ig26gae9jb` (`user_id`),
  CONSTRAINT `FK4qxjj8bvj2etne243xluni0vn` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `FK904juw2v1hm2av0ig26gae9jb` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_return_list` WRITE;
/*!40000 ALTER TABLE `t_return_list` DISABLE KEYS */;

INSERT INTO `t_return_list` (`id`, `amount_paid`, `amount_payable`, `remarks`, `return_date`, `return_number`, `state`, `supplier_id`, `user_id`)
VALUES
	(1,197,197,'cc','2020-12-06 00:00:00','TH202012060001',2,5,1),
	(2,0,4464,'cc','2020-12-06 00:00:00','TH202012060001',1,1,1),
	(3,60,60,'','2020-12-06 00:00:00','TH202012060003',2,1,1);

/*!40000 ALTER TABLE `t_return_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_return_list_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_return_list_goods`;

CREATE TABLE `t_return_list_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `return_list_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKemclu281vyvyk063c3foafq1w` (`return_list_id`),
  KEY `FKa1prpd96fcs0x2oe0omny9vio` (`type_id`),
  CONSTRAINT `FKa1prpd96fcs0x2oe0omny9vio` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`),
  CONSTRAINT `FKemclu281vyvyk063c3foafq1w` FOREIGN KEY (`return_list_id`) REFERENCES `t_return_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_return_list_goods` WRITE;
/*!40000 ALTER TABLE `t_return_list_goods` DISABLE KEYS */;

INSERT INTO `t_return_list_goods` (`id`, `code`, `goods_id`, `model`, `name`, `num`, `price`, `total`, `unit`, `return_list_id`, `type_id`)
VALUES
	(1,'0001',1,'红色装','陶华碧老干妈香辣脆油辣椒',2,8.5,17,'瓶',1,10),
	(2,'0024',33,'A字裙','卓图女装立领针织格子印花拼接高腰A字裙2020秋冬新款碎花连衣裙',1,180,180,'件',1,6),
	(3,'0002',2,'Note8','华为荣耀Note8',2,2220,4440,'台',2,16),
	(4,'0005',13,'散装500克','麦片燕麦巧克力',3,8,24,'袋',2,11),
	(5,'0003',11,'500g装','野生东北黑木耳',2,22,44,'袋',3,11),
	(6,'0006',14,'300g装','冰糖金桔干',4,4,16,'盒',3,11);

/*!40000 ALTER TABLE `t_return_list_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;

INSERT INTO `t_role` (`id`, `name`, `remarks`)
VALUES
	(1,'系统管理','管理员 最高权限'),
	(2,'主管','主管'),
	(4,'采购员','采购员'),
	(5,'销售经理','销售经理'),
	(7,'仓库管理员','仓库管理员'),
	(9,'总经理','总经理'),
	(10,'xxxx','dsf');

/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_role_menu`;

CREATE TABLE `t_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhayg4ib6v7h1wyeyxhq6xlddq` (`menu_id`),
  KEY `FKsonb0rbt2u99hbrqqvv3r0wse` (`role_id`),
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_role_menu` WRITE;
/*!40000 ALTER TABLE `t_role_menu` DISABLE KEYS */;

INSERT INTO `t_role_menu` (`id`, `menu_id`, `role_id`)
VALUES
	(2,1,1),
	(3,10,1),
	(4,20,1),
	(5,30,1),
	(6,40,1),
	(7,50,1),
	(8,60,1),
	(9,1010,1),
	(10,1020,1),
	(11,1030,1),
	(12,1040,1),
	(13,1050,1),
	(14,2010,1),
	(15,2020,1),
	(16,2030,1),
	(17,2040,1),
	(18,2050,1),
	(19,3010,1),
	(20,3020,1),
	(21,3030,1),
	(22,3040,1),
	(23,3050,1),
	(24,4010,1),
	(25,4020,1),
	(26,4030,1),
	(27,4040,1),
	(28,4050,1),
	(29,4060,1),
	(30,5010,1),
	(31,5020,1),
	(32,5030,1),
	(33,5040,1),
	(34,6010,1),
	(35,6020,1),
	(43,6030,1),
	(44,6040,1),
	(45,1,4),
	(46,20,4),
	(47,2010,4),
	(48,1,5),
	(49,30,5),
	(50,3010,5),
	(64,6050,1),
	(65,1,7),
	(66,10,7),
	(67,1010,7),
	(68,1020,7),
	(69,1030,7),
	(70,1040,7),
	(71,1050,7),
	(72,20,7),
	(73,2010,7),
	(74,2020,7),
	(75,2030,7),
	(76,40,7),
	(77,4010,7),
	(78,4020,7),
	(79,1,9),
	(80,10,9),
	(81,1020,9),
	(82,20,9),
	(83,2020,9),
	(84,30,9),
	(85,3040,9),
	(86,3050,9),
	(87,40,9),
	(88,4040,9),
	(89,50,9),
	(90,5010,9),
	(91,5020,9),
	(92,5030,9),
	(93,5040,9),
	(94,60,9),
	(95,6050,9),
	(96,1,10),
	(97,10,10),
	(98,1030,10),
	(99,20,10),
	(100,2030,10),
	(101,40,10),
	(102,4040,10),
	(103,50,10),
	(104,5020,10),
	(105,60,10),
	(106,6010,10),
	(107,6020,10),
	(108,6030,10),
	(109,6040,10),
	(110,6050,10),
	(111,1,2),
	(112,10,2),
	(113,1010,2),
	(114,1020,2),
	(115,1030,2),
	(116,1040,2),
	(117,1050,2),
	(118,30,2),
	(119,6051,2);

/*!40000 ALTER TABLE `t_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_sale_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_sale_list`;

CREATE TABLE `t_sale_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount_paid` float NOT NULL,
  `amount_payable` float NOT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `sale_number` varchar(100) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKox4qfs87eu3fvwdmrvelqhi8e` (`customer_id`),
  KEY `FK34bnujemrdqimbhg133enp8k8` (`user_id`),
  CONSTRAINT `FK34bnujemrdqimbhg133enp8k8` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKox4qfs87eu3fvwdmrvelqhi8e` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_sale_list` WRITE;
/*!40000 ALTER TABLE `t_sale_list` DISABLE KEYS */;

INSERT INTO `t_sale_list` (`id`, `amount_paid`, `amount_payable`, `remarks`, `sale_date`, `sale_number`, `state`, `customer_id`, `user_id`)
VALUES
	(2,449,449,'cc','2020-11-08 00:00:00','XS202012100002',1,2,1),
	(3,130,130,'cc','2020-08-12 00:00:00','XS202012120001',1,1,1),
	(4,140,140,'cc','2020-04-22 00:00:00','XS202012220001',1,1,1),
	(5,1390,1390,'cc','2016-12-23 00:00:00','XS202012230001',1,2,1),
	(6,3800,3800,'cc','2020-04-26 00:00:00','XS202012260001',1,2,1),
	(7,2200,2200,'','2020-05-26 00:00:00','XS202012260002',1,1,1);

/*!40000 ALTER TABLE `t_sale_list` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_sale_list_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_sale_list_goods`;

CREATE TABLE `t_sale_list_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `sale_list_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK20ehd6ta9geyql4hxtdsnhbox` (`sale_list_id`),
  KEY `FKn9i5p1d8f0gek5x7q45cq8ibw` (`type_id`),
  CONSTRAINT `FK20ehd6ta9geyql4hxtdsnhbox` FOREIGN KEY (`sale_list_id`) REFERENCES `t_sale_list` (`id`),
  CONSTRAINT `FKn9i5p1d8f0gek5x7q45cq8ibw` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_sale_list_goods` WRITE;
/*!40000 ALTER TABLE `t_sale_list_goods` DISABLE KEYS */;

INSERT INTO `t_sale_list_goods` (`id`, `code`, `goods_id`, `model`, `name`, `num`, `price`, `total`, `unit`, `sale_list_id`, `type_id`)
VALUES
	(3,'0010',18,'250g装','劲仔小鱼干',1,20,20,'袋',2,11),
	(4,'0006',14,'300g装','冰糖金桔干',33,13,429,'盒',2,11),
	(5,'0006',14,'300g装','冰糖金桔干',10,13,130,'盒',3,11),
	(6,'0003',11,'500g装','野生东北黑木耳',3,38,114,'袋',4,11),
	(7,'0006',14,'300g装','冰糖金桔干',2,13,26,'盒',4,11),
	(8,'0004',12,'2斤装','新疆红枣',10,25,250,'袋',5,10),
	(9,'0003',11,'500g装','野生东北黑木耳',30,38,1140,'袋',5,11),
	(10,'0003',11,'500g装','野生东北黑木耳',100,38,3800,'袋',6,11),
	(11,'0002',2,'Note8','华为荣耀Note8',1,2200,2200,'台',7,16);

/*!40000 ALTER TABLE `t_sale_list_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_supplier`;

CREATE TABLE `t_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_supplier` WRITE;
/*!40000 ALTER TABLE `t_supplier` DISABLE KEYS */;

INSERT INTO `t_supplier` (`id`, `address`, `contact`, `name`, `number`, `remarks`)
VALUES
	(1,'上海市金山区张堰镇松金公路2072号6607室','小张','上海福桂食品有限公司','0773-7217175','失信供应商'),
	(2,'安徽省合肥市肥西县桃花工业园合派路','小王','安徽麦堡食品工业有限公司','0773-7217275',NULL),
	(3,'晋江市罗山后林西区41号','小李','福建省晋江市罗山惠康食品有限公司','1273-1217175','优质供应商'),
	(4,'南京市江宁区科学园竹山路565号1幢','小丽','南京含羞草食品有限公司','2121-7217175',NULL),
	(5,'南京市高淳县阳江镇新桥村下桥278号','王大狗','南京禾乃美工贸有限公司','2133-7217125',NULL),
	(6,'开平市水口镇东埠路６号','小七','开平广合腐乳有限公司','3332-7217175','2'),
	(7,'汕头市跃进路２３号利鸿基中心大厦写字楼２座','刘钩子','汕头市金茂食品有限公司','0723-7232175',NULL),
	(8,'南京市溧水区经济开发区','七枷社','南京喜之郎食品有限公司','1773-7217175',NULL),
	(9,'深圳市罗湖区翠竹北路中深石化区厂房B栋6楼','小蔡','深圳昌信实业有限公司','1773-7217175',NULL),
	(10,'南京市下关区金陵小区6村27-2-203室','小路','南京市下关区红鹰调味品商行','2132-7217175',NULL),
	(11,'荔浦县荔塔路１６－３６号','亲亲','桂林阜康食品工业有限公司','2123-7217175',NULL),
	(12,'南京鼓楼区世纪大楼123号','小二','南京大王科技','0112-1426789','123'),
	(13,'南京将军路800号','小吴','南京大陆食品公司','1243-2135487','cc');

/*!40000 ALTER TABLE `t_supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(50) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `true_name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;

INSERT INTO `t_user` (`id`, `password`, `remarks`, `true_name`, `user_name`)
VALUES
	(1,'123','管理员','王大陆','admin'),
	(2,'123','主管','王大锤','jack'),
	(3,'123','销售经理','玛丽','marry'),
	(7,'dfs2','3122','212','fds'),
	(8,'322','sf','32','21'),
	(9,'21','21','21','212');

/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa9c8iiy6ut0gnx491fqx4pxam` (`role_id`),
  KEY `FKq5un6x7ecoef5w1n39cop66kl` (`user_id`),
  CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;

INSERT INTO `t_user_role` (`id`, `role_id`, `user_id`)
VALUES
	(1,1,1),
	(19,2,2),
	(20,4,2),
	(21,5,2),
	(28,2,3),
	(29,4,3),
	(30,5,3),
	(31,7,3),
	(43,2,7),
	(44,4,7),
	(45,5,7),
	(46,7,7),
	(47,9,7),
	(53,9,8);

delete from t_menu where name = '销售管理';
delete from t_menu where p_id = 20;
delete from t_menu where name = '商品报溢';
delete from t_menu where id = 4040;
delete from t_menu where id = 4060;
update t_menu set name = '报损查询' where name = '报损报溢查询';

delete from t_role_menu where menu_id = 20;
delete from t_role_menu where menu_id = 2010;
delete from t_role_menu where menu_id = 2020;
delete from t_role_menu where menu_id = 2030;
delete from t_role_menu where menu_id = 2040;
delete from t_role_menu where menu_id = 2050;
delete from t_role_menu where menu_id = 3020;
delete from t_role_menu where menu_id = 4040;
delete from t_role_menu where menu_id = 4060;
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
