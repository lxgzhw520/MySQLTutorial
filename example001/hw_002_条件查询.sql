#案例1：查询工资>12000的员工信息
show tables;
# drop table if exists departments01;
# drop table if exists jobs01;
# drop table if exists countrys01;
# drop table if exists admin01;
# drop table if exists boys01;
# drop table if exists beauty01;
# drop table if exists employees01;
# drop table if exists job_grades01;
# drop table if exists locations01;

select *
from employees
where salary > 12000;


#案例2：查询部门编号不等于90号的员工名和部门编号
desc employees;#department_id != 90
select concat(first_name, last_name) as 姓名, department_id as 部门编号
from employees
where department_id != 90;

#案例1：查询工资在10000到20000之间的员工名、工资以及奖金率
desc employees; #concat() salary commission_pct
select concat(first_name, last_name), salary, commission_pct
from employees
where salary > 10000
  and salary < 20000;


#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
select *
from employees
where not (department_id >= 90 and department_id <= 110)
   or salary > 15000;

#查询员工名中包含字符a的员工信息
select *
from employees
where last_name like '%a%';


#查询员工名中第三个字符为n，第五个字符为l的员工名和工资
select *
from employees
where last_name like '__n_l%';

# 查询员工名中第二个字符为_的员工名
select *
from employees
where last_name like '_\_%';

# 查询员工编号在100到120之间的员工信息
select *
from employees
where employee_id between 100 and 200;

# 查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
select last_name,job_id
from employees
where job_id in ('IT_PROG','AD_VP','AD_PRES');


# 查询没有奖金的员工名和奖金率
select last_name,commission_pct
from employees
where commission_pct is null;

# 查询有奖金的员工名和奖金率
select last_name,commission_pct
from employees
where commission_pct is not null;

# 查询工资为12000的员工信息
select *
from employees
where salary=12000;