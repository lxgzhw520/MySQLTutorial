
DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`) values (1,'john','8888'),(2,'lyt','6666');

/*Table structure for table `beauty` */

DROP TABLE IF EXISTS `beauty`;

CREATE TABLE `beauty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` char(1) DEFAULT '女',
  `borndate` datetime DEFAULT '1987-01-01 00:00:00',
  `phone` varchar(11) NOT NULL,
  `photo` blob,
  `boyfriend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `beauty` */

insert  into `beauty`(`id`,`name`,`sex`,`borndate`,`phone`,`photo`,`boyfriend_id`) values (1,'柳岩','女','1988-02-03 00:00:00','18209876577',NULL,8),(2,'苍老师','女','1987-12-30 00:00:00','18219876577',NULL,9),(3,'Angelababy','女','1989-02-03 00:00:00','18209876567',NULL,3),(4,'热巴','女','1993-02-03 00:00:00','18209876579',NULL,2),(5,'周冬雨','女','1992-02-03 00:00:00','18209179577',NULL,9),(6,'周芷若','女','1988-02-03 00:00:00','18209876577',NULL,1),(7,'岳灵珊','女','1987-12-30 00:00:00','18219876577',NULL,9),(8,'小昭','女','1989-02-03 00:00:00','18209876567',NULL,1),(9,'双儿','女','1993-02-03 00:00:00','18209876579',NULL,9),(10,'王语嫣','女','1992-02-03 00:00:00','18209179577',NULL,4),(11,'夏雪','女','1993-02-03 00:00:00','18209876579',NULL,9),(12,'赵敏','女','1992-02-03 00:00:00','18209179577',NULL,1);

/*Table structure for table `boys` */

DROP TABLE IF EXISTS `boys`;

CREATE TABLE `boys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boyName` varchar(20) DEFAULT NULL,
  `userCP` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `boys` */

insert  into `boys`(`id`,`boyName`,`userCP`) values (1,'张无忌',100),(2,'鹿晗',800),(3,'黄晓明',50),(4,'段誉',300);

