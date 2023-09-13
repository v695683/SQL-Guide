select * from (select *,DENSE_RANK() over(order by salary )as r from emp_data ) T where r=5


select Salary,RANK() over(order by Salary) as r from emp_data

select * from emp_data

select Gender,Salary,RANK() over(partition by Gender order by Salary) as r from emp_data

select * from emp_data

select Gender,Salary,Row_number() over(order by Emp_ID) as r from emp_data

select * from Instagram_Data

select DATEPART(YY,Date_Posted) as t from Instagram_Data

select DATEDIFF(YY,Date_Posted,GETDATE()) as t from Instagram_Data

select * from emp_data

--Group by
select count(Emp_id),LOC from emp_data group by LOC

select * from emp_data group by Emp_ID,Name_Prefix,First_Name,Last_Name,Gender,E_Mail,Salary,LOC,MGR_ID,DEPT_ID
select distinct * from emp_data

--self join
select* from emp

select e1.empno,e1.ename,e2.ename from emp e1,emp e2 where e1.mgr=e2.empno
--To create New table form existing only schema
Drop table NEWTable1
select * INTO NEWTable1 from practice..EmployeeInfo where 1=0
select * from NEWTable1

--To create New table form existing with data
Drop table NEWTable1
select * INTO NEWTable1 from practice..EmployeeInfo where 1=1
select * from NEWTable1