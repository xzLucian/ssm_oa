/*
 Navicat Premium Data Transfer

 Source Server         : DataBase
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : t285

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 07/07/2021 21:07:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for communicate
-- ----------------------------
DROP TABLE IF EXISTS `communicate`;
CREATE TABLE `communicate` (
  `comid` int NOT NULL AUTO_INCREMENT COMMENT '会议ID',
  `roomid` int DEFAULT NULL COMMENT '会议室ID',
  `userid` int DEFAULT NULL COMMENT '申请人ID',
  `title` varchar(50) DEFAULT NULL COMMENT '会议主题',
  `starttime` varchar(30) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(30) DEFAULT NULL COMMENT '结束时间',
  `state` int DEFAULT '0' COMMENT '会议审核',
  PRIMARY KEY (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communicate
-- ----------------------------
BEGIN;
INSERT INTO `communicate` VALUES (1, 1, 1, '带动经济发展', '2021-06-18 01:03:03', '2021-06-18 02:03:05', 1);
INSERT INTO `communicate` VALUES (2, 2, 1, 'oa办公管理系统上线', '2021-06-20 08:10:00', '2021-06-20 09:00:00', 1);
INSERT INTO `communicate` VALUES (3, 3, 2, 'WWDC发布会', '2021-06-21 08:00:00', '2021-06-22 20:59:59', 1);
INSERT INTO `communicate` VALUES (4, 4, 2, '高等数学强化班', '2021-10-22', '2021-10-23', 1);
INSERT INTO `communicate` VALUES (5, 5, 1, '线性代数强化课程', '2021-06-01', '2021-06-02', 1);
INSERT INTO `communicate` VALUES (6, 6, 1, '概率论基础知识过关', '2021-06-22 05:00:00', '2021-06-22 08:00:00', 1);
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentid` int NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `departmentname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名字',
  `departmentphone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门电话',
  `departmentnumber` int DEFAULT NULL COMMENT '部门人数',
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES (1, '董事会', '010-66411166', 5);
INSERT INTO `department` VALUES (2, '人事部', '010-65551114', 10);
INSERT INTO `department` VALUES (3, '财政部', '010-66096114', 10);
INSERT INTO `department` VALUES (4, '行政部', '010-64193366', 10);
INSERT INTO `department` VALUES (5, '研发部', '010-84201114', 20);
INSERT INTO `department` VALUES (6, '售货管理部', '010-58160600', 35);
INSERT INTO `department` VALUES (7, '渠道管理部', '010-63202114', 20);
INSERT INTO `department` VALUES (8, '营销部', '010-65194114', 25);
INSERT INTO `department` VALUES (9, '售后部', '010-66411167', 20);
COMMIT;

-- ----------------------------
-- Table structure for holiday
-- ----------------------------
DROP TABLE IF EXISTS `holiday`;
CREATE TABLE `holiday` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `userid` int DEFAULT NULL COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请人',
  `departmentid` int DEFAULT NULL COMMENT '部门',
  `type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(100) DEFAULT NULL COMMENT '请假原因',
  `starttime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结束时间',
  `totaltime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请假总时长',
  `state` int DEFAULT '0' COMMENT '批准状态',
  `isApply` int DEFAULT NULL COMMENT '二级审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holiday
-- ----------------------------
BEGIN;
INSERT INTO `holiday` VALUES (1, 1, 'admin', 1, '病假', '老婆怀孕', '2020-10-10 09:00:00', '2020-10-11 18:00:00', '0个月1天9小时0分钟0秒', 1, 2);
INSERT INTO `holiday` VALUES (2, 3, 'aaa', 2, '病假', '老婆怀孕', '2021-06-21 02:00:00', '2022-07-22 20:59:59', '1年1个月1天18小时59分钟59秒', 1, 1);
INSERT INTO `holiday` VALUES (3, 3, 'aaa', 2, '病假', '老婆怀孕', '2021-06-21 09:00:00', '2021-06-21 10:00:00', '0个月0天1小时0分钟0秒', 1, 1);
INSERT INTO `holiday` VALUES (4, 1, 'admin', 1, '病假', '弟弟买车', '2021-07-06 00:00:00', '2021-08-10 00:00:00', '1个月', 2, 1);
INSERT INTO `holiday` VALUES (5, 2, '123456', 2, '事假', '老婆怀孕', '2021-06-08', '2021-06-08', '1', 1, 1);
INSERT INTO `holiday` VALUES (6, 1, 'admin', 1, '事假', '老婆怀孕', '2021-06-10', '2021-06-11', '1', 1, 0);
INSERT INTO `holiday` VALUES (7, 1, 'admin', 1, '事假', '老婆怀孕', '2021-06-02', '2021-06-03', '1', 1, 0);
INSERT INTO `holiday` VALUES (8, 1, 'admin', 1, '事假', '老婆怀孕', '2021-06-11', '2021-06-12', '1', 1, 0);
INSERT INTO `holiday` VALUES (9, 1, 'admin', 1, '事假', '老婆怀孕', '2021-06-03', '2021-06-05', '2', 0, 0);
INSERT INTO `holiday` VALUES (10, 1, 'admin', 1, '事假', '弟弟结婚', '2021-06-20', '2021-06-21', '1', 0, 0);
INSERT INTO `holiday` VALUES (11, 1, 'admin', 1, '病假', '买新房子', '2021-06-21 00:00:00', '2021-07-21 23:59:59', '1个月0天', 0, 0);
INSERT INTO `holiday` VALUES (12, 16, 'demo', 3, '病假', 'test', '2021-06-21 09:00:00', '2021-08-06 23:59:59', '1个月16天14小时59分钟59秒', 0, 0);
INSERT INTO `holiday` VALUES (13, 1, 'admin', 3, '事假', 'test', '2021-06-21 09:00:00', '2021-08-06 23:59:59', '1个月16天14小时59分钟59秒', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for menuinfo
-- ----------------------------
DROP TABLE IF EXISTS `menuinfo`;
CREATE TABLE `menuinfo` (
  `menuid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名字',
  `state` int DEFAULT '1' COMMENT '状态',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单地址',
  `pid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单上级ID',
  `iconCls` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuinfo
-- ----------------------------
BEGIN;
INSERT INTO `menuinfo` VALUES ('Y01', '员工管理', 1, 'null', 'root', 'null');
INSERT INTO `menuinfo` VALUES ('Y0101', '员工信息', 1, 'user.jsp', 'Y01', 'null');
INSERT INTO `menuinfo` VALUES ('Y02', '部门管理', 1, 'null', 'root', 'null');
INSERT INTO `menuinfo` VALUES ('Y0201', '部门信息', 1, 'department.jsp', 'Y02', 'null');
INSERT INTO `menuinfo` VALUES ('Y03', '财政管理', 1, 'null', 'root', 'null');
INSERT INTO `menuinfo` VALUES ('Y0301', '工资信息', 1, 'null', 'Y03', 'null');
INSERT INTO `menuinfo` VALUES ('Y0302', '公司收入盈利', 1, 'null', 'Y03', 'null');
INSERT INTO `menuinfo` VALUES ('Y0303', '公司收费情况', 1, 'null', 'Y03', 'null');
INSERT INTO `menuinfo` VALUES ('Y04', '超级权限管理', 1, 'null', 'root', 'nulll');
INSERT INTO `menuinfo` VALUES ('Y0401', '用户列表', 1, 'showUser.jsp', 'Y04', 'nulll');
INSERT INTO `menuinfo` VALUES ('Y0402', '菜单列表', 1, 'showMenu.jsp', 'Y04', 'nulll');
INSERT INTO `menuinfo` VALUES ('Y0403', '角色列表', 1, 'showRole.jsp', 'Y04', 'nulll');
INSERT INTO `menuinfo` VALUES ('Y05', '请假管理', 1, 'null', 'root', 'null');
INSERT INTO `menuinfo` VALUES ('Y0501', '请假申请', 1, 'applyLeave.jsp', 'Y05', 'null');
INSERT INTO `menuinfo` VALUES ('Y0502', '请假审批', 1, 'approveApply.jsp', 'Y05', 'null');
INSERT INTO `menuinfo` VALUES ('Y06', '会议管理', 1, 'null', 'root', 'null');
INSERT INTO `menuinfo` VALUES ('Y0601', '会议申请', 1, 'roomApply.jsp', 'Y06', 'null');
INSERT INTO `menuinfo` VALUES ('Y0602', '会议审批', 1, 'roomApprove.jsp', 'Y06', 'null');
INSERT INTO `menuinfo` VALUES ('Y0603', '会议室管理', 1, 'room.jsp', 'Y06', 'null');
INSERT INTO `menuinfo` VALUES ('Y07', '开发者日志', 1, 'null', 'root', 'null');
INSERT INTO `menuinfo` VALUES ('Y0701', '日志', 1, 'log.jsp', 'Y07', 'null');
COMMIT;

-- ----------------------------
-- Table structure for roleinfo
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `roleid` int DEFAULT NULL COMMENT '角色ID',
  `rolename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleinfo
-- ----------------------------
BEGIN;
INSERT INTO `roleinfo` VALUES (1, '董事长');
INSERT INTO `roleinfo` VALUES (2, '人事部经理');
INSERT INTO `roleinfo` VALUES (3, '财政部经理');
INSERT INTO `roleinfo` VALUES (4, '行政部经理');
INSERT INTO `roleinfo` VALUES (5, '普通员工');
COMMIT;

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `roleid` int DEFAULT NULL COMMENT '角色ID',
  `menuid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
BEGIN;
INSERT INTO `rolemenu` VALUES (484, 4, 'Y02');
INSERT INTO `rolemenu` VALUES (485, 4, 'Y0201');
INSERT INTO `rolemenu` VALUES (486, 4, 'Y0202');
INSERT INTO `rolemenu` VALUES (661, 2, 'Y02');
INSERT INTO `rolemenu` VALUES (662, 2, 'Y0201');
INSERT INTO `rolemenu` VALUES (663, 2, 'Y0202');
INSERT INTO `rolemenu` VALUES (1029, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1030, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1031, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1032, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1033, 1, 'Y02');
INSERT INTO `rolemenu` VALUES (1034, 1, 'Y0201');
INSERT INTO `rolemenu` VALUES (1035, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1036, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1037, 1, 'Y02');
INSERT INTO `rolemenu` VALUES (1038, 1, 'Y0201');
INSERT INTO `rolemenu` VALUES (1039, 1, 'Y03');
INSERT INTO `rolemenu` VALUES (1040, 1, 'Y0301');
INSERT INTO `rolemenu` VALUES (1041, 1, 'Y0302');
INSERT INTO `rolemenu` VALUES (1042, 1, 'Y0303');
INSERT INTO `rolemenu` VALUES (1043, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1044, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1045, 1, 'Y02');
INSERT INTO `rolemenu` VALUES (1046, 1, 'Y0201');
INSERT INTO `rolemenu` VALUES (1047, 1, 'Y03');
INSERT INTO `rolemenu` VALUES (1048, 1, 'Y0301');
INSERT INTO `rolemenu` VALUES (1049, 1, 'Y0302');
INSERT INTO `rolemenu` VALUES (1050, 1, 'Y0303');
INSERT INTO `rolemenu` VALUES (1051, 1, 'Y04');
INSERT INTO `rolemenu` VALUES (1052, 1, 'Y0401');
INSERT INTO `rolemenu` VALUES (1053, 1, 'Y0402');
INSERT INTO `rolemenu` VALUES (1054, 1, 'Y0403');
INSERT INTO `rolemenu` VALUES (1055, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1056, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1057, 1, 'Y02');
INSERT INTO `rolemenu` VALUES (1058, 1, 'Y0201');
INSERT INTO `rolemenu` VALUES (1059, 1, 'Y03');
INSERT INTO `rolemenu` VALUES (1060, 1, 'Y0301');
INSERT INTO `rolemenu` VALUES (1061, 1, 'Y0302');
INSERT INTO `rolemenu` VALUES (1062, 1, 'Y0303');
INSERT INTO `rolemenu` VALUES (1063, 1, 'Y04');
INSERT INTO `rolemenu` VALUES (1064, 1, 'Y0401');
INSERT INTO `rolemenu` VALUES (1065, 1, 'Y0402');
INSERT INTO `rolemenu` VALUES (1066, 1, 'Y0403');
INSERT INTO `rolemenu` VALUES (1067, 1, 'Y05');
INSERT INTO `rolemenu` VALUES (1068, 1, 'Y0501');
INSERT INTO `rolemenu` VALUES (1069, 1, 'Y0502');
INSERT INTO `rolemenu` VALUES (1070, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1071, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1072, 1, 'Y02');
INSERT INTO `rolemenu` VALUES (1073, 1, 'Y0201');
INSERT INTO `rolemenu` VALUES (1074, 1, 'Y03');
INSERT INTO `rolemenu` VALUES (1075, 1, 'Y0301');
INSERT INTO `rolemenu` VALUES (1076, 1, 'Y0302');
INSERT INTO `rolemenu` VALUES (1077, 1, 'Y0303');
INSERT INTO `rolemenu` VALUES (1078, 1, 'Y04');
INSERT INTO `rolemenu` VALUES (1079, 1, 'Y0401');
INSERT INTO `rolemenu` VALUES (1080, 1, 'Y0402');
INSERT INTO `rolemenu` VALUES (1081, 1, 'Y0403');
INSERT INTO `rolemenu` VALUES (1082, 1, 'Y05');
INSERT INTO `rolemenu` VALUES (1083, 1, 'Y0501');
INSERT INTO `rolemenu` VALUES (1084, 1, 'Y0502');
INSERT INTO `rolemenu` VALUES (1085, 1, 'Y06');
INSERT INTO `rolemenu` VALUES (1086, 1, 'Y0601');
INSERT INTO `rolemenu` VALUES (1087, 1, 'Y0602');
INSERT INTO `rolemenu` VALUES (1088, 1, 'Y0603');
INSERT INTO `rolemenu` VALUES (1089, 1, 'Y01');
INSERT INTO `rolemenu` VALUES (1090, 1, 'Y0101');
INSERT INTO `rolemenu` VALUES (1091, 1, 'Y02');
INSERT INTO `rolemenu` VALUES (1092, 1, 'Y0201');
INSERT INTO `rolemenu` VALUES (1093, 1, 'Y03');
INSERT INTO `rolemenu` VALUES (1094, 1, 'Y0301');
INSERT INTO `rolemenu` VALUES (1095, 1, 'Y0302');
INSERT INTO `rolemenu` VALUES (1096, 1, 'Y0303');
INSERT INTO `rolemenu` VALUES (1097, 1, 'Y04');
INSERT INTO `rolemenu` VALUES (1098, 1, 'Y0401');
INSERT INTO `rolemenu` VALUES (1099, 1, 'Y0402');
INSERT INTO `rolemenu` VALUES (1100, 1, 'Y0403');
INSERT INTO `rolemenu` VALUES (1101, 1, 'Y05');
INSERT INTO `rolemenu` VALUES (1102, 1, 'Y0501');
INSERT INTO `rolemenu` VALUES (1103, 1, 'Y0502');
INSERT INTO `rolemenu` VALUES (1104, 1, 'Y06');
INSERT INTO `rolemenu` VALUES (1105, 1, 'Y0601');
INSERT INTO `rolemenu` VALUES (1106, 1, 'Y0602');
INSERT INTO `rolemenu` VALUES (1107, 1, 'Y0603');
INSERT INTO `rolemenu` VALUES (1108, 1, 'Y07');
INSERT INTO `rolemenu` VALUES (1109, 1, 'Y0701');
INSERT INTO `rolemenu` VALUES (1110, 5, 'Y01');
INSERT INTO `rolemenu` VALUES (1111, 5, 'Y0101');
INSERT INTO `rolemenu` VALUES (1112, 5, 'Y01');
INSERT INTO `rolemenu` VALUES (1113, 5, 'Y0101');
INSERT INTO `rolemenu` VALUES (1114, 5, 'Y02');
INSERT INTO `rolemenu` VALUES (1115, 5, 'Y0201');
INSERT INTO `rolemenu` VALUES (1116, 5, 'Y01');
INSERT INTO `rolemenu` VALUES (1117, 5, 'Y0101');
INSERT INTO `rolemenu` VALUES (1118, 5, 'Y02');
INSERT INTO `rolemenu` VALUES (1119, 5, 'Y0201');
INSERT INTO `rolemenu` VALUES (1120, 5, 'Y05');
INSERT INTO `rolemenu` VALUES (1121, 5, 'Y0501');
INSERT INTO `rolemenu` VALUES (1122, 3, 'Y03');
INSERT INTO `rolemenu` VALUES (1123, 3, 'Y0301');
INSERT INTO `rolemenu` VALUES (1124, 3, 'Y0302');
INSERT INTO `rolemenu` VALUES (1125, 3, 'Y0303');
INSERT INTO `rolemenu` VALUES (1126, 3, 'Y03');
INSERT INTO `rolemenu` VALUES (1127, 3, 'Y0301');
INSERT INTO `rolemenu` VALUES (1128, 3, 'Y0302');
INSERT INTO `rolemenu` VALUES (1129, 3, 'Y0303');
INSERT INTO `rolemenu` VALUES (1130, 3, 'Y05');
INSERT INTO `rolemenu` VALUES (1131, 3, 'Y0501');
INSERT INTO `rolemenu` VALUES (1132, 3, 'Y0502');
COMMIT;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `roomid` int NOT NULL AUTO_INCREMENT COMMENT '会议室ID',
  `roomname` varchar(20) DEFAULT NULL COMMENT '会议室名称',
  `peoplenum` int DEFAULT NULL COMMENT '容纳人数',
  `roomaddress` varchar(30) DEFAULT NULL COMMENT '会议地点',
  `state` int DEFAULT '0' COMMENT '会议室状态',
  `isapply` int DEFAULT NULL COMMENT '是否被申请',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
BEGIN;
INSERT INTO `room` VALUES (1, '桃花源', 10, 'A栋1层101', 1, 1);
INSERT INTO `room` VALUES (2, '梅花谷', 10, 'A栋2层201', 1, 1);
INSERT INTO `room` VALUES (3, '雅兰阁', 20, 'B栋1层101', 1, 1);
INSERT INTO `room` VALUES (4, '水云间', 20, 'B栋2层201', 1, 1);
INSERT INTO `room` VALUES (5, '紫水亭', 30, 'C栋1层101', 1, 1);
INSERT INTO `room` VALUES (6, '苍云座', 30, 'C栋2层201', 1, 1);
INSERT INTO `room` VALUES (7, '清波园', 10, 'D栋1层101', 1, 0);
INSERT INTO `room` VALUES (8, '翠玉阁', 10, 'D栋2层201', 1, 0);
INSERT INTO `room` VALUES (9, '碧玉间', 20, 'E栋1层101', 1, 0);
INSERT INTO `room` VALUES (10, '清溪阁', 15, 'E栋2层201', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工姓名',
  `userpass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工密码',
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `birthday` varchar(30) DEFAULT NULL COMMENT '出生年月',
  `departmentid` int DEFAULT NULL COMMENT '部门ID',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地点',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `entertime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入职时间',
  `salary` int DEFAULT NULL COMMENT '工资',
  `roleid` int DEFAULT '5' COMMENT '角色ID',
  `state` int DEFAULT '1' COMMENT '入职状态',
  `imageurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  PRIMARY KEY (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roleinfo` (`roleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
BEGIN;
INSERT INTO `userinfo` VALUES (1, 'admin', '4297F44B13955235245B2497399D7A93', '男', '2000-07-01', 3, '13870096885', '江西省南昌市青山湖区', '1109951287@qq.com', '2019-7-9', 18000, 1, 1, 'layui/upload/IMG_3070.jpeg');
INSERT INTO `userinfo` VALUES (2, '张三', 'EF4927839EB8810DE4CC2D9039C3527F', '女', '2000-07-01', 2, '13967325579', '江西省南昌市青山湖区', '25769532279@qq.com', '2020-3-2 ', 15000, 2, 1, 'layui/upload/1.png');
INSERT INTO `userinfo` VALUES (3, '章青', 'B3D9D77868F4F1BA1C8922CFA35E243B', '男', '2000-07-01', 3, '18277633573', '江西省南昌市青山湖区', '23177632513@qq.com', '2019-1-27', 14000, 3, 1, NULL);
INSERT INTO `userinfo` VALUES (4, '董小眼', '7EF2C31A293BBB57C2AF7C08A22DEDC9', '女', '2000-07-01', 4, '19967235541', '江西省南昌市青山湖区', '1109951287@qq.com', '2018-10-15', 13000, 4, 1, NULL);
INSERT INTO `userinfo` VALUES (5, '刘红', '58850EF94049843F5DE16D4F8F524D8C', '男', '2000-07-01', 2, '17366545572', '江西省南昌市青山湖区', '1109951287@qq.com', '2020-10-10', 12000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (6, '赵峰', '219B3A4E846E3D0019A876C74F5AF373', '女', '2000-07-01', 4, '18332556722', '江西省南昌市青山湖区', '1109951287@qq.com', '2019-3-7', 9000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (7, '孙周', 'E556421F2F543737E9040256024604FF', '男', '2000-07-01', 3, '19976312572', '江西省南昌市青山湖区', '1109951287@qq.com', '2019-5-9 ', 7000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (8, '刘琦', '4CB40714B5049BA56428F7DD1AE297E9', '男', '2000-07-01', 2, '18677325531', '江西省南昌市青山湖区', '1109951287@qq.com', '2021-3-3 ', 8000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (9, '夏雨荷', 'E10ADC3949BA59ABBE56E057F20F883E', '女', '2000-07-01', 4, '13376557731', '江西省南昌市青山湖区', '1109951287@qq.com', '2021-3-4', 8000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (10, '周芷若', 'E10ADC3949BA59ABBE56E057F20F883E', '男', '2000-07-01', 3, '13886557731', '江西省南昌市青山湖区', '1109951287@qq.com', '2020-10-10', 6000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (11, '王杨子君', 'E10ADC3949BA59ABBE56E057F20F883E', '男', '2000-07-01', 3, '18332555674', '江西省南昌市青山湖区', '1109951287@qq.com', '2019-6-17', 6000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (13, '胡淑颖', 'E2FC714C4727EE9395F324CD2E7F331F', '男', '2021-06-03', 4, '13970968505', '江西省南昌市青山湖区', '1109951287@qq.com', '2021-06-03', 6000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (14, '郑宇', '845D5F1153C27BEED29F479640445148', '女', '2000-03-11', 3, '15080802802', '江西省南昌市青山湖区', '1109951287@qq.com', '2021-03-11', 5000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (15, '周可', 'FE01CE2A7FBAC8FAFAED7C982A04E229', '女', '2000-03-11', 3, '13870096994', '江西省南昌市青山湖区', '1109951287@qq.com', '2021-03-18', 5000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (16, '谭世一', 'B247DEAFA97A5122EEF246B489074C5D', '女', '2000-03-11', 1, '13879942357', '江西省南昌市青山湖区', '1109951287@qq.com', '2019-03-11', 5000, 5, 1, NULL);
INSERT INTO `userinfo` VALUES (21, 'demo', '7C8227725C19E48E6D6288C94BC6D67B', '男', '2000-03-03', 1, '13860097095', '江西省南昌市青山湖区', '1109951287@qq.com', '2021-07-02', 9000, 5, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `roleid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrole
-- ----------------------------
BEGIN;
INSERT INTO `userrole` VALUES (1, 1, 1);
INSERT INTO `userrole` VALUES (2, 2, 2);
INSERT INTO `userrole` VALUES (3, 3, 3);
INSERT INTO `userrole` VALUES (4, 4, 4);
INSERT INTO `userrole` VALUES (5, 5, 5);
INSERT INTO `userrole` VALUES (6, 6, 5);
INSERT INTO `userrole` VALUES (7, 7, 5);
INSERT INTO `userrole` VALUES (8, 17, 5);
INSERT INTO `userrole` VALUES (9, 16, 3);
INSERT INTO `userrole` VALUES (10, 21, 5);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
