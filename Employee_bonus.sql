--Employee Bonus

Table: Employee2
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+
empId is the primary key column for this table.
Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 

Table: Bonus
+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+
empId is the primary key column for this table.
empId is a foreign key to empId from the Employee table.
Each row of this table contains the id of an employee and their respective bonus.
 

Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.
The query result format is in the following example.

 

Example 1:
Input: 
Employee2 table:
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+

Bonus table:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+

Output: 
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+


--Create Employee2 table
CREATE TABLE Employee2 (
    empId INT PRIMARY KEY, 
    name VARCHAR(100),
    supervisor INT, 
    salary INT
);

--Insert Employee2 values
INSERT INTO Employee2 (empId, name, supervisor, salary)
VALUES (3, 'Brad', NULL, 4000),
       (1, 'John', 3, 1000),
       (2, 'Dan', 3, 2000),
       (4, 'Thomas', 3, 4000);

CREATE TABLE Bonus (
    empId INT,
    bonus INT,
    FOREIGN KEY (empId) REFERENCES Employee2(empId)
);

--Insert Bonus values
INSERT INTO Bonus (empId, bonus)
VALUES (2, 500),
       (4, 2000);

--Solution
SELECT name, bonus
FROM Employee2 E
LEFT JOIN Bonus B ON E.empId = B.empId
WHERE bonus < 1000 OR bonus IS NULL

