/* QS3: 1) Create a query to calculate the span (in days) between the hire date of the employee 
with the longest tenure and the hire date of the employee with the shortest tenure who is still 
currently employed at the company */
SELECT * FROM Employee
WITH employ_span AS
           (SELECT name, id, staff, city,start_date, DATEDIFF(day,start_date,GETDATE()) AS datediff
            FROM dbo.Employee
            WHERE end_date IS NULL
            )
SELECT DATEDIFF(Day,
               (SELECT TOP 1 start_date FROM employ_span ORDER BY datediff DESC),
			   (SELECT TOP 1 start_date FROM employ_span ORDER BY datediff ASC))
FROM employ_span

/* QS3: 2) Using the employee table, write a query that finds the longest period (in days) 
during which no employee was hired or fired.  */

WITH hire_fire AS(
SELECT start_date, 
       LAG(start_date,1) OVER (ORDER BY start_date ASC) AS hire_date, 
       end_date,
	   LAG(end_date,1) OVER (ORDER BY end_date ASC) AS fire_date
FROM Employee)


SELECT MAX(DATEDIFF(day, hire_date,start_date)) AS longest_hire_time,
       MAX(DATEDIFF(day, fire_date,end_date)) AS longest_fire_time
FROM hire_fire

/* QS3: 3, Create a query that returns each employee along with the maximum number of employees 
who worked for the company during their tenure, and the first date on which this maximum number was reached */


SELECT SUM(count) OVER (ORDER BY fdate) AS maxnum, fdate
FROM (SELECT start_date as fdate, 1 as count
      FROM Employee
	  UNION ALL
	  SELECT end_date, -1
      FROM Employee
	  WHERE end_date IS NOT NULL
)AS max_em



SELECT *
FROM Employee
JOIN (
	SELECT SUM(count) OVER (ORDER BY fdate) AS maxnum, fdate
    FROM (
		SELECT start_date as fdate, 1 as count
        FROM Employee
	    UNION ALL
	    SELECT end_date, -1
        FROM Employee
	    WHERE end_date IS NOT NULL
	) AS max_em
) max_em ON fdate BETWEEN start_date AND end_date
ORDER BY id, fdate DESC;


