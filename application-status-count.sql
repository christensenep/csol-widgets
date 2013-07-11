# prints a count of applications grouped by state
# run on the csol database

SELECT
    CASE
		WHEN state = 'open' THEN 'Not yet submitted'
		WHEN state = 'waiting' THEN 'Awaiting guardian approval'
        WHEN state = 'denied' THEN 'Application denied by guardian'
        WHEN state = 'submitted' THEN 'Submitted'
        WHEN state = 'rejected' THEN 'Rejected'
        WHEN state = 'accepted' THEN 'Accepted'
		ELSE 'Unknown'
    END AS state,
    COUNT(*) AS count
    FROM applications
    GROUP BY state;