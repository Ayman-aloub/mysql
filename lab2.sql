-- 1
select  DNO,Dname ,fname from departments d left join  employee e on  d.MGRSSN=e.ssn;
-- 2
select d.Dname,p.Pname from departments d, project p where p.Dnum=d.Dnum;
-- 3
select d.*,e.Fname from dependent d , employee e where d.ESSN=e.SSN;
-- 4
select e.fname, d.dependent_name from employee e, dependent d where e.Gender='F' and d.essn =e.ssn and d.sex ='F'
union 
select e.fname, d.dependent_name from employee e, dependent d where e.Gender='M' and d.essn =e.ssn and d.sex ='M';
-- 5 
select e.* from departments d,employee e where d.MGRSSN=e.SSN;
-- select * from employee e where e.ssn=any(select d.MGRSSN from departments d); 

-- 6
select Pnumber,Pname,Plocation from project  where city in('Cairo','Alex');

-- 7
select * from project  where Pname like'a%';

-- 8 
select * from employee where DNO=30 and (Salary between 1000 and 2000);

--  9
select e.Fname from works_for w , employee e , project p 
where e.SSN=w.Essn  and  p.Pnumber=w.pno and  p.Pname='al rabwah' and w.hours>=10 and e.dno=10; 

-- 10

select e.fname from employee e 
where e.SuperSSN=(select ssn from employee where fname like 'kamel' and lname like 'mohamed') ;


--  11
select p.Pname , sum(w.hours) from project p ,works_for w where p.Pnumber=w.Pno group by w.Pno ;
 
 -- 12
 select  e.Fname  from employee e , works_for w  where w.Essn = e.ssn  order by e.Fname ;
-- select  e.Fname ,p.Pname  from employee e , works_for w ,project p where w.Essn = e.ssn and p.Pnumber=w.Pno order by e.Fname ;

-- 13
-- select min(ssn) from employee;
-- select DNO,Fname from employee having min(ssn);
-- select DNO from employee having min(ssn);

--  sol
select * from departments where Dnum=(select DNO from employee where ssn =(select min(ssn) from employee ));

--  14
select Dname, min(salary),max(salary),avg(salary) from employee e ,departments d where d.Dnum=e.DNO group by DNO;

--  15
select MGRSSN ,Lname from departments ,employee where MGRSSN=ssn and MGRSSN not in (select essn from dependent where ESSN);


-- 16
  select SSN,DNO from employee  group by DNO having avg(Salary) >( select avg(salary) from employee );
  
  --  17
  select  e.Fname ,e.Lname ,e.DNO from project p, employee e ,works_for w 
  where p.Pnumber=w.Pno and e.SSN =w.Essn order by e.dno ,e.Fname,e.Lname;
  
  -- 18
  select p.Pnumber, e.lname ,e.Bdate ,e.Address  from project p,departments d,employee e 
  where p.City like 'cairo' and d.Dnum=p.Dnum and d.MGRSSN=e.SSN   ;
  
  --  19
   
  
  select p.Pname, p.Pnumber from  project p 
  where   p.Pnumber in 
  (select distinct w.pno  from works_for w, employee e where w.Essn=e.SSN and e.Lname='mohamed'  )
  or 
  p.pnumber in
  (select distinct p.pnumber  from project p, employee e , departments d 
   where p.dnum=d.Dnum and d.MGRSSN=e.SSN  and e.Lname='mohamed'  )
  ;
  
  
  -- 20
  select Fname ,ssn from employee e where not exists 
  (select distinct e.Fname, e.SSN from dependent d where d.ESSN =e.ssn);
  
  