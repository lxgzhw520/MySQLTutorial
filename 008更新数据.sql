show tables ;
insert into python001(name, age, gender, class_no) value(
  "要被修改的姓名",33,'男',"Python001"
  );

select *from python001;

#修改数据
update python001 set name="李安" where id=4;
#用单引号也能表示字符串 且是推荐的方式
update python001 set name='李安111' where id=4;