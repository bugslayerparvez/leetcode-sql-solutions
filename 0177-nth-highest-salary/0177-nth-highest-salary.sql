CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    SELECT MAX(salary)
    INTO result
    FROM Employee a
    WHERE N - 1 = (
        SELECT COUNT(DISTINCT b.salary)
        FROM Employee b
        WHERE b.salary > a.salary
    );

    RETURN result;
END;