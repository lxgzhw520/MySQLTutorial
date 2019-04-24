# 查看数据库
show databases;

#选择数据库
use mysql_tutorial;
#创建表
create table if not exists python002
(
  id       int primary key auto_increment,
  name     varchar(24) not null,
  age      int         not null,
  gender   char(1)     not null,
  class_no varchar(24) not null
);

#查看表
show tables;


# 另一种创建表的方式 完整
create table if not exists `python001`#if not exist 如果不存在
(#飘号是为了防止关键字冲突
  `id`       int unsigned auto_increment,#unsigned无符号类型  auto_increment表示自增
  `name`     varchar(24)  not null,#notnull表示不能为空 varchar()表示字符串类型
  `age`      int unsigned not null,#int表示数字类型
  `gender`   char(1)      not null,#char表示字符类型
  `class_no` varchar(24)  not null,
  primary key (`id`)#最后指定主键为id
) engine = InnoDB
  default charset = utf8;#设置默认编码为utf8 引擎为InnoDB