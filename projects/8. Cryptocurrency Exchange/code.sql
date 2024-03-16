-- Cryptocurrency Exchange

-- Fiddy Cent is a digital currency exchange headquartered in Neo Tokyo. They broker exchanges of Bitcoin, Bitcoin Cash, Ethereum, and Litecoin with fiat currencies in around 50 countries.

-- Help them analyze their January ledger data using SQL aggregate functions! You are given the transactions table, which contains both money-in and money-out transactions.

--  1
-- Let’s start by checking out the whole transactions table:

SELECT
  *
FROM
  transactions;

-- 2
-- The money_in column records the amount (in USD) the user bought.
-- What is the total money_in in the table?

SELECT
  SUM(money_in)
FROM
  transactions;

-- 3
-- The money_out column records the amount (in USD) the user sold.
-- What is the total money_out in the table?

SELECT
  SUM(money_out)
FROM
  transactions;

-- 4
-- It was reported that Bitcoin dominates Fiddy Cent’s exchange. Let’s see if it is true within these dates by answering two questions:
-- How many money_in transactions are in this table?
-- How many money_in transactions are in this table where ‘BIT’ is the currency?

SELECT
  COUNT(money_in)
FROM
  transactions;

SELECT
  COUNT(money_in)
FROM
  transactions
WHERE
  currency = 'BIT';

-- 5
-- What was the largest transaction in this whole table?

SELECT MAX(money_in)
FROM transactions;

SELECT MAX(money_out)
FROM transactions;

-- 6
-- What is the average money_in in the table for the currency Ethereum (‘ETH’)?

SELECT
  AVG(money_in)
FROM
  transactions
WHERE
  currency = 'ETH';

-- 7
-- Let’s build a ledger for the different dates.
-- Select date, average money_in, and average money_out from the table.
-- And group everything by date.

SELECT
  date,
  AVG(money_in),
  AVG(money_out)
FROM
  transactions
GROUP BY
  1;

-- 8
-- To make the previous query easier to read, round the averages to 2 decimal places.
-- Give the column aliases using AS for readability.

SELECT
  date,
  ROUND(AVG(money_in), 2) 'Average Buy',
  ROUND(AVG(money_out), 2) 'Average Sell'
FROM
  transactions
GROUP BY
  1;
