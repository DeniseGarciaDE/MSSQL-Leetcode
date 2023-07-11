--Creating Weather table
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate date, 
    temperature INT
);

--Inserting values 
INSERT INTO Weather (id, recordDate, temperature)
VALUES (1, '2015-01-01', 10),
       (2, '2015-01-02', 25),
       (3, '2015-01-03', 20),
       (4, '2015-01-04', 30);

--Solution
SELECT w.id 
FROM
    (SELECT id, 
            temperature AS CurrentTemp, 
            LAG(temperature, 1) OVER (ORDER BY recordDate ASC) AS PriorTemp,
            recordDate AS CurrentDate,
            LAG(recordDate, 1) OVER (ORDER BY recordDate ASC) AS PriorDate
    FROM Weather ) AS w
WHERE (w.CurrentTemp > w.PriorTemp) AND (DATEDIFF(DAY, w.PriorDate, w.CurrentDate) = 1)

