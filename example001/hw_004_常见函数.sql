#1.length 获取参数值的字节个数
select length('zhangdapeng') as name;

#2.concat 拼接字符串
#3.upper、lower
#4.substr截取从指定索引处后面所有字符
#5.instr 返回子串第一次出现的索引，如果找不到返回0
#6.trim 去掉空格
select trim('     aaa     ') as str;
#7.lpad 用指定的字符实现左填充指定长度
#8.rpad 用指定的字符实现右填充指定长度
#9.replace 替换
select replace('敏感词嘿嘿敏感词哈哈敏感词啊啊啊', '敏感词', '*') as body;
#round 四舍五入
#ceil 向上取整
#floor 向下取整
#truncate 截断
#mod取余
#now 返回当前系统日期+时间
select now() as time;
#curdate 返回当前系统日期，不包含时间
select curdate() as date;
#curtime 返回当前时间，不包含日期
select curtime() as time;
#可以获取指定的部分，年、月、日、小时、分钟、秒
select year(now()) year;
select year('1991-01-01') as year;
select year(hiredate) as year
from employees;
#month
#str_to_date 将字符通过指定的格式转换成日期
select str_to_date('1998-01-01', '%Y-%c-%d') as date;
# 查询入职日期为1992-4-3的员工信息
select *
from employees
where hiredate = '1992-4-3';

select *
from employees
where hiredate = str_to_date('4-3 1992', '%c-%d %Y');

#date_format 将日期转换成字符
select date_format(now(), '%c/%d %Y') as date;
#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
select last_name, date_format(hiredate, '%c/%d %Y') as date
from employees
where salary is not null;

# 其他函数
select VERSION();
select database();
select user() as user;

#1.if函数
select if(10 < 5, '真的', '假的') as result;
select last_name,
       commission_pct,
       if(commission_pct is null, 'no commission', 'commisstion') commisstion
from employees;

/*案例：查询员工的工资，要求

部门号=30，显示的工资为1.1倍
部门号=40，显示的工资为1.2倍
部门号=50，显示的工资为1.3倍
其他部门，显示的工资为原工资

*/
select salary,
       department_id,
       case department_id
         when 30 then salary * 1.1
         when 40 then salary * 1.2
         when 50 then salary * 1.3
         else salary
         end as new_salary
from employees
order by new_salary desc ;

