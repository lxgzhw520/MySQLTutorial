show tables ;

#向数据表插入数据 insert into 向某个表插入数据 (括号里面写要插入的字段)
#value表示单个值(具体值,与前面指定的字段一一对应)
insert into python001(name, age, gender, class_no) value (
  "东周",18,'男',"Python001"
  );


#向数据表插入多行数据                               values表示插入多条数据 后面一个()表示一条数据
insert into python001(name, age, gender, class_no) values(
                                                          "丁一",17,'男',"Python001"
                                                         ),(
                                                          "李皇",22,'男',"Python001"
                                                         )