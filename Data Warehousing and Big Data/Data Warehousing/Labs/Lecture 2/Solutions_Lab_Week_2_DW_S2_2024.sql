/* Solutions Lab Week 2 Data Warehousing */
-- Solutions Lab Week 2 Data Warehousing --

/*****************/
/* Task 1 */
/*****************/


/* Question 1 */
select first_name || ' ' || last_name AS "FULL NAMEs", 
      commission_pct  AS "Commission PCT", 
      job_id as "JOB ID"
from employees
where commission_pct > 0.25;



/* Question 2 */
select first_name ||' '|| last_name AS "FULL NAME",
    job_id as "JOB ID",
    salary as "SALARY_"
from employees
where salary BETWEEN 7000 and 9000;



/* Question 3 */
select first_name ||' '|| last_name AS "FULL NAME",
    job_id as "JOB ID",
    salary as "SALARY_"
from employees
where salary not BETWEEN 7000 and 9000;



/* Question 4 */
SELECT first_name||' '||last_name AS "Full Name", 
    job_id, HIRE_DATE as "HIRE_DATE"
    from employees
where last_name in ('Atkinson' , 'Greenberg');


/* Question 5 */
select street_address, postal_code, city, country_id
    from locations
where COUNTRY_ID in ('BR', 'UK');


/* Question 6 */
/* (a) */
SELECT first_name||' '||last_name AS "Full Name",
' Email: ' || email ||' Phone: '||phone_number as "Contact Details" 
FROM employees
 WHERE hire_date between '01-AUG-2002' AND '31-AUG-2002'
/* WHERE hire_date between '01-Jan-1996' AND '30-Jan-1996' */
ORDER BY first_name;


/* (b) */
SELECT first_name||' '||last_name AS "Full Name",
' Email: ' || email ||' Phone: '||phone_number as "Contact Details" 
FROM employees
/* WHERE hire_date between '01-AUG-2002' AND '31-AUG-2002'; */
WHERE hire_date between '01-Jan-1996' AND '30-Jan-1996'
ORDER BY first_name ASC;


SELECT first_name||' '||last_name AS "Full Name",
' Email: ' || email ||' Phone: '||phone_number as "Contact Details" 
FROM employees
/* WHERE hire_date between '01-AUG-2002' AND '31-AUG-2002'; */
WHERE hire_date between to_date('01-Jan-1996', 'dd-mon-YYYY') AND '30-Jan-1996'
ORDER BY first_name ASC;


/* Question 7 */
SELECT 'Full Name: ' || first_name ||' '||last_name AS "Full Name", 
        hire_date, job_id,  
        ' Email: ' || email ||
        ' Phone: '||phone_number AS "Contact Details" 
FROM employees
WHERE hire_date > '31/12/99' 
ORDER BY job_id, hire_date desc;


/* Question 8 */
select FIRST_NAME, LAST_NAME
 FROM EMPLOYEES
where first_name like 'S%n';

/* Question 9 */
SELECT FIRST_NAME, LAST_NAME,  job_id  AS "JOB ID"
FROM EMPLOYEES
where job_id in ('AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP', 'PR_REP');


/* Question 10 */
/* Step 1  - List of DEPT IDs */
select department_id
from employees
group by department_id;

/* Step 2 - USe & to identify each variable in your SQL statement */ 
select EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID 
FROM EMPLOYEES
where department_ID = &deptno;


/*****************/
/* Task 2 */
/*****************/

/* Q1  */
SELECT * 
FROM ROOM
WHERE PRICE > 40 
ORDER BY PRICE ASC;


/* Q2  */
SELECT guestname, guestaddress as "Guest Address"
FROM guest 
WHERE guestaddress like '%Mount%' 
ORDER BY guestname;













