-- # Assigment 2 # --

--USE DEMO;

-- CREATING TABLE EMP_SAL
CREATE TABLE EMP_SAL
(
    EID CHAR(5),
    DEPT VARCHAR(25),
    DESI VARCHAR(30),
    DOJ DATE,
    SALARY INT
);

----------------------------------------------------------

INSERT INTO EMP_SAL
VALUES
    ('E0001' , 'IT' , 'ASSOCIATE' , '2016-04-25', 35000),
    ('E0002', 'MIS', 'TEMP', '2023-03-13', 16500),
    ('E0003' , 'ADMIN' , 'ASSOCIATE' , '2011-07-13' , 28000),
    ('E0004', 'HR', 'ASSOCIATE', '2020-03-10', 19500),
    ('E0005', 'ADMIN', 'MANAGER', '2018-12-31', 65000),
    ('E0006', 'IT', 'TEMP', '2013-01-17', 25000),
    ('E0007', 'MIS', 'ASSOCIATE', '2022-11-11', 25000);

----------------------------------------------------------

SELECT *
FROM EMP_SAL;

----------------------------------------------------------

SELECT *
FROM EMP
WHERE NAME LIKE ('%SHARMA');

----------------------------------------------------------

UPDATE EMP_SAL SET SALARY = (SALARY + (SALARY*0.10))
WHERE DESI LIKE ('%MANAGER%');

----------------------------------------------------------