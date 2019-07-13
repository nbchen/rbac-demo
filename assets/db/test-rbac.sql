/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : test-rbac

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 13/07/2019 09:46:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for funs
-- ----------------------------
DROP TABLE IF EXISTS `funs`;
CREATE TABLE `funs`  (
  `funid` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `funname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `funurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能url',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`funid`) USING BTREE,
  INDEX `funs_fk`(`menu_id`) USING BTREE,
  CONSTRAINT `funs_fk` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of funs
-- ----------------------------
INSERT INTO `funs` VALUES (1, '首页', 'index', 1);
INSERT INTO `funs` VALUES (2, '头页面', 'head', 1);
INSERT INTO `funs` VALUES (3, '菜单页面', 'menu', 1);
INSERT INTO `funs` VALUES (4, '操作页面', 'body', 1);
INSERT INTO `funs` VALUES (5, '底页面', 'foot', 1);
INSERT INTO `funs` VALUES (6, '错误页面', 'error', 1);
INSERT INTO `funs` VALUES (7, '角色错误页面', 'roleerror', 1);
INSERT INTO `funs` VALUES (8, '成功页面', 'ok', 1);
INSERT INTO `funs` VALUES (100, '添加用户页面', 'addUser', 3);
INSERT INTO `funs` VALUES (101, '添加用会动作', 'addUserDo', 3);
INSERT INTO `funs` VALUES (102, '查询用户页面', 'findUser', 4);
INSERT INTO `funs` VALUES (103, '查询用户动作', 'findUserDo', 4);
INSERT INTO `funs` VALUES (104, '显示用户页面', 'showUser', 4);
INSERT INTO `funs` VALUES (105, '预更新用户动作', 'preUpdateUserDo', 4);
INSERT INTO `funs` VALUES (106, '更新用户页面', 'updateUser', 4);
INSERT INTO `funs` VALUES (107, '更新用户动作', 'updateUserDo', 4);
INSERT INTO `funs` VALUES (108, '删除用户动作', 'delUserDo', 4);
INSERT INTO `funs` VALUES (200, '添加客户页面', 'addCust', 6);
INSERT INTO `funs` VALUES (201, '添加客户动作', 'addCustDo', 6);
INSERT INTO `funs` VALUES (202, '查询客户页面', 'findCust', 7);
INSERT INTO `funs` VALUES (203, '查询客户动作', 'findCustDo', 7);
INSERT INTO `funs` VALUES (204, '显示客户页面', 'showCust', 7);
INSERT INTO `funs` VALUES (205, '预更新客户动作', 'preUpdateCustDo', 7);
INSERT INTO `funs` VALUES (206, '更新客户页面', 'updateCust', 7);
INSERT INTO `funs` VALUES (207, '更新客户动作', 'updateCustDo', 7);
INSERT INTO `funs` VALUES (208, '删除客户动作', 'delCustDo', 7);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `menuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menuname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menuurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单访问url',
  `fatherid` int(11) NULL DEFAULT NULL COMMENT '树形菜单,上级',
  PRIMARY KEY (`menuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'RBAC管理系统', NULL, -1);
INSERT INTO `menus` VALUES (2, '用户管理', NULL, 1);
INSERT INTO `menus` VALUES (3, '添加用户', 'addUser.jsp', 2);
INSERT INTO `menus` VALUES (4, '查询用户', 'findUser.jsp', 2);
INSERT INTO `menus` VALUES (5, '客户管理', NULL, 1);
INSERT INTO `menus` VALUES (6, '添加客户', 'addCusto.jsp', 5);
INSERT INTO `menus` VALUES (7, '查询客户', 'findCusto.jsp', 5);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `rolename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '管理员');
INSERT INTO `roles` VALUES (2, '客服人员');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus`  (
  `roles_id` int(11) NOT NULL COMMENT '角色表id',
  `menus_id` int(11) NOT NULL COMMENT '菜单表id',
  PRIMARY KEY (`roles_id`, `menus_id`) USING BTREE,
  INDEX `roles_menus_fk2`(`menus_id`) USING BTREE,
  CONSTRAINT `roles_menus_fk1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roles_menus_fk2` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`menuid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES (1, 1);
INSERT INTO `roles_menus` VALUES (2, 1);
INSERT INTO `roles_menus` VALUES (1, 2);
INSERT INTO `roles_menus` VALUES (1, 3);
INSERT INTO `roles_menus` VALUES (1, 4);
INSERT INTO `roles_menus` VALUES (1, 5);
INSERT INTO `roles_menus` VALUES (2, 5);
INSERT INTO `roles_menus` VALUES (1, 6);
INSERT INTO `roles_menus` VALUES (2, 6);
INSERT INTO `roles_menus` VALUES (1, 7);
INSERT INTO `roles_menus` VALUES (2, 7);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名,主键',
  `userpwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID,外键',
  PRIMARY KEY (`username`) USING BTREE,
  INDEX `user_fk`(`role_id`) USING BTREE,
  CONSTRAINT `user_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', 'admin', 1);
INSERT INTO `users` VALUES ('zhangsan', 'zhangsan', 2);

SET FOREIGN_KEY_CHECKS = 1;
