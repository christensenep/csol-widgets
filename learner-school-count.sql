# prints a count of learners grouped by school
# run on the csol database

SELECT
	CASE
		WHEN l.school IS NULL OR l.school = '' THEN 'Not Specified'
		ELSE l.school
	END AS school,
	COUNT(*) as count
	FROM learners l
	GROUP BY school
	ORDER BY FIELD(school, 'Not Specified') ASC, school;