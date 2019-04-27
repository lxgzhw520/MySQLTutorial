# 查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序
show tables ;
select concat(last_name,first_name) as name,department_id,salary
from employees
order by salary desc, name asc;

#选择工资不在8000到17000的员工的姓名和工资，按工资降序
select concat(last_name,first_name) as name,salary
from employees
where salary not between 8000 and 17000
order by salary desc ;

# 查询邮箱中包含e的员工信息，并先按邮箱的字节数降序，再按部门号升序
select *
from employees
where email like '%e%'
order by length(email) desc ,department_id asc ;

#查询员工信息 按年薪降序
select *,salary*12*(1+ifnull(commission_pct,0)) as year_salary
from employees
order by year_salary desc ;

# 查询员工名，并且按名字的长度降序
select last_name
from employees
order by length(last_name) desc ;

# 查询员工信息，要求先按工资降序，再按employee_id升序
select *
from employees
order by salary desc ,employee_id asc ;