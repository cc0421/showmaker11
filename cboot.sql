/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.7.31 : Database - cboot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cboot` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cboot`;

/*Table structure for table `cost_collection` */

DROP TABLE IF EXISTS `cost_collection`;

CREATE TABLE `cost_collection` (
  `regis_id` int(11) NOT NULL,
  `collection_date` date DEFAULT NULL,
  `collection_method` char(10) DEFAULT NULL,
  `collection_summary` char(10) DEFAULT NULL,
  `collection_amount` int(11) DEFAULT NULL,
  `bill_flag` char(10) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`regis_id`),
  KEY `Ref1514` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `cost_collection` */

/*Table structure for table `cost_contract_linkman` */

DROP TABLE IF EXISTS `cost_contract_linkman`;

CREATE TABLE `cost_contract_linkman` (
  `LINK_MAN_ID` int(11) NOT NULL,
  `LINKMAN_NAME` varchar(30) DEFAULT NULL,
  `MOBILE_PHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(127) DEFAULT NULL,
  `ADDRESS` varchar(127) DEFAULT NULL,
  `FAX` varchar(30) DEFAULT NULL,
  `POST` varchar(30) DEFAULT NULL,
  `MEMO` varchar(127) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`LINK_MAN_ID`),
  KEY `Ref1911` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `cost_contract_linkman` */

/*Table structure for table `cost_customer` */

DROP TABLE IF EXISTS `cost_customer`;

CREATE TABLE `cost_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` char(10) DEFAULT NULL,
  `link_person` char(10) DEFAULT NULL,
  `customer_address` char(10) DEFAULT NULL,
  `reg_user_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `cost_customer` */

/*Table structure for table `cost_project` */

DROP TABLE IF EXISTS `cost_project`;

CREATE TABLE `cost_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_plantime` date DEFAULT NULL,
  `project_name` char(10) DEFAULT NULL,
  `project_num` int(11) DEFAULT NULL,
  `project_money` int(11) DEFAULT NULL,
  `project_inmoney` decimal(18,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `user_name` varchar(16) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `Ref1915` (`customer_id`),
  KEY `Ref2016` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `cost_project` */

insert  into `cost_project`(`project_id`,`project_plantime`,`project_name`,`project_num`,`project_money`,`project_inmoney`,`start_date`,`user_name`,`customer_id`,`USER_ID`) values 
(1,'2020-11-13','ppp',121,122,200.00,'2020-11-12','lisi',1,1),
(2,'2020-11-20','去去去',123,123,1213.00,'2020-11-20','rer',2,2),
(3,NULL,'1313',12,13131,2132.00,NULL,'123',13213,131);

/*Table structure for table `cost_refund` */

DROP TABLE IF EXISTS `cost_refund`;

CREATE TABLE `cost_refund` (
  `refund_id` int(11) NOT NULL,
  `refund_date` datetime NOT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_user_name` char(10) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `Ref1512` (`project_id`),
  KEY `Ref209` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `cost_refund` */

/*Table structure for table `cost_refund_detail` */

DROP TABLE IF EXISTS `cost_refund_detail`;

CREATE TABLE `cost_refund_detail` (
  `refund_detail_ID` int(11) NOT NULL,
  `detail_item` int(11) DEFAULT NULL,
  `pay_summary` char(10) DEFAULT NULL,
  `renfund_detail_amount` int(11) DEFAULT NULL,
  `refund_id` int(11) NOT NULL,
  PRIMARY KEY (`refund_detail_ID`),
  KEY `Ref1613` (`refund_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `cost_refund_detail` */

/*Table structure for table `hx_dict` */

DROP TABLE IF EXISTS `hx_dict`;

CREATE TABLE `hx_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cname` varchar(50) DEFAULT NULL COMMENT '名称',
  `ccode` varchar(50) DEFAULT NULL COMMENT '代码',
  `parentCode` varchar(50) DEFAULT NULL COMMENT '父编码',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `hx_dict` */

insert  into `hx_dict`(`id`,`cname`,`ccode`,`parentCode`,`remark`) values 
(1,'被子','1001001',NULL,'被子'),
(2,'床单','1001002',NULL,'床单'),
(3,'被罩','1001003',NULL,'被罩');

/*Table structure for table `rbac_organ` */

DROP TABLE IF EXISTS `rbac_organ`;

CREATE TABLE `rbac_organ` (
  `DEPARTMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_CODE` varchar(32) DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(32) NOT NULL,
  `ORGAN_TYPE` tinyint(4) DEFAULT NULL,
  `BELONG_ID` int(11) NOT NULL DEFAULT '0',
  `TYPE` tinyint(4) DEFAULT '1',
  `DEPARTMENT_DEPTH` tinyint(4) NOT NULL,
  `ORDER_BY_WAY` int(11) DEFAULT '0',
  `BRANCH_LEADERSHIP` int(11) DEFAULT NULL,
  `LEADER_USER_ID` int(11) DEFAULT NULL,
  `ASSIST_USER_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_POST` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `rbac_organ` */

/*Table structure for table `t_customer` */

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `custName` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `cPhoneNum` varchar(20) DEFAULT NULL COMMENT '电话',
  `cEmail` varchar(60) DEFAULT NULL COMMENT '电子邮箱',
  `cAddress` varchar(200) DEFAULT NULL COMMENT '地址',
  `cRemark` varchar(300) DEFAULT NULL COMMENT '备注',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `cStatus` int(2) DEFAULT NULL COMMENT '状态0启用1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_customer` */

insert  into `t_customer`(`id`,`custName`,`cPhoneNum`,`cEmail`,`cAddress`,`cRemark`,`addTime`,`cStatus`) values 
(1,'1','1','1','1','1','2020-04-03 21:38:23',0);

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deptName` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `deptDesc` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `enable` int(3) DEFAULT NULL COMMENT '0 启用 1 禁用<!-- "{\\"formType\\":\\"select\\",\\"options\\":[{\\"optText\\":\\"启用\\",\\"optValue\\":0},{\\"optText\\":\\"禁用\\",\\"optValue\\":1}]}" -->',
  `parentId` int(11) DEFAULT NULL COMMENT '上级部们<!-- "{\\"formType\\":\\"foreignKey\\",\\"fKName\\":\\"dept_dept_fk\\"}" -->',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  `parentName` varchar(100) DEFAULT NULL COMMENT '上级部们名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10206 DEFAULT CHARSET=utf8;

/*Data for the table `t_dept` */

insert  into `t_dept`(`id`,`deptName`,`deptDesc`,`enable`,`parentId`,`sort`,`parentName`) values 
(1,'河南有限公司总部','河南总部',0,0,1,NULL),
(101,'郑州东区分公司','东区分公司',0,1,101,'河南有限公司总部'),
(102,'总部物联网产业部','总部物联网',0,1,102,'河南有限公司总部'),
(103,'总部IT产业部','总部IT产业部',0,1,103,'河南有限公司总部'),
(10101,'东区分公司金穗产业部','东区分公司金穗产业部',0,101,10101,'郑州东区分公司'),
(10102,'东区分公司金融产业部','东区分公司金融产业部',0,101,10102,'郑州东区分公司'),
(10103,'东区分公司物联网产业部','东区分公司物联网产业部',0,101,10103,'郑州东区分公司'),
(10104,'东区分公司金盾产业部','东区分公司金盾产业部',0,101,10104,'郑州东区分公司'),
(10105,'东区分公司IT产业部','东区分公司IT产业部',0,101,10105,'郑州东区分公司'),
(10201,'物联网研发小组','研发小组',0,102,10201,'总部物联网产业部'),
(10203,'111','111',1,10202,1,'111'),
(10204,'123','1213',1,10101,2,'东区分公司金穗产业部'),
(10205,'333','112',1,10101,1,'东区分公司金穗产业部');

/*Table structure for table `t_fkeys` */

DROP TABLE IF EXISTS `t_fkeys`;

CREATE TABLE `t_fkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fkName` varchar(50) DEFAULT NULL COMMENT '外键名称',
  `mTableName` varchar(50) DEFAULT NULL COMMENT '主表名',
  `mColumnName` varchar(50) DEFAULT NULL COMMENT '主表关联列名',
  `rTableName` varchar(50) DEFAULT NULL COMMENT '从表名',
  `rColumnName` varchar(50) DEFAULT NULL COMMENT '从表关联列名',
  `rType` int(2) DEFAULT NULL COMMENT '关联查询类型<!-- "{\\"formType\\":\\"select\\",\\"options\\":[{\\"optText\\":\\"一对一\\",\\"optValue\\":0},{\\"optText\\":\\"列表\\",\\"optValue\\":1},{\\"optText\\":\\"树\\",\\"optValue\\":2}]}" -->',
  `rSql` varchar(200) DEFAULT NULL COMMENT '关联查询语句',
  `coverOtherValueColumn` varchar(100) DEFAULT NULL COMMENT '主表取值查询视图的列对应',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_fkeys` */

insert  into `t_fkeys`(`id`,`fkName`,`mTableName`,`mColumnName`,`rTableName`,`rColumnName`,`rType`,`rSql`,`coverOtherValueColumn`) values 
(1,'user_dept_fk','t_user','deptId','t_dept','id',2,'SELECT t.id AS id ,t.deptName AS name ,t.parentId pId, \'true\' as open,\"other\" as otherColumn FROM t_dept t','[{ \"mTable\":\"deptId\" ,\"rSql\":\"id\" }, {\"mTable\":\"deptName\", \"rSql\":\"name\"}]'),
(2,'dept_dept_fk','t_dept','parentId','t_dept','id',2,'SELECT  t.id AS id, t.deptName AS `name`, t.parentId pId , \'true\' AS `open` FROM t_dept t','[{ \"mTable\":\"parentId\" ,\"rSql\":\"id\" }, {\"mTable\":\"parentName\", \"rSql\":\"name\"}]'),
(3,'testuser_dept_fk','t_testuser','deptId','t_dept','id',2,'SELECT t.id AS id ,t.deptName AS name ,t.parentId pId, \'true\' as open,\"other\" as otherColumn FROM t_dept t','[{ \"mTable\":\"deptId\" ,\"rSql\":\"id\" }, {\"mTable\":\"deptName\", \"rSql\":\"name\"}]'),
(4,'role_role_fk','t_role','pRoleKey','t_role','roleKey',2,'SELECT t.roleKey AS id ,t.roleDesc AS name ,t.pRoleKey pId, \'true\' as open,\"other\" as otherColumn FROM t_role t','[{ \"mTable\":\"pRoleKey\" ,\"rSql\":\"id\" }, {\"mTable\":\"pRoleDesc\", \"rSql\":\"name\"}]');

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fromUserId` int(11) NOT NULL COMMENT '发送人',
  `toUserId` int(11) NOT NULL COMMENT '接收人',
  `msgContent` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `status` int(2) DEFAULT NULL COMMENT '状态0未读1已读',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `readTime` datetime DEFAULT NULL COMMENT '阅读时间',
  `conversationId` varchar(100) DEFAULT NULL COMMENT '会话ID',
  `corder` int(11) DEFAULT NULL COMMENT '会话序列',
  PRIMARY KEY (`id`,`fromUserId`,`toUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

insert  into `t_message`(`id`,`fromUserId`,`toUserId`,`msgContent`,`status`,`addTime`,`readTime`,`conversationId`,`corder`) values 
(1,1,2,'中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！中国必胜，中国加油！',0,'2020-04-03 21:38:23',NULL,'aaaaaaabbbbb',0),
(2,2,1,'必须的！必须的！必须的！必须的！必须的！必须的！必须的！必须的！必须的！必须的！必须的！必须的！必须的！',0,'2020-04-22 10:19:09',NULL,'aaaaaaabbbbb',1),
(37,1,2,'$(this).attr(\"myAttr\");',0,'2020-04-09 16:52:42',NULL,'aaaaaaabbbbb',2),
(38,1,2,'sdddddddddddd',0,'2020-04-09 16:53:06',NULL,'aaaaaaabbbbb',3),
(39,1,2,'sddddddddddd',0,'2020-04-09 16:53:11',NULL,'aaaaaaabbbbb',4),
(40,1,2,'sddddddddddddddd',0,'2020-04-09 16:53:14',NULL,'aaaaaaabbbbb',5),
(41,1,2,'dssssssssssssssssssssssss',0,'2020-04-09 16:53:17',NULL,'8b0d60d7d07548ffa32ac59824eb582f',0),
(42,1,2,'sddddddddddddd',0,'2020-04-09 16:53:39',NULL,'8b0d60d7d07548ffa32ac59824eb582f',1),
(43,1,2,'$(this).attr(\"myAttr\");$(this).attr(\"myAttr\");',0,'2020-04-09 16:55:07',NULL,'8b0d60d7d07548ffa32ac59824eb582f',2),
(44,1,2,'rttttttttt',0,'2020-04-09 17:28:35',NULL,'8b0d60d7d07548ffa32ac59824eb582f',3),
(45,1,2,'converId',0,'2020-04-09 17:29:53',NULL,'8b0d60d7d07548ffa32ac59824eb582f',4),
(46,1,2,'converId',0,'2020-04-09 17:30:01',NULL,'8b0d60d7d07548ffa32ac59824eb582f',5),
(47,1,2,'converId',0,'2020-04-09 17:30:06',NULL,'34e0f5878df646cdb8e3a3f299a60dd3',0),
(48,1,2,'converId',0,'2020-04-09 17:30:23',NULL,'34e0f5878df646cdb8e3a3f299a60dd3',1),
(49,1,2,'converId',0,'2020-04-09 18:05:22',NULL,'0b66c61c57aa433993a329be15048b55',0),
(50,1,2,'33232232',0,'2020-04-10 09:48:18',NULL,'0b66c61c57aa433993a329be15048b55',1);

/*Table structure for table `t_orgcomment` */

DROP TABLE IF EXISTS `t_orgcomment`;

CREATE TABLE `t_orgcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `newsId` int(11) DEFAULT NULL COMMENT '新闻ID',
  `ncomment` longtext COMMENT '评论内容',
  `userId` int(11) DEFAULT NULL COMMENT '评论人ID',
  `userName` varchar(60) DEFAULT NULL COMMENT '评论人名称',
  `addTime` datetime DEFAULT NULL COMMENT '评论时间',
  `cstate` int(11) DEFAULT NULL COMMENT '评论状态0显示1隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_orgcomment` */

insert  into `t_orgcomment`(`id`,`newsId`,`ncomment`,`userId`,`userName`,`addTime`,`cstate`) values 
(6,13,'&lt;p&gt;&lt;b&gt;affasfsdasfda&lt;/b&gt;afsddafsafasdfassa&lt;/p&gt;',1,'admin','2020-04-18 19:01:30',0),
(7,13,'&lt;p&gt;&lt;img alt=&quot;3ed16bfa-ec3f-4c42-bbb6-2ba085f2cd5d.jpg&quot; src=&quot;/simditor/image/b0c451cd-be43-447d-ad79-57248bf6aa52.jpg&quot; width=&quot;300&quot; height=&quot;300&quot;&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-18 22:53:13',0),
(8,13,'&lt;p&gt;&lt;img alt=&quot;4b3f6fd7-6697-4d75-ac1c-d0be489f8c37.jpg&quot; src=&quot;/simditor/image/cd561a6b-f521-4096-9817-511010b1022a.jpg&quot; width=&quot;350&quot; height=&quot;350&quot;&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-18 22:53:55',0),
(9,13,'&lt;p&gt;&lt;img alt=&quot;4b3f6fd7-6697-4d75-ac1c-d0be489f8c37.jpg&quot; src=&quot;/simditor/image/cd561a6b-f521-4096-9817-511010b1022a.jpg&quot; width=&quot;350&quot; height=&quot;350&quot;&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-18 22:54:27',0),
(10,13,'',1,'admin','2020-04-18 22:59:33',0),
(11,13,'&lt;p&gt;&lt;img alt=&quot;5f69c0fb-8041-4df8-8db9-11b38a693fc8.jpg&quot; src=&quot;/simditor/image/2939fca8-19f5-467d-a0d8-280b9e98a36a.jpg&quot; width=&quot;350&quot; height=&quot;350&quot;&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-18 22:59:47',0),
(12,13,'&lt;p&gt;&lt;img alt=&quot;7db6d36c-56f7-40c8-801a-f3812f88536d.jpg&quot; src=&quot;/simditor/image/1504d52d-8de0-40be-9ee8-468839f36cb7.jpg&quot; width=&quot;350&quot; height=&quot;350&quot;&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-18 23:01:17',0),
(13,13,'&lt;p&gt;asfdsda&lt;/p&gt;',1,'admin','2020-04-19 09:14:56',0),
(14,13,'&lt;p&gt;asfdsdfasfd&lt;/p&gt;',1,'admin','2020-04-19 09:14:59',0),
(15,13,'&lt;p&gt;asfddfsaff&lt;/p&gt;',1,'admin','2020-04-19 09:15:08',0),
(16,13,'&lt;p&gt;sfsdfsdaas&lt;/p&gt;',1,'admin','2020-04-19 09:15:34',0),
(17,13,'&lt;p&gt;sadfafafasdfasfasafsfaddasf&lt;/p&gt;',1,'admin','2020-04-19 09:15:48',0),
(18,13,'&lt;p&gt;&lt;b&gt;afsddfsafsdafsdfsdfdsa&lt;/b&gt;&lt;/p&gt;',1,'admin','2020-04-19 09:15:52',0),
(19,13,'&lt;p&gt;afasf&lt;/p&gt;',1,'admin','2020-04-19 09:47:38',0),
(20,13,'&lt;p&gt;afsd&lt;/p&gt;',1,'admin','2020-04-19 09:49:44',0),
(21,13,'&lt;p&gt;afsd&lt;/p&gt;',1,'admin','2020-04-19 10:06:44',0),
(22,13,'&lt;p&gt;sasssssssssssssss&lt;/p&gt;',1,'admin','2020-04-19 10:06:50',0),
(23,13,'&lt;p&gt;&lt;span style=&quot;&quot;&gt;&lt;b&gt;queryWhere&lt;/b&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-19 10:10:49',0),
(24,13,'&lt;p&gt;&lt;b&gt;asfsda&lt;/b&gt;&lt;/p&gt;',1,'admin','2020-04-19 10:25:07',0),
(25,13,'&lt;p&gt;fsasdafss&amp;nbsp;&lt;/p&gt;',1,'admin','2020-04-19 10:26:58',0),
(26,13,'&lt;p&gt;afsdasf&amp;nbsp;&lt;/p&gt;',1,'admin','2020-04-19 10:31:30',0),
(27,13,'&lt;p&gt;sfad&amp;nbsp;&lt;/p&gt;',1,'admin','2020-04-19 10:32:20',0),
(28,13,'&lt;p&gt;fsasadf&lt;/p&gt;',1,'admin','2020-04-19 10:33:56',0),
(29,13,'&lt;p&gt;afs&lt;/p&gt;',1,'admin','2020-04-19 10:34:05',0),
(30,13,'&lt;p&gt;&lt;span style=&quot;&quot;&gt;obj&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-19 10:35:46',0),
(31,13,'&lt;p&gt;fsasf&lt;/p&gt;',1,'admin','2020-04-19 10:40:30',0),
(32,13,'&lt;p&gt;sdf&lt;/p&gt;',1,'admin','2020-04-19 10:42:32',0),
(33,13,'&lt;p&gt;fasd&lt;/p&gt;',1,'admin','2020-04-19 10:44:19',0),
(34,13,'&lt;p&gt;&lt;b&gt;dfassf&lt;/b&gt;&lt;/p&gt;',1,'admin','2020-04-19 10:49:52',0),
(35,13,'&lt;p&gt;fsad&lt;/p&gt;',1,'admin','2020-04-19 10:52:59',0),
(36,13,'&lt;p&gt;safasfdfsad&lt;/p&gt;',1,'admin','2020-04-19 10:53:07',0),
(37,13,'&lt;p&gt;fsafsadsa&lt;/p&gt;',1,'admin','2020-04-19 10:53:12',0),
(38,13,'&lt;p&gt;&lt;span style=&quot;color: rgb(226, 139, 65);&quot;&gt;彩色文字&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-19 11:26:49',0),
(39,13,'&lt;p&gt;&lt;span style=&quot;color: rgb(170, 135, 115);&quot;&gt;给发个方法&lt;/span&gt;&lt;/p&gt;',1,'admin','2020-04-19 11:27:04',0),
(40,13,'&lt;p&gt;&lt;a href=&quot;http://www.baidu.com&quot; target=&quot;_blank&quot;&gt;链接文字&lt;/a&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-19 11:27:42',0),
(41,13,'&lt;p&gt;asdf&lt;/p&gt;',1,'admin','2020-04-19 11:55:47',0),
(42,13,'&lt;p&gt;fsad&lt;/p&gt;',1,'admin','2020-04-19 11:56:31',0),
(43,13,'&lt;p&gt;asf&lt;/p&gt;',1,'admin','2020-04-19 11:56:40',0),
(44,13,'&lt;p&gt;fas&lt;/p&gt;',1,'admin','2020-04-19 11:57:08',0),
(45,13,'&lt;p&gt;a&lt;/p&gt;',1,'admin','2020-04-19 11:57:17',0),
(46,13,'&lt;p&gt;ddddddddddddd&lt;/p&gt;',1,'admin','2020-04-19 11:58:28',0),
(47,13,'&lt;p&gt;sadsds&lt;/p&gt;',1,'admin','2020-04-19 12:00:23',0),
(48,13,'&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51);&quot;&gt;layui-col-md-offset4&lt;/span&gt;&lt;br&gt;&lt;/p&gt;',1,'admin','2020-04-21 20:09:30',0);

/*Table structure for table `t_orgnews` */

DROP TABLE IF EXISTS `t_orgnews`;

CREATE TABLE `t_orgnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `newsType` int(11) DEFAULT NULL COMMENT '新闻类型0内部使用1外部链接',
  `ntitle` varchar(60) DEFAULT NULL COMMENT '新闻标题',
  `ncontent` longtext COMMENT '新闻内容',
  `publishTime` datetime DEFAULT NULL COMMENT '添加时间',
  `userId` int(11) DEFAULT NULL COMMENT '发表用户ID',
  `userName` varchar(60) DEFAULT NULL COMMENT '发表人',
  `newsPath` varchar(200) DEFAULT NULL COMMENT '静态路径',
  `nstate` int(11) DEFAULT NULL COMMENT '状态0起草1发布',
  `allowComment` int(11) DEFAULT NULL COMMENT '是否开启评论0开启1关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_orgnews` */

insert  into `t_orgnews`(`id`,`newsType`,`ntitle`,`ncontent`,`publishTime`,`userId`,`userName`,`newsPath`,`nstate`,`allowComment`) values 
(10,0,'afasfsasaf 闻新闻新闻闻新闻新闻新闻新闻新闻新闻新闻闻新闻新闻新闻新闻新闻新闻新闻','&lt;p&gt;asdfsadfasfasd&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;asdfsadfasfasd&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;asdfsadfasfasd&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;新闻&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, &amp;quot;PingFang SC&amp;quot;, Tahoma, Arial, sans-serif; font-size: 14px; text-align: right;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','2020-04-13 11:31:26',1,'admin','/localPage/staticHtml/orgnews/orgnews_6721edd92a5f409bae809c31eded866b.html',1,0),
(12,0,'afsafa','&lt;p&gt;&lt;b&gt;asfafsa闻闻闻&lt;/b&gt;&lt;/p&gt;&lt;table&gt;&lt;colgroup&gt;&lt;col width=&quot;100%&quot;&gt;&lt;/colgroup&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;&lt;img alt=&quot;c.jpg&quot; src=&quot;http://localhost:10086/simditor/image/f39a16fa-ee07-4ba4-868e-dcc1e595630e.jpg&quot; width=&quot;20&quot; height=&quot;20&quot;&gt;&lt;br&gt;&lt;/th&gt;&lt;/tr&gt;&lt;/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;','2020-04-15 10:06:06',1,'admin','/localPage/staticHtml/orgnews/orgnews_9d0eef058e8c4f6a81390eeda7a4b025.html',1,0),
(13,0,'新闻标新闻标新闻标新闻标新闻标新闻标','&lt;p&gt;afssdaffasf&lt;/p&gt;','2020-04-19 12:03:32',1,'admin','/localPage/staticHtml/orgnews/orgnews_8269e7eb46d64e7aa7c9c99d22569d8f.html',1,0);

/*Table structure for table `t_resources` */

DROP TABLE IF EXISTS `t_resources`;

CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '资源名称',
  `resKey` int(11) DEFAULT NULL COMMENT '资源id',
  `resUrl` varchar(100) DEFAULT NULL COMMENT '资源链接',
  `presKey` int(11) DEFAULT NULL COMMENT '父资源id',
  `pName` varchar(100) DEFAULT NULL COMMENT '父资源名称',
  `sort` int(11) DEFAULT NULL COMMENT '资源排序',
  `type` int(11) DEFAULT NULL COMMENT '0 启用 1 禁用',
  `resType` int(11) DEFAULT '0' COMMENT '资源类型0显式资源1非显式资源',
  `resIcon` varchar(20) DEFAULT NULL COMMENT '资源图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1523 DEFAULT CHARSET=utf8;

/*Data for the table `t_resources` */

insert  into `t_resources`(`id`,`name`,`resKey`,`resUrl`,`presKey`,`pName`,`sort`,`type`,`resType`,`resIcon`) values 
(1,'系统管理',1,'#',0,'Java精研管理平台',1,0,0,'&#xe62e;'),
(2,'用户管理',1007,'user/list',1,'系统管理',1007,0,0,'&#xe60a;'),
(3,'用户新增',1007001,'user/add',1007,'用户管理',1007001,0,0,'&#xe60a;'),
(4,'用户修改',1007002,'user/update',1007,'用户管理',1007002,0,0,'&#xe60a;'),
(5,'用户刪除',1007003,'user/delete',1007,'用户管理',1007003,0,0,'&#xe60a;'),
(6,'赋予角色',1007004,'user/giveRole',1007,'用户管理',1007004,0,0,'&#xe60a;'),
(1403,'部门管理',1001,'dept/list',1,'系统管理',1001,0,0,'&#xe643;'),
(1404,'部门新增',1001001,'dept/add',1001,'部门管理',1001001,0,0,'&#xe643;'),
(1405,'部门修改',1001002,'dept/update',1001,'部门管理',1001002,0,0,'&#xe643;'),
(1406,'部门刪除',1001003,'dept/delete',1001,'部门管理',1001003,0,0,'&#xe643;'),
(1411,'资源管理',1003,'resources/list',1,'系统管理',1003,0,0,'&#xe61a;'),
(1412,'资源新增',1003001,'resources/add',1003,'资源管理',1003001,0,0,'&#xe61a;'),
(1413,'资源修改',1003002,'resources/update',1003,'资源管理',1003002,0,0,'&#xe61a;'),
(1414,'资源刪除',1003003,'resources/delete',1003,'资源管理',1003003,0,0,'&#xe61a;'),
(1415,'角色管理',1004,'role/list',1,'系统管理',1004,0,0,'&#xe653;'),
(1416,'角色新增',1004001,'role/add',1004,'角色管理',1004001,0,0,'&#xe653;'),
(1417,'角色修改',1004002,'role/update',1004,'角色管理',1004002,0,0,'&#xe653;'),
(1418,'角色刪除',1004003,'role/delete',1004,'角色管理',1004003,0,0,'&#xe653;'),
(1419,'权限',1004004,'role/roleResource',1004,'角色管理',1004004,0,0,'&#xe653;'),
(1423,'系统配置管理',1006,'sysConfig/list',1,'系统管理',1006,0,0,'&#xe68c;'),
(1424,'系统配置新增',1006001,'sysConfig/add',1006,'系统配置管理',1006001,0,0,'&#xe68c;'),
(1425,'系统配置修改',1006002,'sysConfig/update',1006,'系统配置管理',1006002,0,0,'&#xe68c;'),
(1426,'系统配置刪除',1006003,'sysConfig/delete',1006,'系统配置管理',1006003,0,0,'&#xe68c;'),
(1427,'系统配置图标',1006004,'sysConfig/icons',1006,'系统配置管理',1006004,0,0,'&#xe68c;'),
(1452,'个人中心',3,'userCenter',0,'Java精研管理平台',3,0,0,'&#xe705;'),
(1453,'基本信息',1009,'userCenter/userInfo',3,'个人中心',1009,0,0,'&#xe705;'),
(1456,'我的私信',1011,'userCenter/personalMsg',3,'个人中心',1011,0,0,'&#xe70b;'),
(1457,'动态消息',1012,'userCenter/publicMsg',3,'个人中心',1012,0,0,'&#xe6c5;'),
(1458,'修改密码',1013,'userCenter/updatePwd',3,'个人中心',1013,0,0,'&#xe605;'),
(1459,'修改头像',1009001,'userCenter/updatePic',1009,'基本信息',1009001,0,0,'&#xe646;'),
(1500,'业务管理',2,'business',0,'Java精研管理平台',2,0,0,'&#xe636;'),
(1501,'客户管理管理',1008,'customer/list',2,'业务管理',1008,0,0,'&#xe636;'),
(1502,'客户管理新增',1008001,'customer/add',1008,'客户管理管理',1008001,0,0,'&#xe636;'),
(1503,'客户管理修改',1008002,'customer/update',1008,'客户管理管理',1008002,0,0,'&#xe636;'),
(1504,'客户管理删除',1008003,'customer/delete',1008,'客户管理管理',1008003,0,0,'&#xe636;'),
(1505,'新闻公告',4,'orgnews',0,'Java精研管理平台',4,0,0,'&#xe6c4;'),
(1506,'新闻管理',4001,'orgnews/list',4,'新闻公告',4001,0,0,'&#xe6c4;'),
(1507,'新闻新增',4001001,'orgnews/add',4001,'新闻管理',4001001,0,0,'&#xe6c4;'),
(1508,'新闻修改',4001002,'orgnews/update',4001,'新闻管理',4001002,0,0,'&#xe6c4;'),
(1509,'新闻删除',4001003,'orgnews/delete',4001,'新闻管理',4001003,0,0,'&#xe6c4;'),
(1510,'新闻发布',4001004,'orgnews/publish',4001,'新闻发布',4001004,0,0,'&#xe6c4;'),
(1511,'动态消息管理',4002,'orgnews/publicMsgManage',4,'新闻公告',4002,0,0,'&#xe6c4;'),
(1512,'隐藏权限管理',5,'hiddenRes',0,'Java精研管理平台',5,0,1,'&#xe69c;'),
(1513,'评论列表',5001,'orgcomment/list',5,'隐藏权限管理',5001,0,1,'&#xe69c;'),
(1515,'回复评论',5001001,'orgcomment/add',5001,'评论列表',5001001,0,1,'&#xe69c;'),
(1516,'删除评论',5001002,'orgcomment/delete',5001,'评论列表',5001002,0,1,'&#xe69c;'),
(1517,'成本管理',5,'project',0,'Java精研管理平台',1,0,0,NULL),
(1518,'项目管理',1232222,'project/list',5,'成本管理',2333,0,0,NULL),
(1519,'项目新增',51,'project/add',1232222,'项目管理',1,0,0,NULL),
(1521,'项目修改',52,'project/update',1232222,'项目管理',3,0,0,NULL),
(1522,'项目删除',53,'project/delete',1232222,'项目管理',4,0,0,NULL);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleKey` varchar(100) NOT NULL COMMENT '角色id',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `pRoleKey` varchar(100) DEFAULT NULL COMMENT '父角色id',
  `pRoleDesc` varchar(255) DEFAULT NULL COMMENT '父角色描述',
  `enable` int(3) DEFAULT NULL COMMENT '0 启用 1 禁用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`roleKey`,`roleDesc`,`pRoleKey`,`pRoleDesc`,`enable`,`sort`) values 
(1,'1','超级管理员','0',NULL,0,1),
(2,'2','河南总部总经理','1','超级管理员',0,2),
(3,'2001','河南总部副总经理','2','河南总部总经理',0,2001),
(4,'2002','河南分公司总经理','2','河南总部总经理',0,2002),
(5,'2002001','河南分公司副总经理','2002','河南分公司总经理',0,2002001),
(6,'2001001','河南总部研发部经理','2001','河南总部副总经理',0,2001001),
(7,'2001002','河南总部物联网部经理','2001','河南总部副总经理',0,2001002),
(8,'2001003','河南总部金融产业部经理','2001','河南总部副总经理',0,2001003),
(9,'2001001001','河南总部研发部员工','2001001','河南总部研发部经理',0,2001001001),
(10,'2001002001','河南总部物联网部员工','2001002','河南总部物联网部经理',0,2001002001),
(11,'2001002002','河南分公司产业部经理','2002001','河南分公司副总经理',0,2001002002);

/*Table structure for table `t_role_resources` */

DROP TABLE IF EXISTS `t_role_resources`;

CREATE TABLE `t_role_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleKey` varchar(100) NOT NULL COMMENT '角色id',
  `resKey` varchar(100) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`,`roleKey`,`resKey`)
) ENGINE=InnoDB AUTO_INCREMENT=949 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_resources` */

insert  into `t_role_resources`(`id`,`roleKey`,`resKey`) values 
(397,'2002001','2'),
(398,'2002','2'),
(399,'2001','2'),
(400,'2','2'),
(900,'1','1'),
(901,'1','1007'),
(902,'1','1007001'),
(903,'1','1007002'),
(904,'1','1007003'),
(905,'1','1007004'),
(906,'1','1001'),
(907,'1','1001001'),
(908,'1','1001002'),
(909,'1','1001003'),
(910,'1','1003'),
(911,'1','1003001'),
(912,'1','1003002'),
(913,'1','1003003'),
(914,'1','1004'),
(915,'1','1004001'),
(916,'1','1004002'),
(917,'1','1004003'),
(918,'1','1004004'),
(919,'1','1006'),
(920,'1','1006001'),
(921,'1','1006002'),
(922,'1','1006003'),
(923,'1','1006004'),
(924,'1','3'),
(925,'1','1009'),
(926,'1','1009001'),
(927,'1','1011'),
(928,'1','1012'),
(929,'1','1013'),
(930,'1','2'),
(931,'1','1008'),
(932,'1','1008001'),
(933,'1','1008002'),
(934,'1','4'),
(935,'1','4001'),
(936,'1','4001001'),
(937,'1','4001002'),
(938,'1','4001003'),
(939,'1','4002'),
(940,'1','5'),
(941,'1','5'),
(942,'1','5001'),
(943,'1','5001001'),
(944,'1','5001002'),
(945,'1','1232222'),
(946,'1','51'),
(947,'1','52'),
(948,'1','53');

/*Table structure for table `t_sys_config` */

DROP TABLE IF EXISTS `t_sys_config`;

CREATE TABLE `t_sys_config` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `sysConfigIndex` int(11) NOT NULL COMMENT '配置索引',
  `delStatus` tinyint(2) DEFAULT '0' COMMENT '配置状态0启用1禁用',
  PRIMARY KEY (`id`,`sysConfigIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_sys_config` */

insert  into `t_sys_config`(`id`,`name`,`value`,`sysConfigIndex`,`delStatus`) values 
(1,'systemName','Java精研管理平台',1,0),
(2,'orgnewsAuthor','河南有限公司',2,0);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userName` varchar(33) DEFAULT NULL COMMENT '名称',
  `password` varchar(33) DEFAULT NULL COMMENT '密码',
  `enable` int(10) DEFAULT NULL COMMENT '状态0启用1禁用<!-- "{\\"formType\\":\\"select\\",\\"options\\":[{\\"optText\\":\\"启用\\",\\"optValue\\":0},{\\"optText\\":\\"禁用\\",\\"optValue\\":1}]}" -->',
  `phoneNo` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `mail` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `addTime` date DEFAULT NULL COMMENT '添加时间<!-- "{\\"formType\\":\\"datePicker\\"}" -->',
  `deptId` int(11) DEFAULT NULL COMMENT '部门ID<!-- "{\\"formType\\":\\"foreignKey\\",\\"fKName\\":\\"user_dept_fk\\"}" -->',
  `deptName` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `sex` int(3) DEFAULT NULL COMMENT '性别',
  `info` varchar(500) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`password`,`enable`,`phoneNo`,`mail`,`addTime`,`deptId`,`deptName`,`sex`,`info`) values 
(1,'admin','E10ADC3949BA59ABBE56E057F20F883E',0,'12311122211','adafs','2019-10-06',112,'122121',1,'adsfa'),
(2,'super','E10ADC3949BA59ABBE56E057F20F883E',0,'12311122211','adafsd','2019-10-06',112,'122121',0,'adsfa'),
(4,'aa','E10ADC3949BA59ABBE56E057F20F883E',0,'121314553255','aaasd','2020-11-05',10101,'东区分公司金穗产业部',0,'111222');

/*Table structure for table `t_user_ext` */

DROP TABLE IF EXISTS `t_user_ext`;

CREATE TABLE `t_user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `personCard` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '身份证号',
  `userPic` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户头像路径',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_ext` */

insert  into `t_user_ext`(`id`,`userId`,`personCard`,`userPic`,`birthday`,`updateTime`) values 
(1,1,'4115021198906048718','/userCenter/image/3304edff-03c8-47ef-a89f-89d83df15428.jpg','2019-03-27','2020-04-17 12:06:58'),
(2,2,'4115021198906048718','/userCenter/image/daf4c380-6c0a-45a2-924c-bd22d19c3e52.jpg','2019-03-27','2020-04-02 16:49:27');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleKey` varchar(100) DEFAULT NULL COMMENT '角色识别key',
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`userId`,`roleKey`) values 
(57,142,'1'),
(58,142,'2'),
(59,142,'2001'),
(60,142,'2001001'),
(61,142,'2001001001'),
(62,142,'2001002'),
(63,142,'2001002001'),
(64,142,'2001003'),
(65,142,'2001002003'),
(69,1,'1');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `USER_ID` int(11) NOT NULL,
  `POSITION_ID` int(11) NOT NULL,
  `REAL_NAME` varchar(30) DEFAULT NULL,
  `USER_CODE` char(14) DEFAULT NULL,
  `USER_NAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL,
  `USER_TYPE` tinyint(4) DEFAULT NULL,
  `GENDER` bit(1) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `IS_MARRIAGE` bit(1) DEFAULT NULL,
  `POST_LEVEL` tinyint(4) DEFAULT NULL,
  `POST_ID` int(11) DEFAULT NULL,
  `POST_GRADE` tinyint(4) DEFAULT NULL,
  `TEAM` varchar(20) DEFAULT NULL,
  `PROPERTY` tinyint(4) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `WORK_DATE` datetime DEFAULT NULL,
  `ATTEND_DATE` datetime DEFAULT NULL,
  `PHOTO` varbinary(4000) DEFAULT NULL,
  `POLITIC_DATE` datetime DEFAULT NULL,
  `DUTY` varchar(30) DEFAULT NULL,
  `DUTY_LEVEL` varchar(30) DEFAULT NULL,
  `CURRENT_POST_DATE` datetime DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `NATION` varchar(20) DEFAULT NULL,
  `CARD_ ID` varchar(18) DEFAULT NULL,
  `NATIVE` varchar(30) DEFAULT NULL,
  `IS_AGRICULTURAL` bit(1) DEFAULT NULL,
  `EXPECTED_POST` varchar(30) DEFAULT NULL,
  `PLAN_POST_DATE` datetime NOT NULL,
  `IS_LABOR_DISPUTE` bit(1) DEFAULT NULL,
  `OLD_ASSURANCE` varchar(255) DEFAULT NULL,
  `RETIRED_DESC` varchar(255) DEFAULT NULL,
  `RELATION` tinyint(4) DEFAULT NULL,
  `REFERRER` varchar(30) DEFAULT NULL,
  `POLITIC_STATUS` tinyint(4) DEFAULT NULL,
  `PROFESSIONAL` varchar(30) DEFAULT NULL,
  `PROFESSIONAL_SPECIALTY` varchar(30) DEFAULT NULL,
  `PROFESSIONAL_LEVEL` varchar(30) DEFAULT NULL,
  `PROFESSIONAL_DATE` datetime DEFAULT NULL,
  `PROFESSIONAL_CERTIFICATE` varchar(30) DEFAULT NULL,
  `CERTIFICATE_SPECIALTY` varchar(30) DEFAULT NULL,
  `CERTIFICATE_LEVEL` varchar(30) DEFAULT NULL,
  `CERTIFICATE_DATE` datetime DEFAULT NULL,
  `PROFESSIONAL_SENIORITY` varchar(30) DEFAULT NULL,
  `ENGLISH_SPECIALTY` varchar(30) DEFAULT NULL,
  `DISEASE` varchar(30) DEFAULT NULL,
  `HEALTH_STATUS` varchar(30) DEFAULT NULL,
  `ORIGINAL_EDUCATION` varchar(30) DEFAULT NULL,
  `ORIGINAL_SPECIALTY` varchar(30) DEFAULT NULL,
  `ORIGINAL_GRADUATE_SCHOOL` varchar(30) DEFAULT NULL,
  `ORIGINAL_GRADUATE_TIME` datetime DEFAULT NULL,
  `LAST_EDUCATION` varchar(30) DEFAULT NULL,
  `LAST_SPECIALTY` varchar(30) DEFAULT NULL,
  `LAST_GRADUATE_SCHOOL` varchar(30) DEFAULT NULL,
  `LAST_GRADUATE_DATE` datetime DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL,
  `GroupID` int(11) NOT NULL,
  `DEPARTMENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `Ref1310` (`DEPARTMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
