/**
This is an intermediate question to look at motorcycle sales parts

Data could not be extracted, but this is the link: https://projects.datacamp.com/projects/1574

Goal: How much Wholesale net revenue each product_line generated per month per warehouse 
Specifics:
- contain the following:
- product_line,
- month: displayed as 'June', 'July', and 'August',
- warehouse, 
- net_revenue: the sum of total minus the sum of payment_fee
- sorted by product_line and month, then net_revenue DESC
**/



-- just checking to make sure the years are distinct
SELECT DISTINCT extract(year from date) AS year
FROM sales;

-- analyze the question at hand
SELECT product_line, 
	   CASE WHEN extract(month FROM date) = 6 THEN 'June'
		WHEN extract(month FROM date) = 7 THEN 'July'
		WHEN extract(month FROM date) = 8 THEN 'August' 
	   END AS month,
	   warehouse, 
	   SUM(total) - SUM(payment_fee) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, warehouse, month 
ORDER BY product_line, month, net_revenue DESC;