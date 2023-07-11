
--Customer Placing the Largest Number of Orders

Table: Orders2
+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number is the primary key for this table.
This table contains information about the order ID and the customer ID.
 

Find the customer_number for the customer who has placed the largest number of orders.
The test cases are generated so that exactly one customer will have placed more orders than any other customer.
The result format is in the following example.

 

Example 1:
Input: 
Orders2 table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+

Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.

--Create Orders2 table
CREATE TABLE Orders2 (order_number INT PRIMARY KEY, 
                      customer_number INT
);

--Insert Orders2 Values
INSERT INTO Orders2 (order_number, customer_number)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);

--Solution
SELECT TOP 1 customer_number
FROM (SELECT COUNT(*) as X, customer_number
      FROM Orders2
      GROUP BY customer_number) sub
ORDER BY x DESC 
