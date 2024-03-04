CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
        # Write your MySQL query statement below.
        SELECT
            COUNT(DISTINCT user_id)
        FROM
            Purchases
        WHERE
            (time_stamp BETWEEN CONVERT(startDate, DATETIME) AND CONVERT(endDate, DATETIME)) AND
            amount >= minAmount
  );
END
