# sum 求和、avg 平均值、max 最大值 、min 最小值 、count 计算个数
#1、简单 的使用
select sum(salary) sum
from employees;
select avg(salary) avg
from employees;
select max(salary) max
from employees;
select min(salary) min
from employees;
select count(salary) count
from employees;

# 和distinct搭配
select sum(distinct salary) sum, sum(salary) sum1
from employees;

# 查询公司员工工资的最大值，最小值，平均值，总和
select max(salary) max_salary, min(salary) min_salary, avg(salary) avg_salary, sum(salary) sum_salary
from employees;
# 查询员工表中的最大入职时间和最小入职时间的相差天数
select max(hiredate) max, min(hiredate) min, ((max(hiredate) - min(hiredate)) / 1000 / 3600 / 24) difference
from employees;

select datediff(max(hiredate), min(hiredate)) difference
from employees;

# 查询部门编号为90的员工个数
select count(*) count,department_id
from employees
where department_id=90;