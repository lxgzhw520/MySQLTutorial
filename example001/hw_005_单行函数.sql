#1.	显示系统时间(注：日期+时间)
select now();
#2.	查询员工号，姓名，工资，以及工资提高百分之20%后的结果（new salary）
select employee_id, last_name, salary, salary * 1.2 as `new salary`
from employees;

#3.	将员工的姓名按首字母排序，并写出姓名的长度（length）
select concat(last_name, first_name) as `name`, length(concat(last_name,first_name)) as length
from employees
order by name;

