--Sales Person

Table: SalesPerson
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+
sales_id is the primary key column for this table.
Each row of this table indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.
 

Table: Company
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+
com_id is the primary key column for this table.
Each row of this table indicates the name and the ID of a company and the city in which the company is located.
 

Table: Orders3
+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+
order_id is the primary key column for this table.
com_id is a foreign key to com_id from the Company table.
sales_id is a foreign key to sales_id from the SalesPerson table.
Each row of this table contains information about one order. This includes the ID of the company, the ID of the salesperson, the date of the order, and the amount paid.
 

Find the names of all the salespersons who did not have any orders related to the company with the name "RED".
Return the result table in any order.
The result format is in the following example.

 
Example 1:
Input: 
SalesPerson table:
+----------+------+--------+-----------------+------------+
| sales_id | name | salary | commission_rate | hire_date  |
+----------+------+--------+-----------------+------------+
| 1        | John | 100000 | 6               | 4/1/2006   |
| 2        | Amy  | 12000  | 5               | 5/1/2010   |
| 3        | Mark | 65000  | 12              | 12/25/2008 |
| 4        | Pam  | 25000  | 25              | 1/1/2005   |
| 5        | Alex | 5000   | 10              | 2/3/2007   |
+----------+------+--------+-----------------+------------+

Company table:
+--------+--------+----------+
| com_id | name   | city     |
+--------+--------+----------+
| 1      | RED    | Boston   |
| 2      | ORANGE | New York |
| 3      | YELLOW | Boston   |
| 4      | GREEN  | Austin   |
+--------+--------+----------+

Orders3 table:
+----------+------------+--------+----------+--------+
| order_id | order_date | com_id | sales_id | amount |
+----------+------------+--------+----------+--------+
| 1        | 1/1/2014   | 3      | 4        | 10000  |
| 2        | 2/1/2014   | 4      | 5        | 5000   |
| 3        | 3/1/2014   | 1      | 1        | 50000  |
| 4        | 4/1/2014   | 1      | 4        | 25000  |
+----------+------------+--------+----------+--------+

Output: 
+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+
Explanation: 
According to orders 3 and 4 in the Orders3 table, it is easy to tell that only salesperson John and Pam have sales to company RED, so we report all the other names in the table salesperson.

--Create SalesPerson Table
CREATE TABLE SalesPerson (
  sales_id INT PRIMARY KEY,
  name VARCHAR(100),
  salary INT,
  commission_rate INT,
  hire_date DATE
);

--Create Company Table
CREATE TABLE Company (
  com_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(100)
);

--Create Orders3 Table
CREATE TABLE Orders3 (
  order_id INT PRIMARY KEY,
  order_date DATE,
  com_id INT,
  sales_id INT,
  amount INT,
  FOREIGN KEY (com_id) REFERENCES Company(com_id),
  FOREIGN KEY (sales_id) REFERENCES SalesPerson(sales_id)
);

--Inserting SalesPerson values
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) 
VALUES (1, 'John', 100000, 6, '2006-04-01');

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) 
VALUES (2, 'Amy', 12000, 5, '2010-05-01');

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) 
VALUES (3, 'Mark', 65000, 12, '2008-12-25');

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) 
VALUES (4, 'Pam', 25000, 25, '2005-01-01');

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) 
VALUES (5, 'Alex', 5000, 10, '2007-02-03');

--Inserting Company values
INSERT INTO Company (com_id, name, city) 
VALUES (1, 'RED', 'Boston');

INSERT INTO Company (com_id, name, city) 
VALUES (2, 'ORANGE', 'New York');

INSERT INTO Company (com_id, name, city) 
VALUES (3, 'YELLOW', 'Boston');

INSERT INTO Company (com_id, name, city) 
VALUES (4, 'GREEN', 'Austin');

-- Inserting Orders3 values
INSERT INTO Orders3 (order_id, order_date, com_id, sales_id, amount) 
VALUES (1, '2014-01-01', 3, 4, 10000);

INSERT INTO Orders3 (order_id, order_date, com_id, sales_id, amount) 
VALUES (2, '2014-02-01', 4, 5, 5000);

INSERT INTO Orders3 (order_id, order_date, com_id, sales_id, amount) 
VALUES (3, '2014-03-01', 1, 1, 50000);

INSERT INTO Orders3 (order_id, order_date, com_id, sales_id, amount) 
VALUES (4, '2014-04-01', 1, 4, 25000);

--Solution
SELECT name
FROM SalesPerson 
WHERE sales_id NOT IN 
                    (SELECT o.sales_id
                    FROM Orders3 AS o
                    LEFT JOIN Company AS c ON o.com_id = c.com_id
                    WHERE name LIKE 'RED') 
       