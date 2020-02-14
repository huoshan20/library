/*
 Navicat Premium Data Transfer

 Source Server         : MySQLlink
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 14/02/2020 15:24:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admintel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adminaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1001, '火山', '18271660494', '腾龙5215', '10adc49ba5be56e20f88');
INSERT INTO `admin` VALUES (1002, '10', '12', '11', '10adc49ba5be56e20f88');
INSERT INTO `admin` VALUES (1003, '10', '11', '12', '10adc49ba5be56e20f88');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `booktypeid` int(11) NULL DEFAULT NULL,
  `bookshelfid` int(11) NULL DEFAULT NULL,
  `bookname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publishdate` date NULL DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `indate` date NULL DEFAULT NULL,
  `bookstatus` tinyint(4) NULL DEFAULT NULL,
  `borrowtotals` int(11) NULL DEFAULT NULL,
  `isbn` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `translator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`) USING BTREE,
  INDEX `booktypeid`(`booktypeid`) USING BTREE,
  INDEX `bookshelfid`(`bookshelfid`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`booktypeid`) REFERENCES `booktype` (`booktypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`bookshelfid`) REFERENCES `bookshelf` (`bookshelfid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1015 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1000, 1, 4, '浮生物语', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-21', 0, 0, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1001, 3, 2, '浮生物语1', 'aa', '2019-12-04', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-21', 1, 1, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1002, 2, 4, '浮生物语2', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-30', 1, 0, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1003, 1, 1, '浮生物语3', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-11-19', 0, 1, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1004, 5, 4, '浮生物语4', 'bb', '2019-12-10', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-29', 0, 1, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1005, 1, 8, '浮生物语5', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-09', 0, 1, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1006, 1, 4, '浮生物语6', 'cc', '2019-12-07', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-02', 1, 0, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1007, 3, 4, '浮生物语7', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-29', 0, 0, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1008, 1, 6, '浮生物语8', 'dd', '2019-12-23', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-29', 0, 0, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1009, 5, 2, '浮', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-29', 0, 1, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1010, 1, 6, '浮生', 'ff', '2019-11-20', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2019-12-29', 0, 0, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1011, 3, 7, '浮生物', '裟椤双树', '2019-12-17', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, NULL, NULL, NULL, '9787549202614', 'aa', '长江出版社');
INSERT INTO `book` VALUES (1014, 8, 4, '浮生物语', 'gg', '2019-12-09', '千百年前，她曾是爱上了水神的小小树妖，在经历过与水神幻灭的悲情爱恋后，她独自活到现世，变成了“不停”甜品店的老板娘。她会泡一种叫做浮生的茶，她店铺里会来很多奇怪的客人。', 26.80, '2020-02-08', 0, 0, '9787549202614', 'aa', '长江出版社');

-- ----------------------------
-- Table structure for bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf`;
CREATE TABLE `bookshelf`  (
  `bookshelfid` int(11) NOT NULL AUTO_INCREMENT,
  `bookshelfname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookshelfid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookshelf
-- ----------------------------
INSERT INTO `bookshelf` VALUES (1, '1楼A书架');
INSERT INTO `bookshelf` VALUES (2, '1楼B书架');
INSERT INTO `bookshelf` VALUES (3, '1楼C书架');
INSERT INTO `bookshelf` VALUES (4, '1楼D书架');
INSERT INTO `bookshelf` VALUES (5, '2楼A书架');
INSERT INTO `bookshelf` VALUES (6, '2楼B书架');
INSERT INTO `bookshelf` VALUES (7, '2楼C书架');
INSERT INTO `bookshelf` VALUES (8, '2楼D书架');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype`  (
  `booktypeid` int(11) NOT NULL AUTO_INCREMENT,
  `booktypename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`booktypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES (1, '马克思主义,列宁主义');
INSERT INTO `booktype` VALUES (2, '哲学');
INSERT INTO `booktype` VALUES (3, '宗教');
INSERT INTO `booktype` VALUES (4, '政治');
INSERT INTO `booktype` VALUES (5, '法律');
INSERT INTO `booktype` VALUES (6, '军事');
INSERT INTO `booktype` VALUES (7, '经济');
INSERT INTO `booktype` VALUES (8, '文化、科学、教育');
INSERT INTO `booktype` VALUES (9, '语言');
INSERT INTO `booktype` VALUES (10, '文学');
INSERT INTO `booktype` VALUES (11, '艺术');
INSERT INTO `booktype` VALUES (12, '历史');
INSERT INTO `booktype` VALUES (13, '地理');
INSERT INTO `booktype` VALUES (14, '天文学');
INSERT INTO `booktype` VALUES (15, '生物科学');
INSERT INTO `booktype` VALUES (16, '农业技术');
INSERT INTO `booktype` VALUES (17, '工业技术');
INSERT INTO `booktype` VALUES (18, '交通运输');
INSERT INTO `booktype` VALUES (19, '航天航空');
INSERT INTO `booktype` VALUES (20, '环境科学');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `bookid` int(11) NOT NULL,
  `readerid` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fineid` int(11) NULL DEFAULT NULL,
  `borrowdate` date NULL DEFAULT NULL,
  `expiredate` date NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`, `readerid`) USING BTREE,
  INDEX `readerid`(`readerid`) USING BTREE,
  INDEX `fineid`(`fineid`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`readerid`) REFERENCES `reader` (`readid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_3` FOREIGN KEY (`fineid`) REFERENCES `fine` (`fineid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1001, '201912290001', NULL, '2020-02-05', '2020-03-06');
INSERT INTO `borrow` VALUES (1002, '201912290002', NULL, '2019-12-17', '2020-01-15');
INSERT INTO `borrow` VALUES (1006, '201912290003', NULL, '2019-12-18', '2020-01-16');

-- ----------------------------
-- Table structure for borrowecord
-- ----------------------------
DROP TABLE IF EXISTS `borrowecord`;
CREATE TABLE `borrowecord`  (
  `borrowecordid` int(11) NOT NULL AUTO_INCREMENT,
  `fineid` int(11) NULL DEFAULT NULL,
  `readerid` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bookid` int(11) NULL DEFAULT NULL,
  `borrowdate` date NULL DEFAULT NULL,
  `expiredate` date NULL DEFAULT NULL,
  `returndate` date NULL DEFAULT NULL,
  PRIMARY KEY (`borrowecordid`) USING BTREE,
  INDEX `fineid`(`fineid`) USING BTREE,
  INDEX `readerid`(`readerid`) USING BTREE,
  INDEX `bookid`(`bookid`) USING BTREE,
  CONSTRAINT `borrowecord_ibfk_1` FOREIGN KEY (`fineid`) REFERENCES `fine` (`fineid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrowecord_ibfk_2` FOREIGN KEY (`readerid`) REFERENCES `reader` (`readid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrowecord_ibfk_3` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1006 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of borrowecord
-- ----------------------------
INSERT INTO `borrowecord` VALUES (1000, NULL, '201912290002', 1001, '2019-05-29', '2019-10-22', '2019-10-01');
INSERT INTO `borrowecord` VALUES (1003, 3, '201912290001', 1005, '2019-12-02', '2019-12-26', '2020-02-05');
INSERT INTO `borrowecord` VALUES (1004, 4, '201912290001', 1009, '2019-12-06', '2020-02-01', '2020-02-05');
INSERT INTO `borrowecord` VALUES (1005, 5, '201912290001', 1004, '2020-02-05', '2019-11-20', '2020-02-05');

-- ----------------------------
-- Table structure for fine
-- ----------------------------
DROP TABLE IF EXISTS `fine`;
CREATE TABLE `fine`  (
  `fineid` int(11) NOT NULL AUTO_INCREMENT,
  `damage` double NULL DEFAULT NULL,
  `damagemoney` double NULL DEFAULT NULL,
  `overdueday` int(11) NULL DEFAULT NULL,
  `overduemoney` double NULL DEFAULT NULL,
  `paymentmoney` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paymenttype` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`fineid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fine
-- ----------------------------
INSERT INTO `fine` VALUES (3, NULL, NULL, 41, 4.5, NULL, NULL);
INSERT INTO `fine` VALUES (4, NULL, NULL, 4, 0.4, NULL, NULL);
INSERT INTO `fine` VALUES (5, NULL, NULL, 77, 7.7, NULL, NULL);

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `readid` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `readname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(4) NULL DEFAULT NULL,
  `readertype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `readertel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sfz` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerdate` date NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `department` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `readerclass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `readeradress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`readid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('201912290001', '刘灿', 1, '学生', '18271660356', '2248356191', '42102319980462', '2019-12-29', 1, '计算机学院', '软件工程', '5216');
INSERT INTO `reader` VALUES ('201912290002', '王林', 1, '学生', '18271660486', '2248356191', '4210355864855', '2019-12-29', 1, '计算机学院', '软件工程', '5215');
INSERT INTO `reader` VALUES ('201912290003', '赵日天', 0, '老师', '156461555', '2248356191', '6164161664556', '2019-12-29', 1, NULL, NULL, '青龙山');
INSERT INTO `reader` VALUES ('201912290004', '叶辰', 1, '学生', '1646466', '2248356191', '6164613146', '2019-12-29', 1, NULL, NULL, '5246');
INSERT INTO `reader` VALUES ('201912290005', '高手', 0, '老师', '1316646', '2248356191', '616464', '2019-12-29', 1, NULL, NULL, '5246');
INSERT INTO `reader` VALUES ('201912290006', '刘天', 1, '老师', '1646466', '2248356191', '616464', '2019-12-29', 1, NULL, NULL, '5246');
INSERT INTO `reader` VALUES ('201912290007', '刘地', 0, '老师', '1646466', '2248356191', '8546164', '2019-12-29', 1, NULL, NULL, '5246');
INSERT INTO `reader` VALUES ('201912290008', '刘无', 0, '老师', '1646466', '2248356191', '8546164', '2019-12-29', 1, NULL, NULL, '5246');
INSERT INTO `reader` VALUES ('201912290009', '刘敌', 0, '老师', '1646466', '2248356191', '8546164', '2019-12-29', 1, NULL, NULL, '5246');
INSERT INTO `reader` VALUES ('202002061', '流水', 0, '学生', '111111', '2248356191', '6101211989060', '2020-02-06', 1, '计算机学院', '软件工程', '5216');
INSERT INTO `reader` VALUES ('202002062', '高渐离', 0, '老师', '1111111', '2248356191', '61012119890', '2020-02-06', 1, '', '', '5217');

SET FOREIGN_KEY_CHECKS = 1;
