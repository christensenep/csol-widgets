// prints a count of learners grouped by zip code
// run on the csol database

SELECT
	CASE
		WHEN zipCode IS NULL OR zipCode = '' THEN 'Not Specified'
		ELSE zipCode
	END AS ZIP,
	COUNT(*) as count
	FROM learners
	GROUP BY ZIP
	ORDER BY FIELD(ZIP, 'Not Specified') ASC, ZIP;