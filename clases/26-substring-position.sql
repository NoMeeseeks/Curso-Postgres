SELECT
	NAME,
	SUBSTRING( NAME, 0, 5 ),
	POSITION( ' ' IN NAME ),
	SUBSTRING( NAME, 0, POSITION( ' ' IN NAME ) )    AS FIRST_NAME,
	SUBSTRING( NAME, POSITION( ' ' IN NAME ) + 1 )   AS LAST_NAME,
	TRIM(SUBSTRING( NAME, POSITION( ' ' IN NAME ) )) AS TRIMMED_LAST_NAME
FROM
	USERS;