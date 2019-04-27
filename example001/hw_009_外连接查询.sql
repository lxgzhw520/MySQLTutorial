# 用于查询一个表中有，另一个表没有的记录
select b.*, bo.*
from boys bo
       left outer join beauty b on b.boyfriend_id = bo.id;

# 查询哪个部门没有员工
# 左外
select d.*, e.employee_id
from departments d
       left outer join employees e on d.department_id = e.department_id
where e.employee_id is null;

# 右外
select d.*, e.employee_id
from employees e
       right outer join departments d on e.department_id = d.department_id
where e.employee_id is null;

#一、查询编号>3的女神的男朋友信息，如果有则列出详细，如果没有，用null填充
select b.id, b.name, bo.*
from beauty b
       left outer join boys bo on b.boyfriend_id = bo.id
where b.id > 3;

# 查询哪个城市没有部门
select city
from departments d
       #组成了一张新的表,在新表上进行过滤
       right outer join locations l on d.location_id = l.location_id
where d.department_id is null;

# 查询部门名为SAL或IT的员工信息
select e.*,d.department_name
from employees e
       left outer join departments d on e.department_id = d.department_id
where d.department_name = 'SAL'
   or d.department_name = 'IT';



