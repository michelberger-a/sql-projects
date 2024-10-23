/**
This is a rather simple query using student mental health data

Data comes from here: https://www.datacamp.com/projects/1593
A csv copy has been attached in the folders

Goal: Analyze the data to see how length of stay impacts the average mental health diagnostic scores of international students
Specifics:
- 9 rows and 5 columns in output
- 5 cols: stay, count_int, average_phq, average_scs, and average_as, in that order.
- contain the average of the todep (PHQ-9 test), tosc (SCS test), and toas (ASISS test) columns for each length of stay, rounded to two decimal places.
- count_int column should be the number of international students for each length of stay.
- Sort the results by the length of stay in descending order.
**/

-- overall view of the data
SELECT *
FROM students
LIMIT 10;

-- check the levels of inter_dom variable
SELECT DISTINCT inter_dom
FROM students;

-- assess the data according to desired outputs
SELECT stay
, COUNT(*) AS count_int
, ROUND(AVG(todep),2) AS average_phq
, ROUND(AVG(tosc),2) AS average_scs
, ROUND(AVG(toas),2) AS average_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC
LIMIT 9;