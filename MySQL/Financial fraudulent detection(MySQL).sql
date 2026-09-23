-- data loading --
CREATE DATABASE FINANCE;
USE FINANCE;

-- calculate the total number of transactions --
SELECT COUNT(*) FROM cc_data;

-- identify the top 10 most frequent merchants --
SELECT
  merchant,
  COUNT(merchant) AS transaction_count
FROM cc_data
GROUP BY
  merchant
ORDER BY
  transaction_count DESC
LIMIT 10;

-- average transaction amount for each category of transactions --
SELECT
  category,
  ROUND(AVG(amt), 2) AS average_transaction_amount
FROM cc_data
GROUP BY
  category
ORDER BY
  average_transaction_amount DESC;

-- number of fraudulent transactions --
SELECT
  SUM(is_fraud) AS fraudulent_transactions_count,
  COUNT(*) AS total_transactions,
  
  -- Calculate percentage --
  ROUND((SUM(is_fraud) / COUNT(*)) * 100, 2) AS percentage_fraudulent
FROM cc_data;

-- join the cc_data and location_data tables to identify the latitude and longitude of each transaction --
SELECT
  t.trans_num,
  t.city,
  t.state,
  t.zip,
  l.lat,
  l.long  
FROM
  cc_data t
INNER JOIN
  location_data l ON t.cc_num = l.cc_num;

-- identify the city with the highest population --
SELECT
  city,
  city_pop
FROM
  cc_data
ORDER BY
  city_pop DESC
LIMIT 1;

-- find the earliest and latest transaction dates --
SELECT
  MIN(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS earliest_transaction_date,
  MAX(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS latest_transaction_date
FROM
  cc_data;

-- the total amount spent across all transactions --
SELECT
  ROUND(SUM(amt), 2) AS total_amount_spent
FROM
  cc_data;

-- number of transactions occurred in each category --
SELECT
  category,
  COUNT(*) AS transaction_count
FROM
  cc_data
GROUP BY
  category
ORDER BY
  transaction_count DESC;
  
-- the average transaction amount for each gender --
SELECT
  gender,
  ROUND(AVG(amt), 2) AS average_transaction_amount
FROM
  cc_data
GROUP BY
  gender
ORDER BY
  average_transaction_amount DESC;
  
-- the day of the week has the highest average transaction amount --
SELECT
  DAYNAME(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS day_of_week,
  ROUND(AVG(amt), 2) AS average_transaction_amount
FROM
  cc_data
GROUP BY
  day_of_week
ORDER BY
  average_transaction_amount DESC
LIMIT 1;






  
  































