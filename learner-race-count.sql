# prints a count of learners grouped by race
# run on the csol database

SELECT
	CASE
		WHEN raceEthnicity IS NULL OR raceEthnicity = '' THEN 'Not Specified'
		ELSE raceEthnicity
	END AS race,
	COUNT(*) as count
	FROM learners
	GROUP BY race
	ORDER BY FIELD(race, 'Not Specified') ASC, race;