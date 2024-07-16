--1#-clausa-union
--una forma de unir resultados
SELECT
    *
FROM
    CONTINENT
WHERE
    "name" LIKE '%America%'
UNION
SELECT
    *
FROM
    CONTINENT
WHERE
    CODE IN (3, 5)
ORDER BY
    "name" ASC;

--nota: tienen que tener el mismo numero de columnas y el mismo orden

--2#-clausula-where
--hacer union por where
SELECT
    C.NAME  AS PAIS,
    C2.NAME AS CONTINENTE
FROM
    COUNTRY   C,
    CONTINENT C2
WHERE
    C.CONTINENT = C2.CODE
ORDER BY
    C2.NAME;

--hacer uniones por el where puede llegar a ser volatil en casos de no especificarlo

--3#-clausula-inner-join
--solo muestra los datos que se relacionan en la tabla a y b
SELECT
    C.NAME  AS PAIS,
    C2.NAME AS CONTINENTE
FROM
    COUNTRY   C
    INNER JOIN CONTINENT C2
    ON C.CONTINENT = C2.CODE
ORDER BY
    C2.NAME;

--Alterar secuencias
ALTER SEQUENCE 'sequenceName' RESTART WITH 8;

SELECT
    *
FROM
    CONTINENT C;

INSERT INTO CONTINENT VALUES(
    9,
    'South Oceania'
)
 --
INSERT INTO CONTINENT VALUES(
    11,
    'South Oceania'
) INSERT INTO CONTINENT VALUES(
    12,
    'South Oceania'
)
 --country a  -> name , continet(codigo numerico)
 -- continent b  -> name as continentName
    SELECT
        CO.NAME AS CODIGO,
        C.CODE
    FROM
        COUNTRY CO
        FULL OUTER JOIN CONTINENT C
        ON CO.CONTINENT = C.CODE