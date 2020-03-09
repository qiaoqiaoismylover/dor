/*
Navicat MySQL Data Transfer

Source Server         : dbdormitory
Source Server Version : 50646
Source Host           : localhost:3306
Source Database       : dbdormitory

Target Server Type    : MYSQL
Target Server Version : 50646
File Encoding         : 65001

Date: 2019-12-06 10:01:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ad_id` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ad_id`) COMMENT '管理员账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `dor_admin`
-- ----------------------------
DROP TABLE IF EXISTS `dor_admin`;
CREATE TABLE `dor_admin` (
  `dor_ad_id` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `dor_id` varchar(20) NOT NULL DEFAULT '' COMMENT '可管理宿舍号',
  `dor_ad_phone` varchar(20) DEFAULT NULL COMMENT '宿管联系电话',
  PRIMARY KEY (`dor_ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宿舍管理员账号';

-- ----------------------------
-- Records of dor_admin
-- ----------------------------
INSERT INTO `dor_admin` VALUES ('13', '123', '123', '123');
INSERT INTO `dor_admin` VALUES ('dodo', 'dodo', '11', '15911112203');
INSERT INTO `dor_admin` VALUES ('doradmin', 'doradmin', '10', '15911112202');
INSERT INTO `dor_admin` VALUES ('doradmin2', 'doradmin2', '11', '15911112204');
INSERT INTO `dor_admin` VALUES ('doradmin3', 'doradmin3', '09', '15911112205');
INSERT INTO `dor_admin` VALUES ('pupu', 'pupu', '09', '15911112201');

-- ----------------------------
-- Table structure for `dor_info`
-- ----------------------------
DROP TABLE IF EXISTS `dor_info`;
CREATE TABLE `dor_info` (
  `dor_id` varchar(20) NOT NULL DEFAULT '' COMMENT '宿舍号',
  `dor_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '宿舍电话',
  `resident_num` varchar(20) NOT NULL DEFAULT '' COMMENT '可住人数',
  `occupied_num` varchar(20) NOT NULL DEFAULT '' COMMENT '已住人数',
  PRIMARY KEY (`dor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宿舍楼管理';

-- ----------------------------
-- Records of dor_info
-- ----------------------------
INSERT INTO `dor_info` VALUES ('09714', '3254214', '3', '3');
INSERT INTO `dor_info` VALUES ('10716', '3254216', '3', '3');
INSERT INTO `dor_info` VALUES ('11714', '3254215', '3', '0');
INSERT INTO `dor_info` VALUES ('11715', '3254215', '10', '3');

-- ----------------------------
-- Table structure for `stu_info`
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info` (
  `stu_id` varchar(20) NOT NULL DEFAULT '' COMMENT '学号',
  `password` varchar(20) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(20) NOT NULL DEFAULT '' COMMENT '性别',
  `department` varchar(20) NOT NULL DEFAULT '' COMMENT '所在系',
  `dor_id` varchar(20) NOT NULL DEFAULT '' COMMENT '宿舍号',
  `stu_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `stu_class` varchar(20) NOT NULL DEFAULT '' COMMENT '专业班级',
  PRIMARY KEY (`stu_id`) COMMENT '学号',
  KEY `index_dor_id` (`dor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生个人信息';

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES ('123', '123', '罗一', '男', '信工', '09714', '15911111140', '外包162');
INSERT INTO `stu_info` VALUES ('1234', '1234', '张二', '女', '信工', '11715', '15911111143', '外包162');
INSERT INTO `stu_info` VALUES ('1600502241', '1600502241', '刘二', '男', '信工', '11715', '15911111141', '外包162');
INSERT INTO `stu_info` VALUES ('1600502242', '1600502242', '王五', '女', '信工', '10716', '15911111142', '外包162');
INSERT INTO `stu_info` VALUES ('1600502244', '1600502244', '赵七', '女', '信工', '11714', '15911111144', '外包162');
INSERT INTO `stu_info` VALUES ('1600502246', '1600502246', '王十', '男', '信工', '09715', '15911111150', '外包162');

-- ----------------------------
-- Table structure for `water_and_electricity`
-- ----------------------------
DROP TABLE IF EXISTS `water_and_electricity`;
CREATE TABLE `water_and_electricity` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单号',
  `dor_id` varchar(20) NOT NULL DEFAULT '' COMMENT '宿舍号',
  `time` varchar(30) NOT NULL DEFAULT '' COMMENT '时间',
  `water_consum` varchar(20) NOT NULL DEFAULT '' COMMENT '用水量 单位立方',
  `water_charge` varchar(20) NOT NULL DEFAULT '' COMMENT '水费',
  `electricity_consum` varchar(20) NOT NULL DEFAULT '' COMMENT '用电量 单位度',
  `electricity_charge` varchar(20) NOT NULL DEFAULT '' COMMENT '电费',
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '缴纳状态',
  PRIMARY KEY (`bill_id`) COMMENT '单号',
  KEY `index_dor_id` (`dor_id`),
  KEY `index_dor_pay` (`is_pay`,`dor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='水电费';

-- ----------------------------
-- Records of water_and_electricity
-- ----------------------------
INSERT INTO `water_and_electricity` VALUES ('1', '11715', '2019-03-21 15:52:10', '6立方', '12元', '15度', '45元', '0');
INSERT INTO `water_and_electricity` VALUES ('2', '09714', '2019-03-20 15:52:16', '7立方', '14元', '14度', '42元', '1');
INSERT INTO `water_and_electricity` VALUES ('3', '10716', '2019-03-18 15:52:23', '3立方', '6元', '13度', '39元', '0');
INSERT INTO `water_and_electricity` VALUES ('5', '09714', '2019-02-20 15:52:16', '7立方', '14元', '14度', '42元', '1');
INSERT INTO `water_and_electricity` VALUES ('6', '10716', '2019-02-21 15:52:10', '6立方', '12元', '15度', '45元', '1');
