# prints a count of badge claims by underage learners grouped by status
# run on the csol database

SELECT
	CASE
		WHEN c.state = 'approved' THEN 'Approved'
		WHEN c.state = 'waiting' THEN 'Awaiting guardian approval'
		WHEN c.state = 'denied' THEN 'Denied by guardian'
		ELSE 'Unknown'
	END AS state,
	COUNT(*) as count
	FROM claims c
	INNER JOIN learners l ON c.LearnerId = l.id
	WHERE l.underage = 1
	GROUP BY state
	ORDER BY FIELD(state, 'Unknown') ASC, state;