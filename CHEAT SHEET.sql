-- =============================================================
-- ==                  THE ULTIMATE SQL CHEATSHEET            ==
-- =============================================================
-- Use this file as a quick reference for all major SQL commands.
-- All commands are commented out.
-- =============================================================


-- =============================================================
-- == 1. DQL (Data Query Language) - RETRIEVING DATA
-- =============================================================

-- SELECT all columns from a table
-- SELECT * FROM table_name;

-- SELECT specific columns from a table
-- SELECT column1, column2 FROM table_name;

-- SELECT with an alias (temporary new name)
-- SELECT column1 AS 'New Name', column2 AS 'Another Name' FROM table_name;

-- SELECT unique/distinct values
-- SELECT DISTINCT column1 FROM table_name;

-- SELECT with filtering (WHERE clause)
-- SELECT * FROM table_name WHERE column1 = 'some_value';
-- SELECT * FROM table_name WHERE column2 > 100;
-- SELECT * FROM table_name WHERE column3 LIKE 'a%'; -- Starts with 'a'
-- SELECT * FROM table_name WHERE column3 LIKE '%a'; -- Ends with 'a'
-- SELECT * FROM table_name WHERE column3 LIKE '%a%'; -- Contains 'a'
-- SELECT * FROM table_name WHERE column4 IN ('value1', 'value2');
-- SELECT * FROM table_name WHERE column5 BETWEEN 10 AND 20;
-- SELECT * FROM table_name WHERE column6 IS NULL;
-- SELECT * FROM table_name WHERE column6 IS NOT NULL;

-- SELECT with complex filtering (AND / OR)
-- SELECT * FROM table_name WHERE column1 = 'value' AND column2 > 10;
-- SELECT * FROM table_name WHERE column1 = 'value' OR column2 > 10;

-- SELECT with sorting (ORDER BY)
-- SELECT * FROM table_name ORDER BY column1 ASC; -- Ascending (A-Z, 1-10)
-- SELECT * FROM table_name ORDER BY column1 DESC; -- Descending (Z-A, 10-1)
-- SELECT * FROM table_name ORDER BY column1, column2 DESC; -- Sort by 2 columns

-- SELECT a limited number of rows
-- SELECT * FROM table_name LIMIT 10; -- (MySQL/PostgreSQL)
-- SELECT TOP 10 * FROM table_name; -- (MS SQL Server)


-- =============================================================
-- == 2. AGGREGATE FUNCTIONS - SUMMARIZING DATA
-- =============================================================
-- These are almost always used with GROUP BY

-- COUNT: Count the number of rows
-- SELECT COUNT(*) FROM table_name;
-- SELECT COUNT(column1) FROM table_name; -- Counts non-NULL values
-- SELECT COUNT(DISTINCT column1) FROM table_name; -- Counts unique values

-- SUM: Sum of a numeric column
-- SELECT SUM(column_name) FROM table_name;

-- AVG: Average of a numeric column
-- SELECT AVG(column_name) FROM table_name;

-- MIN: Minimum value in a column
-- SELECT MIN(column_name) FROM table_name;

-- MAX: Maximum value in a column
-- SELECT MAX(column_name) FROM table_name;


-- =============================================================
-- == 3. GROUP BY & HAVING - GROUPING DATA
-- =============================================================

-- GROUP BY: Group rows that have the same values into summary rows
-- Used with aggregate functions.
-- "For each department, get the average salary."
-- SELECT DEPT, AVG(SALARY)
-- FROM EMP_SAL
-- GROUP BY DEPT;

-- HAVING: Filters groups *after* aggregation. WHERE filters rows *before*.
-- "For each department *that has more than 5 employees*, get the average salary."
-- SELECT DEPT, AVG(SALARY), COUNT(EID)
-- FROM EMP_SAL
-- GROUP BY DEPT
-- HAVING COUNT(EID) > 5;


-- =============================================================
-- == 4. DML (Data Manipulation Language) - MODIFYING DATA
-- =============================================================

-- INSERT: Add new rows
-- INSERT INTO table_name (column1, column2)
-- VALUES ('value1', 'value2');

-- INSERT multiple rows
-- INSERT INTO table_name (column1, column2)
-- VALUES
--   ('value_a1', 'value_a2'),
--   ('value_b1', 'value_b2');

-- UPDATE: Modify existing rows
-- IMPORTANT: Always use a WHERE clause!
-- UPDATE table_name
-- SET column1 = 'new_value', column2 = 100
-- WHERE column_id = 1;

-- DELETE: Remove existing rows
-- IMPORTANT: Always use a WHERE clause!
-- DELETE FROM table_name
-- WHERE column_id = 1;


-- =============================================================
-- == 5. DDL (Data Definition Language) - DEFINING DATA STRUCTURE
-- =============================================================

-- CREATE DATABASE
-- CREATE DATABASE database_name;

-- USE DATABASE
-- USE database_name; -- (MySQL / MS SQL Server)
-- \c database_name; -- (PostgreSQL)

-- CREATE TABLE
-- CREATE TABLE table_name (
--     column1_id INT PRIMARY KEY,
--     column2_name VARCHAR(100) NOT NULL,
--     column3_price DECIMAL(10, 2) DEFAULT 0,
--     column4_date DATE,
--     column5_f_key INT,
--     FOREIGN KEY (column5_f_key) REFERENCES other_table(other_id)
-- );

-- ALTER TABLE: Modify a table
-- Add a new column
-- ALTER TABLE table_name
-- ADD column_new VARCHAR(50);

-- Drop a column
-- ALTER TABLE table_name
-- DROP COLUMN column_new;

-- Modify a column's data type
-- ALTER TABLE table_name
-- ALTER COLUMN column_new VARCHAR(100); -- (MS SQL Server)
-- MODIFY COLUMN column_new VARCHAR(100); -- (MySQL)

-- DROP TABLE: Delete a table
-- DROP TABLE table_name;

-- TRUNCATE TABLE: Delete all data *inside* a table (faster than DELETE, cannot be undone)
-- TRUNCATE TABLE table_name;


-- =============================================================
-- == 6. JOINS - COMBINING DATA FROM MULTIPLE TABLES
-- =============================================================
-- Example tables: CUSTOMER (CID, CNAME) and ORDERS (OID, ODATE, CID)

-- INNER JOIN: Returns only rows that have a match in *both* tables.
-- SELECT C.CNAME, O.ODATE
-- FROM CUSTOMER AS C
-- INNER JOIN ORDERS AS O ON C.CID = O.CID;

-- LEFT JOIN: Returns *all* rows from the left table (CUSTOMER),
-- and matching rows from the right table (ORDERS).
-- If no match, NULL is returned for the right table's columns.
-- SELECT C.CNAME, O.ODATE
-- FROM CUSTOMER AS C
-- LEFT JOIN ORDERS AS O ON C.CID = O.CID;

-- RIGHT JOIN: Returns *all* rows from the right table (ORDERS),
-- and matching rows from the left table (CUSTOMER).
-- (Less common than LEFT JOIN).
-- SELECT C.CNAME, O.ODATE
-- FROM CUSTOMER AS C
-- RIGHT JOIN ORDERS AS O ON C.CID = O.CID;

-- FULL OUTER JOIN: Returns all rows when there is a match in *either* table.
-- If no match, NULLs are returned for the missing side.
-- SELECT C.CNAME, O.ODATE
-- FROM CUSTOMER AS C
-- FULL OUTER JOIN ORDERS AS O ON C.CID = O.CID;


-- =============================================================
-- == 7. SUBQUERIES - NESTED QUERIES
-- =============================================================

-- Subquery in a WHERE clause (find employees who earn more than average)
-- SELECT EID, SALARY
-- FROM EMP_SAL
-- WHERE SALARY > (SELECT AVG(SALARY) FROM EMP_SAL);

-- Subquery in a FROM clause (treat a query result as a temporary table)
-- SELECT T.DEPT, T.AVG_SALARY
-- FROM (
--     SELECT DEPT, AVG(SALARY) AS AVG_SALARY
--     FROM EMP_SAL
--     GROUP BY DEPT
-- ) AS T
-- WHERE T.AVG_SALARY > 30000;


-- =============================================================
-- == 8. OTHER USEFUL COMMANDS
-- =============================================================

-- CONSTRAINTS: Rules for data in a table
-- PRIMARY KEY: Uniquely identifies each row.
-- FOREIGN KEY: Links a row to another table.
-- NOT NULL: Column cannot have a NULL value.
-- UNIQUE: All values in the column must be different.
-- CHECK: Ensures values meet a specific condition (e.g., CHECK (AGE > 18)).
-- DEFAULT: Sets a default value if no value is given.
-- (See CREATE TABLE example in section 5)

-- UNION: Combines the results of two SELECT statements (removes duplicates)
-- SELECT column_name FROM table1
-- UNION
-- SELECT column_name FROM table2;

-- UNION ALL: Combines results, but *keeps* duplicates (faster)
-- SELECT column_name FROM table1
-- UNION ALL
-- SELECT column_name FROM table2;

-- CASE: If-then-else logic within a SELECT
-- SELECT OID, OQTY,
--   CASE
--     WHEN OQTY > 100 THEN 'Large Order'
--     WHEN OQTY > 50 THEN 'Medium Order'
--     ELSE 'Small Order'
--   END AS OrderSize
-- FROM ORDERS;

-- VIEW: A virtual table based on a SELECT query
-- CREATE VIEW v_CustomerOrders AS
-- SELECT C.CNAME, O.OID, O.ODATE
-- FROM CUSTOMER AS C
-- JOIN ORDERS AS O ON C.CID = O.CID;
--
-- Now you can query the view:
-- SELECT * FROM v_CustomerOrders WHERE CNAME = 'Amit Sharma';

-- DCL (Data Control Language)
-- GRANT: Give permissions to a user
-- GRANT SELECT, INSERT ON table_name TO 'username'@'host';

-- REVOKE: Take permissions away
-- REVOKE INSERT ON table_name FROM 'username'@'host';

-- TCL (Transaction Control Language)
-- START TRANSACTION; -- Start a new transaction
--   -- (Run your INSERT, UPDATE, DELETE statements)
-- COMMIT; -- Save the changes
-- ROLLBACK; -- Undo the changes

-- =============================================================
-- ==      9. SQL QUERY EXECUTION ORDER CHEATSHEET            ==
-- =============================================================
--
-- This file explains the difference between the order you
-- WRITE a query and the order the database EXECUTES it.
--
-- =============================================================

-- == 9.1 How You WRITE the Code (Written Order) ==
-- This is the order you type the keywords.
-- It's designed to be human-readable.

-- 1. SELECT
-- 2. FROM
-- 3. JOIN
-- 4. WHERE
-- 5. GROUP BY
-- 6. HAVING
-- 7. ORDER BY
-- 8. LIMIT / TOP

-- =============================================================

-- == 9.2 How the Database EXECUTES the Code (Logical Order) ==
-- This is the logical order the database "thinks" about your query.

-- 1. FROM / JOIN
--    (Gets all tables and joins them into one giant temporary table)

-- 2. WHERE
--    (Filters the individual rows)

-- 3. GROUP BY
--    (Bundles the rows into groups)

-- 4. HAVING
--    (Filters the *groups*, not the rows)

-- 5. SELECT
--    (Performs calculations like AVG(), and applies aliases)

-- 6. DISTINCT
--    (Removes duplicate rows)

-- 7. ORDER BY
--    (Sorts the final results)

-- 8. LIMIT / TOP
--    (Picks the final set of rows to return)

-- =============================================================

-- == 9.3 KEY TAKEAWAY ==

-- You cannot use an alias from your `SELECT` (e.g., AS 'TeamSize')
-- in your `WHERE` clause.

-- WHY? Because `WHERE` (Step 2) is executed *before* `SELECT` (Step 5),
-- so the alias doesn't exist yet.

-- =============================================================