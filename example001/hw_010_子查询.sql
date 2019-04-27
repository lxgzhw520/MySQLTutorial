# 谁的工资比 Abel 高?
select last_name, salary
from employees
where salary > (
  select salary
  from employees
  where last_name = 'Abel'
);

# 返回job_id与141号员工相同，salary比143号员工的员工 姓名，job_id 和工资
select last_name, job_id, salary
from employees
where job_id = (
  select job_id
  from employees
  where employee_id = 141
)
  and salary = (
  select salary
  from employees
  where employee_id = 143
);


# 返回公司工资最少的员工的last_name,job_id和salary
select last_name, job_id, salary
from employees
where salary = (
  select min(salary)
  from employees
);


# 查询最低工资 大于50号部门最低工资的 部门id 和 其最低工资
select department_id, min(salary) min_salary
from employees
group by department_id
having min_salary > (
  select min(salary)
  from employees
  where department_id = 50
);


# 返回location_id是1400或1700的部门 中的 所有员工姓名
# 得到所有的部门id
select distinct department_id
from departments
where location_id = 1400
   or location_id = 1700;
#根据部门id查员工名

select last_name, department_id
from employees
where department_id = any (
  select distinct department_id
  from departments
  where location_id = 1400
     or location_id = 1700
)
order by department_id;

# 返回其它工种中比job_id为‘IT_PROG’工种 任一工资低的 员工的员工号、姓名、job_id 以及salary
# 1 job_id为‘IT_PROG’的所有工资
select salary
from employees
where job_id = 'IT_PROG';

# 2 嵌套查询
select employee_id, last_name, job_id, salary
from employees
where salary < all (
  select salary
  from employees
  where job_id = 'IT_PROG'
)
order by salary;

# 查询员工编号最小并且工资最高的员工信息
select *
from employees
where employee_id = (
  select min(employee_id)
  from employees
)
  and salary = (
  select max(salary)
  from employees
);

# 查询每个部门的员工个数
select count(*) count, department_name
from employees e
       inner join departments d on e.department_id = d.department_id
group by department_name
order by count;

#第二种方法 第一种方法查不出员工为0的部门
select department_name,
       (
         select count(*)
         from employees e
         where e.department_id = d.department_id
       ) count
from departments d
     # having count != 0
order by count;


# 查询员工号=102的部门名
select department_name
from departments d
where department_id = (
  select department_id
  from employees e
  where e.employee_id = 102
);

#第二种方法
select department_name
from departments
       left outer join employees e on departments.department_id = e.department_id
where e.employee_id = 102;

# 查询每个部门的平均工资的工资等级
#1 查询每个部门的平均工资
select round(avg(salary)) avg_salary, department_id
from employees
group by department_id;
#2 嵌套查询 将查询结果作为新表链接
select ag_dep.*, g.grade_level
from (
       select round(avg(salary)) avg_salary, department_id
       from employees
       group by department_id
     ) ag_dep
       inner join job_grades g on ag_dep.avg_salary between lowest_sal and highest_sal;


# 查询所有员工的部门名
select d.department_name
from departments d
where d.department_id in (
  select department_id
  from employees
);

select department_name
from departments d
where exists(select *
             from employees e
             where d.department_id = e.department_id);

# 查询没有女朋友的男神信息
select bo.*
from boys bo
where bo.id not in (
  select boyfriend_id
  from beauty
);

select bo.*
from boys bo
where not exists(
    select boyfriend_id
    from beauty b
    where bo.id = b.boyfriend_id
  );

# 查询和Zlotkey相同部门的员工姓名和工资
# Zlotkey相同部门
select department_id
from employees
where last_name = 'Zlotkey';

#嵌套
select concat(last_name, first_name) name, salary
from employees
where department_id = (
  select department_id
  from employees
  where last_name = 'Zlotkey'
);

# 查询工资比公司平均工资高的员工的员工号，姓名和工资
# 公司平均工资
select avg(salary) avg_salary
from employees;

select employee_id, concat(last_name, first_name) name, salary
from employees
where salary > (
  select avg(salary) avg_salary
  from employees
);

# 查询各部门中 工资比本部门平均工资高 的员工的员工号, 姓名和工资
# 本部门平均工资
select avg(salary) avg_salary
from employees
where department_id is not null
group by department_id;

# 各部门
select distinct department_id
from employees
where department_id is not null;

#嵌套
select employee_id, concat(last_name, first_name) name, salary, e.department_id
from employees e
       inner join (
  select avg(salary) avg_salary, department_id
  from employees
  where department_id is not null
  group by department_id
) ag_dep on e.department_id = ag_dep.department_id
where salary > ag_dep.avg_salary;


# 查询和姓名中包含字母u 的员工在 相同部门 的员工的员工号和姓名
# 相同部门
select department_id
from employees
where last_name like '%u%'
group by department_id;

#嵌套
select employee_id, concat(last_name, first_name) name
from employees e
       inner join (
  select department_id
  from employees
  where last_name like '%u%'
  group by department_id
) udepart on e.department_id = udepart.department_id;

#方法2
select employee_id, concat(last_name, first_name) name
from employees
where department_id in (
  select department_id
  from employees
  where last_name like '%u%'
  group by department_id
);

#方法3
select employee_id, concat(last_name, first_name) name
from employees
where department_id = any (
  select department_id
  from employees
  where last_name like '%u%'
  group by department_id
);


# 查询在部门的location_id为1700的部门工作的员工的员工号
# location_id为1700的部门
select department_id
from departments d
       inner join locations l on d.location_id = l.location_id
where l.location_id = 1700;

#嵌套
select employee_id
from employees e
where e.department_id = any (
  select department_id
  from departments d
         inner join locations l on d.location_id = l.location_id
  where l.location_id = 1700
);



# 查询管理者是K_ing的 员工姓名和工资
# 管理者是K_ing
select employee_id
from employees
where last_name = 'K_ing';

#嵌套
select concat(last_name, first_name) name, salary
from employees
where manager_id = any (
  select employee_id
  from employees
  where last_name = 'K_ing'
);
# 查询工资最高的员工的姓名，要求first_name和last_name显示为一列，列名为 姓.名
# 工资最高
select max(salary)
from employees;

#嵌套
select concat(last_name, '.', first_name) name
from employees
where salary = (
  select max(salary)
  from employees
);


