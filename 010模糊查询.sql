show tables ;

#模糊查询 like
select *from python001 where name like '%安';#%表示多个任意字符串
select *from python001 where name like '_安';#_表示一个任意字符串

# '%a'     //以a结尾的数据
# 'a%'     //以a开头的数据
# '%a%'    //含有a的数据
# '_a_'    //三位且中间字母是a的  _表示一个任意数据
# '_a'     //两位且结尾字母是a的
# 'a_'     //两位且开头字母是a的