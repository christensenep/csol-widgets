# prints a count of learners grouped by school
# run on the csol database

DROP FUNCTION IF EXISTS ERIK_CAP_FIRST;

DELIMITER $$

CREATE FUNCTION ERIK_CAP_FIRST (input VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE len INT;
	DECLARE i INT;

	SET len   = CHAR_LENGTH(input);
	SET input = LOWER(input);
	SET i = 0;

	WHILE (i < len) DO
		IF (MID(input,i,1) = ' ' OR i = 0) THEN
			IF (i < len) THEN
				SET input = CONCAT(
					LEFT(input,i),
					UPPER(MID(input,i + 1,1)),
					RIGHT(input,len - i - 1)
				);
			END IF;
		END IF;
		SET i = i + 1;
	END WHILE;

	RETURN input;
END $$

DELIMITER ;

SELECT
	CASE
		WHEN l.school IS NULL OR l.school = '' THEN 'Not Specified'
		ELSE ERIK_CAP_FIRST(l.school)
	END AS school,
	COUNT(*) as count
	FROM learners l
	GROUP BY school
	ORDER BY FIELD(school, 'Not Specified') ASC, school;

DROP FUNCTION IF EXISTS ERIK_CAP_FIRST;