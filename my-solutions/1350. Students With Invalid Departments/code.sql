# Write your MySQL query statement below

SELECT
    id,
    name
FROM
    Students
WHERE
    department_id NOT IN (SELECT id FROM Departments)

# Write your MySQL query statement below

SELECT
    id,
    name
FROM
	Students AS s
WHERE NOT EXISTS(
	SELECT
		1
	FROM
		Departments
	WHERE
		id = s.department_id
);
