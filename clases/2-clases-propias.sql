SELECT
    *
FROM
    USERS;

--con operador between
SELECT
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS > 4600
    AND U.FOLLOWERS <4900
ORDER BY
    U.FOLLOWERS ASC
    SELECT
        U.FOLLOWERS
    FROM
        USERS U
    WHERE
        U.FOLLOWERS BETWEEN 4600 AND 4900
    ORDER BY
        U.FOLLOWERS DESC;

SELECT
    COUNT(*)                AS TOTAL_DE_USUARIOS,
    MIN(FOLLOWERS)          AS MINIMO_DE_SEGUIDORES,
    MAX(FOLLOWERS)          AS MAXIMO_DE_SEGUIDORES,
    AVG(FOLLOWERS)          AS AVG_DE_SEGUIDORES,
    ROUND(AVG(FOLLOWERS))   AS AVG_DE_SEGUIDORES_REDON,
    SUM(FOLLOWERS)/COUNT(*) AS AVG_MANUAL
FROM
    USERS;

SELECT
    U.FIRST_NAME,
    U.LAST_CONNECTION,
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS = 4
    OR U.FOLLOWERS = 4999;

SELECT
    COUNT(*),
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS = 4
    OR U.FOLLOWERS = 4999
GROUP BY
    U.FOLLOWERS;

SELECT
    COUNT(*),
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS BETWEEN 4 AND 4999
GROUP BY
    U.FOLLOWERS;

SELECT
    COUNT(*),
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS BETWEEN 4 AND 4999
GROUP BY
    U.FOLLOWERS
ORDER BY
    U.FOLLOWERS DESC;

SELECT
    COUNT(*),
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS BETWEEN 4 AND 4999
GROUP BY
    U.FOLLOWERS
ORDER BY
    U.FOLLOWERS ASC;

-- DDL
-- create, alter, drop, truncate

-- DML
-- insert, delete, update

-- TCL
-- commit, rollback

-- DQL
-- selects

--funciones agregadas
-- count es contar
-- sum sumamos algo
-- max valor maximo
-- min valor minimo
-- group by es cuando agrupamos
-- order by para ordenas ascendente o desendente
-- having

-- filtrando data
-- like para buscar que cumpla cierta condicion
-- in si se encuentra en unas opciones
-- is null si una columna es nula
-- is not null que no sea nula
-- where condicion principal
-- and para agregar varias condiciones
-- or para qeu se cumpla una condicion y otra
-- between se usa cuando queremos evaluar una columna dentro de un rango
-- distinc es para seleccionar los campos que son distintos
-- limit cuantos valores de retorno quiero
-- offset cuantos registros quiero saltarme

SELECT
    COUNT(*),
    COUNTRY
FROM
    USERS
GROUP BY
    COUNTRY
HAVING
    COUNT(*)> 6
ORDER BY
    COUNT(*) DESC;

SELECT
    COUNT(*)
FROM
    USERS;

-- el distinct no es tan eficiente con texto ya que los espacios afecta
SELECT
    DISTINCT(COUNTRY)
FROM
    USERS;

SELECT
    COUNT(*),
    SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1) AS DOMAIN
FROM
    USERS
GROUP BY
    SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1)
HAVING
    COUNT(*) > 1
ORDER BY
    COUNT(*) DESC;

-- subquerys
SELECT
    NAME,
    DOMAIN
FROM
    (
        SELECT
            COUNT(*),
            SUBSTRING(EMAIL,
            POSITION('@' IN EMAIL)+1) AS DOMAIN,
            'Xavier' AS NAME,
            21 AS EDAD
        FROM
            USERS
        GROUP BY
            SUBSTRING(EMAIL, POSITION('@' IN EMAIL)+1)
        HAVING
            COUNT(*) > 1
        ORDER BY
            COUNT(*) DESC
    ) AS TABLA