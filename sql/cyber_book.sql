/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : cyber_book

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 03/01/2024 20:48:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admins
-- ----------------------------
DROP TABLE IF EXISTS `t_admins`;
CREATE TABLE `t_admins`  (
  `admin_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '管理员表的唯一标识',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码(MD5加密)',
  `admin_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员真实姓名',
  `status` int(1) NOT NULL COMMENT '1表示可用 0表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admins
-- ----------------------------
INSERT INTO `t_admins` VALUES (1, 'root', '1824981d619a824795b0a7b9c07fbbef', '管理员', 1, '2024-01-03 15:52:43', '2024-01-03 15:52:46');

-- ----------------------------
-- Table structure for t_book_admins
-- ----------------------------
DROP TABLE IF EXISTS `t_book_admins`;
CREATE TABLE `t_book_admins`  (
  `book_admin_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '图书管理员表的唯一标识',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码md5加密',
  `book_admin_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书管理员真实姓名',
  `status` int(1) NOT NULL COMMENT '1表示可用 0表示禁用',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`book_admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_admins
-- ----------------------------
INSERT INTO `t_book_admins` VALUES (1, 'bookadmin', '1824981d619a824795b0a7b9c07fbbef', '图书管理员', 1, '54250@qq.com', '2024-01-03 15:53:23', '2024-01-03 15:53:25');
INSERT INTO `t_book_admins` VALUES (2, 'bookadmin2', '1824981d619a824795b0a7b9c07fbbef', '图书管理员2', 1, '2233@qq.com', '2024-01-03 20:46:56', '2024-01-03 20:46:56');

-- ----------------------------
-- Table structure for t_book_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_book_rule`;
CREATE TABLE `t_book_rule`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅规则记录的唯一标识',
  `book_rule_id` int(11) NOT NULL COMMENT '借阅规则编号',
  `book_days` int(11) NOT NULL COMMENT '借阅天数',
  `book_limit_number` int(11) NOT NULL COMMENT '限制借阅的本数',
  `book_limit_library` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '限制的图书馆',
  `book_overdue_fee` double NOT NULL COMMENT '图书借阅后每天逾期费用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_rule
-- ----------------------------
INSERT INTO `t_book_rule` VALUES (1, 816, 10000, 200, '南图,北图,教师之家', 8, '2024-01-03 16:10:00', '2024-01-03 16:10:00');
INSERT INTO `t_book_rule` VALUES (2, 318, 10, 1, '南图,教师之家', 100, '2024-01-03 16:11:11', '2024-01-03 16:11:11');

-- ----------------------------
-- Table structure for t_book_type
-- ----------------------------
DROP TABLE IF EXISTS `t_book_type`;
CREATE TABLE `t_book_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书类别唯一标识',
  `type_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅类别的昵称',
  `type_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅类别的描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_type
-- ----------------------------
INSERT INTO `t_book_type` VALUES (1, '名著', '这书是名著', '2024-01-03 16:02:53', '2024-01-03 16:02:53');

-- ----------------------------
-- Table structure for t_books
-- ----------------------------
DROP TABLE IF EXISTS `t_books`;
CREATE TABLE `t_books`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书表唯一标识',
  `book_number` bigint(11) NOT NULL COMMENT '图书编号 图书的唯一标识',
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书名称',
  `book_author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书作者',
  `book_library` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书所在图书馆名称',
  `book_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书类别',
  `book_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书位置',
  `book_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书状态',
  `book_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_books
-- ----------------------------
INSERT INTO `t_books` VALUES (1, 51483980058, '红楼梦', '刘珂', '南图', '名著', 'E311', '未借出', '这是刘珂写的红楼梦,你爱看不看', '2024-01-03 16:04:41', '2024-01-03 16:04:41');

-- ----------------------------
-- Table structure for t_books_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_books_borrow`;
CREATE TABLE `t_books_borrow`  (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅表唯一标识',
  `card_number` bigint(11) NOT NULL COMMENT '借阅证编号 固定11位随机生成 用户和图书关联的唯一标识',
  `book_number` bigint(11) NOT NULL COMMENT '图书编号 图书唯一标识',
  `borrow_date` datetime NOT NULL COMMENT '借阅日期',
  `close_date` datetime NOT NULL COMMENT '截止日期',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`borrow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_books_borrow
-- ----------------------------
INSERT INTO `t_books_borrow` VALUES (1, 19330234253, 51483980058, '2024-01-03 16:15:54', '2051-05-21 16:15:54', '2024-01-03 16:19:19', '2024-01-03 16:15:56', '2024-01-03 16:15:56');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言表唯一标识',
  `comment_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言的头像 链接',
  `comment_barrage_style` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '弹幕的高度(样式)',
  `comment_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '弹幕的内容',
  `comment_time` int(11) NOT NULL COMMENT '留言的时间(控制速度)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 'https://robohash.org/19330234251', 'jiubai', '我是刘珂', 8, '2024-01-03 18:44:06', '2024-01-03 19:18:14');
INSERT INTO `t_comment` VALUES (2, 'https://robohash.org/19330234255', 'wubai', '我是蒋哲言', 7, '2024-01-03 19:18:36', '2024-01-03 19:18:36');
INSERT INTO `t_comment` VALUES (3, 'https://robohash.org/19330234252', 'erbai', '我是李培森', 8, '2024-01-03 19:18:48', '2024-01-03 19:18:48');
INSERT INTO `t_comment` VALUES (4, 'https://robohash.org/19330234254', 'sibai', '我是章云辉', 5, '2024-01-03 19:19:07', '2024-01-03 19:19:07');
INSERT INTO `t_comment` VALUES (5, 'https://robohash.org/19330234259', 'jiubai', '我是牛马', 7, '2024-01-03 20:00:25', '2024-01-03 20:00:25');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告表唯一标识',
  `notice_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告题目',
  `notice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `notice_admin_id` int(11) NOT NULL COMMENT '发布公告的管理员id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '所有目光向我看齐', '我是刘珂', 1, '2024-01-03 16:29:03', '2024-01-03 16:29:03');

-- ----------------------------
-- Table structure for t_user_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_interface_info`;
CREATE TABLE `t_user_interface_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id或管理员id',
  `interface_id` bigint(20) NOT NULL COMMENT '1 表示AI聊天接口 2表示智能分析接口 ',
  `total_num` int(11) NOT NULL DEFAULT 0 COMMENT '总共调用接口次数\r\n',
  `left_num` int(11) NOT NULL DEFAULT 0 COMMENT '剩余接口可用次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_interface_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户表的唯一标识',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 MD5加密',
  `card_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `card_number` bigint(11) NOT NULL COMMENT '借阅证编号 固定11位随机生成 非空',
  `rule_number` int(11) NOT NULL COMMENT '规则编号 可以自定义也就是权限功能',
  `status` int(1) NOT NULL COMMENT '1表示可用 0表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'user', '1824981d619a824795b0a7b9c07fbbef', '用户', 19330234253, 816, 1, '2024-01-03 15:54:12', '2024-01-03 16:10:22');

-- ----------------------------
-- Table structure for t_violation
-- ----------------------------
DROP TABLE IF EXISTS `t_violation`;
CREATE TABLE `t_violation`  (
  `violation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '违章表唯一标识',
  `card_number` bigint(11) NOT NULL COMMENT '借阅证编号 11位 随机生成',
  `book_number` bigint(11) NOT NULL COMMENT '图书编号 图书唯一标识',
  `borrow_date` datetime NOT NULL COMMENT '借阅日期',
  `close_date` datetime NOT NULL COMMENT '截止日期',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  `violation_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '违章信息',
  `violation_admin_id` int(11) NOT NULL COMMENT '违章信息管理员的id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`violation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_violation
-- ----------------------------
INSERT INTO `t_violation` VALUES (1, 19330234253, 51483980058, '2024-01-03 16:15:54', '2051-05-21 16:15:54', '2024-01-03 16:19:19', '', 1, '2024-01-03 16:15:56', '2024-01-03 16:15:56');

SET FOREIGN_KEY_CHECKS = 1;
