CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
RETURN (
    SELECT MAX(a.salary)
    FROM Employee a
    WHERE N - 1 = (
        SELECT COUNT(DISTINCT b.salary)
        FROM Employee b
        WHERE b.salary > a.salary
    )
);
