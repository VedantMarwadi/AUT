
/* MODEL ANSWERs - S2 2024 Lab 1 DW*/


REM: Create tables:
@H:\COMP810_Master\S2_2024\HR.sql

/*************************************************************/
/* Exercise 1 - Exploring the data and structure of tables */
REM: *** Students may try other options  ***

/* Part 1 -  */
select * 
from locations;

/* Part 2 */
select * 
from locations;
desc locations;

/* Part 2 - Alternative */
desc employees; 




/*************************************************************/
/* Exercise 2 */
REM: drop table jobs2 cascade constraints;

/* Part 1 */
CREATE TABLE jobsbis 
   ( JOB_ID varchar(10) NOT NULL UNIQUE,
     JOB_TITLE varchar(35),
     MIN_SALARY decimal(6,0),
     MAX_SALARY decimal(6,0)
     check(MAX_SALARY <= 25000)
   );

desc jobsbis;

/* Part 2 */

/* ANSWER: We'll get an error message. 
Table name 'jobs' is already used by an existing object */


/* Part 3 */

drop table jobsbis cascade constraints;

CREATE TABLE jobsbis 
    (  JOB_ID varchar(10) NOT NULL UNIQUE, 		
       JOB_TITLE varchar(35), 
       MIN_SALARY decimal(6,0) DEFAULT 5000, 
       MAX_SALARY decimal(6,0) DEFAULT NULL
    );

Desc jobsbis;


/* Part 4 */
CREATE TABLE mycountries
  ( COUNTRY_ID   varchar(3) NOT NULL UNIQUE,
    COUNTRY_NAME varchar(40),
    REGION_ID    decimal(10,0)
);

desc mycountries;



/*************************************************************/
/* Exercise 3 */


/* Part 1 */ 

SELECT *
from locations;
desc locations;



/* Part 2 */ 
desc employees;

SELECT employee_id AS "Emp#", 
       first_name||' '||last_name AS "Full Name",
       job_id AS "Job Title", department_id AS "Department ID"
from employees;



/* Part 3 */ 
select distinct (job_id)
from employees;



/* Part 4 */ 
select first_name ||' '|| last_name as "Full Name",
       'Phone:'||' '||phone_number||' Email: '||email as "Contact Details"
from employees;



/* Part 5 */ 
select first_name ||' '|| last_name as "Full Name",
       'Phone:'||' '||phone_number||' Email: '||email as "Contact Details",
       Department_ID as "Dept ID"
from employees
where Department_ID = 30;



/* Part 6 */ 
select 
distinct job_id
from employees;


/* END OF LAB WEEK 1 Data Warehousing */
REM: Edited on August 2024.
