SELECT
	ID,
	UPPER(NAME)                       AS UPPER_NAME,
	LOWER(NAME)                       AS LOWER_NAME,
	LENGTH(NAME)                      AS LENGTH,
	(20 * 2)                          AS CONSTANTE,
	'*'
	||ID
	||'-'
	|| NAME
	||'*'                             AS BARCODE,
	CONCAT( '*', ID, '-', NAME, '*' ),
	NAME
FROM
	USERS;