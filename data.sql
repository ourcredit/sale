/*
 Navicat Premium Data Transfer

 Source Server         : 103.45.8.198
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : 103.45.8.198:3306
 Source Schema         : sale

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 11/09/2018 21:16:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_category
-- ----------------------------
DROP TABLE IF EXISTS `sale_category`;
CREATE TABLE `sale_category`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''主键id'',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''分类名'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_category
-- ----------------------------
INSERT INTO `sale_category` VALUES (''729b38229229473cafe090dd5e1b31cb'', ''咖啡'', ''2018-09-10 04:36:15'', 1, 1);
INSERT INTO `sale_category` VALUES (''8ecb8c0000a5412398ead98e2146c7c1'', ''生鲜'', ''2018-09-06 07:44:46'', 1, 1);
INSERT INTO `sale_category` VALUES (''b05ed60d9ddd4b548f272973d63db95c'', ''纪念币'', ''2018-09-10 04:36:28'', 1, 1);
INSERT INTO `sale_category` VALUES (''b79eedbfaceb4d839a6ac2167ee1c347'', ''饮料'', ''2018-09-10 04:36:21'', 1, 1);
INSERT INTO `sale_category` VALUES (''cc499d7112274ee98eba87daaf8731f6'', ''玩偶'', ''2018-09-10 04:36:32'', 1, 1);

-- ----------------------------
-- Table structure for sale_device
-- ----------------------------
DROP TABLE IF EXISTS `sale_device`;
CREATE TABLE `sale_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `deviceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''点位名称'',
  `deviceNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''设备编码'',
  `deviceType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''设备类型'',
  `areaId` int(11) NULL DEFAULT NULL COMMENT ''区域id'',
  `pointName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''设备名'',
  `pointId` int(11) NULL DEFAULT NULL COMMENT ''从属点位'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `isDeleted` tinyint(2) NULL DEFAULT 0 COMMENT ''软删除  '',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_device
-- ----------------------------
INSERT INTO `sale_device` VALUES (1, ''测试设备1'', ''yuanren201809050011'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, -1, 1);
INSERT INTO `sale_device` VALUES (2, ''测试设备1232w'', ''sc00112'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (3, ''MuMu3'', ''0087967492835033'', ''格子机'', 17, ''西单商城3层北侧'', 2, ''2018-08-30 14:19:25'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (4, ''vivo X94'', ''5319796792268854'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 15:12:15'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (5, ''猿人售货机00015'', ''yuanren201809050015'', ''售货机'', 20, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (6, ''猿人售货机00016'', ''yuanren201809050016'', ''格子机'', 20, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (7, ''猿人售货机00017'', ''yuanren201809050017'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (8, ''猿人售货机00018'', ''yuanren201809050018'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (9, ''猿人售货机00019'', ''yuanren201809050019'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (10, ''猿人售货机000110'', ''yuanren2018090500110'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (11, ''猿人售货机000111'', ''yuanren2018090500111'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (12, ''猿人售货机000112'', ''yuanren2018090500112'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (13, ''猿人售货机000113'', ''yuanren2018090500113'', ''格子机'', 3, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (14, ''猿人售货机000114'', ''yuanren2018090500114'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (15, ''猿人售货机000115'', ''yuanren2018090500115'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (16, ''猿人售货机000116'', ''yuanren2018090500116'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (17, ''猿人售货机000117'', ''yuanren2018090500117'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (18, ''猿人售货机000118'', ''yuanren2018090500118'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (19, ''猿人售货机000119'', ''yuanren2018090500119'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (20, ''猿人售货机000120'', ''yuanren2018090500120'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (21, ''猿人售货机000121'', ''yuanren2018090500121'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (22, ''猿人售货机000122'', ''yuanren2018090500122'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (23, ''猿人售货机000123'', ''yuanren2018090500123'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (24, ''猿人售货机000124'', ''yuanren2018090500124'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (25, ''猿人售货机000125'', ''yuanren2018090500125'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (26, ''猿人售货机000126'', ''yuanren2018090500126'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (27, ''猿人售货机000127'', ''yuanren2018090500127'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (28, ''猿人售货机000128'', ''yuanren2018090500128'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (29, ''猿人售货机000129'', ''yuanren2018090500129'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (30, ''猿人售货机000130'', ''yuanren2018090500130'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (31, ''猿人售货机000131'', ''yuanren2018090500131'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (32, ''猿人售货机000132'', ''yuanren2018090500132'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (33, ''猿人售货机000133'', ''yuanren2018090500133'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (34, ''猿人售货机000134'', ''yuanren2018090500134'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (35, ''猿人售货机000135'', ''yuanren2018090500135'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (36, ''猿人售货机000136'', ''yuanren2018090500136'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (37, ''猿人售货机000137'', ''yuanren2018090500137'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (38, ''猿人售货机000138'', ''yuanren2018090500138'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (39, ''猿人售货机000139'', ''yuanren2018090500139'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (40, ''猿人售货机000140'', ''yuanren2018090500140'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (41, ''猿人售货机000141'', ''yuanren2018090500141'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (42, ''猿人售货机000142'', ''yuanren2018090500142'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (43, ''猿人售货机000143'', ''yuanren2018090500143'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (44, ''猿人售货机000144'', ''yuanren2018090500144'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (45, ''猿人售货机000145'', ''yuanren2018090500145'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (46, ''猿人售货机000146'', ''yuanren2018090500146'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (47, ''猿人售货机000147'', ''yuanren2018090500147'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (48, ''猿人售货机000148'', ''yuanren2018090500148'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (49, ''猿人售货机000149'', ''yuanren2018090500149'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (50, ''猿人售货机000150'', ''yuanren2018090500150'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (51, ''猿人售货机000151'', ''yuanren2018090500151'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (52, ''猿人售货机000152'', ''yuanren2018090500152'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (53, ''猿人售货机000153'', ''yuanren2018090500153'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (54, ''猿人售货机000154'', ''yuanren2018090500154'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (55, ''猿人售货机000155'', ''yuanren2018090500155'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (56, ''猿人售货机000156'', ''yuanren2018090500156'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (57, ''猿人售货机000157'', ''yuanren2018090500157'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (58, ''猿人售货机000158'', ''yuanren2018090500158'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (59, ''猿人售货机000159'', ''yuanren2018090500159'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (60, ''猿人售货机000160'', ''yuanren2018090500160'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (61, ''猿人售货机000161'', ''yuanren2018090500161'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (62, ''猿人售货机000162'', ''yuanren2018090500162'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (63, ''猿人售货机000163'', ''yuanren2018090500163'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (64, ''猿人售货机000164'', ''yuanren2018090500164'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (65, ''猿人售货机000165'', ''yuanren2018090500165'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (66, ''猿人售货机000166'', ''yuanren2018090500166'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (67, ''猿人售货机000167'', ''yuanren2018090500167'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (68, ''猿人售货机000168'', ''yuanren2018090500168'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (69, ''猿人售货机000169'', ''yuanren2018090500169'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (70, ''猿人售货机000170'', ''yuanren2018090500170'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (71, ''猿人售货机000171'', ''yuanren2018090500171'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (72, ''猿人售货机000172'', ''yuanren2018090500172'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (73, ''猿人售货机000173'', ''yuanren2018090500173'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (74, ''猿人售货机000174'', ''yuanren2018090500174'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (75, ''猿人售货机000175'', ''yuanren2018090500175'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (76, ''猿人售货机000176'', ''yuanren2018090500176'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (77, ''猿人售货机000177'', ''yuanren2018090500177'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (78, ''猿人售货机000178'', ''yuanren2018090500178'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (79, ''猿人售货机000179'', ''yuanren2018090500179'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (80, ''猿人售货机000180'', ''yuanren2018090500180'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (81, ''猿人售货机000181'', ''yuanren2018090500181'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (82, ''猿人售货机000182'', ''yuanren2018090500182'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (83, ''猿人售货机000183'', ''yuanren2018090500183'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (84, ''猿人售货机000184'', ''yuanren2018090500184'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (85, ''猿人售货机000185'', ''yuanren2018090500185'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (86, ''猿人售货机000186'', ''yuanren2018090500186'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (87, ''猿人售货机000187'', ''yuanren2018090500187'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (88, ''猿人售货机000188'', ''yuanren2018090500188'', ''格子机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (89, ''猿人售货机000189'', ''yuanren2018090500189'', ''格子机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (90, ''猿人售货机000190'', ''yuanren2018090500190'', ''格子机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (91, ''猿人售货机000191'', ''yuanren2018090500191'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (92, ''猿人售货机000192'', ''yuanren2018090500192'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (93, ''猿人售货机000193'', ''yuanren2018090500193'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (94, ''猿人售货机000194'', ''yuanren2018090500194'', ''格子机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (95, ''猿人售货机000195'', ''yuanren2018090500195'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (96, ''猿人售货机000196'', ''yuanren2018090500196'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (97, ''猿人售货机000197'', ''yuanren2018090500197'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (98, ''猿人售货机000198'', ''yuanren2018090500198'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (99, ''猿人售货机000199'', ''yuanren2018090500199'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (100, ''猿人售货机0001100'', ''yuanren20180905001100'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (101, ''猿人售货机0001101'', ''yuanren20180905001101'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (102, ''猿人售货机0001102'', ''yuanren20180905001102'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (103, ''猿人售货机0001103'', ''yuanren20180905001103'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (104, ''猿人售货机0001104'', ''yuanren20180905001104'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (105, ''猿人售货机0001105'', ''yuanren20180905001105'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (106, ''猿人售货机0001106'', ''yuanren20180905001106'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (107, ''猿人售货机0001107'', ''yuanren20180905001107'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (108, ''猿人售货机0001108'', ''yuanren20180905001108'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (109, ''猿人售货机0001109'', ''yuanren20180905001109'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (110, ''猿人售货机0001110'', ''yuanren20180905001110'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (111, ''猿人售货机0001111'', ''yuanren20180905001111'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (112, ''猿人售货机0001112'', ''yuanren20180905001112'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (113, ''猿人售货机0001113'', ''yuanren20180905001113'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (114, ''猿人售货机0001114'', ''yuanren20180905001114'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (115, ''猿人售货机0001115'', ''yuanren20180905001115'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (116, ''猿人售货机0001116'', ''yuanren20180905001116'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (117, ''猿人售货机0001117'', ''yuanren20180905001117'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (118, ''猿人售货机0001118'', ''yuanren20180905001118'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (119, ''猿人售货机0001119'', ''yuanren20180905001119'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (120, ''猿人售货机0001120'', ''yuanren20180905001120'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (121, ''猿人售货机0001121'', ''yuanren20180905001121'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (122, ''猿人售货机0001122'', ''yuanren20180905001122'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (123, ''猿人售货机0001123'', ''yuanren20180905001123'', ''售货机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (124, ''猿人售货机0001124'', ''yuanren20180905001124'', ''售货机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (125, ''猿人售货机0001125'', ''yuanren20180905001125'', ''售货机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (126, ''猿人售货机0001126'', ''yuanren20180905001126'', ''售货机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (127, ''猿人售货机0001127'', ''yuanren20180905001127'', ''售货机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (128, ''猿人售货机0001128'', ''yuanren20180905001128'', ''售货机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (129, ''猿人售货机0001129'', ''yuanren20180905001129'', ''售货机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (130, ''猿人售货机0001130'', ''yuanren20180905001130'', ''售货机'', NULL, ''西单商城2层南侧'', 1, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (131, ''猿人售货机0001131'', ''yuanren20180905001131'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (132, ''猿人售货机0001132'', ''yuanren20180905001132'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (133, ''猿人售货机0001133'', ''yuanren20180905001133'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (134, ''猿人售货机0001134'', ''yuanren20180905001134'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (135, ''猿人售货机0001135'', ''yuanren20180905001135'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (136, ''猿人售货机0001136'', ''yuanren20180905001136'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (137, ''猿人售货机0001137'', ''yuanren20180905001137'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (138, ''猿人售货机0001138'', ''yuanren20180905001138'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (139, ''猿人售货机0001139'', ''yuanren20180905001139'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (140, ''猿人售货机0001140'', ''yuanren20180905001140'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (141, ''猿人售货机0001141'', ''yuanren20180905001141'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (142, ''猿人售货机0001142'', ''yuanren20180905001142'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (143, ''猿人售货机0001143'', ''yuanren20180905001143'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (144, ''猿人售货机0001144'', ''yuanren20180905001144'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (145, ''猿人售货机0001145'', ''yuanren20180905001145'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (146, ''猿人售货机0001146'', ''yuanren20180905001146'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (147, ''猿人售货机0001147'', ''yuanren20180905001147'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (148, ''猿人售货机0001148'', ''yuanren20180905001148'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (149, ''猿人售货机0001149'', ''yuanren20180905001149'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (150, ''猿人售货机0001150'', ''yuanren20180905001150'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (151, ''猿人售货机0001151'', ''yuanren20180905001151'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (152, ''猿人售货机0001152'', ''yuanren20180905001152'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (153, ''猿人售货机0001153'', ''yuanren20180905001153'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (154, ''猿人售货机0001154'', ''yuanren20180905001154'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (155, ''猿人售货机0001155'', ''yuanren20180905001155'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (156, ''猿人售货机0001156'', ''yuanren20180905001156'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (157, ''猿人售货机0001157'', ''yuanren20180905001157'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (158, ''猿人售货机0001158'', ''yuanren20180905001158'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (159, ''猿人售货机0001159'', ''yuanren20180905001159'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (160, ''猿人售货机0001160'', ''yuanren20180905001160'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (161, ''猿人售货机0001161'', ''yuanren20180905001161'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (162, ''猿人售货机0001162'', ''yuanren20180905001162'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (163, ''猿人售货机0001163'', ''yuanren20180905001163'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (164, ''猿人售货机0001164'', ''yuanren20180905001164'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (165, ''猿人售货机0001165'', ''yuanren20180905001165'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (166, ''猿人售货机0001166'', ''yuanren20180905001166'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (167, ''猿人售货机0001167'', ''yuanren20180905001167'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (168, ''猿人售货机0001168'', ''yuanren20180905001168'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (169, ''猿人售货机0001169'', ''yuanren20180905001169'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (170, ''猿人售货机0001170'', ''yuanren20180905001170'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (171, ''猿人售货机0001171'', ''yuanren20180905001171'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (172, ''猿人售货机0001172'', ''yuanren20180905001172'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (173, ''猿人售货机0001173'', ''yuanren20180905001173'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (174, ''猿人售货机0001174'', ''yuanren20180905001174'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (175, ''猿人售货机0001175'', ''yuanren20180905001175'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (176, ''猿人售货机0001176'', ''yuanren20180905001176'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (177, ''猿人售货机0001177'', ''yuanren20180905001177'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (178, ''猿人售货机0001178'', ''yuanren20180905001178'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (179, ''猿人售货机0001179'', ''yuanren20180905001179'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (180, ''猿人售货机0001180'', ''yuanren20180905001180'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (181, ''猿人售货机0001181'', ''yuanren20180905001181'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (182, ''猿人售货机0001182'', ''yuanren20180905001182'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (183, ''猿人售货机0001183'', ''yuanren20180905001183'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (184, ''猿人售货机0001184'', ''yuanren20180905001184'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (185, ''猿人售货机0001185'', ''yuanren20180905001185'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (186, ''猿人售货机0001186'', ''yuanren20180905001186'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (187, ''猿人售货机0001187'', ''yuanren20180905001187'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (188, ''猿人售货机0001188'', ''yuanren20180905001188'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (189, ''猿人售货机0001189'', ''yuanren20180905001189'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (190, ''猿人售货机0001190'', ''yuanren20180905001190'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (191, ''猿人售货机0001191'', ''yuanren20180905001191'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (192, ''猿人售货机0001192'', ''yuanren20180905001192'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (193, ''猿人售货机0001193'', ''yuanren20180905001193'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (194, ''猿人售货机0001194'', ''yuanren20180905001194'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (195, ''猿人售货机0001195'', ''yuanren20180905001195'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (196, ''猿人售货机0001196'', ''yuanren20180905001196'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (197, ''猿人售货机0001197'', ''yuanren20180905001197'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (198, ''猿人售货机0001198'', ''yuanren20180905001198'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (199, ''猿人售货机0001199'', ''yuanren20180905001199'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (200, ''猿人售货机0001200'', ''yuanren20180905001200'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (201, ''猿人售货机0001201'', ''yuanren20180905001201'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (202, ''猿人售货机0001202'', ''yuanren20180905001202'', ''售货机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (203, ''猿人售货机0001203'', ''yuanren20180905001203'', ''格子机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (204, ''猿人售货机0001204'', ''yuanren20180905001204'', ''售货机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (205, ''猿人售货机0001205'', ''yuanren20180905001205'', ''格子机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (206, ''猿人售货机0001206'', ''yuanren20180905001206'', ''售货机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (207, ''猿人售货机0001207'', ''yuanren20180905001207'', ''格子机'', 20, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (208, ''猿人售货机0001208'', ''yuanren20180905001208'', ''格子机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (209, ''猿人售货机0001209'', ''yuanren20180905001209'', ''售货机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (210, ''猿人售货机0001210'', ''yuanren20180905001210'', ''售货机'', 20, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (211, ''猿人售货机0001211'', ''yuanren20180905001211'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (212, ''猿人售货机0001212'', ''yuanren20180905001212'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (213, ''猿人售货机0001213'', ''yuanren20180905001213'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (214, ''猿人售货机0001214'', ''yuanren20180905001214'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (215, ''猿人售货机0001215'', ''yuanren20180905001215'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (216, ''猿人售货机0001216'', ''yuanren20180905001216'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (217, ''猿人售货机0001217'', ''yuanren20180905001217'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (218, ''猿人售货机0001218'', ''yuanren20180905001218'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (219, ''猿人售货机0001219'', ''yuanren20180905001219'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (220, ''猿人售货机0001220'', ''yuanren20180905001220'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (221, ''猿人售货机0001221'', ''yuanren20180905001221'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (222, ''猿人售货机0001222'', ''yuanren20180905001222'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (223, ''猿人售货机0001223'', ''yuanren20180905001223'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (224, ''猿人售货机0001224'', ''yuanren20180905001224'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (225, ''猿人售货机0001225'', ''yuanren20180905001225'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (226, ''猿人售货机0001226'', ''yuanren20180905001226'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (227, ''猿人售货机0001227'', ''yuanren20180905001227'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (228, ''猿人售货机0001228'', ''yuanren20180905001228'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (229, ''猿人售货机0001229'', ''yuanren20180905001229'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (230, ''猿人售货机0001230'', ''yuanren20180905001230'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (231, ''猿人售货机0001231'', ''yuanren20180905001231'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (232, ''猿人售货机0001232'', ''yuanren20180905001232'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (233, ''猿人售货机0001233'', ''yuanren20180905001233'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (234, ''猿人售货机0001234'', ''yuanren20180905001234'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (235, ''猿人售货机0001235'', ''yuanren20180905001235'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (236, ''猿人售货机0001236'', ''yuanren20180905001236'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (237, ''猿人售货机0001237'', ''yuanren20180905001237'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (238, ''猿人售货机0001238'', ''yuanren20180905001238'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (239, ''猿人售货机0001239'', ''yuanren20180905001239'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (240, ''猿人售货机0001240'', ''yuanren20180905001240'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (241, ''猿人售货机0001241'', ''yuanren20180905001241'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (242, ''猿人售货机0001242'', ''yuanren20180905001242'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (243, ''猿人售货机0001243'', ''yuanren20180905001243'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (244, ''猿人售货机0001244'', ''yuanren20180905001244'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (245, ''猿人售货机0001245'', ''yuanren20180905001245'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (246, ''猿人售货机0001246'', ''yuanren20180905001246'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (247, ''猿人售货机0001247'', ''yuanren20180905001247'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (248, ''猿人售货机0001248'', ''yuanren20180905001248'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (249, ''猿人售货机0001249'', ''yuanren20180905001249'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (250, ''猿人售货机0001250'', ''yuanren20180905001250'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (251, ''猿人售货机0001251'', ''yuanren20180905001251'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (252, ''猿人售货机0001252'', ''yuanren20180905001252'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (253, ''猿人售货机0001253'', ''yuanren20180905001253'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (254, ''猿人售货机0001254'', ''yuanren20180905001254'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (255, ''猿人售货机0001255'', ''yuanren20180905001255'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (256, ''猿人售货机0001256'', ''yuanren20180905001256'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (257, ''猿人售货机0001257'', ''yuanren20180905001257'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (258, ''猿人售货机0001258'', ''yuanren20180905001258'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (259, ''猿人售货机0001259'', ''yuanren20180905001259'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (260, ''猿人售货机0001260'', ''yuanren20180905001260'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (261, ''猿人售货机0001261'', ''yuanren20180905001261'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (262, ''猿人售货机0001262'', ''yuanren20180905001262'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (263, ''猿人售货机0001263'', ''yuanren20180905001263'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (264, ''猿人售货机0001264'', ''yuanren20180905001264'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (265, ''猿人售货机0001265'', ''yuanren20180905001265'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (266, ''猿人售货机0001266'', ''yuanren20180905001266'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (267, ''猿人售货机0001267'', ''yuanren20180905001267'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (268, ''猿人售货机0001268'', ''yuanren20180905001268'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (269, ''猿人售货机0001269'', ''yuanren20180905001269'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (270, ''猿人售货机0001270'', ''yuanren20180905001270'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (271, ''猿人售货机0001271'', ''yuanren20180905001271'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (272, ''猿人售货机0001272'', ''yuanren20180905001272'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (273, ''猿人售货机0001273'', ''yuanren20180905001273'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (274, ''猿人售货机0001274'', ''yuanren20180905001274'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (275, ''猿人售货机0001275'', ''yuanren20180905001275'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (276, ''猿人售货机0001276'', ''yuanren20180905001276'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (277, ''猿人售货机0001277'', ''yuanren20180905001277'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (278, ''猿人售货机0001278'', ''yuanren20180905001278'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (279, ''猿人售货机0001279'', ''yuanren20180905001279'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (280, ''猿人售货机0001280'', ''yuanren20180905001280'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (281, ''猿人售货机0001281'', ''yuanren20180905001281'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (282, ''猿人售货机0001282'', ''yuanren20180905001282'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (283, ''猿人售货机0001283'', ''yuanren20180905001283'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (284, ''猿人售货机0001284'', ''yuanren20180905001284'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (285, ''猿人售货机0001285'', ''yuanren20180905001285'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (286, ''猿人售货机0001286'', ''yuanren20180905001286'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (287, ''猿人售货机0001287'', ''yuanren20180905001287'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (288, ''猿人售货机0001288'', ''yuanren20180905001288'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (289, ''猿人售货机0001289'', ''yuanren20180905001289'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (290, ''猿人售货机0001290'', ''yuanren20180905001290'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (291, ''猿人售货机0001291'', ''yuanren20180905001291'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (292, ''猿人售货机0001292'', ''yuanren20180905001292'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (293, ''猿人售货机0001293'', ''yuanren20180905001293'', ''售货机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (294, ''猿人售货机0001294'', ''yuanren20180905001294'', ''格子机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (295, ''猿人售货机0001295'', ''yuanren20180905001295'', ''售货机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (296, ''猿人售货机0001296'', ''yuanren20180905001296'', ''格子机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (297, ''猿人售货机0001297'', ''yuanren20180905001297'', ''售货机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (298, ''猿人售货机0001298'', ''yuanren20180905001298'', ''格子机'', 20, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (299, ''猿人售货机0001299'', ''yuanren20180905001299'', ''格子机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (300, ''猿人售货机0001300'', ''yuanren20180905001300'', ''售货机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (301, ''猿人售货机0001301'', ''yuanren20180905001301'', ''售货机'', 20, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (302, ''猿人售货机0001302'', ''yuanren20180905001302'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (303, ''猿人售货机0001303'', ''yuanren20180905001303'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (304, ''猿人售货机0001304'', ''yuanren20180905001304'', ''售货机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (305, ''猿人售货机0001305'', ''yuanren20180905001305'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (306, ''猿人售货机0001306'', ''yuanren20180905001306'', ''售货机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (307, ''猿人售货机0001307'', ''yuanren20180905001307'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (308, ''猿人售货机0001308'', ''yuanren20180905001308'', ''格子机'', 17, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (309, ''猿人售货机0001309'', ''yuanren20180905001309'', ''格子机'', 3, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (310, ''猿人售货机0001310'', ''yuanren20180905001310'', ''格子机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (311, ''猿人售货机0001311'', ''yuanren20180905001311'', ''售货机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (312, ''猿人售货机0001312'', ''yuanren20180905001312'', ''售货机'', NULL, ''西单商城2层南侧'', 1, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (313, ''猿人售货机0001313'', ''yuanren20180905001313'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (314, ''猿人售货机0001314'', ''yuanren20180905001314'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (315, ''猿人售货机0001315'', ''yuanren20180905001315'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (316, ''猿人售货机0001316'', ''yuanren20180905001316'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (317, ''猿人售货机0001317'', ''yuanren20180905001317'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (318, ''猿人售货机0001318'', ''yuanren20180905001318'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (319, ''猿人售货机0001319'', ''yuanren20180905001319'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (320, ''猿人售货机0001320'', ''yuanren20180905001320'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (321, ''猿人售货机0001321'', ''yuanren20180905001321'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (322, ''猿人售货机0001322'', ''yuanren20180905001322'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (323, ''猿人售货机0001323'', ''yuanren20180905001323'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (324, ''猿人售货机0001324'', ''yuanren20180905001324'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (325, ''猿人售货机0001325'', ''yuanren20180905001325'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (326, ''猿人售货机0001326'', ''yuanren20180905001326'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (327, ''猿人售货机0001327'', ''yuanren20180905001327'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (328, ''猿人售货机0001328'', ''yuanren20180905001328'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (329, ''猿人售货机0001329'', ''yuanren20180905001329'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (330, ''猿人售货机0001330'', ''yuanren20180905001330'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (331, ''猿人售货机0001331'', ''yuanren20180905001331'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (332, ''猿人售货机0001332'', ''yuanren20180905001332'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (333, ''猿人售货机0001333'', ''yuanren20180905001333'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (334, ''猿人售货机0001334'', ''yuanren20180905001334'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (335, ''猿人售货机0001335'', ''yuanren20180905001335'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (336, ''猿人售货机0001336'', ''yuanren20180905001336'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (337, ''猿人售货机0001337'', ''yuanren20180905001337'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (338, ''猿人售货机0001338'', ''yuanren20180905001338'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (339, ''猿人售货机0001339'', ''yuanren20180905001339'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (340, ''猿人售货机0001340'', ''yuanren20180905001340'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (341, ''猿人售货机0001341'', ''yuanren20180905001341'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (342, ''猿人售货机0001342'', ''yuanren20180905001342'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (343, ''猿人售货机0001343'', ''yuanren20180905001343'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (344, ''猿人售货机0001344'', ''yuanren20180905001344'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (345, ''猿人售货机0001345'', ''yuanren20180905001345'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (346, ''猿人售货机0001346'', ''yuanren20180905001346'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (347, ''猿人售货机0001347'', ''yuanren20180905001347'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (348, ''猿人售货机0001348'', ''yuanren20180905001348'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (349, ''猿人售货机0001349'', ''yuanren20180905001349'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (350, ''猿人售货机0001350'', ''yuanren20180905001350'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (351, ''猿人售货机0001351'', ''yuanren20180905001351'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (352, ''猿人售货机0001352'', ''yuanren20180905001352'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (353, ''猿人售货机0001353'', ''yuanren20180905001353'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (354, ''猿人售货机0001354'', ''yuanren20180905001354'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (355, ''猿人售货机0001355'', ''yuanren20180905001355'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (356, ''猿人售货机0001356'', ''yuanren20180905001356'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (357, ''猿人售货机0001357'', ''yuanren20180905001357'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (358, ''猿人售货机0001358'', ''yuanren20180905001358'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (359, ''猿人售货机0001359'', ''yuanren20180905001359'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (360, ''猿人售货机0001360'', ''yuanren20180905001360'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (361, ''猿人售货机0001361'', ''yuanren20180905001361'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (362, ''猿人售货机0001362'', ''yuanren20180905001362'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (363, ''猿人售货机0001363'', ''yuanren20180905001363'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (364, ''猿人售货机0001364'', ''yuanren20180905001364'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (365, ''猿人售货机0001365'', ''yuanren20180905001365'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (366, ''猿人售货机0001366'', ''yuanren20180905001366'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (367, ''猿人售货机0001367'', ''yuanren20180905001367'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (368, ''猿人售货机0001368'', ''yuanren20180905001368'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (369, ''猿人售货机0001369'', ''yuanren20180905001369'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (370, ''猿人售货机0001370'', ''yuanren20180905001370'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (371, ''猿人售货机0001371'', ''yuanren20180905001371'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (372, ''猿人售货机0001372'', ''yuanren20180905001372'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (373, ''猿人售货机0001373'', ''yuanren20180905001373'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (374, ''猿人售货机0001374'', ''yuanren20180905001374'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (375, ''猿人售货机0001375'', ''yuanren20180905001375'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (376, ''猿人售货机0001376'', ''yuanren20180905001376'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (377, ''猿人售货机0001377'', ''yuanren20180905001377'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (378, ''猿人售货机0001378'', ''yuanren20180905001378'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (379, ''猿人售货机0001379'', ''yuanren20180905001379'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (380, ''猿人售货机0001380'', ''yuanren20180905001380'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (381, ''猿人售货机0001381'', ''yuanren20180905001381'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (382, ''猿人售货机0001382'', ''yuanren20180905001382'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (383, ''猿人售货机0001383'', ''yuanren20180905001383'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (384, ''猿人售货机0001384'', ''yuanren20180905001384'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (385, ''猿人售货机0001385'', ''yuanren20180905001385'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (386, ''猿人售货机0001386'', ''yuanren20180905001386'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (387, ''猿人售货机0001387'', ''yuanren20180905001387'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (388, ''猿人售货机0001388'', ''yuanren20180905001388'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (389, ''猿人售货机0001389'', ''yuanren20180905001389'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (390, ''猿人售货机0001390'', ''yuanren20180905001390'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (391, ''猿人售货机0001391'', ''yuanren20180905001391'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (392, ''猿人售货机0001392'', ''yuanren20180905001392'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (393, ''猿人售货机0001393'', ''yuanren20180905001393'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (394, ''猿人售货机0001394'', ''yuanren20180905001394'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (395, ''猿人售货机0001395'', ''yuanren20180905001395'', ''售货机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (396, ''猿人售货机0001396'', ''yuanren20180905001396'', ''格子机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (397, ''猿人售货机0001397'', ''yuanren20180905001397'', ''售货机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (398, ''猿人售货机0001398'', ''yuanren20180905001398'', ''格子机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (399, ''猿人售货机0001399'', ''yuanren20180905001399'', ''售货机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (400, ''猿人售货机0001400'', ''yuanren20180905001400'', ''格子机'', 20, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (401, ''猿人售货机0001401'', ''yuanren20180905001401'', ''格子机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (402, ''猿人售货机0001402'', ''yuanren20180905001402'', ''售货机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (403, ''猿人售货机0001403'', ''yuanren20180905001403'', ''售货机'', 20, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (404, ''猿人售货机0001404'', ''yuanren20180905001404'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (405, ''猿人售货机0001405'', ''yuanren20180905001405'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (406, ''猿人售货机0001406'', ''yuanren20180905001406'', ''售货机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (407, ''猿人售货机0001407'', ''yuanren20180905001407'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (408, ''猿人售货机0001408'', ''yuanren20180905001408'', ''售货机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (409, ''猿人售货机0001409'', ''yuanren20180905001409'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (410, ''猿人售货机0001410'', ''yuanren20180905001410'', ''格子机'', 17, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (411, ''猿人售货机0001411'', ''yuanren20180905001411'', ''格子机'', 3, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (412, ''猿人售货机0001412'', ''yuanren20180905001412'', ''格子机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (413, ''猿人售货机0001413'', ''yuanren20180905001413'', ''售货机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (414, ''猿人售货机0001414'', ''yuanren20180905001414'', ''售货机'', NULL, ''西单商城2层南侧'', 1, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (415, ''猿人售货机0001415'', ''yuanren20180905001415'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (416, ''猿人售货机0001416'', ''yuanren20180905001416'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (417, ''猿人售货机0001417'', ''yuanren20180905001417'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (418, ''猿人售货机0001418'', ''yuanren20180905001418'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (419, ''猿人售货机0001419'', ''yuanren20180905001419'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (420, ''猿人售货机0001420'', ''yuanren20180905001420'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (421, ''猿人售货机0001421'', ''yuanren20180905001421'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (422, ''猿人售货机0001422'', ''yuanren20180905001422'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (423, ''猿人售货机0001423'', ''yuanren20180905001423'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (424, ''猿人售货机0001424'', ''yuanren20180905001424'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (425, ''猿人售货机0001425'', ''yuanren20180905001425'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (426, ''猿人售货机0001426'', ''yuanren20180905001426'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (427, ''猿人售货机0001427'', ''yuanren20180905001427'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (428, ''猿人售货机0001428'', ''yuanren20180905001428'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (429, ''猿人售货机0001429'', ''yuanren20180905001429'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (430, ''猿人售货机0001430'', ''yuanren20180905001430'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (431, ''猿人售货机0001431'', ''yuanren20180905001431'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (432, ''猿人售货机0001432'', ''yuanren20180905001432'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (433, ''猿人售货机0001433'', ''yuanren20180905001433'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (434, ''猿人售货机0001434'', ''yuanren20180905001434'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (435, ''猿人售货机0001435'', ''yuanren20180905001435'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (436, ''猿人售货机0001436'', ''yuanren20180905001436'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (437, ''猿人售货机0001437'', ''yuanren20180905001437'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (438, ''猿人售货机0001438'', ''yuanren20180905001438'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (439, ''猿人售货机0001439'', ''yuanren20180905001439'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (440, ''猿人售货机0001440'', ''yuanren20180905001440'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (441, ''猿人售货机0001441'', ''yuanren20180905001441'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (442, ''猿人售货机0001442'', ''yuanren20180905001442'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (443, ''猿人售货机0001443'', ''yuanren20180905001443'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (444, ''猿人售货机0001444'', ''yuanren20180905001444'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (445, ''猿人售货机0001445'', ''yuanren20180905001445'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (446, ''猿人售货机0001446'', ''yuanren20180905001446'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (447, ''猿人售货机0001447'', ''yuanren20180905001447'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (448, ''猿人售货机0001448'', ''yuanren20180905001448'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (449, ''猿人售货机0001449'', ''yuanren20180905001449'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (450, ''猿人售货机0001450'', ''yuanren20180905001450'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (451, ''猿人售货机0001451'', ''yuanren20180905001451'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (452, ''猿人售货机0001452'', ''yuanren20180905001452'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (453, ''猿人售货机0001453'', ''yuanren20180905001453'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (454, ''猿人售货机0001454'', ''yuanren20180905001454'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (455, ''猿人售货机0001455'', ''yuanren20180905001455'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (456, ''猿人售货机0001456'', ''yuanren20180905001456'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (457, ''猿人售货机0001457'', ''yuanren20180905001457'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (458, ''猿人售货机0001458'', ''yuanren20180905001458'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (459, ''猿人售货机0001459'', ''yuanren20180905001459'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (460, ''猿人售货机0001460'', ''yuanren20180905001460'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (461, ''猿人售货机0001461'', ''yuanren20180905001461'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (462, ''猿人售货机0001462'', ''yuanren20180905001462'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (463, ''猿人售货机0001463'', ''yuanren20180905001463'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (464, ''猿人售货机0001464'', ''yuanren20180905001464'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (465, ''猿人售货机0001465'', ''yuanren20180905001465'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (466, ''猿人售货机0001466'', ''yuanren20180905001466'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (467, ''猿人售货机0001467'', ''yuanren20180905001467'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (468, ''猿人售货机0001468'', ''yuanren20180905001468'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (469, ''猿人售货机0001469'', ''yuanren20180905001469'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (470, ''猿人售货机0001470'', ''yuanren20180905001470'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (471, ''猿人售货机0001471'', ''yuanren20180905001471'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (472, ''猿人售货机0001472'', ''yuanren20180905001472'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (473, ''猿人售货机0001473'', ''yuanren20180905001473'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (474, ''猿人售货机0001474'', ''yuanren20180905001474'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (475, ''猿人售货机0001475'', ''yuanren20180905001475'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (476, ''猿人售货机0001476'', ''yuanren20180905001476'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (477, ''猿人售货机0001477'', ''yuanren20180905001477'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (478, ''猿人售货机0001478'', ''yuanren20180905001478'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (479, ''猿人售货机0001479'', ''yuanren20180905001479'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (480, ''猿人售货机0001480'', ''yuanren20180905001480'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (481, ''猿人售货机0001481'', ''yuanren20180905001481'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (482, ''猿人售货机0001482'', ''yuanren20180905001482'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (483, ''猿人售货机0001483'', ''yuanren20180905001483'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (484, ''猿人售货机0001484'', ''yuanren20180905001484'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (485, ''猿人售货机0001485'', ''yuanren20180905001485'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (486, ''猿人售货机0001486'', ''yuanren20180905001486'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (487, ''猿人售货机0001487'', ''yuanren20180905001487'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (488, ''猿人售货机0001488'', ''yuanren20180905001488'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (489, ''猿人售货机0001489'', ''yuanren20180905001489'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (490, ''猿人售货机0001490'', ''yuanren20180905001490'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (491, ''猿人售货机0001491'', ''yuanren20180905001491'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (492, ''猿人售货机0001492'', ''yuanren20180905001492'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (493, ''猿人售货机0001493'', ''yuanren20180905001493'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (494, ''猿人售货机0001494'', ''yuanren20180905001494'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (495, ''猿人售货机0001495'', ''yuanren20180905001495'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (496, ''猿人售货机0001496'', ''yuanren20180905001496'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (497, ''猿人售货机0001497'', ''yuanren20180905001497'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (498, ''猿人售货机0001498'', ''yuanren20180905001498'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (499, ''猿人售货机0001499'', ''yuanren20180905001499'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (500, ''猿人售货机0001500'', ''yuanren20180905001500'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (501, ''猿人售货机0001501'', ''yuanren20180905001501'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (502, ''猿人售货机0001502'', ''yuanren20180905001502'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (503, ''猿人售货机0001503'', ''yuanren20180905001503'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (504, ''猿人售货机0001504'', ''yuanren20180905001504'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (505, ''猿人售货机0001505'', ''yuanren20180905001505'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (506, ''猿人售货机0001506'', ''yuanren20180905001506'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (507, ''猿人售货机0001507'', ''yuanren20180905001507'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (508, ''猿人售货机0001508'', ''yuanren20180905001508'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (509, ''猿人售货机0001509'', ''yuanren20180905001509'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (510, ''猿人售货机0001510'', ''yuanren20180905001510'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (511, ''猿人售货机0001511'', ''yuanren20180905001511'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (512, ''猿人售货机0001512'', ''yuanren20180905001512'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (513, ''猿人售货机0001513'', ''yuanren20180905001513'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (514, ''猿人售货机0001514'', ''yuanren20180905001514'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (515, ''猿人售货机0001515'', ''yuanren20180905001515'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (516, ''猿人售货机0001516'', ''yuanren20180905001516'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (517, ''猿人售货机0001517'', ''yuanren20180905001517'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (518, ''猿人售货机0001518'', ''yuanren20180905001518'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (519, ''猿人售货机0001519'', ''yuanren20180905001519'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (520, ''猿人售货机0001520'', ''yuanren20180905001520'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (521, ''猿人售货机0001521'', ''yuanren20180905001521'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (522, ''猿人售货机0001522'', ''yuanren20180905001522'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (523, ''猿人售货机0001523'', ''yuanren20180905001523'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (524, ''猿人售货机0001524'', ''yuanren20180905001524'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (525, ''猿人售货机0001525'', ''yuanren20180905001525'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (526, ''猿人售货机0001526'', ''yuanren20180905001526'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (527, ''猿人售货机0001527'', ''yuanren20180905001527'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (528, ''猿人售货机0001528'', ''yuanren20180905001528'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (529, ''猿人售货机0001529'', ''yuanren20180905001529'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (530, ''猿人售货机0001530'', ''yuanren20180905001530'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (531, ''猿人售货机0001531'', ''yuanren20180905001531'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (532, ''猿人售货机0001532'', ''yuanren20180905001532'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (533, ''猿人售货机0001533'', ''yuanren20180905001533'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (534, ''猿人售货机0001534'', ''yuanren20180905001534'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (535, ''猿人售货机0001535'', ''yuanren20180905001535'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (536, ''猿人售货机0001536'', ''yuanren20180905001536'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (537, ''猿人售货机0001537'', ''yuanren20180905001537'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (538, ''猿人售货机0001538'', ''yuanren20180905001538'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (539, ''猿人售货机0001539'', ''yuanren20180905001539'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (540, ''猿人售货机0001540'', ''yuanren20180905001540'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (541, ''猿人售货机0001541'', ''yuanren20180905001541'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (542, ''猿人售货机0001542'', ''yuanren20180905001542'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (543, ''猿人售货机0001543'', ''yuanren20180905001543'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (544, ''猿人售货机0001544'', ''yuanren20180905001544'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (545, ''猿人售货机0001545'', ''yuanren20180905001545'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (546, ''猿人售货机0001546'', ''yuanren20180905001546'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (547, ''猿人售货机0001547'', ''yuanren20180905001547'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (548, ''猿人售货机0001548'', ''yuanren20180905001548'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (549, ''猿人售货机0001549'', ''yuanren20180905001549'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (550, ''猿人售货机0001550'', ''yuanren20180905001550'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (551, ''猿人售货机0001551'', ''yuanren20180905001551'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (552, ''猿人售货机0001552'', ''yuanren20180905001552'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (553, ''猿人售货机0001553'', ''yuanren20180905001553'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (554, ''猿人售货机0001554'', ''yuanren20180905001554'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (555, ''猿人售货机0001555'', ''yuanren20180905001555'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (556, ''猿人售货机0001556'', ''yuanren20180905001556'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (557, ''猿人售货机0001557'', ''yuanren20180905001557'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (558, ''猿人售货机0001558'', ''yuanren20180905001558'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (559, ''猿人售货机0001559'', ''yuanren20180905001559'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (560, ''猿人售货机0001560'', ''yuanren20180905001560'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (561, ''猿人售货机0001561'', ''yuanren20180905001561'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (562, ''猿人售货机0001562'', ''yuanren20180905001562'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (563, ''猿人售货机0001563'', ''yuanren20180905001563'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (564, ''猿人售货机0001564'', ''yuanren20180905001564'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (565, ''猿人售货机0001565'', ''yuanren20180905001565'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (566, ''猿人售货机0001566'', ''yuanren20180905001566'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (567, ''猿人售货机0001567'', ''yuanren20180905001567'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (568, ''猿人售货机0001568'', ''yuanren20180905001568'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (569, ''猿人售货机0001569'', ''yuanren20180905001569'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (570, ''猿人售货机0001570'', ''yuanren20180905001570'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (571, ''猿人售货机0001571'', ''yuanren20180905001571'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (572, ''猿人售货机0001572'', ''yuanren20180905001572'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (573, ''猿人售货机0001573'', ''yuanren20180905001573'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (574, ''猿人售货机0001574'', ''yuanren20180905001574'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (575, ''猿人售货机0001575'', ''yuanren20180905001575'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (576, ''猿人售货机0001576'', ''yuanren20180905001576'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (577, ''猿人售货机0001577'', ''yuanren20180905001577'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (578, ''猿人售货机0001578'', ''yuanren20180905001578'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (579, ''猿人售货机0001579'', ''yuanren20180905001579'', ''售货机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (580, ''猿人售货机0001580'', ''yuanren20180905001580'', ''格子机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (581, ''猿人售货机0001581'', ''yuanren20180905001581'', ''售货机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (582, ''猿人售货机0001582'', ''yuanren20180905001582'', ''格子机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (583, ''猿人售货机0001583'', ''yuanren20180905001583'', ''售货机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (584, ''猿人售货机0001584'', ''yuanren20180905001584'', ''格子机'', 20, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (585, ''猿人售货机0001585'', ''yuanren20180905001585'', ''格子机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (586, ''猿人售货机0001586'', ''yuanren20180905001586'', ''售货机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (587, ''猿人售货机0001587'', ''yuanren20180905001587'', ''售货机'', 20, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (588, ''猿人售货机0001588'', ''yuanren20180905001588'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (589, ''猿人售货机0001589'', ''yuanren20180905001589'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (590, ''猿人售货机0001590'', ''yuanren20180905001590'', ''售货机'', NULL, ''复兴商业城正门'', 5, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (591, ''猿人售货机0001591'', ''yuanren20180905001591'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (592, ''猿人售货机0001592'', ''yuanren20180905001592'', ''售货机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (593, ''猿人售货机0001593'', ''yuanren20180905001593'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (594, ''猿人售货机0001594'', ''yuanren20180905001594'', ''格子机'', 17, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (595, ''猿人售货机0001595'', ''yuanren20180905001595'', ''格子机'', 3, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (596, ''猿人售货机0001596'', ''yuanren20180905001596'', ''格子机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (597, ''猿人售货机0001597'', ''yuanren20180905001597'', ''售货机'', NULL, ''西单商城3层北侧'', 2, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (598, ''猿人售货机0001598'', ''yuanren20180905001598'', ''售货机'', NULL, ''西单商城2层南侧'', 1, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (599, ''猿人售货机0001599'', ''yuanren20180905001599'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (600, ''猿人售货机0001600'', ''yuanren20180905001600'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (601, ''猿人售货机0001601'', ''yuanren20180905001601'', ''格子机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (602, ''猿人售货机0001602'', ''yuanren20180905001602'', ''售货机'', NULL, '' 昌平新世纪商场'', 37, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (603, ''猿人售货机0001603'', ''yuanren20180905001603'', ''格子机'', 32, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (604, ''猿人售货机0001604'', ''yuanren20180905001604'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (605, ''猿人售货机0001605'', ''yuanren20180905001605'', ''格子机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (606, ''猿人售货机0001606'', ''yuanren20180905001606'', ''售货机'', NULL, ''顺义国泰'', 36, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (607, ''猿人售货机0001607'', ''yuanren20180905001607'', ''格子机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (608, ''猿人售货机0001608'', ''yuanren20180905001608'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (609, ''猿人售货机0001609'', ''yuanren20180905001609'', ''售货机'', NULL, ''新世界商场'', 35, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (610, ''猿人售货机0001610'', ''yuanren20180905001610'', ''售货机'', 6, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (611, ''猿人售货机0001611'', ''yuanren20180905001611'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (612, ''猿人售货机0001612'', ''yuanren20180905001612'', ''格子机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (613, ''猿人售货机0001613'', ''yuanren20180905001613'', ''售货机'', NULL, ''飘亮购物中心 '', 34, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (614, ''猿人售货机0001614'', ''yuanren20180905001614'', ''格子机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (615, ''猿人售货机0001615'', ''yuanren20180905001615'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (616, ''猿人售货机0001616'', ''yuanren20180905001616'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (617, ''猿人售货机0001617'', ''yuanren20180905001617'', ''售货机'', NULL, ''王府井洋华堂'', 33, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (618, ''猿人售货机0001618'', ''yuanren20180905001618'', ''格子机'', 16, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (619, ''猿人售货机0001619'', ''yuanren20180905001619'', ''格子机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (620, ''猿人售货机0001620'', ''yuanren20180905001620'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (621, ''猿人售货机0001621'', ''yuanren20180905001621'', ''售货机'', NULL, ''贵友大厦一层东侧'', 32, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (622, ''猿人售货机0001622'', ''yuanren20180905001622'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (623, ''猿人售货机0001623'', ''yuanren20180905001623'', ''售货机'', NULL, ''贵友大厦一层西侧'', 31, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (624, ''猿人售货机0001624'', ''yuanren20180905001624'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (625, ''猿人售货机0001625'', ''yuanren20180905001625'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (626, ''猿人售货机0001626'', ''yuanren20180905001626'', ''售货机'', NULL, ''贵友大厦正门入口东侧'', 30, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (627, ''猿人售货机0001627'', ''yuanren20180905001627'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (628, ''猿人售货机0001628'', ''yuanren20180905001628'', ''售货机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (629, ''猿人售货机0001629'', ''yuanren20180905001629'', ''格子机'', NULL, ''北辰购物中心正门入口'', 29, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (630, ''猿人售货机0001630'', ''yuanren20180905001630'', ''格子机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (631, ''猿人售货机0001631'', ''yuanren20180905001631'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (632, ''猿人售货机0001632'', ''yuanren20180905001632'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (633, ''猿人售货机0001633'', ''yuanren20180905001633'', ''售货机'', NULL, ''北辰购物中心二层扶梯东侧'', 28, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (634, ''猿人售货机0001634'', ''yuanren20180905001634'', ''格子机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (635, ''猿人售货机0001635'', ''yuanren20180905001635'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (636, ''猿人售货机0001636'', ''yuanren20180905001636'', ''售货机'', NULL, ''北辰购物中心二层扶梯西侧'', 27, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (637, ''猿人售货机0001637'', ''yuanren20180905001637'', ''格子机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (638, ''猿人售货机0001638'', ''yuanren20180905001638'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (639, ''猿人售货机0001639'', ''yuanren20180905001639'', ''售货机'', NULL, ''蓝鸟大厦大厅'', 26, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (640, ''猿人售货机0001640'', ''yuanren20180905001640'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (641, ''猿人售货机0001641'', ''yuanren20180905001641'', ''格子机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (642, ''猿人售货机0001642'', ''yuanren20180905001642'', ''售货机'', NULL, ''蓝鸟大厦正门入口'', 25, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (643, ''猿人售货机0001643'', ''yuanren20180905001643'', ''格子机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (644, ''猿人售货机0001644'', ''yuanren20180905001644'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (645, ''猿人售货机0001645'', ''yuanren20180905001645'', ''售货机'', NULL, ''赛特购物中心二层东侧'', 24, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (646, ''猿人售货机0001646'', ''yuanren20180905001646'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (647, ''猿人售货机0001647'', ''yuanren20180905001647'', ''格子机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (648, ''猿人售货机0001648'', ''yuanren20180905001648'', ''售货机'', NULL, ''赛特购物中心一层会员区'', 23, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (649, ''猿人售货机0001649'', ''yuanren20180905001649'', ''格子机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (650, ''猿人售货机0001650'', ''yuanren20180905001650'', ''售货机'', NULL, ''赛特购物中心正门入口'', 22, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (651, ''猿人售货机0001651'', ''yuanren20180905001651'', ''格子机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (652, ''猿人售货机0001652'', ''yuanren20180905001652'', ''售货机'', NULL, ''燕莎友谊商城一层电梯口'', 21, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (653, ''猿人售货机0001653'', ''yuanren20180905001653'', ''格子机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (654, ''猿人售货机0001654'', ''yuanren20180905001654'', ''售货机'', NULL, ''燕莎友谊商城一层西侧'', 20, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (655, ''猿人售货机0001655'', ''yuanren20180905001655'', ''格子机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (656, ''猿人售货机0001656'', ''yuanren20180905001656'', ''售货机'', NULL, ''燕莎友谊商城一层首饰区对面'', 19, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (657, ''猿人售货机0001657'', ''yuanren20180905001657'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (658, ''猿人售货机0001658'', ''yuanren20180905001658'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (659, ''猿人售货机0001659'', ''yuanren20180905001659'', ''格子机'', NULL, ''华堂商城（丰台北路店）顶层入口'', 18, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (660, ''猿人售货机0001660'', ''yuanren20180905001660'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (661, ''猿人售货机0001661'', ''yuanren20180905001661'', ''售货机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (662, ''猿人售货机0001662'', ''yuanren20180905001662'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (663, ''猿人售货机0001663'', ''yuanren20180905001663'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (664, ''猿人售货机0001664'', ''yuanren20180905001664'', ''格子机'', NULL, ''华堂商城（丰田北路店）东侧电梯对面'', 17, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (665, ''猿人售货机0001665'', ''yuanren20180905001665'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (666, ''猿人售货机0001666'', ''yuanren20180905001666'', ''格子机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (667, ''猿人售货机0001667'', ''yuanren20180905001667'', ''售货机'', NULL, ''华堂商城（丰台北路店）正门入口'', 16, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (668, ''猿人售货机0001668'', ''yuanren20180905001668'', ''格子机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (669, ''猿人售货机0001669'', ''yuanren20180905001669'', ''售货机'', NULL, ''新东安商城百货区'', 15, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (670, ''猿人售货机0001670'', ''yuanren20180905001670'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (671, ''猿人售货机0001671'', ''yuanren20180905001671'', ''售货机'', NULL, ''新东安商城A座电梯'', 14, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (672, ''猿人售货机0001672'', ''yuanren20180905001672'', ''格子机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (673, ''猿人售货机0001673'', ''yuanren20180905001673'', ''售货机'', NULL, ''北京秀水街南门入口'', 13, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (674, ''猿人售货机0001674'', ''yuanren20180905001674'', ''格子机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (675, ''猿人售货机0001675'', ''yuanren20180905001675'', ''售货机'', NULL, ''北京秀水街西区2'', 12, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (676, ''猿人售货机0001676'', ''yuanren20180905001676'', ''格子机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (677, ''猿人售货机0001677'', ''yuanren20180905001677'', ''售货机'', NULL, ''北京秀水街西区'', 11, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (678, ''猿人售货机0001678'', ''yuanren20180905001678'', ''格子机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (679, ''猿人售货机0001679'', ''yuanren20180905001679'', ''售货机'', NULL, ''中友百货西侧电梯'', 10, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (680, ''猿人售货机0001680'', ''yuanren20180905001680'', ''格子机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (681, ''猿人售货机0001681'', ''yuanren20180905001681'', ''售货机'', NULL, ''中友百货入口西侧'', 9, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (682, ''猿人售货机0001682'', ''yuanren20180905001682'', ''格子机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (683, ''猿人售货机0001683'', ''yuanren20180905001683'', ''售货机'', NULL, ''长安商城正门大厅东侧'', 8, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (684, ''猿人售货机0001684'', ''yuanren20180905001684'', ''格子机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (685, ''猿人售货机0001685'', ''yuanren20180905001685'', ''售货机'', NULL, ''长安商城二层西侧'', 7, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (686, ''猿人售货机0001686'', ''yuanren20180905001686'', ''格子机'', 20, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (687, ''猿人售货机0001687'', ''yuanren20180905001687'', ''格子机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (688, ''猿人售货机0001688'', ''yuanren20180905001688'', ''格子机'', NULL, ''西单商城正门'', 3, ''2018-08-30 20:01:06'', NULL, 0, 1);
INSERT INTO `sale_device` VALUES (689, ''MuMu'', ''008796749283503'', ''售货机'', NULL, ''复兴商业城1层南侧'', 6, ''2018-09-06 14:43:34'', 1, 0, 1);
INSERT INTO `sale_device` VALUES (690, ''vivo X9'', ''604015703279859'', ''售货机'', 20, ''复兴商业城正门'', 5, ''2018-09-06 14:52:34'', 1, 0, 1);
INSERT INTO `sale_device` VALUES (691, ''COL-AL10'', ''867551031022241'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-09-06 14:52:34'', 1, 0, 1);
INSERT INTO `sale_device` VALUES (692, ''FRD-AL00'', ''869953025418534'', ''格子机'', NULL, ''复兴商业城正门'', 5, ''2018-09-09 08:02:27'', 1, 0, 1);
INSERT INTO `sale_device` VALUES (693, ''MI MAX 2'', ''865902030947924'', NULL, NULL, NULL, NULL, ''2018-09-10 14:38:11'', 1, 0, 1);

-- ----------------------------
-- Table structure for sale_device_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_device_product`;
CREATE TABLE `sale_device_product`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''guid'',
  `productId` int(11) NOT NULL COMMENT ''产品id'',
  `deviceId` int(11) NOT NULL COMMENT ''设备id'',
  `isSale` tinyint(2) NOT NULL DEFAULT 0 COMMENT ''是否售卖'',
  `price` int(10) NULL DEFAULT NULL COMMENT ''价格'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Ix_id`(`id`) USING BTREE,
  INDEX `fk_device_id`(`deviceId`) USING BTREE,
  CONSTRAINT `fk_device_id` FOREIGN KEY (`deviceId`) REFERENCES `sale_device` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_device_product
-- ----------------------------
INSERT INTO `sale_device_product` VALUES (''0914c84c5f73419d9b5cd0f1c75cf50a'', 4, 3, 1, 30000, ''2018-09-06 14:43:10'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''198e2d50bc7c4b1ba4b22e1b68b03a91'', 4, 2, 0, 120000, ''2018-09-06 12:01:23'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''23d4b7861d904be5afdd72736d1631f2'', 3, 689, 1, 20000, ''2018-09-06 14:45:09'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''27e8ca2318ad43b3ba22401a955fdc68'', 10, 691, 1, 4900, ''2018-09-10 12:13:14'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''32a7f35871b1461a9152edd8c655117c'', 15, 16, 1, 50000, ''2018-09-10 04:50:19'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''35243ef86fb745dc9844677e38cbcb56'', 14, 16, 1, 40000, ''2018-09-10 04:50:19'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''5523a4c6e1be432daea91809b5d5b7bb'', 1, 3, 1, 10000, ''2018-08-30 14:19:49'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''61bc91f495cc4dae87a103f7504dfe7e'', 12, 17, 0, 4100, ''2018-09-10 13:06:17'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''6ae38861ca44422998b14ec8fd912ca6'', 5, 2, 1, 110000, ''2018-09-06 12:01:23'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''718e0c06bcd74235a1111e9ef799fda1'', 9, 691, 1, 4900, ''2018-09-10 12:12:44'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''74143a13357940929d58ee2090c15fee'', 1, 2, 1, 123000, ''2018-09-06 07:22:20'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''7ae86fc53801427bb1a75a906b22eeaa'', 13, 16, 1, 30000, ''2018-09-10 04:50:19'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''a7ab4f29bf134094aa14ddb2a11edea6'', 3, 3, 1, 20000, ''2018-09-06 14:43:10'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''ad742c57b41745bd832ff574df302990'', 3, 2, 0, 1230000, ''2018-09-06 07:22:20'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''b35f8b205b3f43449736345881bae46d'', 1, 1, 1, 12111, ''2018-08-30 12:03:03'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''bb89dbc4bb964d2ab30628402f2a902f'', 12, 692, 0, 4100, ''2018-09-10 13:06:10'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''bd53f0c96caf4149a65a65dc99f92163'', 5, 689, 1, 40000, ''2018-09-06 14:45:09'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''e3d71d9b9e5a411f8c385a4ec4587152'', 4, 689, 0, 30000, ''2018-09-06 14:45:09'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''e8fa744fbfd64df79e67009c732b8c4c'', 12, 16, 1, 20000, ''2018-09-10 04:50:19'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''fcfb5a16e8924ca1bcda125746af128f'', 1, 689, 1, 10000, ''2018-09-06 14:45:09'', 1, 1);
INSERT INTO `sale_device_product` VALUES (''feb349fed5754252ad7bd8a075fd11f4'', 5, 3, 1, 40000, ''2018-09-06 14:43:10'', 1, 1);

-- ----------------------------
-- Table structure for sale_file
-- ----------------------------
DROP TABLE IF EXISTS `sale_file`;
CREATE TABLE `sale_file`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''key'',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''文件名'',
  `size` bigint(11) NULL DEFAULT NULL COMMENT ''大小'',
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''后缀'',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''路径'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale_file
-- ----------------------------
INSERT INTO `sale_file` VALUES (''0ed397107d53440aa79ebbc88bc8ee56'', ''files'', 995382, ''新建位图图像 (3).bmp'', ''/img/20180830/1535630346741.bmp'', 1, ''2018-08-30 11:59:07'', 1);

-- ----------------------------
-- Table structure for sale_log
-- ----------------------------
DROP TABLE IF EXISTS `sale_log`;
CREATE TABLE `sale_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''主键'',
  `logDescription` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''日志类型'',
  `actionArgs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''日志名称'',
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''用户id'',
  `className` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''类名称'',
  `method` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''方法名称'',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `succeed` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''是否成功'',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ''备注'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id''
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ''操作日志'' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sale_menu
-- ----------------------------
DROP TABLE IF EXISTS `sale_menu`;
CREATE TABLE `sale_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''显示名'',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''url'',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT ''1 菜单 2按钮'',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''权限码'',
  `parentId` int(11) NULL DEFAULT NULL COMMENT ''父级id'',
  `creationTime` datetime(0) NULL DEFAULT NULL,
  `creatorUserId` int(11) NULL DEFAULT NULL,
  `isDeleted` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale_menu
-- ----------------------------
INSERT INTO `sale_menu` VALUES (1, ''控制台'', ''/dashboard'', 1, ''dashboard:show'', NULL, ''2018-08-29 14:18:03'', NULL, 0);
INSERT INTO `sale_menu` VALUES (2, ''订单系统'', NULL, 1, ''order:show'', NULL, ''2018-08-29 14:18:04'', NULL, 0);
INSERT INTO `sale_menu` VALUES (3, ''订单列表'', ''/order/list'', 1, ''order:list'', 2, ''2018-08-29 14:18:04'', NULL, 0);
INSERT INTO `sale_menu` VALUES (4, ''查看订单'', NULL, 2, ''order:list'', 3, ''2018-08-29 14:18:05'', NULL, 0);
INSERT INTO `sale_menu` VALUES (5, ''退款'', NULL, 2, ''order:back'', 3, ''2018-08-29 14:18:05'', NULL, 0);
INSERT INTO `sale_menu` VALUES (6, ''统计'', NULL, 2, ''order:statical'', 3, ''2018-08-29 14:18:05'', NULL, 0);
INSERT INTO `sale_menu` VALUES (7, ''点位管理'', NULL, 1, ''pointer:show'', NULL, ''2018-08-29 14:18:05'', NULL, 0);
INSERT INTO `sale_menu` VALUES (8, ''点位列表'', ''/pointer/point'', 1, ''point:list'', 7, ''2018-08-29 14:18:06'', NULL, 0);
INSERT INTO `sale_menu` VALUES (9, ''编辑点位'', NULL, 2, ''point:modify'', 8, ''2018-08-29 14:18:07'', NULL, 0);
INSERT INTO `sale_menu` VALUES (10, ''删除点位'', NULL, 2, ''point:delete'', 8, ''2018-08-29 14:18:07'', NULL, 0);
INSERT INTO `sale_menu` VALUES (11, ''批量删除点位'', NULL, 2, ''point:batch'', 8, ''2018-08-29 14:18:07'', NULL, 0);
INSERT INTO `sale_menu` VALUES (12, ''获取详情'', NULL, 2, ''point:first'', 8, ''2018-08-29 14:18:07'', NULL, 0);
INSERT INTO `sale_menu` VALUES (13, ''设备管理'', NULL, 1, ''devices:show'', NULL, ''2018-08-29 14:18:07'', NULL, 0);
INSERT INTO `sale_menu` VALUES (14, ''设备列表'', ''/device/list'', 1, ''device:list'', 13, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (15, ''编辑设备'', NULL, 2, ''device:modify'', 14, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (16, ''删除设备'', NULL, 2, ''device:delete'', 14, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (17, ''批量删除设备'', NULL, 2, ''device:batch'', 14, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (18, ''获取设备详情'', NULL, 2, ''device:first'', 14, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (19, ''配置商品'', NULL, 2, ''device:allow'', 14, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (20, ''获取设备下商品列表'', NULL, 2, ''device:getDeviceProduct'', 14, ''2018-08-29 14:18:08'', NULL, 0);
INSERT INTO `sale_menu` VALUES (21, ''货物管理'', NULL, 1, ''product:show'', NULL, ''2018-08-29 14:18:09'', NULL, 0);
INSERT INTO `sale_menu` VALUES (22, ''商品管理'', ''/product/list'', 1, ''product:list'', 21, ''2018-08-29 14:18:09'', NULL, 0);
INSERT INTO `sale_menu` VALUES (23, ''编辑商品'', NULL, 2, ''product:modify'', 22, ''2018-08-29 14:18:10'', NULL, 0);
INSERT INTO `sale_menu` VALUES (24, ''删除商品'', NULL, 2, ''product:delete'', 22, ''2018-08-29 14:18:10'', NULL, 0);
INSERT INTO `sale_menu` VALUES (25, ''批量删除商品'', NULL, 2, ''product:batch'', 22, ''2018-08-29 14:18:10'', NULL, 0);
INSERT INTO `sale_menu` VALUES (26, ''获取详情'', NULL, 2, ''product:first'', 22, ''2018-08-29 14:18:10'', NULL, 0);
INSERT INTO `sale_menu` VALUES (27, ''支付配置'', NULL, 1, ''pay:setting'', NULL, ''2018-08-29 14:18:11'', NULL, 0);
INSERT INTO `sale_menu` VALUES (28, ''支付设置'', ''/pay/alipay'', 1, ''pay:first'', 27, ''2018-08-29 14:18:11'', NULL, 0);
INSERT INTO `sale_menu` VALUES (29, ''修改配置'', NULL, 2, ''pay:modify'', 28, ''2018-08-29 14:18:12'', NULL, 0);
INSERT INTO `sale_menu` VALUES (30, ''监控系统'', NULL, 1, ''watch:show'', NULL, ''2018-08-29 14:18:12'', NULL, 0);
INSERT INTO `sale_menu` VALUES (31, ''后台操作日志'', ''/watch/action'', 1, ''actionlog:list'', 30, ''2018-08-29 14:18:13'', NULL, 0);
INSERT INTO `sale_menu` VALUES (32, ''删除日志'', NULL, 2, ''actionlog:delete'', 31, ''2018-08-29 14:18:14'', NULL, 0);
INSERT INTO `sale_menu` VALUES (33, ''批量删除日志'', NULL, 2, ''actionlog:batch'', 31, ''2018-08-29 14:18:14'', NULL, 0);
INSERT INTO `sale_menu` VALUES (34, ''监控运行日志'', ''/watch/run'', 1, ''runlog:list'', 30, ''2018-08-29 14:18:14'', NULL, 0);
INSERT INTO `sale_menu` VALUES (35, ''删除日志'', NULL, 2, ''runlog:delete'', 34, ''2018-08-29 14:18:15'', NULL, 0);
INSERT INTO `sale_menu` VALUES (36, ''批量删除日志'', NULL, 2, ''runlog:batch'', 34, ''2018-08-29 14:18:15'', NULL, 0);
INSERT INTO `sale_menu` VALUES (37, ''售货机故障日志'', ''/watch/error'', 1, ''errorlog:list'', 30, ''2018-08-29 14:18:15'', NULL, 0);
INSERT INTO `sale_menu` VALUES (38, ''删除日志'', NULL, 2, ''errorlog:delete'', 37, ''2018-08-29 14:18:16'', NULL, 0);
INSERT INTO `sale_menu` VALUES (39, ''批量删除日志'', NULL, 2, ''errorlog:batch'', 37, ''2018-08-29 14:18:16'', NULL, 0);
INSERT INTO `sale_menu` VALUES (40, ''报表系统'', NULL, 1, ''report:show'', NULL, ''2018-08-29 14:18:16'', NULL, 0);
INSERT INTO `sale_menu` VALUES (41, ''设备销量'', ''/watch/device'', 1, ''devicesale:list'', 40, ''2018-08-29 14:18:17'', NULL, 0);
INSERT INTO `sale_menu` VALUES (42, ''商品销量'', ''/watch/product'', 1, ''productsale:list'', 40, ''2018-08-29 14:18:18'', NULL, 0);
INSERT INTO `sale_menu` VALUES (43, ''设备备货信息'', ''/watch/dgp'', 1, ''deviceget:list'', 40, ''2018-08-29 14:18:18'', NULL, 0);
INSERT INTO `sale_menu` VALUES (44, ''设备故障记录'', ''/watch/de'', 1, ''devicewarn:list'', 40, ''2018-08-29 14:18:19'', NULL, 0);
INSERT INTO `sale_menu` VALUES (45, ''设备故障率'', ''/watch/dep'', 1, ''devicewarnper:list'', 40, ''2018-08-29 14:18:20'', NULL, 0);
INSERT INTO `sale_menu` VALUES (46, ''系统管理'', NULL, 1, ''system:show'', NULL, ''2018-08-29 14:18:22'', NULL, 0);
INSERT INTO `sale_menu` VALUES (47, ''用户管理'', ''/system/user'', 1, ''user:list'', 46, ''2018-08-29 14:18:26'', NULL, 0);
INSERT INTO `sale_menu` VALUES (48, ''编辑用户'', NULL, 2, ''user:modify'', 47, ''2018-08-29 14:18:27'', NULL, 0);
INSERT INTO `sale_menu` VALUES (49, ''删除用户'', NULL, 2, ''user:delete'', 47, ''2018-08-29 14:18:27'', NULL, 0);
INSERT INTO `sale_menu` VALUES (50, ''批量删除用户'', NULL, 2, ''user:batch'', 47, ''2018-08-29 14:18:27'', NULL, 0);
INSERT INTO `sale_menu` VALUES (51, ''获取详情'', NULL, 2, ''user:first'', 47, ''2018-08-29 14:18:27'', NULL, 0);
INSERT INTO `sale_menu` VALUES (52, ''分类管理'', ''/system/user'', 1, ''category:list'', 46, ''2018-08-29 14:18:29'', NULL, 0);
INSERT INTO `sale_menu` VALUES (53, ''编辑分类'', NULL, 2, ''category:modify'', 52, ''2018-08-29 14:18:30'', NULL, 0);
INSERT INTO `sale_menu` VALUES (54, ''删除分类'', NULL, 2, ''category:delete'', 52, ''2018-08-29 14:18:30'', NULL, 0);
INSERT INTO `sale_menu` VALUES (55, ''批量删除分类'', NULL, 2, ''category:batch'', 52, ''2018-08-29 14:18:30'', NULL, 0);
INSERT INTO `sale_menu` VALUES (56, ''获取分类'', NULL, 2, ''category:first'', 52, ''2018-08-29 14:18:30'', NULL, 0);
INSERT INTO `sale_menu` VALUES (57, ''角色管理'', ''/system/role'', 1, ''role:list'', 46, ''2018-08-29 14:18:31'', NULL, 0);
INSERT INTO `sale_menu` VALUES (58, ''编辑角色'', NULL, 2, ''role:modify'', 57, ''2018-08-29 14:18:31'', NULL, 0);
INSERT INTO `sale_menu` VALUES (59, ''删除角色'', NULL, 2, ''role:delete'', 57, ''2018-08-29 14:18:31'', NULL, 0);
INSERT INTO `sale_menu` VALUES (60, ''批量删除角色'', NULL, 2, ''role:batch'', 57, ''2018-08-29 14:18:31'', NULL, 0);
INSERT INTO `sale_menu` VALUES (61, ''获取详情'', NULL, 2, ''role:first'', 57, ''2018-08-29 14:18:31'', NULL, 0);
INSERT INTO `sale_menu` VALUES (62, ''租户管理'', ''/system/tenant'', 1, ''tenant:list'', 46, ''2018-08-29 14:18:32'', NULL, 0);
INSERT INTO `sale_menu` VALUES (63, ''编辑租户'', NULL, 2, ''tenant:modify'', 62, ''2018-08-29 14:18:32'', NULL, 0);
INSERT INTO `sale_menu` VALUES (64, ''删除租户'', NULL, 2, ''tenant:delete'', 62, ''2018-08-29 14:18:32'', NULL, 0);
INSERT INTO `sale_menu` VALUES (65, ''批量删除租户'', NULL, 2, ''tenant:batch'', 62, ''2018-08-29 14:18:32'', NULL, 0);
INSERT INTO `sale_menu` VALUES (66, ''获取租户详情'', NULL, 2, ''tenant:first'', 62, ''2018-08-29 14:18:32'', NULL, 0);

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''key'',
  `productName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''商品名'',
  `productId` int(11) NULL DEFAULT NULL COMMENT ''商品id'',
  `price` int(10) NULL DEFAULT NULL COMMENT ''价格'',
  `wechatOrder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''微信订单'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `orderState` int(255) NULL DEFAULT NULL COMMENT ''订单状态'',
  `payState` int(10) NULL DEFAULT NULL COMMENT ''支付状态'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `deviceId` int(10) NULL DEFAULT NULL COMMENT ''设备id'',
  `deviceName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''设备名'',
  `deviceType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''设备类型'',
  `pointName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''点位名'',
  `payType` int(10) NULL DEFAULT NULL COMMENT ''支付类型'',
  `backNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''退款单号'',
  `deviceNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''设备编码'',
  `pointId` int(11) NULL DEFAULT NULL COMMENT ''点位id'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES (''05171906a7d840f9bc9ed157755c63d1'', ''a'', 1, 123, ''008796749283503_1535639970159'', ''2018-09-03 14:39:30'', 1, 1, 1, 1, 3, ''MuMu'', NULL, ''西单商城正门'', 1, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''22f5415558d24591a4c33d245a725a93'', ''awdawd'', 3, 20000, ''008796749283503_1536245120580'', ''2018-09-06 14:45:21'', 1, 1, 1, 1, 689, ''MuMu'', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''4dcaef3a68604665887cdee693097fb2'', ''a'', 1, 12, ''008796749283503_1535639386620'', ''2018-08-30 14:29:47'', 1, 1, 1, 1, 3, ''MuMu'', NULL, ''西单商城正门'', 2, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''79a7a5833c5e4f7babaa52dd06d40f76'', ''a'', 1, 3, ''008796749283503_1535639305429'', ''2018-08-30 14:28:25'', 1, 1, 1, 1, 3, ''MuMu'', NULL, ''中友百货西侧电梯'', 2, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''930b60ee6ed44b33af527b83d864251d'', ''生鲜测试'', 5, 40000, ''008796749283503_1536245132963'', ''2018-09-06 14:45:33'', 1, 1, 1, 1, 689, ''MuMu'', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''a40b6d1c52974bd0bb19e7c120b710e1'', ''d'', 4, 2, ''008796749283503_1535640332218'', ''2018-09-03 08:45:32'', 1, 1, 1, 1, 3, ''MuMu'', NULL, ''中友百货西侧电梯'', 1, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''b48e103036674c519517e455369724a1'', ''黄蜂女'', 10, 4900, ''867551031022241_1536581613449'', ''2018-09-10 12:13:33'', 1, 1, 1, 1, 691, ''COL-AL10'', ''格子机'', ''复兴商业城正门'', 1, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''c3796d407171480da67e43510cb0e22b'', ''d'', 4, 33, ''008796749283503_1535639148637'', ''2018-09-03 11:25:49'', 1, 1, 1, 1, 3, ''MuMu'', NULL, '''', 2, NULL, NULL, NULL);
INSERT INTO `sale_order` VALUES (''cb19033577564c11a532d51a26896c67'', ''f'', 6, 11, ''008796749283503_1535639906982'', ''2018-08-30 14:38:27'', 1, 0, 2, 1, 3, ''MuMu'', NULL, ''新东安商城百货区'', 1, ''31535686929523'', NULL, NULL);
INSERT INTO `sale_order` VALUES (''fea80c2d79964b13822af394e77367ff'', ''g'', 7, 11, ''008796749283503_1535640321727'', ''2018-08-30 14:45:22'', 1, 1, 1, 1, 3, ''MuMu'', NULL, ''新东安商城百货区'', 2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sale_payfor
-- ----------------------------
DROP TABLE IF EXISTS `sale_payfor`;
CREATE TABLE `sale_payfor`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `operatorId` int(10) NULL DEFAULT NULL COMMENT ''运营商key'',
  `alipayId` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''阿里key'',
  `alipayKey` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT ''阿里密钥'',
  `alipayAgent` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''阿里保留'',
  `wechatpayId` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''微信id'',
  `wechatpayKey` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''微信key'',
  `wechatpayAgent` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''微信保留'',
  `creationTime` datetime(0) NULL DEFAULT NULL,
  `creatorUserId` int(11) NULL DEFAULT NULL,
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `cardUrl` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''退款证书地址'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_payfor
-- ----------------------------
INSERT INTO `sale_payfor` VALUES (1, NULL, ''2018081761055752'', ''MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCIPoCV0lNqbZnyNr+Jh81jlxkAP4JSgfIw9fIYdsAtRY2GnuQTSQ2MZ2Br8HkA8bvW/v5qxpS3KgiPoMdes0HIU6KIY4FbvhPs+kY1U231NnI7+qcnXIfQmlOSDqh23L+Ray6w23h0c8y/QqqooJgTbMgHwVU3ZGcrA7hGmMxQU6DT0eR3wZlp+RMW9kKUi3XyXzsE9ca91ZP5bEx9g1akNNqh38v7QMouQr3SlIJnLa5kPj8R2R7GOEobJwR9kpsiP4KjLia4l47ecXS6OGwwmjs9Dhk8GMmGP5+zPRizqTTxfiNZrArzXDpUWbjWMDrJdVxSGsHd7VyBFJ9bzps3AgMBAAECggEAIGU0L+ud1/2NkFFCQ9JdnOONl0iClVm+m7OvR+/cjCcwmqTnOEqzhQIDpEa+juHrtxhUqFDlhZPiCzzAixz2dEqmp+V5GbZdiIiN7xoSWC8FBIv5+NsAlDJN0rnXhsPAbTReGsFkp9PtCEEy0Pu2jU/dVDK9L3mZKlotE+Q7GJIgiIb7VVVXJ1VTQs/8hKlREFt9DApv5r8Tg5ZyuCmhbgoediHrBuNaBg/LlMc6p3K4J1S4hE3LTMQ58S5X9G3SMuSdX7dCWYcft8xFROkYLU1BJ7STHW6u4YhxWH9ZLOFlYJaYfIfEYqt37o3DDxwMNC5VJNk0iCCdy51a0tFG+QKBgQDSP+snFk46B2fKRixrb9xxq+F9ET6bS4ICZSq1EHn2qFIkqwzhYPhq9QtB4BIMCDqHN1S2Eju4GDZSiUwHeDQx/H+NiQ8W0LEnpufr/qYxqWdeafYi2VvLZf9cmYDg0wDIfwfgfqVKkY6vGeQe1ATbXsLkYm1H7ymvxmJaVbxQGwKBgQCl5A/xoiqjG3VlZffusM1Y+/r7z8/g7OnqNu2wF0rU18R5iYmcgaJd6zw4qiFZMyVuA0kNDDGW77pk9UpWELltyO8NdaYNHdehV086vsj/qNYicqHDyW8aBHc3Xy6c6DBlL6YqGKTsViyWWZAbSKT8OEUzEQEwHZDUsfh1vy6rFQKBgHYh0eeBYey68nc1nIm1LWB1Gdoi0VGCSIc9/pQDsPOFObo+nZsY2BuImY2m75zxFqmYzjEK56EVgZg4ao6b3H/lhmmpA+Bm29MStabkys6Gh30F/nUwOaJ8KdIGseIgzITa0zsxDYBrboc1/fXQXPZBNTILl6leWMbZqbNmDsvXAoGAA7FvFW8JyfXLiEVb3ql6+NcrQD3hH93GW1t7sSbjmJdxHU+Ni7lrFvIstgo7kdPMqoVSNAMoe3a8zJCVZhMbPbFyePc8iiA287WQ4vrqWJ62na+1oDk0yvx8dvQcgou8wBPufBNuYICOn45A4gqc+ax7BecEAsE1vzZzFJP8Av0CgYAwUetcp95ZV94jJuJUjAuUmouUQqpHgmmFNaYYtJygoM6u8MX+xRrnHqOIWf2hY7t/qTpsvPnNtRCfOLRBfQl1rxEC/MV4M2wtNF+yRuBu5uCTFiN3QDP59ucif0v7/z3/EBvaqTw8ue3obhuAmAKMFiJymHBsSH5r9OfyoTJ5sQ=='', ''MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnczbStReC4vk4aoE3VT0Crgt/EsvGtNdj6bYmEOLxWSPNeNndrERSJEdszFzBzSQLki5p2reo2uQiJLvnf8njkxZ4jM+6410ZGXOinK9r/SYoq9Wq3FAvmNUCsAovaOpAxe3pIrNe7ZdWWoghSQ0dYPrityK2pC0nxPUwu5qrr8Xn0Zv7jCA19aqPaAbIeKjcgvn/Gxd6ApzO7AronGBEnHq1kUDptUvya70j/UmmfgCM049thH/WzvkvZt/5KR/1lTAEW3oLYdvjEiS1HWUzRzp1bZbYJd0iXXIaQ61vfaZ7iLdo39LINkHCtN8HKGyyGLW+QlUTkScw642x8kV6QIDAQAB'', ''wx3462f1fc533ebe71'', ''1q2w3e4r5t6y7u8i9o0p1q2w3e4r5t6y'', ''1471344102'', ''2018-08-30 14:13:46'', 1, 1, ''/data/secrit/1/apiclient_cert.p12'');

-- ----------------------------
-- Table structure for sale_point
-- ----------------------------
DROP TABLE IF EXISTS `sale_point`;
CREATE TABLE `sale_point`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `pointName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''点位名'',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''地址'',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''i奥数'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `isDeleted` tinyint(2) NULL DEFAULT 0 COMMENT ''软删除  '',
  `x` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''x坐标'',
  `y` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''y坐标'',
  `areaId` int(11) NULL DEFAULT NULL COMMENT ''区域id'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_point
-- ----------------------------
INSERT INTO `sale_point` VALUES (1, ''西单商城2层南侧'', ''西城区西单北大街120号'', ''西单商城2层南侧'', ''2018-08-30 02:12:10'', 1, 0, ''116.38148'', ''39.914322'', 16, 1);
INSERT INTO `sale_point` VALUES (2, ''西单商城3层北侧'', ''西城区西单北大街120号'', ''西单商城3层北侧'', ''2018-08-30 02:12:24'', 1, 0, ''116.381381'', ''39.914419'', 16, 1);
INSERT INTO `sale_point` VALUES (3, ''西单商城正门'', ''西城区西单北大街120号'', ''西单商城正门'', ''2018-08-30 02:13:21'', 1, 0, ''116.381686'', ''39.914363'', 16, 1);
INSERT INTO `sale_point` VALUES (4, ''测试点位'', ''121'', ''1'', ''2018-09-05 01:53:17'', 26, 0, ''116.421751'', ''39.908082'', 7, 23);
INSERT INTO `sale_point` VALUES (5, ''复兴商业城正门'', ''西城区复兴门外大街4号'', ''复兴商业城正门'', ''2018-09-05 03:15:30'', 1, 0, ''116.371912'', ''39.914696'', 17, 1);
INSERT INTO `sale_point` VALUES (6, ''复兴商业城1层南侧'', ''西城区复兴门外大街4号'', ''复兴商业城1层南侧'', ''2018-09-05 03:16:23'', 1, 0, ''116.372774'', ''39.913976'', 17, 1);
INSERT INTO `sale_point` VALUES (7, ''长安商城二层西侧'', ''西城区复兴门外大街1号'', ''长安商城二层西侧'', ''2018-09-05 03:39:51'', 1, 0, ''116.368966'', ''39.91381'', 27, 1);
INSERT INTO `sale_point` VALUES (8, ''长安商城正门大厅东侧'', ''西城区复兴门外大街1号'', ''长安商城正门大厅东侧'', ''2018-09-05 03:40:53'', 1, 0, ''116.372846'', ''39.913976'', 27, 1);
INSERT INTO `sale_point` VALUES (9, ''中友百货入口西侧'', ''西城区西单北大街176号（华南大厦）'', ''中友百货入口西侧'', ''2018-09-05 04:58:37'', 1, 0, ''116.381685'', ''39.914751'', 28, 1);
INSERT INTO `sale_point` VALUES (10, ''中友百货西侧电梯'', ''中友百货入口西侧'', ''中友百货西侧电梯'', ''2018-09-05 04:59:14'', 1, 0, ''116.382547'', ''39.914751'', 28, 1);
INSERT INTO `sale_point` VALUES (11, ''北京秀水街西区'', ''朝阳区秀水东街8号'', ''北京秀水街西区'', ''2018-09-05 05:00:11'', 1, 0, ''116.457861'', ''39.915194'', 34, 1);
INSERT INTO `sale_point` VALUES (12, ''北京秀水街西区2'', ''朝阳区秀水东街8号'', ''北京秀水街'', ''2018-09-05 05:01:01'', 1, 0, ''116.458436'', ''39.914862'', 34, 1);
INSERT INTO `sale_point` VALUES (13, ''北京秀水街南门入口'', ''朝阳区秀水东街8号'', ''北京秀水街南门入口'', ''2018-09-05 05:01:27'', 1, 0, ''116.458436'', ''39.915083'', 34, 1);
INSERT INTO `sale_point` VALUES (14, ''新东安商城A座电梯'', ''东城区王府井大街138号'', ''新东安商城A座电梯'', ''2018-09-05 05:03:44'', 1, 0, ''116.422216'', ''39.927534'', 6, 1);
INSERT INTO `sale_point` VALUES (15, ''新东安商城百货区'', ''东城区王府井大街138号'', ''新东安商城百货区'', ''2018-09-05 05:04:21'', 1, 0, ''116.422288'', ''39.927977'', 6, 1);
INSERT INTO `sale_point` VALUES (16, ''华堂商城（丰台北路店）正门入口'', ''东城区王府井大街255号'', ''华堂商城（丰台北路店）正门入口'', ''2018-09-05 05:05:58'', 1, 0, ''116.416898'', ''39.917408'', 33, 1);
INSERT INTO `sale_point` VALUES (17, ''华堂商城（丰田北路店）东侧电梯对面'', ''东城区王府井大街255号'', ''华堂商城（丰田北路店）东侧电梯对面'', ''2018-09-05 05:06:42'', 1, 0, ''116.416682'', ''39.917851'', 33, 1);
INSERT INTO `sale_point` VALUES (18, ''华堂商城（丰台北路店）顶层入口'', ''东城区王府井大街255号	'', ''华堂商城（丰台北路店）顶层入口'', ''2018-09-05 05:08:10'', 1, 0, ''116.416682'', ''39.917796'', 33, 1);
INSERT INTO `sale_point` VALUES (19, ''燕莎友谊商城一层首饰区对面'', ''朝阳区亮马桥路52号'', ''燕莎友谊商城一层首饰区对面'', ''2018-09-05 05:11:10'', 1, 0, ''116.472341'', ''39.955043'', 14, 1);
INSERT INTO `sale_point` VALUES (20, ''燕莎友谊商城一层西侧'', ''朝阳区亮马桥路52号'', ''燕莎友谊商城一层西侧'', ''2018-09-05 05:11:58'', 1, 0, ''116.472161'', ''39.956287'', 14, 1);
INSERT INTO `sale_point` VALUES (21, ''燕莎友谊商城一层电梯口'', ''朝阳区亮马桥路52号'', ''燕莎友谊商城一层电梯口'', ''2018-09-05 05:12:39'', 1, 0, ''116.476473'', ''39.95702'', 14, 1);
INSERT INTO `sale_point` VALUES (22, ''赛特购物中心正门入口'', ''朝阳区建国门外大街22号'', ''赛特购物中心正门入口'', ''2018-09-05 05:13:43'', 1, 0, ''116.448464'', ''39.913051'', 15, 1);
INSERT INTO `sale_point` VALUES (23, ''赛特购物中心一层会员区'', ''朝阳区建国门外大街22号'', ''赛特购物中心一层会员区'', ''2018-09-05 05:14:24'', 1, 0, ''116.448949'', ''39.913037'', 15, 1);
INSERT INTO `sale_point` VALUES (24, ''赛特购物中心二层东侧'', ''朝阳区建国门外大街22号'', ''赛特购物中心二层东侧'', ''2018-09-05 05:15:35'', 1, 0, ''116.448446'', ''39.913037'', 15, 1);
INSERT INTO `sale_point` VALUES (25, ''蓝鸟大厦正门入口'', ''朝阳区朝阳门外大街8号'', ''蓝鸟大厦正门入口'', ''2018-09-05 05:17:43'', 1, 0, ''116.457214'', ''39.927784'', 20, 1);
INSERT INTO `sale_point` VALUES (26, ''蓝鸟大厦大厅'', ''朝阳区朝阳门外大街8号'', ''蓝鸟大厦大厅'', ''2018-09-05 05:18:33'', 1, 0, ''116.457267'', ''39.927815'', 20, 1);
INSERT INTO `sale_point` VALUES (27, ''北辰购物中心二层扶梯西侧'', ''朝阳区安立路8号'', ''北辰购物中心二层扶梯西侧'', ''2018-09-05 05:22:14'', 1, 0, ''116.414598'', ''40.005948'', 23, 1);
INSERT INTO `sale_point` VALUES (28, ''北辰购物中心二层扶梯东侧'', ''朝阳区安立路8号'', ''北辰购物中心二层扶梯东侧'', ''2018-09-05 05:25:12'', 1, 0, ''116.414923'', ''40.006362'', 23, 1);
INSERT INTO `sale_point` VALUES (29, ''北辰购物中心正门入口'', ''朝阳区安立路8号'', ''北辰购物中心正门入口'', ''2018-09-05 05:26:20'', 1, 0, ''116.414779'', ''40.007081'', 23, 1);
INSERT INTO `sale_point` VALUES (30, ''贵友大厦正门入口东侧'', ''北京市朝阳区建国门外大街甲5号'', ''贵友大厦正门入口东侧'', ''2018-09-05 05:31:58'', 1, 0, ''116.458616'', ''39.915112'', 25, 1);
INSERT INTO `sale_point` VALUES (31, ''贵友大厦一层西侧'', ''北京市朝阳区建国门外大街甲5号'', ''贵友大厦一层西侧'', ''2018-09-05 05:32:31'', 1, 0, ''116.458041'', ''39.914891'', 25, 1);
INSERT INTO `sale_point` VALUES (32, ''贵友大厦一层东侧'', ''北京市朝阳区建国门外大街甲5号'', ''贵友大厦一层东侧'', ''2018-09-05 05:33:10'', 1, 0, ''116.458472'', ''39.914227'', 25, 1);
INSERT INTO `sale_point` VALUES (33, ''王府井洋华堂'', ''朝阳区劲松南路劲松桥东南角'', ''王府井洋华堂'', ''2018-09-05 05:35:19'', 1, 0, ''116.468461'', ''39.890205'', 29, 1);
INSERT INTO `sale_point` VALUES (34, ''飘亮购物中心 '', ''朝阳区安立路68号'', ''飘亮购物中心 '', ''2018-09-05 05:36:22'', 1, 0, ''116.415209'', ''40.007193'', 32, 1);
INSERT INTO `sale_point` VALUES (35, ''新世界商场'', ''崇文区崇文门外大街3号'', ''新世界商场'', ''2018-09-05 05:38:04'', 1, 0, ''116.424587'', ''39.904224'', 21, 1);
INSERT INTO `sale_point` VALUES (36, ''顺义国泰'', ''顺义区新顺南大街2号'', ''顺义国泰'', ''2018-09-05 05:39:40'', 1, 0, ''116.658649'', ''40.135688'', 26, 1);
INSERT INTO `sale_point` VALUES (37, '' 昌平新世纪商场'', ''北京市昌平区土城村东桥'', '' 昌平新世纪商场'', ''2018-09-05 05:40:43'', 1, 0, ''116.199839'', ''40.194471'', 30, 1);

-- ----------------------------
-- Table structure for sale_product
-- ----------------------------
DROP TABLE IF EXISTS `sale_product`;
CREATE TABLE `sale_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `productName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''商品名'',
  `productNum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''商品编号'',
  `productType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''商品类型'',
  `price` int(10) NULL DEFAULT NULL COMMENT ''默认价格'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `isDeleted` tinyint(2) NULL DEFAULT 0 COMMENT ''软删除  '',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `description` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''描述'',
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''图片路径'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_product
-- ----------------------------
INSERT INTO `sale_product` VALUES (1, ''111'', ''111'', ''ces'', 100, ''2018-08-30 11:59:09'', 1, 0, 1, NULL, ''/img/20180830/1535630346741.bmp'');
INSERT INTO `sale_product` VALUES (2, ''123'', ''321'', ''测试'', 1, ''2018-09-05 01:48:14'', 26, 0, 23, NULL, NULL);
INSERT INTO `sale_product` VALUES (3, ''awdawd'', ''aawdawd'', ''wwww'', 33200, ''2018-09-05 12:49:36'', 1, 0, 1, ''awdawdawd'', NULL);
INSERT INTO `sale_product` VALUES (4, ''测试商品'', ''ceshi001'', ''ces'', 12331100, ''2018-09-05 13:50:10'', 1, 0, 1, ''11'', NULL);
INSERT INTO `sale_product` VALUES (5, ''生鲜测试'', ''0012'', ''生鲜'', 1500, ''2018-09-06 07:45:46'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (6, ''牛奶咖啡'', ''yuanren001'', ''咖啡'', 1550, ''2018-09-10 04:37:16'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (7, ''拿铁'', ''yuanren002'', ''咖啡'', 1700, ''2018-09-10 04:37:44'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (8, ''摩卡'', ''yuanren003'', ''咖啡'', 1650, ''2018-09-10 04:38:50'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (9, ''超人一号（男）'', ''yuanren004'', ''玩偶'', 4900, ''2018-09-10 04:39:31'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (10, ''黄蜂女'', ''yuanren005'', ''玩偶'', 4900, ''2018-09-10 04:39:53'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (11, ''成吉思汗头像'', ''yuaren006'', ''纪念币'', 4000, ''2018-09-10 04:40:15'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (12, ''可乐零度'', ''yuanren007'', ''饮料'', 400, ''2018-09-10 04:40:42'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (13, ''可乐'', ''yuanren007'', ''饮料'', 400, ''2018-09-10 04:41:00'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (14, ''雪碧'', ''yuaren008'', ''饮料'', 400, ''2018-09-10 04:41:18'', 1, 0, 1, NULL, NULL);
INSERT INTO `sale_product` VALUES (15, ''三文鱼'', ''yuanren10'', ''生鲜'', 3500, ''2018-09-10 04:41:43'', 1, 0, 1, NULL, NULL);

-- ----------------------------
-- Table structure for sale_role
-- ----------------------------
DROP TABLE IF EXISTS `sale_role`;
CREATE TABLE `sale_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''name'',
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''显示名'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `isActive` tinyint(2) NULL DEFAULT NULL COMMENT ''启用状态'',
  `isStatic` tinyint(4) NULL DEFAULT NULL COMMENT ''是否静态'',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''描述'',
  `isDeleted` int(11) NULL DEFAULT 0,
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  PRIMARY KEY (`id`, `roleName`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale_role
-- ----------------------------
INSERT INTO `sale_role` VALUES (1, ''admin'', ''admin'', ''2018-08-29 14:18:01'', NULL, 1, 0, NULL, 0, 1);
INSERT INTO `sale_role` VALUES (2, ''default'', ''default'', ''2018-08-29 14:18:02'', NULL, 1, 1, NULL, 0, 1);
INSERT INTO `sale_role` VALUES (3, ''test'', ''测试权限的'', ''2018-08-29 14:32:23'', 1, 1, NULL, ''嗡嗡嗡'', 0, 1);
INSERT INTO `sale_role` VALUES (4, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 2);
INSERT INTO `sale_role` VALUES (5, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 2);
INSERT INTO `sale_role` VALUES (6, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 3);
INSERT INTO `sale_role` VALUES (7, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 3);
INSERT INTO `sale_role` VALUES (8, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 4);
INSERT INTO `sale_role` VALUES (9, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 4);
INSERT INTO `sale_role` VALUES (10, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 5);
INSERT INTO `sale_role` VALUES (11, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 5);
INSERT INTO `sale_role` VALUES (12, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 6);
INSERT INTO `sale_role` VALUES (13, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 6);
INSERT INTO `sale_role` VALUES (14, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 7);
INSERT INTO `sale_role` VALUES (15, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 7);
INSERT INTO `sale_role` VALUES (16, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 8);
INSERT INTO `sale_role` VALUES (17, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 8);
INSERT INTO `sale_role` VALUES (18, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 9);
INSERT INTO `sale_role` VALUES (19, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 9);
INSERT INTO `sale_role` VALUES (20, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 10);
INSERT INTO `sale_role` VALUES (21, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 10);
INSERT INTO `sale_role` VALUES (22, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 11);
INSERT INTO `sale_role` VALUES (23, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 11);
INSERT INTO `sale_role` VALUES (24, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 12);
INSERT INTO `sale_role` VALUES (25, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 12);
INSERT INTO `sale_role` VALUES (26, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 13);
INSERT INTO `sale_role` VALUES (27, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 13);
INSERT INTO `sale_role` VALUES (28, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 14);
INSERT INTO `sale_role` VALUES (29, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 14);
INSERT INTO `sale_role` VALUES (30, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 15);
INSERT INTO `sale_role` VALUES (31, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 15);
INSERT INTO `sale_role` VALUES (32, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 16);
INSERT INTO `sale_role` VALUES (33, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 16);
INSERT INTO `sale_role` VALUES (34, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 17);
INSERT INTO `sale_role` VALUES (35, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 17);
INSERT INTO `sale_role` VALUES (36, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 18);
INSERT INTO `sale_role` VALUES (37, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 18);
INSERT INTO `sale_role` VALUES (38, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 19);
INSERT INTO `sale_role` VALUES (39, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 19);
INSERT INTO `sale_role` VALUES (40, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 20);
INSERT INTO `sale_role` VALUES (41, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 20);
INSERT INTO `sale_role` VALUES (42, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 21);
INSERT INTO `sale_role` VALUES (43, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 21);
INSERT INTO `sale_role` VALUES (44, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 22);
INSERT INTO `sale_role` VALUES (45, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 22);
INSERT INTO `sale_role` VALUES (46, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 23);
INSERT INTO `sale_role` VALUES (47, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 23);
INSERT INTO `sale_role` VALUES (48, ''测试角色'', ''测试角色'', ''2018-09-05 01:57:46'', 26, 1, NULL, NULL, 0, 23);
INSERT INTO `sale_role` VALUES (49, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 24);
INSERT INTO `sale_role` VALUES (50, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 24);
INSERT INTO `sale_role` VALUES (51, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 25);
INSERT INTO `sale_role` VALUES (52, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 25);
INSERT INTO `sale_role` VALUES (53, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 26);
INSERT INTO `sale_role` VALUES (54, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 26);
INSERT INTO `sale_role` VALUES (55, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 27);
INSERT INTO `sale_role` VALUES (56, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 27);
INSERT INTO `sale_role` VALUES (57, ''ceshi'', ''ceshi'', ''2018-09-05 14:21:06'', 34, NULL, NULL, NULL, 0, 27);
INSERT INTO `sale_role` VALUES (58, ''admin'', ''admin'', NULL, NULL, 1, 0, NULL, 0, 28);
INSERT INTO `sale_role` VALUES (59, ''default'', ''default'', NULL, NULL, 1, 1, NULL, 0, 28);
INSERT INTO `sale_role` VALUES (60, ''ceshi'', ''ceshi'', ''2018-09-06 07:47:32'', 36, 1, NULL, ''11'', 0, 28);

-- ----------------------------
-- Table structure for sale_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `sale_rolemenu`;
CREATE TABLE `sale_rolemenu`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''guid'',
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  INDEX `ix_roleId`(`roleId`) USING BTREE,
  INDEX `ix_menuId`(`menuId`) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`roleId`) REFERENCES `sale_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale_rolemenu
-- ----------------------------
INSERT INTO `sale_rolemenu` VALUES (''ddd229e4312941e0b29fbe547cf25b06'', 1, 1, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''89248fbbe3fc40d3b121480a4bdb38a7'', 1, 2, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''a2c2e4599376445fb5a376b66ce78220'', 1, 3, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''db0c9448c9494ac7bd905d3d6aafd6fe'', 1, 4, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''82df8f1ec0cc4b94aa84f025d7ae7ecb'', 1, 5, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''8350530d12fb40e4bd1fc9a21a75af50'', 1, 6, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''6257f8c13a7241dfbb70c88da7bdf86d'', 1, 7, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''f1625f4a3e55476594331cdc3cd35990'', 1, 8, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''ad0db63cf3cc421ba468f42993ee5f0e'', 1, 9, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''a2777057fb27480a94f47209c5c0ab0a'', 1, 10, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''d73277d50edc4b26b077f885fbf82ccf'', 1, 11, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''d79b71ed262c42218c62ae2d86d05169'', 1, 12, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''6a7b4df9c82d4802a5cde1129ae01e93'', 1, 13, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''d12085bc14694951a8203a5730a83d55'', 1, 14, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''276d841f3ecf47b38acaf322f75b300e'', 1, 15, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''c2fd06dbe76744f1aa99105f9d2bc126'', 1, 16, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''4de15cf7a7844ed9b843be0e01bdf2f2'', 1, 17, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''85a5ebe2bf5b4a7cad39c699108eb17c'', 1, 18, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''60383e08f5b247cbaf0e261cb4b19c19'', 1, 19, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''22f21e5d6165402193307fe36d1f2631'', 1, 20, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''73217cb687b94ae587e3b9ba0915d337'', 1, 21, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''7e7737202b9b4750bb3b6435de327aec'', 1, 22, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''e8b0ef683e3447028b3dc418098d3215'', 1, 23, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''8a788cdb32aa41fc929c567fdd717a1e'', 1, 24, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''fc7800b3271540d2850ed7ed8f999964'', 1, 25, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''f18ba5acbaa142829c54dc61da06fb8e'', 1, 26, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''2391c40aaf7d404184a5f93a13c5e1b3'', 1, 27, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''a865b6dc8fe046aa99e0866f8e6f79e0'', 1, 28, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''7c418a1a702e477c826410a4b42e861d'', 1, 29, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''701e4e29b536452e8436a0d2c47e19af'', 1, 30, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''06496fa96a2f4201a856aaef156e2897'', 1, 31, 1, ''2018-08-29 14:18:33'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''bbe1415839734c98b7931789f2421b29'', 1, 32, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''688211de3e08411bbc1057ce11821bf9'', 1, 33, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''6171b0b85fbb4732bdda14ba2efaf327'', 1, 34, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''4e8072687613463e8026fc0b945be641'', 1, 35, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''f0990a19de7741af90c446c29d4b159f'', 1, 36, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''b187d087ff2d45b5a9ee07eb260872a7'', 1, 37, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''495a4698ab304968890e0e303fb31bd9'', 1, 38, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''a09922547eda4904a55e4f4c099a368f'', 1, 39, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''c4a59e120d9c4c498eedb1f57b647b53'', 1, 40, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''06bc9695bdaa4a7b9ad07148fea63b5a'', 1, 41, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''c0d2014ac12946d7b47e13cece230703'', 1, 42, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''e4dab146b85740389061a041aadae6b5'', 1, 43, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''4b174daf3c75482bacf9133d30e7ef52'', 1, 44, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''4392481019834773917054aac2097024'', 1, 45, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''5ffe72d2acdc48baa695fc456647977f'', 1, 46, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''6bb66c9a71c14f918a4872df47c4ce8d'', 1, 47, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''3f9780d977e34d9d8ab706a2eb0c17a6'', 1, 48, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''5b0a809394fd486a961b83c0e28a5d2e'', 1, 49, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''02284a3b897d4bb9aa8fdeef802921bd'', 1, 50, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''14ae319167d14afd870f410fc383a88e'', 1, 51, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''aad6b42c707f4efabdb3d1f47cc34416'', 1, 52, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''106d5375c9194406ad060da55403ce7f'', 1, 53, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''f644247700bd4dec96b00163792aca81'', 1, 54, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''0fdff1d67c944e51a7f2564870b8fe69'', 1, 55, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''e0be0d249bcf496da3b321ea1db41b5e'', 1, 56, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''14d39c983e7f4a51a84fbac90cd63525'', 1, 57, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''781c9529a3324b578ef0c13c6521d43e'', 1, 58, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''43bbec50b8c04f069b6eb8e0d09f7471'', 1, 59, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''b26dcdb0f5924e44b425b161827f0a20'', 1, 60, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''cb5dcbc80e7c4b958904b471131a5a95'', 1, 61, 1, ''2018-08-29 14:18:36'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''33dc1354bfb646ec95da79f7ba71a586'', 1, 62, 1, ''2018-08-29 14:18:38'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''4bd3e898968642579a0779629bb9a36d'', 1, 63, 1, ''2018-08-29 14:18:38'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''fdd3a172d29c47ffb621d44b5d027c24'', 1, 64, 1, ''2018-08-29 14:18:38'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''01bc5ae311e148f9be29845411fb38e1'', 1, 65, 1, ''2018-08-29 14:18:38'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''dc74fef525824af2ae84c371a8f73e0a'', 1, 66, 1, ''2018-08-29 14:18:38'', NULL);
INSERT INTO `sale_rolemenu` VALUES (''8ef4fc2a090d40578937312c0b5e9832'', 3, 2, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''1facb7ec4dd84241ab43ee270fe3f7b5'', 3, 3, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''8dfd607ff30b4accb3d2211b21d114bc'', 3, 4, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''73df757851dc4928bf92dd761e176a09'', 3, 5, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''1ef0446665734f5eb041728c8d3840a6'', 3, 6, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''f90d881cce3f4bf5866c86d0d38a0c4f'', 3, 7, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''5d6c6bcc7ed74427ad47654efef77d68'', 3, 8, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''b8089013dfe3465b96d716e71b1e99cd'', 3, 9, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''97a52d34ec32493da3600c19fe1e0b72'', 3, 10, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''91ed8fee6cea43298dccd9aa34a21d28'', 3, 11, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''79196ce30171452e9f2011a7f26e80a6'', 3, 12, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''7bb77a5e943f468c9b3c9b55a0300305'', 3, 13, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''80fdfea8e4ca4c3d8638a46d9ec50b39'', 3, 14, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''1daa111a5a3c4834bca9d278f8def389'', 3, 15, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''21edb242d8614bfda9883d2fcef42f41'', 3, 16, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''3d31a7cc7ce94a808214d8a1b7c6584e'', 3, 17, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''735a99cc2b444363930ae6708beb93ca'', 3, 18, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''e1e4e0fe23a64bd4b6508684d7ac2b28'', 3, 19, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''d82fe00ed3414381ad4cb990e0a00d7c'', 3, 20, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''508eea6cb969416d877c8f8045a46945'', 3, 21, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''ddf9133237d742779abf164b12def4d4'', 3, 22, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''c0740427f6fa424a801545e6d32aa48a'', 3, 23, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''2c6f6c30ba8c4d18a52ab4dd27ac3bbf'', 3, 24, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''80b616acc1d74478b2af615e938f85ac'', 3, 25, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''4962dc3ac7784512b12463962e6d3e74'', 3, 26, 1, ''2018-09-05 02:22:50'', 1);
INSERT INTO `sale_rolemenu` VALUES (''59ac9673b11611e8ba78000c29558df9'', 51, 1, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9b1ab11611e8ba78000c29558df9'', 51, 2, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9c18b11611e8ba78000c29558df9'', 51, 3, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9cd2b11611e8ba78000c29558df9'', 51, 4, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9d80b11611e8ba78000c29558df9'', 51, 5, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9e21b11611e8ba78000c29558df9'', 51, 6, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9ee8b11611e8ba78000c29558df9'', 51, 7, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59ac9f80b11611e8ba78000c29558df9'', 51, 8, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca018b11611e8ba78000c29558df9'', 51, 9, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca0abb11611e8ba78000c29558df9'', 51, 10, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca13db11611e8ba78000c29558df9'', 51, 11, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca1d2b11611e8ba78000c29558df9'', 51, 12, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca2ccb11611e8ba78000c29558df9'', 51, 13, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca37ab11611e8ba78000c29558df9'', 51, 14, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca413b11611e8ba78000c29558df9'', 51, 15, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca4a6b11611e8ba78000c29558df9'', 51, 16, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca532b11611e8ba78000c29558df9'', 51, 17, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca5ccb11611e8ba78000c29558df9'', 51, 18, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca65cb11611e8ba78000c29558df9'', 51, 19, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca6f2b11611e8ba78000c29558df9'', 51, 20, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca78cb11611e8ba78000c29558df9'', 51, 21, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca89cb11611e8ba78000c29558df9'', 51, 22, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca955b11611e8ba78000c29558df9'', 51, 23, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59aca9eab11611e8ba78000c29558df9'', 51, 24, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acaa7fb11611e8ba78000c29558df9'', 51, 25, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acab49b11611e8ba78000c29558df9'', 51, 26, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acabdfb11611e8ba78000c29558df9'', 51, 27, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acac6eb11611e8ba78000c29558df9'', 51, 28, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acad02b11611e8ba78000c29558df9'', 51, 29, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acad93b11611e8ba78000c29558df9'', 51, 30, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acae20b11611e8ba78000c29558df9'', 51, 31, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acaeadb11611e8ba78000c29558df9'', 51, 32, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acaf51b11611e8ba78000c29558df9'', 51, 33, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acafe2b11611e8ba78000c29558df9'', 51, 34, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb070b11611e8ba78000c29558df9'', 51, 35, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb2ccb11611e8ba78000c29558df9'', 51, 36, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb364b11611e8ba78000c29558df9'', 51, 37, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb3f9b11611e8ba78000c29558df9'', 51, 38, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb48cb11611e8ba78000c29558df9'', 51, 39, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb521b11611e8ba78000c29558df9'', 51, 40, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb5b0b11611e8ba78000c29558df9'', 51, 41, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb642b11611e8ba78000c29558df9'', 51, 42, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb6ceb11611e8ba78000c29558df9'', 51, 43, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb75bb11611e8ba78000c29558df9'', 51, 44, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb7fdb11611e8ba78000c29558df9'', 51, 45, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb890b11611e8ba78000c29558df9'', 51, 46, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb920b11611e8ba78000c29558df9'', 51, 47, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acb9acb11611e8ba78000c29558df9'', 51, 48, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acba37b11611e8ba78000c29558df9'', 51, 49, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbacdb11611e8ba78000c29558df9'', 51, 50, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbb8db11611e8ba78000c29558df9'', 51, 51, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbc1fb11611e8ba78000c29558df9'', 51, 52, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbcacb11611e8ba78000c29558df9'', 51, 53, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbd3db11611e8ba78000c29558df9'', 51, 54, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbdd0b11611e8ba78000c29558df9'', 51, 55, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbe75b11611e8ba78000c29558df9'', 51, 56, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbf03b11611e8ba78000c29558df9'', 51, 57, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acbf96b11611e8ba78000c29558df9'', 51, 58, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acc026b11611e8ba78000c29558df9'', 51, 59, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acc0b2b11611e8ba78000c29558df9'', 51, 60, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59acc143b11611e8ba78000c29558df9'', 51, 61, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0c364b11611e8ba78000c29558df9'', 52, 1, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0c97db11611e8ba78000c29558df9'', 52, 2, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0cb3bb11611e8ba78000c29558df9'', 52, 3, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0cc7eb11611e8ba78000c29558df9'', 52, 4, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0cdb7b11611e8ba78000c29558df9'', 52, 5, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0cedcb11611e8ba78000c29558df9'', 52, 6, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0cff6b11611e8ba78000c29558df9'', 52, 7, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0d110b11611e8ba78000c29558df9'', 52, 8, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0d23db11611e8ba78000c29558df9'', 52, 9, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0d490b11611e8ba78000c29558df9'', 52, 10, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0d611b11611e8ba78000c29558df9'', 52, 11, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0d9c3b11611e8ba78000c29558df9'', 52, 12, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0dba1b11611e8ba78000c29558df9'', 52, 13, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0dd5eb11611e8ba78000c29558df9'', 52, 14, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0de8fb11611e8ba78000c29558df9'', 52, 15, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0dfbab11611e8ba78000c29558df9'', 52, 16, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e0f8b11611e8ba78000c29558df9'', 52, 17, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e258b11611e8ba78000c29558df9'', 52, 18, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e37db11611e8ba78000c29558df9'', 52, 19, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e534b11611e8ba78000c29558df9'', 52, 20, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e67ab11611e8ba78000c29558df9'', 52, 21, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e792b11611e8ba78000c29558df9'', 52, 22, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e8cbb11611e8ba78000c29558df9'', 52, 23, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0e9e8b11611e8ba78000c29558df9'', 52, 24, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0eb01b11611e8ba78000c29558df9'', 52, 25, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0ec16b11611e8ba78000c29558df9'', 52, 26, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0ed29b11611e8ba78000c29558df9'', 52, 27, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0ee3bb11611e8ba78000c29558df9'', 52, 28, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0ef57b11611e8ba78000c29558df9'', 52, 29, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0f065b11611e8ba78000c29558df9'', 52, 30, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0f173b11611e8ba78000c29558df9'', 52, 31, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0f5bab11611e8ba78000c29558df9'', 52, 32, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0fb46b11611e8ba78000c29558df9'', 52, 33, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c0fd71b11611e8ba78000c29558df9'', 52, 34, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c100bab11611e8ba78000c29558df9'', 52, 35, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10214b11611e8ba78000c29558df9'', 52, 36, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10374b11611e8ba78000c29558df9'', 52, 37, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10550b11611e8ba78000c29558df9'', 52, 38, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c106dbb11611e8ba78000c29558df9'', 52, 39, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c107feb11611e8ba78000c29558df9'', 52, 40, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10920b11611e8ba78000c29558df9'', 52, 41, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10a2fb11611e8ba78000c29558df9'', 52, 42, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10bacb11611e8ba78000c29558df9'', 52, 43, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10ccdb11611e8ba78000c29558df9'', 52, 44, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10e02b11611e8ba78000c29558df9'', 52, 45, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c10f23b11611e8ba78000c29558df9'', 52, 46, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c11034b11611e8ba78000c29558df9'', 52, 47, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c111a5b11611e8ba78000c29558df9'', 52, 48, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c112b9b11611e8ba78000c29558df9'', 52, 49, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c113cab11611e8ba78000c29558df9'', 52, 50, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c114e2b11611e8ba78000c29558df9'', 52, 51, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c115eeb11611e8ba78000c29558df9'', 52, 52, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c11706b11611e8ba78000c29558df9'', 52, 53, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c11812b11611e8ba78000c29558df9'', 52, 54, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c11921b11611e8ba78000c29558df9'', 52, 55, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c11fb8b11611e8ba78000c29558df9'', 52, 56, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c120dfb11611e8ba78000c29558df9'', 52, 57, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c13122b11611e8ba78000c29558df9'', 52, 58, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c13289b11611e8ba78000c29558df9'', 52, 59, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c13390b11611e8ba78000c29558df9'', 52, 60, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''59c13486b11611e8ba78000c29558df9'', 52, 61, 25, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728767d8b11611e8ba78000c29558df9'', 53, 1, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72876e31b11611e8ba78000c29558df9'', 53, 2, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728770e1b11611e8ba78000c29558df9'', 53, 3, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287728eb11611e8ba78000c29558df9'', 53, 4, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728773f8b11611e8ba78000c29558df9'', 53, 5, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72877860b11611e8ba78000c29558df9'', 53, 6, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72877a26b11611e8ba78000c29558df9'', 53, 7, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72877b91b11611e8ba78000c29558df9'', 53, 8, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72877cf4b11611e8ba78000c29558df9'', 53, 9, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72877e4eb11611e8ba78000c29558df9'', 53, 10, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72877f9fb11611e8ba78000c29558df9'', 53, 11, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878112b11611e8ba78000c29558df9'', 53, 12, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878260b11611e8ba78000c29558df9'', 53, 13, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728783b8b11611e8ba78000c29558df9'', 53, 14, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878503b11611e8ba78000c29558df9'', 53, 15, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287865ab11611e8ba78000c29558df9'', 53, 16, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728787a7b11611e8ba78000c29558df9'', 53, 17, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728788f8b11611e8ba78000c29558df9'', 53, 18, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878a41b11611e8ba78000c29558df9'', 53, 19, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878b90b11611e8ba78000c29558df9'', 53, 20, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878d66b11611e8ba78000c29558df9'', 53, 21, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72878ec9b11611e8ba78000c29558df9'', 53, 22, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72879040b11611e8ba78000c29558df9'', 53, 23, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728791edb11611e8ba78000c29558df9'', 53, 24, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72879348b11611e8ba78000c29558df9'', 53, 25, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72879547b11611e8ba78000c29558df9'', 53, 26, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''728796c0b11611e8ba78000c29558df9'', 53, 27, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287987cb11611e8ba78000c29558df9'', 53, 28, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72879db1b11611e8ba78000c29558df9'', 53, 29, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''72879f91b11611e8ba78000c29558df9'', 53, 30, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a13cb11611e8ba78000c29558df9'', 53, 31, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a34eb11611e8ba78000c29558df9'', 53, 32, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a4bbb11611e8ba78000c29558df9'', 53, 33, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a609b11611e8ba78000c29558df9'', 53, 34, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a74db11611e8ba78000c29558df9'', 53, 35, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a894b11611e8ba78000c29558df9'', 53, 36, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287a9d6b11611e8ba78000c29558df9'', 53, 37, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287ab19b11611e8ba78000c29558df9'', 53, 38, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287ac56b11611e8ba78000c29558df9'', 53, 39, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287ad9cb11611e8ba78000c29558df9'', 53, 40, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287aedfb11611e8ba78000c29558df9'', 53, 41, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b0d5b11611e8ba78000c29558df9'', 53, 42, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b227b11611e8ba78000c29558df9'', 53, 43, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b36bb11611e8ba78000c29558df9'', 53, 44, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b517b11611e8ba78000c29558df9'', 53, 45, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b678b11611e8ba78000c29558df9'', 53, 46, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b7beb11611e8ba78000c29558df9'', 53, 47, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287b906b11611e8ba78000c29558df9'', 53, 48, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287bac5b11611e8ba78000c29558df9'', 53, 49, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287bc13b11611e8ba78000c29558df9'', 53, 50, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287bd59b11611e8ba78000c29558df9'', 53, 51, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287be9ab11611e8ba78000c29558df9'', 53, 52, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287bfddb11611e8ba78000c29558df9'', 53, 53, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287c127b11611e8ba78000c29558df9'', 53, 54, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287c266b11611e8ba78000c29558df9'', 53, 55, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287ccf6b11611e8ba78000c29558df9'', 53, 56, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287ce8eb11611e8ba78000c29558df9'', 53, 57, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287cfdcb11611e8ba78000c29558df9'', 53, 58, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287d110b11611e8ba78000c29558df9'', 53, 59, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287d242b11611e8ba78000c29558df9'', 53, 60, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''7287d370b11611e8ba78000c29558df9'', 53, 61, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a7a1fb11611e8ba78000c29558df9'', 54, 1, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a7fe1b11611e8ba78000c29558df9'', 54, 2, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a847cb11611e8ba78000c29558df9'', 54, 3, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a8608b11611e8ba78000c29558df9'', 54, 4, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a8754b11611e8ba78000c29558df9'', 54, 5, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a88bcb11611e8ba78000c29558df9'', 54, 6, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a89fcb11611e8ba78000c29558df9'', 54, 7, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a8ea8b11611e8ba78000c29558df9'', 54, 8, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a91afb11611e8ba78000c29558df9'', 54, 9, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a9320b11611e8ba78000c29558df9'', 54, 10, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a9459b11611e8ba78000c29558df9'', 54, 11, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a965cb11611e8ba78000c29558df9'', 54, 12, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a97a8b11611e8ba78000c29558df9'', 54, 13, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a991eb11611e8ba78000c29558df9'', 54, 14, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a9a53b11611e8ba78000c29558df9'', 54, 15, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a9b81b11611e8ba78000c29558df9'', 54, 16, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729a9f5cb11611e8ba78000c29558df9'', 54, 17, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa0a1b11611e8ba78000c29558df9'', 54, 18, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa1d8b11611e8ba78000c29558df9'', 54, 19, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa30eb11611e8ba78000c29558df9'', 54, 20, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa43cb11611e8ba78000c29558df9'', 54, 21, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa56fb11611e8ba78000c29558df9'', 54, 22, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa6c5b11611e8ba78000c29558df9'', 54, 23, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa7ffb11611e8ba78000c29558df9'', 54, 24, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aa92cb11611e8ba78000c29558df9'', 54, 25, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aaa59b11611e8ba78000c29558df9'', 54, 26, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aab9ab11611e8ba78000c29558df9'', 54, 27, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aacc4b11611e8ba78000c29558df9'', 54, 28, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aadf1b11611e8ba78000c29558df9'', 54, 29, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aaf50b11611e8ba78000c29558df9'', 54, 30, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ab083b11611e8ba78000c29558df9'', 54, 31, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ab1bab11611e8ba78000c29558df9'', 54, 32, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ab686b11611e8ba78000c29558df9'', 54, 33, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ab7fdb11611e8ba78000c29558df9'', 54, 34, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ab937b11611e8ba78000c29558df9'', 54, 35, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729aba60b11611e8ba78000c29558df9'', 54, 36, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729abb94b11611e8ba78000c29558df9'', 54, 37, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729abcbcb11611e8ba78000c29558df9'', 54, 38, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729abde8b11611e8ba78000c29558df9'', 54, 39, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729abf11b11611e8ba78000c29558df9'', 54, 40, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac0adb11611e8ba78000c29558df9'', 54, 41, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac1e6b11611e8ba78000c29558df9'', 54, 42, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac315b11611e8ba78000c29558df9'', 54, 43, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac447b11611e8ba78000c29558df9'', 54, 44, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac588b11611e8ba78000c29558df9'', 54, 45, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac6b5b11611e8ba78000c29558df9'', 54, 46, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ac7e3b11611e8ba78000c29558df9'', 54, 47, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729acd07b11611e8ba78000c29558df9'', 54, 48, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729acee9b11611e8ba78000c29558df9'', 54, 49, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ad03fb11611e8ba78000c29558df9'', 54, 50, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ad42eb11611e8ba78000c29558df9'', 54, 51, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ad59bb11611e8ba78000c29558df9'', 54, 52, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ad6c5b11611e8ba78000c29558df9'', 54, 53, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ad7efb11611e8ba78000c29558df9'', 54, 54, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ada42b11611e8ba78000c29558df9'', 54, 55, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729adc3ab11611e8ba78000c29558df9'', 54, 56, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729add76b11611e8ba78000c29558df9'', 54, 57, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ade9bb11611e8ba78000c29558df9'', 54, 58, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729adfcbb11611e8ba78000c29558df9'', 54, 59, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ae0f1b11611e8ba78000c29558df9'', 54, 60, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''729ae220b11611e8ba78000c29558df9'', 54, 61, 26, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001a1ab11611e8ba78000c29558df9'', 55, 1, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001cc5b11611e8ba78000c29558df9'', 55, 2, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001d9ab11611e8ba78000c29558df9'', 55, 3, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001e2bb11611e8ba78000c29558df9'', 55, 4, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001eb4b11611e8ba78000c29558df9'', 55, 5, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001f39b11611e8ba78000c29558df9'', 55, 6, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1001fbdb11611e8ba78000c29558df9'', 55, 7, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002040b11611e8ba78000c29558df9'', 55, 8, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10020c8b11611e8ba78000c29558df9'', 55, 9, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002147b11611e8ba78000c29558df9'', 55, 10, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10021c4b11611e8ba78000c29558df9'', 55, 11, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002283b11611e8ba78000c29558df9'', 55, 12, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002470b11611e8ba78000c29558df9'', 55, 13, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002518b11611e8ba78000c29558df9'', 55, 14, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10025c8b11611e8ba78000c29558df9'', 55, 15, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002650b11611e8ba78000c29558df9'', 55, 16, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10026ccb11611e8ba78000c29558df9'', 55, 17, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100274bb11611e8ba78000c29558df9'', 55, 18, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10027cdb11611e8ba78000c29558df9'', 55, 19, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002847b11611e8ba78000c29558df9'', 55, 20, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10028c9b11611e8ba78000c29558df9'', 55, 21, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100294cb11611e8ba78000c29558df9'', 55, 22, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002a01b11611e8ba78000c29558df9'', 55, 23, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002a90b11611e8ba78000c29558df9'', 55, 24, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002b10b11611e8ba78000c29558df9'', 55, 25, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002b92b11611e8ba78000c29558df9'', 55, 26, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002c15b11611e8ba78000c29558df9'', 55, 27, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002c93b11611e8ba78000c29558df9'', 55, 28, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002d18b11611e8ba78000c29558df9'', 55, 29, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002d9ab11611e8ba78000c29558df9'', 55, 30, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002e16b11611e8ba78000c29558df9'', 55, 31, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002e95b11611e8ba78000c29558df9'', 55, 32, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002f18b11611e8ba78000c29558df9'', 55, 33, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1002f99b11611e8ba78000c29558df9'', 55, 34, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003012b11611e8ba78000c29558df9'', 55, 35, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003088b11611e8ba78000c29558df9'', 55, 36, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003106b11611e8ba78000c29558df9'', 55, 37, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003183b11611e8ba78000c29558df9'', 55, 38, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10031fcb11611e8ba78000c29558df9'', 55, 39, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100329eb11611e8ba78000c29558df9'', 55, 40, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100331db11611e8ba78000c29558df9'', 55, 41, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100339cb11611e8ba78000c29558df9'', 55, 42, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003415b11611e8ba78000c29558df9'', 55, 43, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003491b11611e8ba78000c29558df9'', 55, 44, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100353eb11611e8ba78000c29558df9'', 55, 45, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10035c7b11611e8ba78000c29558df9'', 55, 46, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003644b11611e8ba78000c29558df9'', 55, 47, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10036c1b11611e8ba78000c29558df9'', 55, 48, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100373bb11611e8ba78000c29558df9'', 55, 49, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10037b4b11611e8ba78000c29558df9'', 55, 50, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003849b11611e8ba78000c29558df9'', 55, 51, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10038c5b11611e8ba78000c29558df9'', 55, 52, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003941b11611e8ba78000c29558df9'', 55, 53, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10039bcb11611e8ba78000c29558df9'', 55, 54, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003b43b11611e8ba78000c29558df9'', 55, 55, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003c57b11611e8ba78000c29558df9'', 55, 56, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003cdab11611e8ba78000c29558df9'', 55, 57, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003d56b11611e8ba78000c29558df9'', 55, 58, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003dfeb11611e8ba78000c29558df9'', 55, 59, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1003facb11611e8ba78000c29558df9'', 55, 60, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1004037b11611e8ba78000c29558df9'', 55, 61, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008560b11611e8ba78000c29558df9'', 56, 1, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008745b11611e8ba78000c29558df9'', 56, 2, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100880ab11611e8ba78000c29558df9'', 56, 3, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008a28b11611e8ba78000c29558df9'', 56, 4, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008ad8b11611e8ba78000c29558df9'', 56, 5, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008b55b11611e8ba78000c29558df9'', 56, 6, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008c07b11611e8ba78000c29558df9'', 56, 7, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008c8bb11611e8ba78000c29558df9'', 56, 8, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008d04b11611e8ba78000c29558df9'', 56, 9, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008d79b11611e8ba78000c29558df9'', 56, 10, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008df1b11611e8ba78000c29558df9'', 56, 11, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008e64b11611e8ba78000c29558df9'', 56, 12, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008edab11611e8ba78000c29558df9'', 56, 13, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008f50b11611e8ba78000c29558df9'', 56, 14, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1008fc6b11611e8ba78000c29558df9'', 56, 15, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009039b11611e8ba78000c29558df9'', 56, 16, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10090b1b11611e8ba78000c29558df9'', 56, 17, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009129b11611e8ba78000c29558df9'', 56, 18, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10091a2b11611e8ba78000c29558df9'', 56, 19, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009212b11611e8ba78000c29558df9'', 56, 20, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009284b11611e8ba78000c29558df9'', 56, 21, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10092fab11611e8ba78000c29558df9'', 56, 22, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100937ab11611e8ba78000c29558df9'', 56, 23, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10093f0b11611e8ba78000c29558df9'', 56, 24, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009460b11611e8ba78000c29558df9'', 56, 25, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10094ceb11611e8ba78000c29558df9'', 56, 26, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100953ab11611e8ba78000c29558df9'', 56, 27, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10095abb11611e8ba78000c29558df9'', 56, 28, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100961ab11611e8ba78000c29558df9'', 56, 29, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009688b11611e8ba78000c29558df9'', 56, 30, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10096f5b11611e8ba78000c29558df9'', 56, 31, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009768b11611e8ba78000c29558df9'', 56, 32, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10097d8b11611e8ba78000c29558df9'', 56, 33, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009846b11611e8ba78000c29558df9'', 56, 34, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10098b5b11611e8ba78000c29558df9'', 56, 35, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009943b11611e8ba78000c29558df9'', 56, 36, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d10099bbb11611e8ba78000c29558df9'', 56, 37, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009a2ab11611e8ba78000c29558df9'', 56, 38, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009a98b11611e8ba78000c29558df9'', 56, 39, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009b05b11611e8ba78000c29558df9'', 56, 40, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009b79b11611e8ba78000c29558df9'', 56, 41, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009be9b11611e8ba78000c29558df9'', 56, 42, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009c6eb11611e8ba78000c29558df9'', 56, 43, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009cdfb11611e8ba78000c29558df9'', 56, 44, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009d59b11611e8ba78000c29558df9'', 56, 45, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009dd0b11611e8ba78000c29558df9'', 56, 46, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009e3fb11611e8ba78000c29558df9'', 56, 47, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009eabb11611e8ba78000c29558df9'', 56, 48, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009f1db11611e8ba78000c29558df9'', 56, 49, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009f8ab11611e8ba78000c29558df9'', 56, 50, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d1009ff7b11611e8ba78000c29558df9'', 56, 51, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a067b11611e8ba78000c29558df9'', 56, 52, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a0dbb11611e8ba78000c29558df9'', 56, 53, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a148b11611e8ba78000c29558df9'', 56, 54, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a1b4b11611e8ba78000c29558df9'', 56, 55, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a222b11611e8ba78000c29558df9'', 56, 56, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a292b11611e8ba78000c29558df9'', 56, 57, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a301b11611e8ba78000c29558df9'', 56, 58, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a3a2b11611e8ba78000c29558df9'', 56, 59, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a412b11611e8ba78000c29558df9'', 56, 60, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''d100a481b11611e8ba78000c29558df9'', 56, 61, 27, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''8040d4d58132429b8bdf159023837dcd'', 57, 2, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''43687cf10c5c49c6a7dd405e1a1e5f22'', 57, 3, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''5a5e4d5551884f28ac472a511dec3feb'', 57, 4, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''7dadf78a5eeb4ea78a141eef92e0f68f'', 57, 5, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''8139e6f78a244a619fd30edb31b9e7ce'', 57, 6, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''25a95bd628234bf589d544251be3d3f3'', 57, 7, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''a5d53138379b465582085f8b130b5ff7'', 57, 8, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''4ffa97113b724c45962e2d491ae2f7ea'', 57, 9, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''72971bc3890f40b09bdfc9ed0eab78b6'', 57, 10, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''edd917740c5b456092045fda77d5afbe'', 57, 11, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''46fa3ecb9131459b94a4ed9a76975cb3'', 57, 12, 27, ''2018-09-05 14:21:06'', 34);
INSERT INTO `sale_rolemenu` VALUES (''ecd5a5bab1a811e8ba78000c29558df9'', 58, 1, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5a96db1a811e8ba78000c29558df9'', 58, 2, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5aa65b1a811e8ba78000c29558df9'', 58, 3, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ab0bb1a811e8ba78000c29558df9'', 58, 4, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5abd0b1a811e8ba78000c29558df9'', 58, 5, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ac78b1a811e8ba78000c29558df9'', 58, 6, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ad30b1a811e8ba78000c29558df9'', 58, 7, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ade3b1a811e8ba78000c29558df9'', 58, 8, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ae78b1a811e8ba78000c29558df9'', 58, 9, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5af32b1a811e8ba78000c29558df9'', 58, 10, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5aff2b1a811e8ba78000c29558df9'', 58, 11, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b089b1a811e8ba78000c29558df9'', 58, 12, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b11db1a811e8ba78000c29558df9'', 58, 13, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b1acb1a811e8ba78000c29558df9'', 58, 14, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b23ab1a811e8ba78000c29558df9'', 58, 15, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b2c3b1a811e8ba78000c29558df9'', 58, 16, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b386b1a811e8ba78000c29558df9'', 58, 17, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b411b1a811e8ba78000c29558df9'', 58, 18, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b49cb1a811e8ba78000c29558df9'', 58, 19, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b52ab1a811e8ba78000c29558df9'', 58, 20, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b5cdb1a811e8ba78000c29558df9'', 58, 21, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b656b1a811e8ba78000c29558df9'', 58, 22, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b6e8b1a811e8ba78000c29558df9'', 58, 23, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b78bb1a811e8ba78000c29558df9'', 58, 24, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b811b1a811e8ba78000c29558df9'', 58, 25, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b897b1a811e8ba78000c29558df9'', 58, 26, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b91db1a811e8ba78000c29558df9'', 58, 27, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5b99db1a811e8ba78000c29558df9'', 58, 28, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ba21b1a811e8ba78000c29558df9'', 58, 29, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5baa2b1a811e8ba78000c29558df9'', 58, 30, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bb25b1a811e8ba78000c29558df9'', 58, 31, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bba5b1a811e8ba78000c29558df9'', 58, 32, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bc2db1a811e8ba78000c29558df9'', 58, 33, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bcaab1a811e8ba78000c29558df9'', 58, 34, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bd46b1a811e8ba78000c29558df9'', 58, 35, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bdc4b1a811e8ba78000c29558df9'', 58, 36, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5be41b1a811e8ba78000c29558df9'', 58, 37, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bebeb1a811e8ba78000c29558df9'', 58, 38, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5bf3bb1a811e8ba78000c29558df9'', 58, 39, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c0dcb1a811e8ba78000c29558df9'', 58, 40, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c17cb1a811e8ba78000c29558df9'', 58, 41, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c259b1a811e8ba78000c29558df9'', 58, 42, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c2ebb1a811e8ba78000c29558df9'', 58, 43, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c36eb1a811e8ba78000c29558df9'', 58, 44, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c405b1a811e8ba78000c29558df9'', 58, 45, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c4c0b1a811e8ba78000c29558df9'', 58, 46, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c543b1a811e8ba78000c29558df9'', 58, 47, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c5c0b1a811e8ba78000c29558df9'', 58, 48, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c640b1a811e8ba78000c29558df9'', 58, 49, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c6bbb1a811e8ba78000c29558df9'', 58, 50, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c734b1a811e8ba78000c29558df9'', 58, 51, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c7b1b1a811e8ba78000c29558df9'', 58, 52, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c84fb1a811e8ba78000c29558df9'', 58, 53, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c8cfb1a811e8ba78000c29558df9'', 58, 54, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5c94db1a811e8ba78000c29558df9'', 58, 55, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5cb1fb1a811e8ba78000c29558df9'', 58, 56, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5cbb7b1a811e8ba78000c29558df9'', 58, 57, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5cc34b1a811e8ba78000c29558df9'', 58, 58, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5ccb5b1a811e8ba78000c29558df9'', 58, 59, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5cd57b1a811e8ba78000c29558df9'', 58, 60, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd5cdd9b1a811e8ba78000c29558df9'', 58, 61, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd77862b1a811e8ba78000c29558df9'', 59, 1, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd77aafb1a811e8ba78000c29558df9'', 59, 2, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd77d17b1a811e8ba78000c29558df9'', 59, 3, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd77dc2b1a811e8ba78000c29558df9'', 59, 4, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd77e48b1a811e8ba78000c29558df9'', 59, 5, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd77f04b1a811e8ba78000c29558df9'', 59, 6, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78166b1a811e8ba78000c29558df9'', 59, 7, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd7820db1a811e8ba78000c29558df9'', 59, 8, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd7829db1a811e8ba78000c29558df9'', 59, 9, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78325b1a811e8ba78000c29558df9'', 59, 10, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd783aab1a811e8ba78000c29558df9'', 59, 11, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd7842fb1a811e8ba78000c29558df9'', 59, 12, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd784b0b1a811e8ba78000c29558df9'', 59, 13, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78535b1a811e8ba78000c29558df9'', 59, 14, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd785b7b1a811e8ba78000c29558df9'', 59, 15, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78641b1a811e8ba78000c29558df9'', 59, 16, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd786c4b1a811e8ba78000c29558df9'', 59, 17, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78749b1a811e8ba78000c29558df9'', 59, 18, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd787cdb1a811e8ba78000c29558df9'', 59, 19, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd7884bb1a811e8ba78000c29558df9'', 59, 20, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd788cab1a811e8ba78000c29558df9'', 59, 21, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78946b1a811e8ba78000c29558df9'', 59, 22, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd789ffb1a811e8ba78000c29558df9'', 59, 23, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78a8cb1a811e8ba78000c29558df9'', 59, 24, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78b07b1a811e8ba78000c29558df9'', 59, 25, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78ba5b1a811e8ba78000c29558df9'', 59, 26, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78c26b1a811e8ba78000c29558df9'', 59, 27, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78ca3b1a811e8ba78000c29558df9'', 59, 28, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78d1cb1a811e8ba78000c29558df9'', 59, 29, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78dc1b1a811e8ba78000c29558df9'', 59, 30, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78e44b1a811e8ba78000c29558df9'', 59, 31, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78ec5b1a811e8ba78000c29558df9'', 59, 32, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78f41b1a811e8ba78000c29558df9'', 59, 33, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd78fbeb1a811e8ba78000c29558df9'', 59, 34, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd7903ab1a811e8ba78000c29558df9'', 59, 35, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd790b6b1a811e8ba78000c29558df9'', 59, 36, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79134b1a811e8ba78000c29558df9'', 59, 37, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd791aeb1a811e8ba78000c29558df9'', 59, 38, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79228b1a811e8ba78000c29558df9'', 59, 39, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd792a3b1a811e8ba78000c29558df9'', 59, 40, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79320b1a811e8ba78000c29558df9'', 59, 41, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79399b1a811e8ba78000c29558df9'', 59, 42, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79414b1a811e8ba78000c29558df9'', 59, 43, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd795bfb1a811e8ba78000c29558df9'', 59, 44, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79650b1a811e8ba78000c29558df9'', 59, 45, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd796d5b1a811e8ba78000c29558df9'', 59, 46, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79753b1a811e8ba78000c29558df9'', 59, 47, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd797d1b1a811e8ba78000c29558df9'', 59, 48, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd7984cb1a811e8ba78000c29558df9'', 59, 49, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd798c7b1a811e8ba78000c29558df9'', 59, 50, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79944b1a811e8ba78000c29558df9'', 59, 51, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd799bdb1a811e8ba78000c29558df9'', 59, 52, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79a36b1a811e8ba78000c29558df9'', 59, 53, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79ab0b1a811e8ba78000c29558df9'', 59, 54, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79bbfb1a811e8ba78000c29558df9'', 59, 55, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79c47b1a811e8ba78000c29558df9'', 59, 56, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79cc6b1a811e8ba78000c29558df9'', 59, 57, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79d59b1a811e8ba78000c29558df9'', 59, 58, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79dcfb1a811e8ba78000c29558df9'', 59, 59, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79e42b1a811e8ba78000c29558df9'', 59, 60, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''ecd79ebcb1a811e8ba78000c29558df9'', 59, 61, 28, NULL, NULL);
INSERT INTO `sale_rolemenu` VALUES (''4721370e10c9430b8bc2c022afd56179'', 60, 2, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''8bef3af3d94a4cb091f07dcbae9a8b98'', 60, 3, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''1bf436ca3bb84a418deabda1a84086f1'', 60, 4, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''ad7d7848445b40c396b7f36fded9a18a'', 60, 5, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''0682948a98a84f8d83844eda17fe83c4'', 60, 6, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''2b1233e9296747e198ba8a1e9211c2c3'', 60, 7, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''a9de81ea251b45ba88ca8a92b54fe790'', 60, 8, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''325fa5c628d749eba06fffa06756bc5d'', 60, 9, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''b91a14d2483747398a628f45edfc5b82'', 60, 10, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''09939e6f3ee0465686c65839d8320b46'', 60, 11, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''14550b64dec94f4199d4b18345a83e5c'', 60, 12, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''38809e9b5caa4b6ea45eca60f1099821'', 60, 13, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''bd7074e998ed4d07a0c3c44471968f62'', 60, 14, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''1157a8e3b1fd4915ad98042142ba0ce5'', 60, 15, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''227afb48bc6e4f7d89ffdf9efc497484'', 60, 16, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''9a183fa93ace4270b51598ca50829755'', 60, 17, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''70534c0d6d714056a1aa5754d5db3b58'', 60, 18, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''abb206d84d914788b4dc1ea8f4e265a5'', 60, 19, 28, ''2018-09-06 07:47:32'', 36);
INSERT INTO `sale_rolemenu` VALUES (''b5097f120a734ec193402b4d395711c8'', 60, 20, 28, ''2018-09-06 07:47:32'', 36);

-- ----------------------------
-- Table structure for sale_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sale_tenant`;
CREATE TABLE `sale_tenant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''显示名'',
  `tenantName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''名称'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''d'',
  `creatorUserId` int(11) NULL DEFAULT NULL,
  `isActive` tinyint(2) NULL DEFAULT NULL COMMENT ''1启用  0禁用'',
  `isDeleted` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_tenant
-- ----------------------------
INSERT INTO `sale_tenant` VALUES (1, ''dizhushuomingzichanganquan'', ''dizhushuomingzichanganquan'', ''2018-08-29 14:18:00'', NULL, 1, 0);
INSERT INTO `sale_tenant` VALUES (25, ''awdawd'', ''awdawd'', ''2018-09-05 14:16:58'', 1, NULL, 0);
INSERT INTO `sale_tenant` VALUES (26, ''wwwww'', ''wwwww'', ''2018-09-05 14:17:39'', 1, 1, 0);
INSERT INTO `sale_tenant` VALUES (27, ''ceshi'', ''ceshi'', ''2018-09-05 14:20:19'', 1, 1, 0);
INSERT INTO `sale_tenant` VALUES (28, ''ceshi001'', ''ceshi001'', ''2018-09-06 07:46:12'', 1, 1, 0);

-- ----------------------------
-- Table structure for sale_tree
-- ----------------------------
DROP TABLE IF EXISTS `sale_tree`;
CREATE TABLE `sale_tree`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''key'',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''节点名'',
  `parentId` int(11) NULL DEFAULT NULL COMMENT ''父级id'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `levelCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''级别code'',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_tree
-- ----------------------------
INSERT INTO `sale_tree` VALUES (2, ''总部'', NULL, ''2018-08-29 14:33:18'', 1, 1, ''e3d513f3'');
INSERT INTO `sale_tree` VALUES (3, ''北京'', 2, ''2018-08-29 14:33:24'', 1, 1, ''e3d513f3.4db526e5'');
INSERT INTO `sale_tree` VALUES (4, ''西城区'', 3, ''2018-08-29 14:33:31'', 1, 1, ''e3d513f3.4db526e5.3c585e04'');
INSERT INTO `sale_tree` VALUES (5, ''东城区'', 3, ''2018-08-30 02:06:40'', 1, 1, ''e3d513f3.4db526e5.ee02af14'');
INSERT INTO `sale_tree` VALUES (6, ''新东安商场'', 5, ''2018-08-30 02:06:47'', 1, 1, ''e3d513f3.4db526e5.ee02af14.179a9d43'');
INSERT INTO `sale_tree` VALUES (7, ''总部'', NULL, ''2018-09-05 01:28:37'', 26, 23, ''eafc15d8'');
INSERT INTO `sale_tree` VALUES (8, ''北京总部'', 7, ''2018-09-05 01:50:54'', 26, 23, ''eafc15d8.df1b842c'');
INSERT INTO `sale_tree` VALUES (9, ''11'', NULL, ''2018-09-05 01:51:30'', 26, 23, ''eef9ffb2'');
INSERT INTO `sale_tree` VALUES (10, ''朝阳区'', 3, ''2018-09-05 02:59:40'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd'');
INSERT INTO `sale_tree` VALUES (11, ''崇文区'', 3, ''2018-09-05 03:00:10'', 1, 1, ''e3d513f3.4db526e5.e01023bb'');
INSERT INTO `sale_tree` VALUES (12, ''顺义区'', 3, ''2018-09-05 03:00:18'', 1, 1, ''e3d513f3.4db526e5.6dfc3c70'');
INSERT INTO `sale_tree` VALUES (13, ''昌平区'', 3, ''2018-09-05 03:00:26'', 1, 1, ''e3d513f3.4db526e5.940ee7d1'');
INSERT INTO `sale_tree` VALUES (14, ''燕莎友谊商城'', 10, ''2018-09-05 03:00:42'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.3851f533'');
INSERT INTO `sale_tree` VALUES (15, ''赛特购物中心'', 10, ''2018-09-05 03:00:51'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.069d3975'');
INSERT INTO `sale_tree` VALUES (16, ''西单商场'', 4, ''2018-09-05 03:01:00'', 1, 1, ''e3d513f3.4db526e5.3c585e04.933b5234'');
INSERT INTO `sale_tree` VALUES (17, ''复兴商业城'', 4, ''2018-09-05 03:01:08'', 1, 1, ''e3d513f3.4db526e5.3c585e04.a620d428'');
INSERT INTO `sale_tree` VALUES (19, ''城乡贸易中心'', 18, ''2018-09-05 03:01:38'', 1, 1, ''e3d513f3.4db526e5.82d81c3c.eb1c7b59'');
INSERT INTO `sale_tree` VALUES (20, ''蓝鸟大厦'', 10, ''2018-09-05 03:01:48'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.f7be3088'');
INSERT INTO `sale_tree` VALUES (21, ''新世界商场'', 11, ''2018-09-05 03:02:09'', 1, 1, ''e3d513f3.4db526e5.e01023bb.22c09fa7'');
INSERT INTO `sale_tree` VALUES (22, ''甘家口大厦'', 18, ''2018-09-05 03:02:18'', 1, 1, ''e3d513f3.4db526e5.82d81c3c.c90e145b'');
INSERT INTO `sale_tree` VALUES (23, ''北辰购物中心 '', 10, ''2018-09-05 03:02:28'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.d7a2a1c2'');
INSERT INTO `sale_tree` VALUES (24, ''海淀数码大厦'', 18, ''2018-09-05 03:02:39'', 1, 1, ''e3d513f3.4db526e5.82d81c3c.566458ee'');
INSERT INTO `sale_tree` VALUES (25, ''贵友大厦'', 10, ''2018-09-05 03:02:53'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.0ad446cb'');
INSERT INTO `sale_tree` VALUES (26, ''顺义国泰'', 12, ''2018-09-05 03:03:12'', 1, 1, ''e3d513f3.4db526e5.6dfc3c70.1986aa7b'');
INSERT INTO `sale_tree` VALUES (27, ''长安商场'', 4, ''2018-09-05 03:03:25'', 1, 1, ''e3d513f3.4db526e5.3c585e04.b0661f76'');
INSERT INTO `sale_tree` VALUES (28, ''中友百货'', 4, ''2018-09-05 03:03:32'', 1, 1, ''e3d513f3.4db526e5.3c585e04.13a9a139'');
INSERT INTO `sale_tree` VALUES (29, ''王府井洋华堂'', 10, ''2018-09-05 03:03:48'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.5d85b02d'');
INSERT INTO `sale_tree` VALUES (30, ''昌平新世纪商场'', 13, ''2018-09-05 03:04:03'', 1, 1, ''e3d513f3.4db526e5.940ee7d1.d31f23df'');
INSERT INTO `sale_tree` VALUES (31, ''双安商场'', 18, ''2018-09-05 03:05:31'', 1, 1, ''e3d513f3.4db526e5.82d81c3c.f6eaa326'');
INSERT INTO `sale_tree` VALUES (32, ''飘亮购物中心'', 10, ''2018-09-05 03:05:44'', 1, 1, ''e3d513f3.4db526e5.e6c6a6fd.39234d20'');
INSERT INTO `sale_tree` VALUES (33, ''华堂商场(丰台北路店)'', 5, ''2018-09-05 03:06:03'', 1, 1, ''e3d513f3.4db526e5.ee02af14.460adbb3'');
INSERT INTO `sale_tree` VALUES (34, ''北京秀水街'', 4, ''2018-09-05 03:06:18'', 1, 1, ''e3d513f3.4db526e5.3c585e04.8110cea4'');

-- ----------------------------
-- Table structure for sale_user
-- ----------------------------
DROP TABLE IF EXISTS `sale_user`;
CREATE TABLE `sale_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''自增主键'',
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''账户'',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''密码'',
  `creationTime` datetime(0) NULL DEFAULT NULL COMMENT ''创建时间'',
  `creatorUserId` int(11) NULL DEFAULT NULL COMMENT ''创建人id'',
  `userName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''姓名'',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ''手机'',
  `isActive` tinyint(2) NULL DEFAULT NULL COMMENT ''1启用  0禁用'',
  `isDeleted` tinyint(2) NULL DEFAULT 0 COMMENT ''软删除  '',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT ''最后登陆时间'',
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  `areaId` int(11) NULL DEFAULT NULL COMMENT ''区域id'',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale_user
-- ----------------------------
INSERT INTO `sale_user` VALUES (1, ''admin'', ''$2a$10$p0HAhK8njqNRovN5fkjntueN5vjwsKwe1J9E1RY2IVcq3Q/ZP/Zui'', ''2018-08-29 14:18:01'', NULL, ''admin'', NULL, 1, 0, ''2018-09-10 15:00:59'', 1, 2);
INSERT INTO `sale_user` VALUES (2, ''test'', ''$2a$10$gvNVT3zVr/qg8mm1ciEceeq7XNIPll1ALPI6txrZy3.aMyCC7MT6G'', ''2018-08-29 14:32:44'', 1, ''test'', NULL, 1, 0, ''2018-08-29 14:46:29'', 1, 2);
INSERT INTO `sale_user` VALUES (3, ''admin'', ''$2a$10$DK.zieqV7JhgmSapOhWm.eaKW9xfF3VnKqg1LW07Q5h3jr6DytnoC'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 2, NULL);
INSERT INTO `sale_user` VALUES (4, ''admin'', ''$2a$10$iW9JnyHcLyhq9udZ2KKO4ubTeCDOFgyOW5PFU0oqCk1rNa3AaCrBS'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 3, NULL);
INSERT INTO `sale_user` VALUES (5, ''admin'', ''$2a$10$nMZr89A/xC5PN36glW0YY.km6svJWOUIQYVXTxWHWFBHNQwsaFZQ6'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 4, NULL);
INSERT INTO `sale_user` VALUES (6, ''admin'', ''$2a$10$b4fiMMs8uDNimG1tupIuou2stW86BwNvjJSuhDYlM7DuVOlUNJ9Fm'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 5, NULL);
INSERT INTO `sale_user` VALUES (7, ''admin'', ''$2a$10$X2J32q0/.9tzCN8Yv8X0pODyqNUOr7xxVbazOTds3CYR6q4rdcPa6'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 6, NULL);
INSERT INTO `sale_user` VALUES (8, ''ceshi001'', ''$2a$10$KLEIqHXuRMOzxstzH/bvHu5fpsd2mI0.p882vr8ARyMcPy6KDpsVO'', ''2018-08-30 12:23:45'', 1, ''ceshi001'', NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `sale_user` VALUES (9, ''admin'', ''$2a$10$46IKK0h3ntQBTj4qopLAzuPpRLYwHr4/kE36s3Soi7AptRRN8aJzG'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 7, NULL);
INSERT INTO `sale_user` VALUES (10, ''admin'', ''$2a$10$rvBck10BPCekvRAGZx/96O4kjzJWn1Lgtc2PKO9L05vGlE0g8C1K6'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 8, NULL);
INSERT INTO `sale_user` VALUES (11, ''admin'', ''$2a$10$Q0dhAU8KdVzbkVEHdao6QeSU1S0XPnC2Tkp5wFrLHapbdsUMJOoGK'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 9, NULL);
INSERT INTO `sale_user` VALUES (12, ''admin'', ''$2a$10$Geu2Tk1REaobTZvqQVZDhuChIQ00IeyQbD0NDQCceQwyiuZ2z3L3K'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 10, NULL);
INSERT INTO `sale_user` VALUES (13, ''admin'', ''$2a$10$BmJWk7YujoVRMv8O//tLT.hL1dEezl1Hrko4VfPqsEaDYEJXz40DG'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 11, NULL);
INSERT INTO `sale_user` VALUES (14, ''admin'', ''$2a$10$YQXzz91gyDhSCiS3hkX/F.8GlhSM98QzvxiP55NuX31wGrnQ9iI2e'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 12, NULL);
INSERT INTO `sale_user` VALUES (15, ''admin'', ''$2a$10$ie93kfksM.lbxCMSIZc2dOq7V6Otp..foCRF5W0XsUa9fPKtm.ee.'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 13, NULL);
INSERT INTO `sale_user` VALUES (16, ''admin'', ''$2a$10$rW5hDZwWUS93ZGtCVmIVduGEwxc3KXoGavd4e7b.vOIjwF3FajmJy'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 14, NULL);
INSERT INTO `sale_user` VALUES (17, ''admin'', ''$2a$10$rjaJ/czFbJG7VT1OgmlL6ebieUZ47S7ZOTlqB1RMWHZ9a7SQ7QaVG'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 15, NULL);
INSERT INTO `sale_user` VALUES (18, ''admin'', ''$2a$10$R8XUz69fntix5eLYHHdP6O2.fWqPcp/Vg.ylUlOQdtI/f9FeXw7zq'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 16, NULL);
INSERT INTO `sale_user` VALUES (19, ''admin'', ''$2a$10$Q8JyorNhT6nvoJwFcMWCXu6gtCJVMF1crXNqzez8mEh74p4XNMuTu'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 17, NULL);
INSERT INTO `sale_user` VALUES (20, ''admin'', ''$2a$10$NoIIj6mJGzR1HMOClGUD4etoIcLb3lv0lmKsNQd9piD4/4K.IWV0y'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 18, NULL);
INSERT INTO `sale_user` VALUES (21, ''admin'', ''$2a$10$93K8SH.efaUsxlOEuWky.uD9faXzRfoDMq3C417EvVBXIff4uKK4W'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 19, NULL);
INSERT INTO `sale_user` VALUES (22, ''admin'', ''$2a$10$sp8owmIPgQlmbERxvv/8DO9nlDj2BbVZvn8etfOYoW0uuoW3rPZrS'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 20, NULL);
INSERT INTO `sale_user` VALUES (23, ''admin'', ''$2a$10$lSnJIGH31RJi2ILogM8Gr.ZA31wPdPiJ9JpmAiZkh3avMtfzPU/hG'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 21, NULL);
INSERT INTO `sale_user` VALUES (24, ''admin'', ''$2a$10$xpdKCLOjjaP6mAK9fs6sWuMDeQWoS390rXVNB3AirNyl2oXSH2Sh.'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 22, NULL);
INSERT INTO `sale_user` VALUES (25, ''ceshi002'', ''$2a$10$7aHuUmXMs9LIEvZNhvV97udD7cHsaukpFaENuH9DmHVTZ1Nhg3ynK'', ''2018-09-03 13:56:49'', 1, ''wadawd'', NULL, 1, 0, NULL, 1, 3);
INSERT INTO `sale_user` VALUES (26, ''admin'', ''$2a$10$jw53t0qzpOUUIqFhxAA/4em0da7Qvi3Duq1rJQkMl6XQRGSBGzgJu'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 23, NULL);
INSERT INTO `sale_user` VALUES (27, ''测试账户'', ''$2a$10$sZZGl702uFjgqrOjaOIkZeHJUs9WYgxEIz6Yrrg8Ju3/tdqWBcva2'', ''2018-09-05 01:58:16'', 26, ''ceshi001'', NULL, 1, 0, NULL, 23, 8);
INSERT INTO `sale_user` VALUES (28, ''admin'', ''$2a$10$XdS8KNpXF0hdovmXytjnhOOlqtIE57nTvs1YyblnhQPEZZgAReUgW'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 24, NULL);
INSERT INTO `sale_user` VALUES (29, ''test'', ''$2a$10$ONiSDhisX3vm06St33onLetaAH3QUttm4imksrzrksNNtjugTWmhm'', ''2018-09-05 02:23:14'', 1, ''test1'', NULL, 1, 0, NULL, 1, 2);
INSERT INTO `sale_user` VALUES (30, ''admin'', ''$2a$10$B1w0LZKXqK8izExyAhUGEOfGn4MmeJSloTJUNkQNQBwZ/rA7qhw7a'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 25, NULL);
INSERT INTO `sale_user` VALUES (31, ''admin'', ''$2a$10$..7KD/jR3axg2BKEQuTZ0OowwACnwZeC7hGCFL4/taHAx6xymtcw.'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 26, NULL);
INSERT INTO `sale_user` VALUES (32, ''test'', ''$2a$10$v0wjcPHQx6/e5rekbG0ua.W5Jefh8jmaiOiTk2wx4N0EXe.3KwvEq'', ''2018-09-05 14:18:29'', 31, ''test'', NULL, 1, 0, NULL, 26, NULL);
INSERT INTO `sale_user` VALUES (33, ''ceshi003'', ''$2a$10$kU7aXuY5gjsHFQUB.ZmsbeqQr0EnUijs2zdaxpdzW334FUNfhMsie'', ''2018-09-05 14:19:28'', 1, ''ceshi003'', NULL, 1, 0, ''2018-09-05 14:19:41'', 1, 2);
INSERT INTO `sale_user` VALUES (34, ''admin'', ''$2a$10$NhAwxW7L.nNvlgwymZLUPe26oKNfNStLnPIJa6BzFByiIMKyydfDq'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 27, NULL);
INSERT INTO `sale_user` VALUES (35, ''ceshi001'', ''$2a$10$p9uA2SljgmkaqbBpPGvJIu2Xmq9dhC5aJ2KqyUSdgOZtkyBpGhpwS'', ''2018-09-05 14:21:28'', 34, ''ceshi001'', NULL, 1, 0, NULL, 27, NULL);
INSERT INTO `sale_user` VALUES (36, ''admin'', ''$2a$10$agLpxhPsXgq5M12MU4vkLO5sIprtje6cvRhP1aUAOHiR7N03.VnPK'', ''2018-07-31 09:50:23'', NULL, ''admin'', NULL, 1, 0, NULL, 28, NULL);
INSERT INTO `sale_user` VALUES (37, ''ceshi'', ''$2a$10$S.joHaVr9rx3v1wr6cDt9ern2pbyv/xyBNysKZBbolsvrwp25q9EO'', ''2018-09-06 07:47:53'', 36, ''ceshi'', NULL, 1, 0, NULL, 28, NULL);

-- ----------------------------
-- Table structure for sale_userrole
-- ----------------------------
DROP TABLE IF EXISTS `sale_userrole`;
CREATE TABLE `sale_userrole`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''key'',
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `creationTime` datetime(0) NULL DEFAULT NULL,
  `creatorUserId` int(11) NULL DEFAULT NULL,
  `tenantId` int(11) NULL DEFAULT NULL COMMENT ''租户id'',
  INDEX `ix_userId`(`userId`) USING BTREE,
  INDEX `ix_roleId`(`roleId`) USING BTREE,
  CONSTRAINT `fk_roleId` FOREIGN KEY (`roleId`) REFERENCES `sale_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `sale_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale_userrole
-- ----------------------------
INSERT INTO `sale_userrole` VALUES (''4e6c620e2a6a4810bf69b638b28d709f'', 1, 1, ''2018-08-30 12:51:34'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''6804e83b82e744e28d90f8f850f43fb6'', 1, 2, ''2018-08-30 12:51:34'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''d0089df28e8444e797f3503315ddd233'', 1, 3, ''2018-08-30 12:51:34'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''7fb4aa76f33f4c2d83a1a3e5611be8bc'', 2, 3, ''2018-08-30 12:52:59'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''962d89a3ac5611e8ba78000c29558df9'', 9, 14, NULL, NULL, 7);
INSERT INTO `sale_userrole` VALUES (''962d9066ac5611e8ba78000c29558df9'', 9, 15, NULL, NULL, 7);
INSERT INTO `sale_userrole` VALUES (''c4fe8fe4ac5611e8ba78000c29558df9'', 10, 16, NULL, NULL, 8);
INSERT INTO `sale_userrole` VALUES (''c4fe9532ac5611e8ba78000c29558df9'', 10, 17, NULL, NULL, 8);
INSERT INTO `sale_userrole` VALUES (''f15127edac5611e8ba78000c29558df9'', 11, 18, NULL, NULL, 9);
INSERT INTO `sale_userrole` VALUES (''f1512d75ac5611e8ba78000c29558df9'', 11, 19, NULL, NULL, 9);
INSERT INTO `sale_userrole` VALUES (''20d441b0ac5811e8ba78000c29558df9'', 12, 20, NULL, NULL, 10);
INSERT INTO `sale_userrole` VALUES (''20d446f0ac5811e8ba78000c29558df9'', 12, 21, NULL, NULL, 10);
INSERT INTO `sale_userrole` VALUES (''6b2d3521ac5811e8ba78000c29558df9'', 13, 22, NULL, NULL, 11);
INSERT INTO `sale_userrole` VALUES (''6b2d3d1fac5811e8ba78000c29558df9'', 13, 23, NULL, NULL, 11);
INSERT INTO `sale_userrole` VALUES (''795e5662ac5811e8ba78000c29558df9'', 14, 24, NULL, NULL, 12);
INSERT INTO `sale_userrole` VALUES (''795e5f43ac5811e8ba78000c29558df9'', 14, 25, NULL, NULL, 12);
INSERT INTO `sale_userrole` VALUES (''1a7fbfd0ac5911e8ba78000c29558df9'', 15, 26, NULL, NULL, 13);
INSERT INTO `sale_userrole` VALUES (''1a7fc87aac5911e8ba78000c29558df9'', 15, 27, NULL, NULL, 13);
INSERT INTO `sale_userrole` VALUES (''a70d044aaf7211e8ba78000c29558df9'', 16, 28, NULL, NULL, 14);
INSERT INTO `sale_userrole` VALUES (''a70d075faf7211e8ba78000c29558df9'', 16, 29, NULL, NULL, 14);
INSERT INTO `sale_userrole` VALUES (''6d2a7626af7311e8ba78000c29558df9'', 17, 30, NULL, NULL, 15);
INSERT INTO `sale_userrole` VALUES (''6d2a78e7af7311e8ba78000c29558df9'', 17, 31, NULL, NULL, 15);
INSERT INTO `sale_userrole` VALUES (''87cbbd41af7511e8ba78000c29558df9'', 18, 32, NULL, NULL, 16);
INSERT INTO `sale_userrole` VALUES (''87cbbffbaf7511e8ba78000c29558df9'', 18, 33, NULL, NULL, 16);
INSERT INTO `sale_userrole` VALUES (''6dfce128af7811e8ba78000c29558df9'', 19, 34, NULL, NULL, 17);
INSERT INTO `sale_userrole` VALUES (''6dfce408af7811e8ba78000c29558df9'', 19, 35, NULL, NULL, 17);
INSERT INTO `sale_userrole` VALUES (''9fbe4fe3af7911e8ba78000c29558df9'', 20, 36, NULL, NULL, 18);
INSERT INTO `sale_userrole` VALUES (''9fbe58dbaf7911e8ba78000c29558df9'', 20, 37, NULL, NULL, 18);
INSERT INTO `sale_userrole` VALUES (''b27ff0a8af7b11e8ba78000c29558df9'', 21, 38, NULL, NULL, 19);
INSERT INTO `sale_userrole` VALUES (''b27ff378af7b11e8ba78000c29558df9'', 21, 39, NULL, NULL, 19);
INSERT INTO `sale_userrole` VALUES (''040b58f4af7c11e8ba78000c29558df9'', 22, 40, NULL, NULL, 20);
INSERT INTO `sale_userrole` VALUES (''040b5be2af7c11e8ba78000c29558df9'', 22, 41, NULL, NULL, 20);
INSERT INTO `sale_userrole` VALUES (''82965024af7c11e8ba78000c29558df9'', 23, 42, NULL, NULL, 21);
INSERT INTO `sale_userrole` VALUES (''82965422af7c11e8ba78000c29558df9'', 23, 43, NULL, NULL, 21);
INSERT INTO `sale_userrole` VALUES (''2cfdc3f3af7d11e8ba78000c29558df9'', 24, 44, NULL, NULL, 22);
INSERT INTO `sale_userrole` VALUES (''2cfdc70caf7d11e8ba78000c29558df9'', 24, 45, NULL, NULL, 22);
INSERT INTO `sale_userrole` VALUES (''e3e54a9022eb4f95b9243da5feb97e1f'', 25, 2, ''2018-09-03 13:56:50'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''19b6e9acd16146bcbf4590281c22d10a'', 25, 3, ''2018-09-03 13:56:50'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''dd5b48a0b0aa11e8ba78000c29558df9'', 26, 46, NULL, NULL, 23);
INSERT INTO `sale_userrole` VALUES (''dd5b4be0b0aa11e8ba78000c29558df9'', 26, 47, NULL, NULL, 23);
INSERT INTO `sale_userrole` VALUES (''2a43f8aecdf94f62a4cc009fdd1a5e1c'', 27, 48, ''2018-09-05 02:08:57'', 26, 23);
INSERT INTO `sale_userrole` VALUES (''0f9458adb0b211e8ba78000c29558df9'', 28, 49, NULL, NULL, 24);
INSERT INTO `sale_userrole` VALUES (''0f945b59b0b211e8ba78000c29558df9'', 28, 50, NULL, NULL, 24);
INSERT INTO `sale_userrole` VALUES (''5990aa56b11611e8ba78000c29558df9'', 30, 51, NULL, NULL, 25);
INSERT INTO `sale_userrole` VALUES (''5990afd1b11611e8ba78000c29558df9'', 30, 52, NULL, NULL, 25);
INSERT INTO `sale_userrole` VALUES (''7268b9eab11611e8ba78000c29558df9'', 31, 53, NULL, NULL, 26);
INSERT INTO `sale_userrole` VALUES (''7268c117b11611e8ba78000c29558df9'', 31, 54, NULL, NULL, 26);
INSERT INTO `sale_userrole` VALUES (''95526d6e9e2b405795a7855b1884914b'', 32, 53, ''2018-09-05 14:18:30'', 31, 26);
INSERT INTO `sale_userrole` VALUES (''7e93079593784f5b9195e57f2d458d7f'', 33, 3, ''2018-09-05 14:19:28'', 1, 1);
INSERT INTO `sale_userrole` VALUES (''d0ff92ffb11611e8ba78000c29558df9'', 34, 55, NULL, NULL, 27);
INSERT INTO `sale_userrole` VALUES (''d0ff95acb11611e8ba78000c29558df9'', 34, 56, NULL, NULL, 27);
INSERT INTO `sale_userrole` VALUES (''ffa6e7abb97a42fa9bb3d3e92ff77332'', 35, 57, ''2018-09-05 14:21:28'', 34, 27);
INSERT INTO `sale_userrole` VALUES (''ecd3c826b1a811e8ba78000c29558df9'', 36, 58, NULL, NULL, 28);
INSERT INTO `sale_userrole` VALUES (''ecd3cb48b1a811e8ba78000c29558df9'', 36, 59, NULL, NULL, 28);
INSERT INTO `sale_userrole` VALUES (''ce41dbe6331c4867b27c7ae16cf289c2'', 37, 60, ''2018-09-06 07:47:53'', 36, 28);

SET FOREIGN_KEY_CHECKS = 1;
