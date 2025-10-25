-- # Assigment 7 ## --

-- USE EMPLOYEE;

SELECT DEPT AS 'DESIGNATION', COUNT(EID) AS 'TEAM SIZE', AVG(SALARY) AS 'AVERAGE SALARY'
FROM EMP_SAL
GROUP BY DEPT;


-----------------------------------------------------

SELECT COUNT(EID) AS 'COUNT'
FROM EMP_SAL
WHERE DESI = 'MANAGER';

-----------------------------------------------------

SELECT MIN(SALARY) AS 'MINIMUM SALARY', MAX(SALARY) AS 'MAXIMUM SALARY'
FROM EMP_SAL
WHERE DESI = 'ASSOCIATE';

-----------------------------------------------------

SELECT DEPT AS 'DEPARTMENT', COUNT(EMP_SAL.EID) AS 'TEAM SIZE', AVG(SALARY) AS 'AVERAGE SALARY'
FROM EMP_SAL
    INNER JOIN EMP
    ON EMP.EID = EMP_SAL.EID
GROUP BY DEPT, CITY
HAVING CITY = 'DELHI';

-----------------------------------------------------

SELECT * , UPPER(CONCAT(LEFT(NAME,1),LEFT(RIGHT(NAME,LEN(NAME)-CHARINDEX(' ',NAME)),1),RIGHT(EID,3),'@RCG.COM'))
FROM EMP

-----------------------------------------------------

SELECT NAME, CITY, PHONE, EMAIL, DOB
FROM EMP
WHERE DATEDIFF(YY,DOB,GETDATE()) >= 40;

-----------------------------------------------------

SELECT EID, NAME , DATEDIFF(YY,DOJ,GETDATE()) AS 'TENURE'
FROM EMP
WHERE DATEDIFF(YY,DOJ,GETDATE()) >= 5
ORDER BY 'TENURE'
;

-----------------------------------------------------

SELECT EMP.EID, NAME, PHONE, EMAIL, DESI , MONTH(DOB) AS 'BIRTH MONTH'
FROM EMP
    JOIN EMP_SAL
    ON EMP.EID = EMP_SAL.EID
WHERE DESI LIKE '%MANAGER' AND MONTH(DOB) =  MONTH(GETDATE());

-----------------------------------------------------

SELECT TOP(1)
    EMP.EID, DEPT AS 'DEPARTMENT', DESI AS 'DESIGNATION', SALARY
FROM EMP
    INNER JOIN EMP_SAL
    ON EMP.EID = EMP_SAL.EID
ORDER BY SALARY DESC;

-----------------------------------------------------

SELECT EID, NAME , LEN(NAME) AS 'LENGTH OF NAME'
FROM EMP
WHERE LEN(NAME) = (SELECT MAX(LEN(NAME))
FROM EMP);

