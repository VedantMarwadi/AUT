
-- EXAMPLE Multiple Aggregation, Sales0506 --
drop table sales0506;
CREATE TABLE sales0506  (
        product     CHAR(7),
        Year         INT,
        Region      CHAR(15),
        Turnover    NUMERIC 
        ); 


INSERT INTO sales0506 VALUES ( 'Fridge', 2005, 'Northland', 135);
INSERT INTO sales0506 VALUES ( 'Fridge', 2005, 'Auckland' , 120);
INSERT INTO sales0506 VALUES ( 'Fridge', 2005,  NULL      , 255);
INSERT INTO sales0506 VALUES ( 'Fridge', 2006, 'Northland', 140);
INSERT INTO sales0506 VALUES ( 'Fridge', 2006, 'Auckland' , 135);
INSERT INTO sales0506 VALUES ( 'Fridge', 2005,   NULL     , 275);
/* INSERT INTO sales0506 VALUES ( 'Fridge', NULL,   NULL     , 530);*/

desc sales0506;

select * from sales0506;

-- END