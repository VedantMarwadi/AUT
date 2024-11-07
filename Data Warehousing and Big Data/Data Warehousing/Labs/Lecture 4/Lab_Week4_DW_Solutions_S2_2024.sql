/* Solutions Lab Week 4 Data Warehousing */
-- Solutions Lab Week 4 Data Warehousing --

/***********************/
/* Task 1  SQL Joins  */
/*********************/


/* Task 1.1 */

/* (1) */
select r.type, r.price from room r, hotel h
where r.hotelno = h.hotelno
AND hotelname = 'Grosvenor Hotel';

-- Alternatively:
SELECT price, type FROM room WHERE hotelNo =
(SELECT hotelNo FROM hotel
WHERE hotelname = 'Grosvenor Hotel');

/* (2)  */

select g.guestname, h.hotelname, b.datefrom, b.dateto 
from booking b, guest g, hotel h
where b.hotelno = h.hotelno and b.guestno = g.guestno;



/* Task 1.2 */

/* (1) */
select e.first_name||' '||e.last_name as "Full Name", e.job_id as "Job Title", d.department_name as "Department Name"
from employees e, departments d
where e.department_id = d.department_id order by e.last_name;



/* (2) */
select e.first_name||' '||e.last_name as "Full Name", e.email||'@MEGACORP.COM' as "Email", d.department_name "Department Name", l.city||', '||c.country_name as "Full Address"
from employees e, departments d, locations l, countries c where e.department_id = d.department_id
and d.location_id = l.location_id and l.country_id = c.country_id
order by e.last_name;



/* (3) */
select e.first_name||' '||e.last_name as "Full Name", e.email||'@MEGACORP.COM' as "Email", d.department_name "Department Name", l.city||', '||c.country_name as "Full Address"
from employees e, departments d, locations l, countries c where e.department_id = d.department_id
and d.location_id = l.location_id and l.country_id = c.country_id
and c.COUNTRY_NAME = '&countryname' order by e.last_name;



/* (4) */
select e.first_name||' '||e.last_name as "Full Name", d.department_name FROM EMPLOYEES E ,DEPARTMENTS D
where e.department_id (+) = d.department_id; 

-- Alternatively:
select e.first_name||' '||e.last_name as "Full Name", d.department_name from employees e right outer join departments d on
e.department_id = d.department_id;



/* (5) */
select worker.first_name||' '||worker.last_name as "Employee Name", worker.employee_id as "Employee #",
manager.first_name||' '||manager.last_name as "Manager Name", manager.employee_id as "Manager #"
from employees worker, employees manager where worker.manager_id = manager.employee_id;




/* (6) */
-- The staff member “Steven King” does not have a manager. He is the CEO



/* (7) */
select worker.first_name||' '||worker.last_name as "Employee Name", worker.employee_id as "Employee #",
manager.first_name||' '||manager.last_name as "Manager Name", manager.employee_id as "Manager #"
from employees worker left outer join employees manager on worker.manager_id = manager.employee_id;


-- Alternative:
select worker.first_name||' '||worker.last_name as "Employee Name", worker.employee_id as "Employee #",
manager.first_name||' '||manager.last_name as "Manager Name", manager.employee_id as "Manager #"
from employees worker, employees manager
where worker.manager_id = manager.employee_id (+);





/***************************************/
/* Task 2  SQL and aggregate functions */
/***************************************/


/* (1) */
select concat (upper (last_name) ||', ',first_name) "Full Name", lower (concat (email,'@megacorp.com')) as "Email"
from employees order by last_name;

--Alternatively:

select upper(last_name) ||', ' || first_name "Full Name", lower (concat (email,'@megacorp.com')) as "Email" 
from employees 
order by last_name;




/* (2) */
select last_name, concat ('NZD',to_char (salary, '99,999')) as "Salary", nvl (commission_pct, 0) as "Commission %",
lpad (nvl (to_char(salary * commission_pct),'No Commission'),20) as "Commission" 
from employees
order by last_name;



/* (3) */
select first_name ||' '|| last_name as "Full Name",
concat (length(concat(first_name, last_name)),' Char.') as "Name Length", to_char(hire_date, 'Day') as "Hire Day",
to_char(hire_date, 'Month ddTH YYYY') as "Hire Date" from employees
where commission_pct is not null and job_id <> 'SA_MAN';



/* (4) */
select first_name ||' '|| last_name as "Full Name",
Job_id as "Job Title", concat (lower (email),'@megacorp.com') as "Email" from employees
where lower (first_name) = lower ('&First_Name');




/* (5) */
select min (salary) as "Minimum", max (salary) "Maximum", round(avg (salary),2) "Average", round(stddev (salary),2) "Standard Deviation"
from employees;




/* (6) */
select job_id as "Job Title", count (*) as "Number of Staff" from employees
group by job_id
order by count (*) desc;


/* (7) */
select min (salary) as "Minimum", max (salary) "Maximum", avg (salary) "Average", stddev (salary) "Standard Deviation"
from employees
where department_id = 80;




/* (8) */
select e.department_id as "Department No", d.department_name as "Department Name", round (avg(e.salary), 2) as "Average Salary"
from employees e, departments d
where e.department_id = d.DEPARTMENT_ID 
group by e.department_id, d.DEPARTMENT_NAME 
order by avg(salary) desc;




/* (9) */
select e.department_id as "Department No", d.department_name as "Department Name", round (avg(salary), 2) as "Average Salary"
from employees e, departments d
where e.department_id = d.DEPARTMENT_ID group by e.department_id, d.DEPARTMENT_NAME having avg(salary) > 6000
order by avg(salary) desc;





/* (10) */
SELECT e.first_name||' '||e.last_name as "Full Name", j.JOB_TITLE as "Job Title",
d.department_name as "Department Name", jh.START_DATE as "Start Date",
jh.END_DATE as "End Date",
round (months_between (jh.end_date, jh.start_date)) as "# Months in Position" from employees e, departments d, job_history jh, jobs j
where e.employee_id = jh.employee_id
AND jh.DEPARTMENT_ID = D.DEPARTMENT_ID
and j.JOB_ID = jh.JOB_ID
order by E.EMPLOYEE_ID, jh.START_DATE;


/* END OF LAB WEEK 4 DW */



