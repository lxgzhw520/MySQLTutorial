# 查询每个部门的员工个数
select count(*) count, department_id
from employees
group by department_id;

# 查询每个工种的员工平均工资
select avg(salary) avg_salary, job_id
from employees
group by job_id
order by avg_salary desc;

# 查询每个位置的部门个数
select count(*) count, location_id
from departments
group by location_id
order by count desc;

# 查询邮箱中包含a字符的 每个部门的最高工资
select max(salary) max_salary, department_id
from employees
where email like '%a%'
group by department_id
order by max_salary desc;

# 查询有奖金的每个领导手下员工的平均工资
select round(avg(salary)) avg_salary, manager_id
from employees
group by manager_id
order by avg_salary desc;

# 查询哪个部门的员工个数>5
select count(*) count, department_id
from employees
group by department_id
having count > 5
order by count desc;

# 每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
select max(salary) max_salary, job_id
from employees
where commission_pct is not null
group by job_id
having max_salary > 12000
order by max_salary desc;

# 领导编号>102的 每个领导手下的 最低工资大于5000的  领导编号和最低工资
select manager_id, min(salary) min_salary
from employees
where manager_id > 102
group by manager_id
having min_salary > 5000
order by min_salary;

#每个工种有奖金的员工的 最高工资>6000的 工种编号和最高工资,按最高工资升序
select job_id, max(salary) max_salary
from employees
where commission_pct is not null
group by job_id
having max_salary > 6000
order by max_salary;

# 查询每个工种每个部门的最低工资,并按最低工资降序
select job_id, department_id, min(salary) min_salary
from employees
group by job_id, department_id
order by min_salary desc;

#案例
#1.查询各job_id的员工工资的最大值，最小值，平均值，总和，并按job_id升序
select max(salary) max_salary,
       min(salary) min_salary,
       avg(salary) avg_salary,
       sum(salary) sum_salary,
       job_id
from employees
group by job_id
order by job_id;

#2.查询员工最高工资和最低工资的差距（DIFFERENCE）
select max(salary)-min(salary) difference_salary
from employees;

#3.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，没有管理者的员工不计算在内
select min(salary) min_salary,manager_id
from employees
where salary>=6000 and manager_id is not null
group by manager_id
order by min_salary;

#4.查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
select department_id,count(*) count,round(avg(salary)) avg_salary
from employees
group by department_id
order by avg_salary desc ;

#5.选择具有各个job_id的员工人数
select count(*) count,job_id
from employees
where job_id is not null
group by job_id
order by count desc ;