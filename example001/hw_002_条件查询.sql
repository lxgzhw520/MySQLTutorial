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