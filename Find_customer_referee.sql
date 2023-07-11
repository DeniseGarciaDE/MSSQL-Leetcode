
--Find Customer Referee 

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

--Create Customer Table
CREATE TABLE Customer (
    id INT PRIMARY KEY, 
    name VARCHAR (100),
    referee_id INT
);

--Insert Customer values 
INSERT INTO Customer (id, name, referee_id)
VALUES 
(1, 'Will', null),
(2, 'Jane', null),
(3, 'Alex', 2),
(4, 'Bill', null),
(5, 'Zack', 1),
(6, 'Mark', 2);

--Solution
SELECT name 
FROM Customer 
WHERE referee_id != 2 OR referee_id IS NULL