-- # Assigment 7 # --

-- USE EMPLOYEE;

SELECT EID, NAME, CITY
FROM EMP
WHERE CITY = 'GURGAON';

---------------------------------------------------------

SELECT EMP.EID, NAME, DOJ, DEPT, DESI, SALARY
FROM EMP
    INNER JOIN EMP_SAL
    ON EMP.EID = EMP_SAL.EID
WHERE DESI LIKE '%MANAGER';

---------------------------------------------------------

UPDATE EMP_SAL
SET SALARY = SALARY - SALARY*0.10
WHERE EID IN (SELECT EID
FROM EMP
WHERE CITY = 'DELHI');

---------------------------------------------------------

SELECT EMP.EID, NAME, CITY, DOJ, DEPT, DESI, SALARY
FROM EMP
    INNER JOIN EMP_SAL
    ON EMP.EID = EMP_SAL.EID
WHERE DEPT IN (SELECT DEPT
FROM EMP_SAL
WHERE EID IN (SELECT EID
FROM EMP
WHERE NAME IN ('RAMESH GUPTA', 'DAVID')));

---------------------------------------------------------

CREATE TABLE TRAINING
(
    EID CHAR(5),
    NAME VARCHAR(30),
    DEPT VARCHAR (10)
);

INSERT INTO TRAINING
    (EID, NAME, DEPT)
SELECT EMP.EID, NAME, DEPT
FROM EMP
    INNER JOIN EMP_SAL
    ON EMP.EID = EMP_SAL.EID
WHERE DEPT = 'OPS'

---------------------------------------------------------

DELETE TRAINING
WHERE EID IN (SELECT EID
FROM EMP_SAL
WHERE DEPT = 'OPS' AND DESI = 'DIRECTOR');

---------------------------------------------------------

SELECT *
FROM EMP_SAL
WHERE EXISTS (SELECT *
FROM EMP_SAL
WHERE SALARY >= 200000);