******************Lab Week 3 answers *****************
/*Note: PRIMARY and FOREIGN KEY constraints may be defined when the table is created (as in GRADE table)
or they may be added later, as in Task 3
When deleting tables, delete child tables first then the parent tables to avoid referential integrity errors. */


-----------------------Task 1 ----------------------
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE course CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;

--NOTE: Parent tables need to be created before the child table (Grade can be craeted with foreign key constraints)

CREATE TABLE student (
student_no Number(6),
student_name varchar2(20) not null,
Student_address varchar2(50),
CONSTRAINT student_pk PRIMARY KEY (student_no));

CREATE TABLE course (
course_no Number(3),
course_name varchar2(40) not null,
Course_details varchar2(50)
CONSTRAINT course_pk PRIMARY KEY (course_no));

CREATE TABLE grade (
student_no Number(6),
course_no Number(3), 
grade Number(3) not null,
CONSTRAINT grade_pk PRIMARY KEY (student_no,course_no)),
CONSTRAINT grade_student_fk FOREIGN KEY (student_no) REFERENCES student(student_no),
CONSTRAINT grade_course_fk FOREIGN KEY (course_no) REFERENCES course(course_no) );

-----------------------Task 2 ----------------------

/* Question 2 */
select h.city, count(roomno)
from hotel h, booking b
where b.hotelno = h.hotelno
group by h.city;

/* Question 3 */
select b.guestno, count(roomno)
from hotel h, booking b
where b.hotelno = h.hotelno
group by b.guestno;


/* Question 4 */
select b.guestno, h.city, count(roomno)
from hotel h, booking b
where b.hotelno = h.hotelno
group by b.guestno, h.city;



-----------------------Task 3 ----------------------

DROP TABLE category CASCADE CONSTRAINTS ;

DROP TABLE item_desc CASCADE CONSTRAINTS ;

DROP TABLE item_scan CASCADE CONSTRAINTS ;

DROP TABLE members_index CASCADE CONSTRAINTS ;

DROP TABLE store_information CASCADE CONSTRAINTS ;

DROP TABLE store_visit CASCADE CONSTRAINTS ;

CREATE TABLE category
  (
    category_id      VARCHAR2 (2) NOT NULL ,
    category_name    VARCHAR2 (20) ,
    category_details VARCHAR2 (100)
  ) ;
ALTER TABLE category ADD CONSTRAINT category_PK PRIMARY KEY ( category_id ) ;

CREATE TABLE item_desc
  (
    item_id         VARCHAR2 (6) NOT NULL ,
    category_id     VARCHAR2 (2) NOT NULL ,
    primary_desc    VARCHAR2 (50) ,
    secondary_desc  VARCHAR2 (50) ,
    color_desc      VARCHAR2 (10) ,
    size_desc       VARCHAR2 (10) ,
    status_code     CHAR (1) NOT NULL ,
    production_date DATE ,
    expiry_date     DATE ,
    brand_name      VARCHAR2 (20)
  ) ;
ALTER TABLE item_desc ADD CONSTRAINT item_desc_PK PRIMARY KEY ( item_id ) ;

CREATE TABLE item_scan
  (
    visit_id        VARCHAR2 (6) NOT NULL ,
    item_id         VARCHAR2 (6) NOT NULL ,
    quantity        NUMBER (2) ,
    unit_cost       NUMBER (5,3) ,
    unit_total_cost NUMBER (5,3)
  ) ;
ALTER TABLE item_scan ADD CONSTRAINT item_scan_PK PRIMARY KEY ( visit_id, item_id ) ;

CREATE TABLE members_index
  (
    membership_id VARCHAR2 (6) NOT NULL ,
    customer_name VARCHAR2 (20) ,
    address       VARCHAR2 (50) ,
    member_type   VARCHAR2 (10) NOT NULL ,
    join_date     DATE NOT NULL ,
    member_status CHAR (1) ,
    member_points NUMBER (3)
  ) ;
ALTER TABLE members_index ADD CONSTRAINT members_index_PK PRIMARY KEY ( membership_id ) ;

CREATE TABLE store_information
  (
    store_id         VARCHAR2 (3) NOT NULL ,
    store_name       VARCHAR2 (20) NOT NULL ,
    street_name      VARCHAR2 (20) ,
    city             VARCHAR2 (20) ,
    zip_code         VARCHAR2 (5) ,
    phone_nbr        VARCHAR2 (20) ,
    manager_name     VARCHAR2 (30) ,
    open_sunday_flag CHAR (1) NOT NULL
  ) ;
ALTER TABLE store_information ADD CONSTRAINT store_information_PK PRIMARY KEY ( store_id ) ;

CREATE TABLE store_visit
  (
    visit_id           VARCHAR2 (6) NOT NULL ,
    store_id           VARCHAR2 (3) NOT NULL ,
    membership_id      VARCHAR2 (6) NOT NULL ,
    transaction_date   DATE ,
    tot_unique_itm_cnt NUMBER (2) ,
    tot_visit_amt      NUMBER (5,3)
  ) ;
ALTER TABLE store_visit ADD CONSTRAINT store_visit_PK PRIMARY KEY ( visit_id ) ;

ALTER TABLE store_visit ADD CONSTRAINT TABLE_9_members_index_FK FOREIGN KEY ( membership_id ) REFERENCES members_index ( membership_id ) ;

ALTER TABLE store_visit ADD CONSTRAINT TABLE_9_store_information_FK FOREIGN KEY ( store_id ) REFERENCES store_information ( store_id ) ;

ALTER TABLE item_desc ADD CONSTRAINT item_desc_category_FK FOREIGN KEY ( category_id ) REFERENCES category ( category_id ) ;

ALTER TABLE item_scan ADD CONSTRAINT item_scan_item_desc_FK FOREIGN KEY ( item_id ) REFERENCES item_desc ( item_id ) ;

ALTER TABLE item_scan ADD CONSTRAINT item_scan_store_visit_FK FOREIGN KEY ( visit_id ) REFERENCES store_visit ( visit_id ) ;
