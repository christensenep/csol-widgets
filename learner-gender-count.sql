// prints a count of learners grouped by gender
// run on the csol database

SELECT
	CASE
		WHEN gender = 'male' THEN 'Male'
		WHEN gender = 'female' THEN 'Female'
		ELSE 'Not Specified'
	END AS gender_readable,
	COUNT(*) as count
	FROM learners
	GROUP BY gender
	ORDER BY FIELD(gender_readable, 'Female', 'Male', 'Not Specified');