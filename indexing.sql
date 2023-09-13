 
 --Indexing
 CREATE INDEX index
 ON TABLE column; 

 Drop table emp_data1 INDEX MyIndex
 create INDEX MyIndex
 ON emp_data1 (id)


 select * from emp where empno=20

 select * from emp_data1 where  Gender='F'and id=7


--Dept max salary emp name
--Here we took job
select * from emp 
select job, max(sal) from emp group by job

--name emp we want
select ename,E.job from emp E inner join
(select job, max(sal) as sal1 from emp group by job) t
on t.job=E.job and t.sal1=E.sal


select DATEPART(WW,Date_Posted) from Instagram_Data
--Join teams
select * from emp

select e.ename as employee_name,e.sal emo_salary, e1.ename as employee_name,e1.sal emo_salary from emp e inner join emp e1 on e.mgr=e1.empno where e.sal>e1.sal


