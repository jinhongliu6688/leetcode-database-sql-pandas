# Write your MySQL query statement below

SELECT
    CASE
        WHEN A + B <= C OR A + C <= B OR B + C <= A THEN "Not A Triangle"
        WHEN A = B AND A = C AND B = C THEN "Equilateral"
        WHEN A = B OR A = C OR B = C THEN "Isosceles"
        ELSE "Scalene"
    END AS triangle_type
FROM
   Triangles 

# Write your MySQL query statement below

SELECT
    IF(A + B <= C OR A + C <= B OR B + C <= A, "Not A Triangle", 
        IF(A = B AND A = C AND B = C, "Equilateral", 
            IF(A = B OR A = C OR B = C, "Isosceles", "Scalene")) 
    ) AS triangle_type
FROM
   Triangles 
