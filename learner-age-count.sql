# prints a count of learners in each of four age groups
# run on the csol database

SELECT
    CASE
        WHEN age < 13 THEN 'Under 13'
        WHEN age BETWEEN 13 AND 17 THEN '13-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
		WHEN age > 24 THEN 'Over 24'
    END AS age_range,
    COUNT(*) AS count
    FROM (SELECT TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS age FROM learners) AS derived
    GROUP BY age_range
    ORDER BY FIELD(age_range, 'Under 13', '13-17', '18-24', 'Over 24');