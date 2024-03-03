# Write your MySQL query statement below

SELECT
    invoice_id,
    customer_name,
    price,
    COUNT(contact_email) contacts_cnt,
    SUM(IF(contact_email IN (SELECT email FROM Customers), 1, 0)) trusted_contacts_cnt
FROM
    Customers cu
LEFT JOIN
    Contacts co
ON
    cu.customer_id = co.user_id
RIGHT JOIN
    Invoices i
ON
    cu.customer_id = i.user_id
GROUP BY
    invoice_id
ORDER BY
    invoice_id
