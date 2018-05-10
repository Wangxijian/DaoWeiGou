/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : daoweigou_db

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-08 20:22:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lxr` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('1', '李先生', '13566667777', '光谷大道999号', '专业销售酒品30年<br />');

-- ----------------------------
-- Table structure for addr
-- ----------------------------
DROP TABLE IF EXISTS `addr`;
CREATE TABLE `addr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shr` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `shraddr` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addr
-- ----------------------------
INSERT INTO `addr` VALUES ('12', 'huiyuan', '13888888888', '湖北武汉', '18', '0');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `sl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg` text,
  `hfmsg` text,
  `savetime` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('7', '祝愿网站越来越好', '谢谢', '2018-03-08 20:20:14', '18');

-- ----------------------------
-- Table structure for dddetail
-- ----------------------------
DROP TABLE IF EXISTS `dddetail`;
CREATE TABLE `dddetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `goodid` varchar(255) DEFAULT NULL,
  `sl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dddetail
-- ----------------------------
INSERT INTO `dddetail` VALUES ('47', '0308201248', '21', '1');
INSERT INTO `dddetail` VALUES ('48', '0308201248', '24', '1');

-- ----------------------------
-- Table structure for ddinfo
-- ----------------------------
DROP TABLE IF EXISTS `ddinfo`;
CREATE TABLE `ddinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `ddprice` varchar(255) DEFAULT NULL,
  `fhstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `wlinfo` varchar(255) DEFAULT NULL,
  `fkstatus` varchar(255) DEFAULT NULL,
  `shrname` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `shraddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ddinfo
-- ----------------------------
INSERT INTO `ddinfo` VALUES ('33', '0308201248', '18', '697.0', '已发货', '2018-03-08 20:12:48', '已收货', '顺丰<br/>47168468767168487', '已付款', '', '', '12');

-- ----------------------------
-- Table structure for fav
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fav
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodno` varchar(255) DEFAULT NULL,
  `goodname` varchar(255) DEFAULT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `note` text,
  `saver` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `istj` varchar(255) DEFAULT NULL,
  `tprice` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `salestatus` varchar(255) DEFAULT NULL,
  `goodpp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('17', '0411200143', '古越龙山 绍兴黄酒 清醇三年 半甜型 500ml', '45', '59', '9.8', '<p>\r\n	<img src=\"/daoweigou/attached/image/20180308/20180308173127_833.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308173132_15.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308173137_939.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308173143_845.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308173148_680.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', null, '2017-04-11 20:01:43', '通过', 'yes', '', '201803081731520016.jpg', '0', '在售', '23');
INSERT INTO `goods` VALUES ('18', '0411200515', '长城（GreatWall）红酒 玫瑰红甜型葡萄酒 750ml', '72', '74', '43', '<p>\r\n	<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><img src=\"/daoweigou/attached/image/20180308/20180308172730_662.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308172735_936.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308172741_388.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308172747_107.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>', null, '2017-04-11 20:05:15', '通过', 'no', '', '201803081727500015.jpg', '0', '在售', '14');
INSERT INTO `goods` VALUES ('19', '0411201130', '张裕（CHANGYU）红酒 玫瑰红甜红葡萄酒750ml*6瓶整箱装', '72', '75', '168', '<img src=\"/daoweigou/attached/image/20180308/20180308170839_500.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308170845_603.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308170850_371.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308170855_497.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308170901_428.jpg\" alt=\"\" />', null, '2017-04-11 20:11:30', '通过', 'no', '', '201803081709100014.jpg', '0', '在售', '13');
INSERT INTO `goods` VALUES ('20', '0411201855', '云端美酒 五粮液股份 白酒 一尊天下15珍酿500ml*2瓶 52度', '52', '70', '159', '<img src=\"/daoweigou/attached/image/20180308/20180308170348_180.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308170354_311.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308170359_943.jpg\" alt=\"\" /><br />', null, '2017-04-11 20:18:55', '通过', 'no', '', '201803081704010013.jpg', '0', '在售', '15');
INSERT INTO `goods` VALUES ('21', '0411202142', '53度白金玛咖酒黑玛咖500ml 白酒 黑玛咖', '52', '69', '598', '<img src=\"/daoweigou/attached/image/20180308/20180308165713_691.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165719_384.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165727_274.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165734_702.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165740_376.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165746_475.jpg\" alt=\"\" />', null, '2017-04-11 20:21:42', '通过', 'no', '', '201803081657540012.jpg', '0', '在售', '16');
INSERT INTO `goods` VALUES ('24', '0307171918', '德国进口啤酒 费尔德堡 大麦黑啤', '47', '66', '99', '<img src=\"/daoweigou/attached/image/20180308/20180308165201_1.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165207_662.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165214_451.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165219_52.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165225_53.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165231_860.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165236_242.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308165243_746.jpg\" alt=\"\" />', null, '2018-03-07 17:19:18', '通过', 'no', '', '201803081652460011.jpg', '0', '在售', '19');
INSERT INTO `goods` VALUES ('25', '0307172525', '燕京啤酒 11度 纯生啤酒', '47', '67', '69', '<img src=\"/daoweigou/attached/image/20180308/20180308164325_839.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308164330_445.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308164335_464.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308164341_833.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308164347_219.jpg\" alt=\"\" />', null, '2018-03-07 17:25:25', '通过', 'no', '', '201803081643500010.jpg', '0', '在售', '18');
INSERT INTO `goods` VALUES ('26', '0307173514', '德国原瓶进口 君来 冰白起/气泡葡萄酒', '46', '62', '86', '<img src=\"/daoweigou/attached/image/20180308/20180308163624_593.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308163629_126.jpg\" alt=\"\" />', null, '2018-03-07 17:35:14', '通过', 'no', '', '201803081636370009.jpg', '0', '在售', '21');
INSERT INTO `goods` VALUES ('27', '0307174205', '尼雅清凉甜白清风桃红葡萄酒双支装', '46', '63', '118', '<img src=\"/daoweigou/attached/image/20180308/20180308163233_842.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308163239_148.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308163244_763.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308163250_319.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308163256_726.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308163302_541.jpg\" alt=\"\" />', null, '2018-03-07 17:42:05', '通过', 'no', '', '201803081633110008.jpg', '0', '在售', '20');
INSERT INTO `goods` VALUES ('28', '0307174539', '女儿红 绍兴黄酒 五年陈 精品黄酒 半干型 1.5L', '45', '60', '49', '<img src=\"/daoweigou/attached/image/20180308/20180308162700_918.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308162705_747.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308162711_11.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308162717_515.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308162723_172.jpg\" alt=\"\" />', null, '2018-03-07 17:45:39', '通过', 'no', '', '201803081627270007.jpg', '0', '在售', '22');
INSERT INTO `goods` VALUES ('29', '0307222539', '法国进口红酒 拉菲（LAFITE）传奇波尔多干红葡萄酒 750ml（ASC）', '72', '73', '948', '<img src=\"/daoweigou/attached/image/20180308/20180308161222_924.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308161228_13.jpg\" alt=\"\" /><img src=\"/daoweigou/attached/image/20180308/20180308161234_416.jpg\" alt=\"\" />', null, '2018-03-07 22:25:39', '通过', 'yes', '', '201803081612370006.jpg', '0', '在售', '24');
INSERT INTO `goods` VALUES ('31', '0308201822', '测试', '45', '59', '12', 'sdfasd', null, '2018-03-08 20:18:22', '通过', 'no', '', '201803082018230005.jpg', '1', '在售', '23');

-- ----------------------------
-- Table structure for imgadv
-- ----------------------------
DROP TABLE IF EXISTS `imgadv`;
CREATE TABLE `imgadv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgadv
-- ----------------------------
INSERT INTO `imgadv` VALUES ('24', '201803081734100017.jpg');

-- ----------------------------
-- Table structure for kcrecord
-- ----------------------------
DROP TABLE IF EXISTS `kcrecord`;
CREATE TABLE `kcrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `happennum` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kcrecord
-- ----------------------------
INSERT INTO `kcrecord` VALUES ('48', '16', '10', 'in', '2017-04-11 20:44:59');
INSERT INTO `kcrecord` VALUES ('49', '16', '1', 'out', '2017-04-11 20:45:08');
INSERT INTO `kcrecord` VALUES ('50', '21', '1', 'in', '2017-04-11 20:53:41');
INSERT INTO `kcrecord` VALUES ('51', '20', '12', 'in', '2018-03-06 21:38:08');
INSERT INTO `kcrecord` VALUES ('52', '19', '12', 'in', '2018-03-06 21:38:10');
INSERT INTO `kcrecord` VALUES ('53', '18', '112', 'in', '2018-03-06 21:38:13');
INSERT INTO `kcrecord` VALUES ('54', '16', '112', 'in', '2018-03-06 21:38:18');
INSERT INTO `kcrecord` VALUES ('55', '17', '12', 'in', '2018-03-06 21:38:21');
INSERT INTO `kcrecord` VALUES ('56', '15', '12', 'in', '2018-03-06 21:38:24');
INSERT INTO `kcrecord` VALUES ('57', '14', '12', 'in', '2018-03-06 21:38:27');
INSERT INTO `kcrecord` VALUES ('58', '21', '1', 'out', '2018-03-06 21:38:43');
INSERT INTO `kcrecord` VALUES ('59', '20', '1', 'out', '2018-03-08 12:32:12');
INSERT INTO `kcrecord` VALUES ('60', '29', '3', 'in', '2018-03-08 12:38:48');
INSERT INTO `kcrecord` VALUES ('61', '28', '12', 'in', '2018-03-08 12:38:51');
INSERT INTO `kcrecord` VALUES ('62', '27', '12', 'in', '2018-03-08 12:38:54');
INSERT INTO `kcrecord` VALUES ('63', '26', '12', 'in', '2018-03-08 12:38:58');
INSERT INTO `kcrecord` VALUES ('64', '25', '12', 'in', '2018-03-08 12:39:02');
INSERT INTO `kcrecord` VALUES ('65', '24', '12', 'in', '2018-03-08 12:39:05');
INSERT INTO `kcrecord` VALUES ('66', '21', '12', 'in', '2018-03-08 12:39:08');
INSERT INTO `kcrecord` VALUES ('67', '29', '4', 'in', '2018-03-08 20:19:00');
INSERT INTO `kcrecord` VALUES ('68', '21', '1', 'out', '2018-03-08 20:19:27');
INSERT INTO `kcrecord` VALUES ('69', '24', '1', 'out', '2018-03-08 20:19:27');

-- ----------------------------
-- Table structure for lookrecord
-- ----------------------------
DROP TABLE IF EXISTS `lookrecord`;
CREATE TABLE `lookrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `memberid` varchar(255) DEFAULT NULL,
  `goodid` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lookrecord
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `ybcode` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('18', 'huiyuan', '123', 'huiyuan@qq.com', 'huiyuan', '男', '', '', '7895486589', '13888888888', '0', '2018-03-08 20:11:40');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `note` text,
  `img` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('15', '郭成宇代表：黑龙江应大力发展冰葡萄加工产业', '<p style=\"font-family:宋体, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><span style=\"color:#666666;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">“北冰红葡萄是我国利用山葡萄自主培育的专门酿造冰葡萄酒（俗称冰酒）的一种品种，目前只在我国东北地区及新疆、西藏地区有少许种植，属于较为稀缺的葡萄品种，因为对产地、原料的要求十分苛刻，产量稀少。 ” 全国人大代表、齐齐哈尔大学食品与生物工程学院副院长说，目前，从全国葡萄酒行业看，冰葡萄资源开发利用还处在起步阶段，充分利用黑龙江省适合种植冰葡萄优势，研制开发适合大众消费的优质冰葡萄酒及冰葡萄饮料，其市场空间巨大，是引领带动我省特色饮品发展的新兴支柱产业之一。</span></span>\r\n</p>\r\n<p style=\"font-family:宋体, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>', '201803082004050002.png', '2017-02-18 19:59:03', '新闻');
INSERT INTO `news` VALUES ('16', '2018 RVF中国·优秀葡萄酒年度评选活动启动', '<h1 style=\"font-size:28px;font-family:\" color:#3f3f3f;\"=\"\">\r\n<p style=\"color:#666666;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	第七届RVF中国·优秀葡萄酒年度评选活动于2018年3月全面启动，是RVF《葡萄酒评论》和RVF·中国（品鉴中心）推出的年度国际权威赛事。\r\n</p>\r\n<p style=\"color:#666666;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	　　<strong>目的：</strong>提供一份专业的葡萄酒选酒指南，帮助消费者选择高品质的葡萄酒以及高性价比的葡萄酒。提高参选机构的品牌市场曝光度和开拓渠道的能力。&nbsp;\r\n</p>\r\n<p style=\"color:#666666;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	　　<strong>评分标准：</strong>酒款采用盲品的方式，评分使用La Revue du vin de France的20分制。该打分方式也是全世界公认的葡萄酒打分方式之一。起评分为11分，11分为合格酒，11.5-12为尚可、12.5-13.5中等、14-15.5优秀、16-17.5 优异、18-20为卓越。\r\n</p>\r\n<p style=\"color:#666666;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	　　<strong>专家团队：</strong>评选将由在法国出版的世界著名的葡萄酒杂志《La Revue du Vin de France 》(RVF) 品酒团队、RVF中文版《葡萄酒评论》和RVF·中国（品鉴中心）的专家团组成专业评判团，其中包括世界最佳侍酒师MS、葡萄酒大师MW、酿酒师、酒评家、培训师、跨界意见领袖等50余位专业代表。\r\n</p>\r\n<p style=\"color:#666666;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	　　<strong>奖项设置：</strong>品评结果所产生的奖项将以金、银、铜、最佳性价比、优质奖组成。除此之外，获得较多奖项、在市场上有活跃表现、定价合理、选酒有特色的酒商和酒庄也将进入年度酒商推荐。\r\n</p>\r\n	</h1>\r\n	<p>\r\n		<br />\r\n	</p>', '201803082003070001.jpg', '2017-02-18 20:00:07', '新闻');

-- ----------------------------
-- Table structure for pj
-- ----------------------------
DROP TABLE IF EXISTS `pj`;
CREATE TABLE `pj` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `goodsaver` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `jb` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `hf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pj
-- ----------------------------
INSERT INTO `pj` VALUES ('16', '21', '', '18', '5', '很好的酒', '2018-03-08 20:19:44', '');
INSERT INTO `pj` VALUES ('17', '24', '', '18', '5', '不错的酒', '2018-03-08 20:19:51', '');

-- ----------------------------
-- Table structure for ppinfo
-- ----------------------------
DROP TABLE IF EXISTS `ppinfo`;
CREATE TABLE `ppinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ppname` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ppinfo
-- ----------------------------
INSERT INTO `ppinfo` VALUES ('8', '雪花', '0');
INSERT INTO `ppinfo` VALUES ('13', '张裕', '0');
INSERT INTO `ppinfo` VALUES ('14', '长城', '0');
INSERT INTO `ppinfo` VALUES ('15', '五粮液', '0');
INSERT INTO `ppinfo` VALUES ('16', '茅台', '0');
INSERT INTO `ppinfo` VALUES ('18', '燕京', '0');
INSERT INTO `ppinfo` VALUES ('19', '青岛啤酒', '0');
INSERT INTO `ppinfo` VALUES ('20', '尼雅', '0');
INSERT INTO `ppinfo` VALUES ('21', '蒙特斯', '0');
INSERT INTO `ppinfo` VALUES ('22', '女儿红', '0');
INSERT INTO `ppinfo` VALUES ('23', '古越龙山', '0');
INSERT INTO `ppinfo` VALUES ('24', '拉菲', '0');
INSERT INTO `ppinfo` VALUES ('26', '百威', '0');
INSERT INTO `ppinfo` VALUES ('27', '水果', '1');

-- ----------------------------
-- Table structure for protype
-- ----------------------------
DROP TABLE IF EXISTS `protype`;
CREATE TABLE `protype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  `fatherid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of protype
-- ----------------------------
INSERT INTO `protype` VALUES ('45', '黄酒', '0', '0');
INSERT INTO `protype` VALUES ('46', '香槟', '0', '0');
INSERT INTO `protype` VALUES ('47', '啤酒', '0', '0');
INSERT INTO `protype` VALUES ('52', '白酒', '0', '0');
INSERT INTO `protype` VALUES ('59', '古越龙山', '45', '0');
INSERT INTO `protype` VALUES ('60', '女儿红', '45', '0');
INSERT INTO `protype` VALUES ('62', '蒙特斯', '46', '0');
INSERT INTO `protype` VALUES ('63', '尼雅', '46', '0');
INSERT INTO `protype` VALUES ('66', '青岛啤酒', '47', '0');
INSERT INTO `protype` VALUES ('67', '燕京', '47', '0');
INSERT INTO `protype` VALUES ('69', '茅台', '52', '0');
INSERT INTO `protype` VALUES ('70', '五粮液', '52', '0');
INSERT INTO `protype` VALUES ('72', '葡萄酒', '0', '0');
INSERT INTO `protype` VALUES ('73', '拉菲', '72', '0');
INSERT INTO `protype` VALUES ('74', '长城', '72', '0');
INSERT INTO `protype` VALUES ('75', '张裕', '72', '0');
INSERT INTO `protype` VALUES ('76', '雪花', '47', '0');
INSERT INTO `protype` VALUES ('77', '百威', '47', '0');
INSERT INTO `protype` VALUES ('78', '测试', '0', '1');
INSERT INTO `protype` VALUES ('79', 'sssss', '78', '1');

-- ----------------------------
-- Table structure for scan_his
-- ----------------------------
DROP TABLE IF EXISTS `scan_his`;
CREATE TABLE `scan_his` (
  `scan_his_key` varchar(2000) DEFAULT NULL,
  `value` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scan_his
-- ----------------------------
INSERT INTO `scan_his` VALUES ('scan_his', '17,29,21,20,24,21,24,28,26,31');

-- ----------------------------
-- Table structure for siteinfo
-- ----------------------------
DROP TABLE IF EXISTS `siteinfo`;
CREATE TABLE `siteinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logoimg` varchar(255) DEFAULT NULL,
  `sitenamefont` varchar(255) DEFAULT NULL,
  `sitenameback` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of siteinfo
-- ----------------------------

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', '管理员', 'admin', '123', '王老大', '男', '429000199012120000', '13667899876', 'admin@163.com', '湖北武汉东湖高新金地格林东郡1-18-2', '0', '2017-02-18 00:00:00');
INSERT INTO `sysuser` VALUES ('6', '管理员', 'root', '123', '小王', '男', '420007198812083200', '13111111111', '11111@163.com', '湖北武汉东湖高新金地格林东郡1-18-1', '0', '2017-02-18 20:35:41');
INSERT INTO `sysuser` VALUES ('7', 'null', 'a1', '123', '老王头', '男', '429004199910109999', '13411112221', 'a1@163.com', '', '0', '2017-02-18 20:04:37');
INSERT INTO `sysuser` VALUES ('8', null, 'adminstrator', '1123', '超级管理员', '男', '422422198001012746', '13888888888', 'email@qq.com', '', '0', '2017-04-11 20:46:22');
INSERT INTO `sysuser` VALUES ('9', null, 'sysuser', '123', 'sysuser123', '男', '422422198001012146', '13888888888', 'huiyuan@qq.com', '', '1', '2018-03-06 21:31:40');
INSERT INTO `sysuser` VALUES ('10', null, 'root23', '123', 'root', '男', '422422198001012146', '13888888888', '13589745895@qq.com', '', '0', '2018-03-08 12:33:37');
INSERT INTO `sysuser` VALUES ('11', null, 'admin123', '123', 'admin123', '男', '422422198001012146', '13888888888', 'huiyuan@qq.com', '', '0', '2018-03-08 20:14:26');

-- ----------------------------
-- Table structure for yqlink
-- ----------------------------
DROP TABLE IF EXISTS `yqlink`;
CREATE TABLE `yqlink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yqlink
-- ----------------------------
INSERT INTO `yqlink` VALUES ('2', '新浪', 'http://www.sina.com');
INSERT INTO `yqlink` VALUES ('3', '百度', 'http://www.baidu.com');
INSERT INTO `yqlink` VALUES ('4', '腾讯', 'http://www.qq.com');
INSERT INTO `yqlink` VALUES ('5', '小米', 'http://www.xiaomi.com');
