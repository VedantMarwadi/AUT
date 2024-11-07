
/***************************************************************/
/* Solutions TO SELECTED EXERCISES Lab Week 4 Data Warehousing */

/***********************/
/* Task 1  SQL Joins */
/*********************/


/* Task 1.1 */

/* (1) */


/* DO IT YOURSELF */


/* (2)  */

select g.guestname, h.hotelname, b.datefrom, b.dateto 
from booking b, guest g, hotel h
where b.hotelno = h.hotelno and b.guestno = g.guestno;



/* Task 1.2 */

/* (1) */

/* DO IT YOURSELF */



/* (2) */
select e.first_name||' '||e.last_name as "Full Name", e.email||'@MEGACORP.COM' as "Email", d.department_name "Department Name", l.city||', '||c.country_name as "Full Address"
from employees e, departments d, locations l, countries c where e.department_id = d.department_id
and d.location_id = l.location_id and l.country_id = c.country_id
order by e.last_name;



/* (3) */

/* DO IT YOURSELF */


/* (4) */


/* DO IT YOURSELF */



/* (5) */
select worker.first_name||' '||worker.last_name as "Employee Name", worker.employee_id as "Employee #",
manager.first_name||' '||manager.last_name as "Manager Name", manager.employee_id as "Manager #"
from employees worker, employees manager where worker.manager_id = manager.employee_id;




/* (6) */

/* DO IT YOURSELF */



/* (7) */

/* DO IT YOURSELF */






/***************************************/
/* Task 2  SQL and aggregate functions */
/***************************************/


/* (1) */

/* DO IT YOURSELF */


/* (2) */
select last_name, concat ('NZD',to_char (salary, '99,999')) as "Salary", nvl (commission_pct, 0) as "Commission %",
lpad (nvl (to_char(salary * commission_pct),'No Commission'),20) as "Commission" 
from employees
order by last_name;



/* (3) */

/* DO IT YOURSELF */



/* (4) */

/* DO IT YOURSELF */




/* (5) */
select min (salary) as "Minimum", max (salary) "Maximum", round(avg (salary),2) "Average", round(stddev (salary),2) "Standard Deviation"
from employees;




/* (6) */
/* DO IT YOURSELF */



/* (7) */
/* DO IT YOURSELF */





/* (8) */
/* DO IT YOURSELF */





/* (9) */
select e.department_id as "Department No", d.department_name as "Department Name", round (avg(salary), 2) as "Average Salary"
from employees e, departments d
where e.department_id = d.DEPARTMENT_ID group by e.department_id, d.DEPARTMENT_NAME having avg(salary) > 6000
order by avg(salary) desc;





/* (10) */
/* DO IT YOURSELF */



/* END OF LAB WEEK 4 DW */



