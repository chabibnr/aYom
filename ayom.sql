/*
Navicat MySQL Data Transfer

Source Server         : Butterfly
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yii2_api_template

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-10-11 11:17:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_assignment`;
CREATE TABLE `tbl_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `tbl_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_assignment
-- ----------------------------
INSERT INTO `tbl_auth_assignment` VALUES ('Default Member', '3', '1507189283');
INSERT INTO `tbl_auth_assignment` VALUES ('Super Admin', '1', '1506755463');
INSERT INTO `tbl_auth_assignment` VALUES ('Super Admin', '2', '1506755449');

-- ----------------------------
-- Table structure for `tbl_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_item`;
CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `tbl_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tbl_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_item
-- ----------------------------
INSERT INTO `tbl_auth_item` VALUES ('/*', '2', null, null, null, '1507187123', '1507187123');
INSERT INTO `tbl_auth_item` VALUES ('/admin/*', '2', null, null, null, '1507185563', '1507185563');
INSERT INTO `tbl_auth_item` VALUES ('/admin/application/access-token/view', '2', null, null, null, '1507185396', '1507185396');
INSERT INTO `tbl_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1507189399', '1507189399');
INSERT INTO `tbl_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1507189401', '1507189401');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/role/*', '2', null, null, null, '1507188708', '1507188708');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/route/*', '2', null, null, null, '1507188709', '1507188709');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/route/create', '2', null, null, null, '1507189784', '1507189784');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/route/delete', '2', null, null, null, '1507189783', '1507189783');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/route/generate', '2', null, null, null, '1507189783', '1507189783');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/route/index', '2', null, null, null, '1507189776', '1507189776');
INSERT INTO `tbl_auth_item` VALUES ('/admin/rbac/user/*', '2', null, null, null, '1507188709', '1507188709');
INSERT INTO `tbl_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1507188718', '1507188718');
INSERT INTO `tbl_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1507188718', '1507188718');
INSERT INTO `tbl_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1507188719', '1507188719');
INSERT INTO `tbl_auth_item` VALUES ('Default Member', '1', null, null, null, '1507185462', '1507185462');
INSERT INTO `tbl_auth_item` VALUES ('Super Admin', '1', '', null, null, '1506755292', '1507184176');

-- ----------------------------
-- Table structure for `tbl_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_item_child`;
CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `tbl_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_item_child
-- ----------------------------
INSERT INTO `tbl_auth_item_child` VALUES ('Default Member', '/admin/default/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Default Member', '/admin/rbac/user/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/application/access-token/view');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/role/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/route/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/route/create');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/route/delete');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/route/generate');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/route/index');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/rbac/user/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/role/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/route/*');
INSERT INTO `tbl_auth_item_child` VALUES ('Super Admin', '/admin/user/*');

-- ----------------------------
-- Table structure for `tbl_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_rule`;
CREATE TABLE `tbl_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_category`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', 'First Category', '', null);
INSERT INTO `tbl_category` VALUES ('2', 'Second Category', '', null);

-- ----------------------------
-- Table structure for `tbl_migration`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_migration
-- ----------------------------
INSERT INTO `tbl_migration` VALUES ('m000000_000000_base', '1506569036');
INSERT INTO `tbl_migration` VALUES ('m140501_075311_add_oauth2_server', '1506570967');
INSERT INTO `tbl_migration` VALUES ('m140506_102106_rbac_init', '1506755162');
INSERT INTO `tbl_migration` VALUES ('m151024_072453_create_route_table', '1506754421');
INSERT INTO `tbl_migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', '1506755163');

-- ----------------------------
-- Table structure for `tbl_oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_access_tokens`;
CREATE TABLE `tbl_oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `tbl_oauth_access_tokens_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_oauth_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_oauth_authorization_codes`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_authorization_codes`;
CREATE TABLE `tbl_oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `redirect_uri` varchar(1000) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `tbl_oauth_authorization_codes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_oauth_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_authorization_codes
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_clients`;
CREATE TABLE `tbl_oauth_clients` (
  `client_id` varchar(32) NOT NULL,
  `client_secret` varchar(32) DEFAULT NULL,
  `redirect_uri` varchar(1000) NOT NULL,
  `grant_types` varchar(100) NOT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_clients
-- ----------------------------
INSERT INTO `tbl_oauth_clients` VALUES ('testclient', 'testpass', 'http://fake/', 'client_credentials authorization_code password implicit', null, null);

-- ----------------------------
-- Table structure for `tbl_oauth_jwt`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_jwt`;
CREATE TABLE `tbl_oauth_jwt` (
  `client_id` varchar(32) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_jwt
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_oauth_public_keys`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_public_keys`;
CREATE TABLE `tbl_oauth_public_keys` (
  `client_id` varchar(255) NOT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_public_keys
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_refresh_tokens`;
CREATE TABLE `tbl_oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `tbl_oauth_refresh_tokens_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_oauth_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_oauth_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_scopes`;
CREATE TABLE `tbl_oauth_scopes` (
  `scope` varchar(2000) NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_scopes
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_oauth_users`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oauth_users`;
CREATE TABLE `tbl_oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oauth_users
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_post`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_at` (`updated_at`),
  KEY `tbl_post_ibfk_2` (`updated_by`),
  CONSTRAINT `tbl_post_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tbl_post_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `tbl_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES ('1', 'Welcome to api template', 'applikasi melakukan trigger mode bookmark, kemudian membuka halaman baru berisikan library gambar, setelah gambar di klik maka kembali ke halaman, applikasi melakukan callback mode editnya. \r\nsetelah user menentukan titik mengirimkan ke app koordinatnya, kemudian applikasi membuka halaman baru dan ada richEditor, \r\n', null, null, null, null, '1', '1');
INSERT INTO `tbl_post` VALUES ('2', 'Other Contente', 'Contente', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for `tbl_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post_category`;
CREATE TABLE `tbl_post_category` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  UNIQUE KEY `post_id` (`post_id`,`category_id`) USING BTREE,
  KEY `category_id` (`category_id`),
  CONSTRAINT `tbl_post_category_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_post_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_post_category
-- ----------------------------
INSERT INTO `tbl_post_category` VALUES ('1', '1');
INSERT INTO `tbl_post_category` VALUES ('1', '2');

-- ----------------------------
-- Table structure for `tbl_route`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_route`;
CREATE TABLE `tbl_route` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_route
-- ----------------------------
INSERT INTO `tbl_route` VALUES ('/*', '*', '', '1');
INSERT INTO `tbl_route` VALUES ('/admin/*', '*', 'admin', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/access-token/*', '*', 'admin/application/access-token', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/access-token/create', 'create', 'admin/application/access-token', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/access-token/delete', 'delete', 'admin/application/access-token', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/access-token/index', 'index', 'admin/application/access-token', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/access-token/update', 'update', 'admin/application/access-token', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/access-token/view', 'view', 'admin/application/access-token', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/client/*', '*', 'admin/application/client', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/client/create', 'create', 'admin/application/client', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/client/delete', 'delete', 'admin/application/client', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/client/index', 'index', 'admin/application/client', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/client/update', 'update', 'admin/application/client', '1');
INSERT INTO `tbl_route` VALUES ('/admin/application/client/view', 'view', 'admin/application/client', '1');
INSERT INTO `tbl_route` VALUES ('/admin/default/*', '*', 'admin/default', '1');
INSERT INTO `tbl_route` VALUES ('/admin/default/index', 'index', 'admin/default', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/*', '*', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/create', 'create', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/delete', 'delete', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/index', 'index', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/permission', 'permission', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/update', 'update', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/role/view', 'view', 'admin/rbac/role', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/*', '*', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/create', 'create', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/delete', 'delete', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/generate', 'generate', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/index', 'index', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/update', 'update', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/route/view', 'view', 'admin/rbac/route', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/user/*', '*', 'admin/rbac/user', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/user/create', 'create', 'admin/rbac/user', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/user/delete', 'delete', 'admin/rbac/user', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/user/index', 'index', 'admin/rbac/user', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/user/update', 'update', 'admin/rbac/user', '1');
INSERT INTO `tbl_route` VALUES ('/admin/rbac/user/view', 'view', 'admin/rbac/user', '1');
INSERT INTO `tbl_route` VALUES ('/api/*', '*', 'api', '1');
INSERT INTO `tbl_route` VALUES ('/api/default/*', '*', 'api/default', '1');
INSERT INTO `tbl_route` VALUES ('/api/default/index', 'index', 'api/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/*', '*', 'debug', '1');
INSERT INTO `tbl_route` VALUES ('/debug/default/*', '*', 'debug/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/default/db-explain', 'db-explain', 'debug/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/default/download-mail', 'download-mail', 'debug/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/default/index', 'index', 'debug/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/default/toolbar', 'toolbar', 'debug/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/default/view', 'view', 'debug/default', '1');
INSERT INTO `tbl_route` VALUES ('/debug/user/*', '*', 'debug/user', '1');
INSERT INTO `tbl_route` VALUES ('/debug/user/reset-identity', 'reset-identity', 'debug/user', '1');
INSERT INTO `tbl_route` VALUES ('/debug/user/set-identity', 'set-identity', 'debug/user', '1');
INSERT INTO `tbl_route` VALUES ('/gii/*', '*', 'gii', '1');
INSERT INTO `tbl_route` VALUES ('/gii/default/*', '*', 'gii/default', '1');
INSERT INTO `tbl_route` VALUES ('/gii/default/action', 'action', 'gii/default', '1');
INSERT INTO `tbl_route` VALUES ('/gii/default/diff', 'diff', 'gii/default', '1');
INSERT INTO `tbl_route` VALUES ('/gii/default/index', 'index', 'gii/default', '1');
INSERT INTO `tbl_route` VALUES ('/gii/default/preview', 'preview', 'gii/default', '1');
INSERT INTO `tbl_route` VALUES ('/gii/default/view', 'view', 'gii/default', '1');
INSERT INTO `tbl_route` VALUES ('/oauth2/*', '*', 'oauth2', '1');
INSERT INTO `tbl_route` VALUES ('/oauth2/rest/*', '*', 'oauth2/rest', '1');
INSERT INTO `tbl_route` VALUES ('/oauth2/rest/revoke', 'revoke', 'oauth2/rest', '1');
INSERT INTO `tbl_route` VALUES ('/oauth2/rest/token', 'token', 'oauth2/rest', '1');
INSERT INTO `tbl_route` VALUES ('/oauth2/rest/user-info', 'user-info', 'oauth2/rest', '1');
INSERT INTO `tbl_route` VALUES ('/post/*', '*', 'post', '1');
INSERT INTO `tbl_route` VALUES ('/post/index', 'index', 'post', '1');
INSERT INTO `tbl_route` VALUES ('/site/*', '*', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/about', 'about', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/authorize', 'authorize', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/captcha', 'captcha', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/contact', 'contact', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/error', 'error', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/index', 'index', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/login', 'login', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/logout', 'logout', 'site', '1');
INSERT INTO `tbl_route` VALUES ('/site/signup', 'signup', 'site', '1');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'admin', 'DZ3vFUcF_pTwLZ7blnWmBddoF-CoBGR8', '$2y$13$dexAtVsFiCsrW3AXCfZlG.q98RjbAanWeOptCqMn2El0q5xZwNW7G', null, '10', '1506571888', '1506571888', null, null, 'admin');
INSERT INTO `tbl_user` VALUES ('3', 'member', 'XfsHZPNq110KYeBCQQ0x5fXpJH6uueu0', '$2y$13$a7cWOJhQ93bA6l3lIJ93yeK7ae0iO7pxgcFPQTjCY9xlMXn1gQaVG', null, '10', '1507189236', '1507189236', null, null, 'member@ms.com');
