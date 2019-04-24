show tables ;
insert into python001 (name, age, gender, class_no) value (
  '要被删除的',111,'女','Python001'
  );

select *from python001;

#根据id删除
delete from python001 where id=5;

update python001 set name='李安' where id=4;