-- VR Startup Company

-- Codecademy Virtual Reality (CVR), Inc. is the latest startup on the VR scene. As head of the Project Completion team, you have been given a list of upcoming projects needing to be delivered. Your main responsibility is to analyze our current talent pool to ensure each project can be completed efficiently and effectively.

-- Each project needs a Project Manager, Team Lead, Designer, Database Administrator (DBA), and at least two Developers.

-- 1
-- Start by familiarizing yourself with the tables. Examine the data from the employees table.

SELECT 
  * 
FROM 
  employees;

-- 2
-- Examine the data in the projects table.
-- Do you think there’s a way to join the two tables?

SELECT 
  * 
FROM 
  projects;

-- 3
-- What are the names of employees who have not chosen a project?

SELECT 
  first_name, 
  last_name
FROM 
  employees
WHERE 
  current_project IS NULL;

-- 4
-- What are the names of projects that were not chosen by any employees?

SELECT 
  project_name 
FROM 
  projects
WHERE 
  project_id NOT IN (
   SELECT 
    current_project
   FROM 
    employees
   WHERE 
    current_project IS NOT NULL);

-- 5
-- What is the name of the project chosen by the most employees?

SELECT 
  project_name
FROM 
  projects
INNER JOIN 
  employees 
ON 
  projects.project_id = employees.current_project
WHERE 
  current_project IS NOT NULL
GROUP BY 
  project_name
ORDER BY 
  COUNT(employee_id) DESC
LIMIT 
  1;

-- 6
-- Which projects were chosen by multiple employees?

SELECT 
  project_name
FROM 
  projects
INNER JOIN 
  employees 
ON 
  projects.project_id = employees.current_project
WHERE 
  current_project IS NOT NULL
GROUP BY 
  current_project
HAVING 
  COUNT(current_project) > 1;

-- 7
-- Each project needs at least 2 developers. How many available project positions are there for developers? Do we have enough developers to fill the needed positions?
-- We will learn how to do this in the last chapters of this course! Take a look at the hint to get a preview.

SELECT 
  (COUNT(*) * 2) - (
    SELECT 
      COUNT(*)
    FROM 
      employees
    WHERE 
      current_project IS NOT NULL AND 
      position = 'Developer'
  ) AS 'Count'
FROM 
  projects;

-- 8
-- When employees are hired at CVR, they are given the Myers-Briggs personality test. We try to diminish tension among team members by creating teams based on compatible personalities.
-- The chart shows which personality matches should be avoided. For example, an employee with the ISFP personality type should not be matched with an INFP, ENFP, or an INFJ.

-- 9
-- Which personality is the most common across our employees?

SELECT 
  personality 
FROM 
  employees
GROUP BY 
  personality
ORDER BY 
  COUNT(personality) DESC
LIMIT 
  1;

-- 10
-- What are the names of projects chosen by employees with the most common personality type?

SELECT 
  project_name 
FROM 
  projects
INNER JOIN 
  employees 
ON 
  projects.project_id = employees.current_project
WHERE personality = (
   SELECT 
    personality
   FROM 
    employees
   GROUP BY 
    personality
   ORDER BY 
    COUNT(personality) DESC
   LIMIT 
    1
);

-- 11
-- Find the personality type most represented by employees with a selected project.
-- What are names of those employees, the personality type, and the names of the project they’ve chosen?

SELECT 
  last_name, 
  first_name, 
  personality, 
  project_name
FROM 
  employees
INNER JOIN 
  projects 
ON 
  employees.current_project = projects.project_id
WHERE personality = (
   SELECT 
    personality 
   FROM 
    employees
   WHERE 
    current_project IS NOT NULL
   GROUP BY 
    personality
   ORDER BY 
    COUNT(personality) DESC
   LIMIT 
    1
);

