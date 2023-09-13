--sp_helptext procHandleDuplicateRecords

alter proc sptest
@DEPT_id int
as
begin
select * from Department_Dataset where DEPT_ID =@DEPT_id
end
--execute store procedure
execute sptest 20
--drop SP
drop proc sptest

-----------------------------------------------------------------------------
--Functions
Create function test()
returns char(4)
as
begin
DECLARE v_count char(4)
select count(*) into v_count from Department_Dataset
return v_count
end

Create function Fun_EmployeeInformation()
returns table
as
return(select * from Department_Dataset  )


select * from dbo.Fun_EmployeeInformation()

