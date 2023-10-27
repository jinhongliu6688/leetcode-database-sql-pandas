# Write your MySQL query statement below

SELECT EmployeeUNI.unique_id, Employees.NAME
FROM Employees
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;
