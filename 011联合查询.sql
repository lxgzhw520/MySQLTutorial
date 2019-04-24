show tables ;

insert into python002(name, age, gender, class_no) values
('东周',18,'男','Python002'),
('李皇',22,'男','Python002');

#联合查询,实际上是将两张表合并为一张表
select *from python001 union select *from python002;