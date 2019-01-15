/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 5.7.16-log : Database - cyb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE = '' */;

/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS */`cyb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cyb`;

/*Table structure for table `tb_article` */

DROP TABLE IF EXISTS `tb_article`;

CREATE TABLE `tb_article` (
  `article_id`      int(11)      NOT NULL AUTO_INCREMENT,
  `article_name`    varchar(150) NOT NULL,
  `article_path`    varchar(255) NOT NULL,
  `click_count`     int(11)               DEFAULT '0',
  `article_ctime`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_utime`   timestamp    NULL     DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP,
  `category_id`     int(11)      NOT NULL,
  `user_id`         int(11)      NOT NULL,
  `state`           char(1)               DEFAULT '1',
  `private`         char(1)               DEFAULT '1',
  `article_content` varchar(150)          DEFAULT NULL,
  PRIMARY KEY (`article_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_article` */

insert into `tb_article` (`article_id`,
                          `article_name`,
                          `article_path`,
                          `click_count`,
                          `article_ctime`,
                          `article_utime`,
                          `category_id`,
                          `user_id`,
                          `state`,
                          `private`,
                          `article_content`)
values (1, '1', '4', 2, '2018-10-29 00:23:40', '2018-10-31 00:58:07', 1, 1, '1', '1', NULL),
       (2,
        '文章题目...',
        'D:/apache-tomcat-8.0.23/webapps/article/文章题目...',
        0,
        '2018-10-30 23:27:37',
        '2018-10-31 00:58:10',
        1,
        1,
        '1',
        '1',
        '&lt;?xml version=\"1.0\" encoding=\"UTF-8\" ?&...'),
       (7,
        '文章题目...',
        'D:/apache-tomcat-8.0.23/webapps/article/文章题目...',
        0,
        '2018-10-31 05:16:19',
        '2018-10-31 05:16:19',
        1,
        1,
        '1',
        '1',
        'nbsp; &nbsp; &nbsp; &nbsp;今天遇到一个很头疼的问题，建的...'),
       (8,
        '文章题目...',
        'D:/apache-tomcat-8.0.23/webapps/article/文章题目...',
        0,
        '2018-11-01 01:57:31',
        '2018-11-01 01:57:31',
        1,
        1,
        '1',
        '1',
        'sadsafsdfsdfdsgdsgfdsdfffffffffffffffffff...'),
       (9,
        '文章题目...',
        'D:/apache-tomcat-8.0.23/webapps/article/文章题目...',
        0,
        '2018-11-02 02:01:31',
        '2018-11-02 02:01:31',
        1,
        1,
        '1',
        '1',
        '程Thread-0正在写入数据...线程Thread-1正在写入数据...线程Th...'),
       (10,
        'title',
        'D:/apache-tomcat-8.0.23/webapps/article/title',
        0,
        '2018-11-02 02:29:44',
        '2018-11-02 02:29:44',
        1,
        1,
        '1',
        '1',
        'ttpClient连接时间所谓连接的时候是HttpClient发送请求的地方开始到...'),
       (11,
        '热启动插件JRebel激活服务',
        'D:/apache-tomcat-8.0.23/webapps/article/热启动插件JRebel激活服务',
        0,
        '2018-11-02 02:31:14',
        '2018-11-02 02:31:14',
        1,
        1,
        '1',
        '1',
        '、打开JRebel的激活页面，选择第三种激活方式：连接到License Serve...');

/*Table structure for table `tb_article_favorites` */

DROP TABLE IF EXISTS `tb_article_favorites`;

CREATE TABLE `tb_article_favorites` (
  `user_id`    int(11) NOT NULL,
  `article_id` int(11) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_article_favorites` */

/*Table structure for table `tb_article_review` */

DROP TABLE IF EXISTS `tb_article_review`;

CREATE TABLE `tb_article_review` (
  `article_id`           int(11)      NOT NULL,
  `user_id`              int(11)      NOT NULL,
  `article_review`       varchar(300) NOT NULL,
  `article_review_ctime` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state`                char(1)               DEFAULT '1'
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_article_review` */

insert into `tb_article_review` (`article_id`, `user_id`, `article_review`, `article_review_ctime`, `state`)
values (6, 2, '123456', '2018-10-31 00:40:11', '1'),
       (6, 2, '123456789', '2018-10-31 00:42:53', '1'),
       (7, 2, '132546', '2018-10-31 05:16:45', '1'),
       (7, 2, '456213', '2018-10-31 05:16:48', '1'),
       (2, 2, '42453333333354', '2018-10-31 12:38:49', '1'),
       (2, 2, '123654897', '2018-10-31 12:43:33', '1'),
       (2, 2, '123456', '2018-10-31 12:44:02', '1'),
       (2, 2, '132564', '2018-10-31 12:46:04', '1'),
       (2, 2, '12564897', '2018-10-31 12:47:58', '1'),
       (2, 2, '12354sad', '2018-10-31 12:49:22', '1'),
       (2, 2, '12564897', '2018-10-31 12:51:50', '1'),
       (7, 2, 'sdasdsafd', '2018-11-01 01:18:47', '1'),
       (7, 2, 'adfsdfsdfsdg', '2018-11-01 01:18:55', '1'),
       (7, 2, '78979', '2018-11-01 01:43:10', '1'),
       (7, 2, '897987', '2018-11-01 01:43:23', '1'),
       (7, 2, 'qweqweqw', '2018-11-01 01:49:45', '1'),
       (8, 2, 'asdsssssssssssssssssssssssssssssssss', '2018-11-01 01:57:42', '1'),
       (2, 2, 'dsfsd', '2018-11-01 03:24:05', '1'),
       (2, 2, 'dsfsdf', '2018-11-01 03:24:19', '1'),
       (7, 2, 'grgtrhtr', '2018-11-02 02:19:51', '1');

/*Table structure for table `tb_article_score` */

DROP TABLE IF EXISTS `tb_article_score`;

CREATE TABLE `tb_article_score` (
  `user_id`       int(11)    NOT NULL,
  `article_id`    int(11)    NOT NULL,
  `article_score` tinyint(4) NOT NULL,
  `article_time`  bigint(20) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_article_score` */

/*Table structure for table `tb_category` */

DROP TABLE IF EXISTS `tb_category`;

CREATE TABLE `tb_category` (
  `category_id`   int(11)      NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) NOT NULL,
  PRIMARY KEY (`category_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_category` */

insert into `tb_category` (`category_id`, `category_name`)
values (1, '财富'),
       (2, '知识');

/*Table structure for table `tb_column` */

DROP TABLE IF EXISTS `tb_column`;

CREATE TABLE `tb_column` (
  `column_id`            int(11)      NOT NULL AUTO_INCREMENT,
  `user_id`              int(11)      NOT NULL,
  `click_count`          int(11)               DEFAULT '0',
  `column_name`          varchar(150) NOT NULL,
  `column_desc`          varchar(255) NOT NULL,
  `column_ctime`         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `column_utime`         timestamp    NULL     DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP,
  `column_picture`       varchar(150)          DEFAULT NULL,
  `column_article_count` int(11)               DEFAULT '0',
  PRIMARY KEY (`column_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_column` */

insert into `tb_column` (`column_id`,
                         `user_id`,
                         `click_count`,
                         `column_name`,
                         `column_desc`,
                         `column_ctime`,
                         `column_utime`,
                         `column_picture`,
                         `column_article_count`)
values (1, 2, 4, '专栏一', '专栏一', '2018-10-31 00:51:51', '2018-10-31 00:51:51', '', 1),
       (2, 1, 3, '专栏二', '专栏二', '2018-10-31 00:52:51', '2018-10-31 00:52:51', NULL, 2),
       (3, 1, 3, '专栏三', '专栏三', '2018-10-31 00:53:18', '2018-10-31 00:53:21', NULL, 3),
       (4, 2, 4, '专栏四', '专栏四', '2018-10-31 00:53:57', '2018-10-31 00:53:57', NULL, 4);

/*Table structure for table `tb_column_article` */

DROP TABLE IF EXISTS `tb_column_article`;

CREATE TABLE `tb_column_article` (
  `column_id`  int(11) NOT NULL,
  `article_id` int(11) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_column_article` */

insert into `tb_column_article` (`column_id`, `article_id`)
values (1, 2),
       (1, 1),
       (2, 2),
       (2, 2),
       (2, 2),
       (3, 2),
       (4, 1),
       (4, 2);

/*Table structure for table `tb_column_favorites` */

DROP TABLE IF EXISTS `tb_column_favorites`;

CREATE TABLE `tb_column_favorites` (
  `user_id`   int(11) NOT NULL,
  `column_id` int(11) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_column_favorites` */

/*Table structure for table `tb_resource` */

DROP TABLE IF EXISTS `tb_resource`;

CREATE TABLE `tb_resource` (
  `resource_id`      int(11)      NOT NULL AUTO_INCREMENT,
  `resource_name`    varchar(150) NOT NULL,
  `resource_desc`    varchar(255) NOT NULL,
  `type_id`          int(11)      NOT NULL,
  `resource_path`    varchar(100) NOT NULL,
  `resource_pwd`     varchar(10)           DEFAULT NULL,
  `user_id`          int(11)      NOT NULL,
  `resource_picture` varchar(255) NOT NULL,
  `category_id`      int(11)      NOT NULL,
  `resource_ctime`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resource_utime`   timestamp    NULL     DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP,
  `state`            char(1)      NOT NULL DEFAULT '1',
  `resource_count`   int(11)      NOT NULL DEFAULT '0',
  `power`            char(1)               DEFAULT '1',
  PRIMARY KEY (`resource_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resource` */

insert into `tb_resource` (`resource_id`,
                           `resource_name`,
                           `resource_desc`,
                           `type_id`,
                           `resource_path`,
                           `resource_pwd`,
                           `user_id`,
                           `resource_picture`,
                           `category_id`,
                           `resource_ctime`,
                           `resource_utime`,
                           `state`,
                           `resource_count`,
                           `power`)
values (1,
        '《Java 数据结构和算法》',
        '1',
        0,
        '1',
        '1',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        0,
        '2018-10-27 09:34:31',
        '2018-11-02 07:15:41',
        '1',
        59,
        '1'),
       (2,
        '《算法导论》',
        '1',
        0,
        '1',
        '123',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        0,
        '2018-10-27 09:42:35',
        '2018-11-02 05:51:32',
        '1',
        4,
        '1'),
       (3,
        '《设计模式——可复用面向对象软件的基础》',
        '2',
        1,
        '',
        '123',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        1,
        '2018-10-27 09:53:06',
        '2018-11-02 05:53:17',
        '1',
        228,
        '1'),
       (4,
        '《MongoDB, The Definitive Guide》',
        'asfsafasf',
        1,
        'wder',
        'afsa',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        1,
        '2018-10-27 11:27:18',
        '2018-11-02 05:51:28',
        '1',
        56,
        '1'),
       (5,
        '《计算机组成与设计》',
        'ddddd',
        0,
        'ddd',
        'dddd',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        0,
        '2018-10-27 11:29:17',
        '2018-11-02 05:51:14',
        '1',
        7,
        '1'),
       (6,
        '《汇编语言》',
        'asfeasfdfsge',
        2,
        'sffsfdsfd',
        '45we',
        1,
        'http://172.162.3.45:8080/image/2018/10/28/1540689461618980.jpg',
        2,
        '2018-10-27 11:40:46',
        '2018-11-02 05:53:30',
        '1',
        129,
        '1'),
       (7,
        '《数据结构》',
        'asds',
        1,
        'asdsa',
        'asda',
        0,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        1,
        '2018-10-27 16:35:33',
        '2018-11-02 04:38:12',
        '1',
        46,
        '1'),
       (8,
        '《数据库系统实现》',
        'ewewq',
        2,
        'dasdsa',
        '123q',
        0,
        'http://172.162.3.45:8080/image/2018/10/27//1540629515551334.png',
        1,
        '2018-10-27 16:38:36',
        '2018-10-30 19:34:34',
        '1',
        5,
        '1'),
       (9,
        '《精通正则表达式（第3版）》',
        '测试',
        1,
        '1',
        'asdf',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540644365392769.jpg',
        2,
        '2018-10-27 20:46:05',
        '2018-11-02 05:53:22',
        '1',
        31,
        '1'),
       (10,
        'C 程序设计语言',
        '测试二',
        2,
        'qwe',
        'dasd',
        1,
        'http://172.162.3.45:8080/image/2018/10/27//1540645036300533.jpg',
        1,
        '2018-10-27 20:57:16',
        '2018-10-30 11:26:15',
        '0',
        0,
        '1'),
       (11,
        'Lnux C 编程一站式学习',
        'dsfdsfsdfds',
        1,
        'sdsadsadsa',
        'sssd',
        1,
        'http://172.162.3.45:8080/image/2018/10/28//1540693448507949.jpg',
        1,
        '2018-10-28 10:24:09',
        '2018-11-02 05:53:27',
        '1',
        17,
        '1'),
       (12,
        'Linux 系统编程',
        'dfewfewfwef',
        1,
        'dsadsa',
        'ssss',
        1,
        'http://172.162.3.45:8080/image/2018/10/28//1540693554089688.jpg',
        1,
        '2018-10-28 10:25:54',
        '2018-11-02 05:53:57',
        '1',
        20,
        '1'),
       (13,
        '鸟哥的 Linux 私房菜',
        '总测试',
        1,
        '1223456',
        '1234',
        1,
        'http://172.162.3.45:8080/image/2018/10/28//1540733008219969.jpg',
        1,
        '2018-10-28 21:23:28',
        '2018-11-02 05:54:02',
        '1',
        44,
        '1'),
       (14,
        '深入理解MySQL核心技术',
        'hahahaha123',
        2,
        'qwer123',
        'qwer0265',
        1,
        'http://172.162.3.45:8080/image/2018/10/29//1540784995737610.jpg',
        2,
        '2018-10-29 11:49:55',
        '2018-10-30 17:19:01',
        '1',
        31,
        '1'),
       (15,
        '我的手机',
        '不告诉你',
        1,
        'http://www.xxx.com',
        's15de',
        1,
        'http://172.162.3.45:8080/image/2018/10/30/1540888892740477.jpg',
        1,
        '2018-10-30 15:46:54',
        '2018-10-30 16:48:09',
        '0',
        51,
        '1'),
       (16,
        '数学之美',
        '数学之美!!',
        1,
        'www.baidu.com',
        '1234',
        1,
        'http://172.162.3.45:8080/image/2018/10/30//1540890822051726.jpg',
        2,
        '2018-10-30 17:13:42',
        '2018-11-02 05:54:29',
        '1',
        6,
        '1'),
       (17,
        '深度学习',
        'deeplearning',
        2,
        'www.baidu.com',
        'qweq',
        1,
        'http://172.162.3.45:8080/image/2018/10/30//1540891578519851.jpg',
        2,
        '2018-10-30 17:26:18',
        '2018-11-01 13:02:09',
        '1',
        2,
        '1'),
       (18,
        '算法图解',
        '算法',
        1,
        'www.baidu.com',
        'qeqwe',
        1,
        'http://172.162.3.45:8080/image/2018/10/30/1540891776888329.jpg',
        1,
        '2018-10-30 17:28:13',
        '2018-10-30 17:29:39',
        '1',
        6,
        '1'),
       (19,
        '沙漠之鹰',
        '123',
        1,
        'http://www.xxx.com',
        'sadsad',
        4,
        'http://172.162.3.45:8080/image/2018/10/31//1540993253347876.jpg',
        1,
        '2018-10-31 21:41:11',
        '2018-10-31 21:41:11',
        '1',
        0,
        '1'),
       (1000,
        '高琪Java300讲',
        '123',
        1,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039492275387.jpg',
        2,
        '2018-11-01 10:31:32',
        '2018-11-01 10:36:58',
        '1',
        0,
        '1'),
       (1001,
        'Mysql入门',
        '213',
        1,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039532731624.jpg',
        2,
        '2018-11-01 10:32:12',
        '2018-11-01 10:37:01',
        '1',
        0,
        '1'),
       (1002,
        'Oracle',
        '123',
        2,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039557579851.jpg',
        1,
        '2018-11-01 10:32:37',
        '2018-11-02 07:13:01',
        '1',
        2,
        '1'),
       (1003,
        'OracleNext',
        '123',
        2,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039588838630.jpg',
        1,
        '2018-11-01 10:33:08',
        '2018-11-02 05:54:50',
        '1',
        7,
        '1'),
       (1004,
        'powerdiengn',
        'ewrw',
        1,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039625024599.jpg',
        1,
        '2018-11-01 10:33:45',
        '2018-11-02 05:49:39',
        '1',
        37,
        '1'),
       (1005,
        '推荐算法',
        '驱蚊器无',
        1,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039660360655.jpg',
        1,
        '2018-11-01 10:34:20',
        '2018-11-02 05:55:30',
        '1',
        7,
        '1'),
       (1006,
        'R语言',
        '撒大声地',
        1,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039716665160.jpg',
        1,
        '2018-11-01 10:35:16',
        '2018-11-02 05:56:37',
        '1',
        4,
        '1'),
       (1007,
        'Cookie',
        '123',
        1,
        'http://www.xxx.com',
        'sadsad',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039741621383.jpg',
        1,
        '2018-11-01 10:35:41',
        '2018-11-02 05:50:21',
        '1',
        2,
        '1'),
       (1008,
        'JDBC',
        '12312',
        1,
        'http://www.xxx.com',
        '1',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039767739745.jpg',
        1,
        '2018-11-01 10:36:07',
        '2018-11-01 10:37:35',
        '1',
        0,
        '1'),
       (1009,
        'request',
        '阿萨德',
        1,
        'http://www.xxx.com',
        '1',
        1,
        'http://172.162.3.45:8080/image/2018/11/01//1541039793648548.jpg',
        1,
        '2018-11-01 10:36:33',
        '2018-11-02 05:55:56',
        '1',
        10,
        '1');

/*Table structure for table `tb_resource_favorites` */

DROP TABLE IF EXISTS `tb_resource_favorites`;

CREATE TABLE `tb_resource_favorites` (
  `user_id`     int(11) NOT NULL,
  `resource_id` int(11) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resource_favorites` */

/*Table structure for table `tb_resource_review` */

DROP TABLE IF EXISTS `tb_resource_review`;

CREATE TABLE `tb_resource_review` (
  `resource_id`           int(11)      NOT NULL,
  `user_id`               int(11)      NOT NULL,
  `resource_review`       varchar(300) NOT NULL,
  `resource_review_ctime` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resource_review` */

insert into `tb_resource_review` (`resource_id`, `user_id`, `resource_review`, `resource_review_ctime`)
values (13, 2, 'sadsaf', '2018-10-31 02:43:37'),
       (13, 2, 'sadsafsa', '2018-10-31 02:43:43'),
       (13, 2, 'dfsfsd', '2018-10-31 02:44:11'),
       (13, 2, 'dsadasdasdasdsadad', '2018-10-31 02:46:15'),
       (13, 2, 'NIHAO', '2018-10-31 02:50:05'),
       (13, 2, 'sadasdas', '2018-10-31 02:52:28'),
       (1, 2, 'adasdfsa', '2018-10-31 23:02:17'),
       (1, 2, 'adasdfsaffsdf', '2018-10-31 23:02:20'),
       (3, 2, 'sfsdf ', '2018-11-02 02:13:18');

/*Table structure for table `tb_resource_score` */

DROP TABLE IF EXISTS `tb_resource_score`;

CREATE TABLE `tb_resource_score` (
  `user_id`        int(11)    NOT NULL,
  `resource_id`    int(11)    NOT NULL,
  `resource_score` int(11)    NOT NULL,
  `resource_time`  bigint(20) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resource_score` */

insert into `tb_resource_score` (`user_id`, `resource_id`, `resource_score`, `resource_time`)
values (1, 3, 10, 0),
       (1, 4, 4, 0),
       (2, 3, 6, 0),
       (3, 3, 8, 0),
       (4, 3, 10, 0),
       (2, 6, 8, 0),
       (3, 6, 4, 0),
       (1, 14, 10, 1540785961569),
       (1, 6, 10, 0),
       (1, 12, 10, 1540787919467),
       (1, 5, 10, 1540808839593),
       (1, 7, 10, 1540808858083),
       (1, 8, 10, 1540899265022),
       (1, 1, 10, 1540998153862);

/*Table structure for table `tb_resourcelist` */

DROP TABLE IF EXISTS `tb_resourcelist`;

CREATE TABLE `tb_resourcelist` (
  `resourcelist_id`      int(11)      NOT NULL AUTO_INCREMENT,
  `user_id`              int(11)      NOT NULL,
  `resourcelist_name`    varchar(150) NOT NULL,
  `resourcelist_desc`    varchar(255) NOT NULL,
  `resourcelist_picture` varchar(255) NOT NULL,
  `state`                char(1)               DEFAULT '1',
  `resourcelist_ctime`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resourcelist_utime`   timestamp    NOT NULL DEFAULT '0000-00-00 00:00:00'
  ON UPDATE CURRENT_TIMESTAMP,
  `resourcelist_count`   int(11)      NOT NULL DEFAULT '0',
  PRIMARY KEY (`resourcelist_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resourcelist` */

insert into `tb_resourcelist` (`resourcelist_id`,
                               `user_id`,
                               `resourcelist_name`,
                               `resourcelist_desc`,
                               `resourcelist_picture`,
                               `state`,
                               `resourcelist_ctime`,
                               `resourcelist_utime`,
                               `resourcelist_count`)
values (1,
        1,
        '我的清单ddd',
        '清单一',
        'http://172.162.3.45:8080/image/resourcelist2018/10/29/1540811077069580.jpg',
        '1',
        '2018-10-29 16:05:31',
        '2018-10-31 23:45:10',
        0),
       (3,
        1,
        '清单二',
        '清单二',
        'http://172.162.3.45:8080/image/resourcelist2018/10/29//1540804066871943.jpg',
        '0',
        '2018-10-29 17:07:46',
        '2018-10-29 20:15:26',
        0),
       (4,
        1,
        '清单三',
        '清单三',
        'http://172.162.3.45:8080/image/resourcelist2018/10/29//1540804225002825.jpg',
        '0',
        '2018-10-29 17:10:25',
        '2018-10-29 20:12:23',
        0),
       (5,
        1,
        '通往财富自由之路',
        '李笑来老师，中国比特币首富！！',
        'http://172.162.3.45:8080/image/resourcelist2018/10/29//1540828572175108.jpg',
        '1',
        '2018-10-29 23:56:12',
        '2018-10-29 23:57:12',
        0),
       (6,
        1,
        '数据科学家之路',
        '胡益龙，力作！',
        'http://172.162.3.45:8080/image/resourcelist2018/10/30//1540828991440215.jpg',
        '1',
        '2018-10-30 00:03:11',
        '0000-00-00 00:00:00',
        0),
       (7,
        1,
        '测试之路',
        '测试一下',
        'http://172.162.3.45:8080/image/resourcelist2018/10/31//1540994642565415.jpg',
        '1',
        '2018-10-31 22:04:02',
        '0000-00-00 00:00:00',
        0);

/*Table structure for table `tb_resourcelist_favorites` */

DROP TABLE IF EXISTS `tb_resourcelist_favorites`;

CREATE TABLE `tb_resourcelist_favorites` (
  `user_id`         int(11) NOT NULL,
  `resourcelist_id` int(11) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resourcelist_favorites` */

/*Table structure for table `tb_resourcelist_resouce` */

DROP TABLE IF EXISTS `tb_resourcelist_resouce`;

CREATE TABLE `tb_resourcelist_resouce` (
  `resourcelist_id` int(11) NOT NULL,
  `resource_id`     int(11) NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_resourcelist_resouce` */

insert into `tb_resourcelist_resouce` (`resourcelist_id`, `resource_id`)
values (1, 3),
       (1, 7),
       (2, 2),
       (2, 4),
       (2, 6),
       (1, 11),
       (1, 6),
       (5, 13),
       (5, 4),
       (5, 6),
       (6, 6),
       (1, 12),
       (1, 5),
       (1, 8),
       (6, 8),
       (5, 11),
       (1, 18),
       (1, 4);

/*Table structure for table `tb_type` */

DROP TABLE IF EXISTS `tb_type`;

CREATE TABLE `tb_type` (
  `type_id`   int(11)     NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`type_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_type` */

insert into `tb_type` (`type_id`, `type_name`)
values (1, '图片'),
       (2, '音频');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id`   int(11)      NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50)  NOT NULL,
  `user_pwd`  varchar(50)  NOT NULL,
  `email`     varchar(320) NOT NULL,
  PRIMARY KEY (`user_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_user` */

insert into `tb_user` (`user_id`, `user_name`, `user_pwd`, `email`)
values (1, 'root', '63a9f0ea7bb98050796b649e85481845', '652662986@qq.com'),
       (2, 'tom', 'tom', '139'),
       (3, 'z', '202cb962ac59075b964b07152d234b70', 'yingkj@163.com');

/*Table structure for table `tb_userinfo` */

DROP TABLE IF EXISTS `tb_userinfo`;

CREATE TABLE `tb_userinfo` (
  `user_id`           int(11)   NOT NULL AUTO_INCREMENT,
  `sex`               char(1)   NOT NULL,
  `user_picture_path` varchar(255)       DEFAULT NULL,
  `user_desc`         varchar(255)       DEFAULT NULL,
  `user_ctime`        timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

/*Data for the table `tb_userinfo` */

/* Trigger structure for table `tb_resourcelist` */

DELIMITER $$

/*!50003 DROP TRIGGER *//*!50032 IF EXISTS */ /*!50003 `update_time_resourcelist` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'172.162.3.45' */ /*!50003 TRIGGER `update_time_resourcelist`
  BEFORE UPDATE
  ON `tb_resourcelist`
  FOR EACH ROW
  set new.resourcelist_utime = now() */$$


DELIMITER ;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;
