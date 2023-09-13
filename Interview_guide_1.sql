
--1.Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName
select upper(EmpFname) as EmpName from practice..EmployeeInfo

--2.Write a query to fetch the number of employees working in the department ‘HR’
select count(*) from practice..EmployeeInfo where Department ='HR'

--3.Write a query to get the current date
select GETUTCDATE()
select GETDATE()
--4 Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select substring(EmpFname,1,4) as EmpName from practice..EmployeeInfo
--5 Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table
select SUBSTRING(Address,0,CHARINDEX('(',Address)) from  practice..EmployeeInfo
--6  Write a query to create a new table which consists of data and structure copied from the other table.
			select * INTO NEWTable from practice..EmployeeInfo where 1=0
			--To create New table form existing only schema
			Drop table NEWTable1
			select * INTO NEWTable1 from practice..EmployeeInfo where 1=0
			select * from NEWTable1

			--To create New table form existing with data
			Drop table NEWTable1
			select * INTO NEWTable1 from practice..EmployeeInfo where 1=1
			select * from NEWTable1
--7Write q query to find all the employees whose salary is between 50000 to 100000
select * from practice..EmployeePosition where Salary between '50000' and '100000'

--8 Write a query to find the names of employees that begin with ‘S’
select * from practice..EmployeeInfo where EmpFname like 'S%'
 
 --9 Write a query to fetch top N records
 select top(5) * from practice..EmployeePosition order by Salary DESC 
 
 --10  Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. 
 --The first name and the last name must be separated with space.
 select EmpFname +' '+ EmpLname as FullName from practice..EmployeeInfo
  select concat(EmpFname ,' ', EmpLname) as FullName from practice..EmployeeInfo

  --11 Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
  select  count(*),Gender from practice..EmployeeInfo where DOB 
  between convert(date,'02/05/1970',104) and convert(date,'31/12/1977',104) group by Gender

--12 Write a query to fetch all the records from the EmployeeInfo table
--ordered by EmpLname in descending order and Department in the ascending order
 select * from practice..EmployeeInfo order by EmpFname DESC ,Department ASC


 --13 Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets

 select * from practice..EmployeeInfo where EmpFname like '____a' and len(EmpFname)=5

 --14  Write a query to fetch details of all employees excluding the employees with first names,
 --“Sanjay” and “Sonia” from the EmployeeInfo table
 select * from practice..EmployeeInfo where EmpFname not in ('Sanjay','Sonia')



 --15  Write a query to fetch details of employees with the address as “DELHI(DEL)”
  select * from practice..EmployeeInfo where Address like 'DELHI(DEL)%'

  --16 Write a query to fetch all employees who also hold the managerial position
   select * from practice..EmployeeInfo ef inner join practice..EmployeePosition ep on ef.EmpID=ep.EmpID where ep.EmpPosition='Manager'


   --17 Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order  
   select count(*),Department from practice..EmployeeInfo group by Department order by count(*) 

   --18 Write a query to calculate the even and odd records from a table
   select * from (select *,ROW_NUMBER() over(order by Salary) as G1 from [dbo].[emp_data])T where G1 % 2 <> 1
select * from (select *,ROW_NUMBER() over(order by Salary) as G1 from [dbo].[emp_data])T where G1 % 2 <> 0

   SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=0
   SELECT EmpID FROM (SELECT rowno, EmpID from EmployeeInfo) WHERE MOD(rowno,2)=1

   --19  Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table

   SELECT * FROM EmployeeInfo E WHERE EXISTS (SELECT * FROM EmployeePosition P WHERE E.EmpId = P.EmpId)
    
	--20 Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table
	SELECT DISTINCT Salary FROM EmployeePosition E1 
 WHERE 2 >= (SELECT COUNT(DISTINCT Salary)FROM EmployeePosition E2 
  WHERE E1.Salary >= E2.Salary) ORDER BY E1.Salary DESC

  select Top 2 Salary from EmployeePosition where Salary is not null order by Salary  ASC

  --21 Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
  select * from (SELECT Salary, DENSE_RANK() over(order by Salary asc) as r  FROM EmployeePosition where Salary is not null)T where r=5

  --22  Write a query to retrieve duplicate records from a table
   SELECT EmpID, EmpFname, Department ,COUNT(*) 
FROM EmployeeInfo GROUP BY EmpID, EmpFname, Department 
HAVING COUNT(*) > 1

--23 Write a query to retrieve the list of employees working in the same department
 Select DISTINCT E.EmpID, E.EmpFname, E.Department 
FROM EmployeeInfo E, EmployeeInfo E1 
WHERE E.Department = E1.Department AND E.EmpID != E1.EmpID

--24   Write a query to retrieve the last 3 records from the EmployeeInfo table

SELECT * FROM EmployeeInfo WHERE EmpID <=3 
UNION 
SELECT * FROM EmployeeInfo WHERE EmpID <=3


--25 Write a query to find the third-highest salary from the EmpPosition table
  select * from (select Salary, DENSE_RANK() over(order by Salary asc) as r from EmployeePosition where Salary is not null) T where r=3
  select * from (select Salary, DENSE_RANK() over(order by Salary desc) as r from EmployeePosition where Salary is not null) T where r=3

  SELECT TOP 1 salary
FROM(
SELECT TOP 3 salary
FROM EmployeePosition
ORDER BY salary DESC) AS emp
ORDER BY salary ASC;

--26 average salary on the basis of position
select *,AVG(Salary) over(partition by EmpPosition) as Avg_salary from [dbo].[EmployeePosition]

--27   department wise highest salary
select e.Department,max(p.Salary) from EmployeeInfo e
Right join EmployeePosition p on e.EmpID=p.EmpID group by e.Department

select *,Salary from EmployeeInfo e
Right join EmployeePosition p on e.EmpID=p.EmpID
select distinct *,Salary from EmployeeInfo e
left join EmployeePosition p on e.EmpID=p.EmpID
--28 

--Delete  Duplicate records(when all rows are Duplicate)
with CTE_table as (
select *, Row_number() over(PARTITION BY Emp_ID
order by Emp_ID) as t from [dbo].[emp_data1])

select * from CTE_table where t=2


--Delete  Duplicate records(when all rows are Duplicate and one their for order by)
with CTE_table1 as
(select *, Row_number() over(PARTITION BY First_Name,Last_Name,Emp_ID,Gender
order by Emp_ID) as t from [dbo].[emp_data1])
select * from  CTE_table1 
Delete from CTE_table1 where t=2


with CTE_table1 as
(select *, Rank() over(PARTITION BY First_Name,Last_Name,Emp_ID,Gender
order by id) as t from [dbo].[emp_data1])
select * from  CTE_table1 


--Delete  Duplicate records(when id is there )
delete from [dbo].[emp_data1] where id not in
(select max(id)
from [dbo].[emp_data1] group by Emp_ID,Name_Prefix,First_Name,Last_Name,Gender,E_Mail,Salary,LOC,MGR_ID,DEPT_ID )

--copy 50 percent data
with cte_table as
(select *,row_number() over(order by sal) as  r,count(*) over() as total from emp)
select * from cte_table where r<ceiling(0.5*total)


--matches plan
select * from team_t t1 cross join team_t t2 where t1.team<>t2.team


select * from EmployeeDetail
select * from Employee

--salry range between 2L to 3L
select * from Employee where Salary betWeen 200000 and 300000 

--emp from same city
select E1.* from Employee E1 ,Employee E2 where E1.City=E2.City and E1.EmpID!=E2.EmpID

--Comulative sum salary
select *,sum(Salary) over(order by Salary) as s from Employee

--Male female ratio
with CTE1 as
(SELECT
*,count(Gender) over(partition by Gender) as F,count(Gender) over() as Total
FROM Employee)
select distinct F*100/Total as Percentage1 from CTE1

--50% record
select *from Employee where EmpID<=(select count(EmpId)/2 from Employee)

--EVEN Emp
with CTE as 
(select *,ROW_NUMBER() over(order by EmpID) as r from Employee)
select * from CTE where r%2=0

--odd
with CTE as 
(select *,ROW_NUMBER() over(order by EmpID) as r from Employee)
select * from CTE where r%2!=0

--• Begin with ‘A’
select * from Employee where EmpName like 'A%'
--Contains ‘A’ alphabet at second place
select * from Employee where EmpName like '_a%'
-- Contains ‘Y’ alphabet at second last place
select * from Employee where EmpName like '%t_'
-- Ends with ‘n’ and contains 5 alphabets
select * from Employee where EmpName like '____n'

--Begins with ‘V’ and ends with ‘A’
select * from Employee where EmpName like 'V%a'

--• starting with vowels (a, e, i, o, or u), without duplicates
SELECT DISTINCT EmpName
FROM Employee
WHERE LOWER(EmpName) like '[aeiou]%'

--• ending with vowels (a, e, i, o, or u), without duplicates
SELECT DISTINCT EmpName
FROM Employee
WHERE LOWER(EmpName) like '%[aeiou]'
--• starting & ending with vowels (a, e, i, o, or u), without duplicates
SELECT DISTINCT EmpName
FROM Employee
WHERE LOWER(EmpName) like '[aeiou]%[aeiou]'


--Nth Highest Salary

With CTE_Sal as
(select * ,DENSE_RANK() over(order by Salary )as rank1 from Employee) 
select * from CTE_Sal where rank1=3

--Duplicate record
SELECT EmpID, EmpName, gender, Salary, city,
COUNT(*) AS duplicate_count
FROM Employee
GROUP BY EmpID, EmpName, gender, Salary, city
HAVING COUNT(*) > 1;

---Query to retrieve the list of employees working in same project.
WITH CTE AS

(SELECT e.EmpID, e.EmpName, ed.Project
FROM Employee AS e
INNER JOIN EmployeeDetail AS ed
ON e.EmpID = ed.EmpID)

SELECT c1.EmpName, c2.EmpName, c1.project
FROM CTE c1, CTE c2
WHERE c1.Project = c2.Project AND c1.EmpID != c2.EmpID AND c1.EmpID < c2.EmpID

--Show the employee with the highest salary for each project
WITH CTE AS

(SELECT e.EmpID, e.EmpName,e.Salary, ed.Project
FROM Employee AS e
INNER JOIN EmployeeDetail AS ed
ON e.EmpID = ed.EmpID)
select Project,Max(Salary) from CTE group by Project

WITH CTE AS
(SELECT project, EmpName, salary,
ROW_NUMBER() OVER (PARTITION BY project ORDER BY salary DESC) AS row_rank
FROM Employee AS e
INNER JOIN EmployeeDetail AS ed
ON e.EmpID = ed.EmpID)
SELECT project, EmpName, salary
FROM CTE
WHERE row_rank = 1;

---Query to find the total count of employees joined each year

with CTE as (select E.EmpId as EmpID1,E1.EmpId as EmpID2,E1.DOJ from Employee E inner join
EmployeeDetail E1 on E.EmpID=E1.EmpID)
select distinct datepart(YYYY,DOJ),count(EmpID1) over(Partition by datepart(YYYY,DOJ)) as YY from CTE

---Create 3 groups based on salary col, salary less than 1L is low, between 1 -
--2L is medium and above 2L is High

select * ,
CASE when Salary<=100000 then 'LOW'
     when Salary>=200000 then 'High'
	 else 'MEDIUM'
	 end as New
	 from Employee



