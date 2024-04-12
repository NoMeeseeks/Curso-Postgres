SELECT
    *
FROM
    COUNTRY
ORDER BY
    CODE ASC;

--ALTERAMOS LA TABLA PARA AGREGAR LA LLAVE PRIMARIA
ALTER TABLE COUNTRY
 --el primer parentesis el de campo de la llave primaria
ADD PRIMARY KEY (CODE);

--ELIMINAMOS UN DATO DUPICLADO
DELETE FROM COUNTRY
WHERE
    CODE = 'NLD'
    AND CODE2 = 'NA';

--CREACION DEL CHECK EN ESTE CASO ES PARA QUE LA SURFACE AREA NO SEA NEGATIVO
--chekc es un constrain especial para verificar un campo o campos
ALTER TABLE COUNTRY ADD CHECK (SURFACEAREA >= 0);

SELECT
    *
FROM
    COUNTRY
    SELECT
        DISTINCT CONTINENT
    FROM
        COUNTRY
 --hacer un varios check y el caso del final es cuando la base necesita un casteo del tipo de dato
        ALTER TABLE COUNTRY ADD CHECK( (CONTINENT = 'Asia' )
        OR (CONTINENT = 'South America' )
        OR (CONTINENT = 'North America' )
        OR (CONTINENT = 'Oceania' )
        OR (CONTINENT = 'Antarctica' )
        OR (CONTINENT = 'Africa' )
        OR (CONTINENT = 'Europe'::TEXT ) );

SELECT
    *
FROM
    COUNTRY
WHERE
    CODE = 'CRI';

--eliminar un check
ALTER TABLE COUNTRY DROP CONSTRAINT "country_continent_check";

ALTER TABLE COUNTRY ADD CHECK( (CONTINENT = 'Asia' )
OR (CONTINENT = 'South America' )
OR (CONTINENT = 'North America' )
OR (CONTINENT = 'Oceania' )
OR (CONTINENT = 'Antarctica' )
OR (CONTINENT = 'Africa' )
OR (CONTINENT = 'Europe'::TEXT )
OR (CONTINENT = 'Central America'::TEXT ) );

--indices en base de datos
--son importantes para mejorar la consulta de la base de datos

SELECT
    *
FROM
    COUNTRY
WHERE
    CONTINENT = 'Africa';

--crear un indice unico primero el nombre de ahi la tabla y por ultimo la columna
CREATE UNIQUE INDEX "unique_country_name" ON COUNTRY (NAME);

--creamos un indice no unico
CREATE INDEX "country_continent" ON COUNTRY (CONTINENT);

SELECT
    *
FROM
    CITY;

ALTER TABLE CITY ADD PRIMARY KEY (ID);

ALTER TABLE CITY ADD CHECK (POPULATION >= 0);

SELECT
    *
FROM
    COUNTRYLANGUAGE
WHERE
    PERCENTAGE >100;

ALTER TABLE COUNTRYLANGUAGE ADD PRIMARY KEY (COUNTRYCODE, LANGUAGE);

INSERT INTO COUNTRYLANGUAGE VALUES (
    'ALB',
    NULL,
    TRUE,
    1
);

DELETE FROM COUNTRYLANGUAGE
WHERE
    COUNTRYCODE = 'ALB'
    AND LANGUAGE = '';

ALTER TABLE COUNTRYLANGUAGE ADD CHECK ((PERCENTAGE >= 0)
AND (PERCENTAGE <=100));

ALTER TABLE COUNTRYLANGUAGE DROP CONSTRAINT COUNTRYLANGUAGE_PERCENTAGE_CHECK;

--unique index problema de la vida real
SELECT
    *
FROM
    CITY;

--
CREATE UNIQUE INDEX "unique_name_countrycode_district"
    ON CITY( NAME,
    COUNTRYCODE,
    DISTRICT );

SELECT
    *
FROM
    CITY
WHERE
    NAME = 'Jinzhou'
    AND COUNTRYCODE = 'CHN'
    AND DISTRICT = 'Liaoning' CREATE INDEX "district"
    ON CITY(DISTRICT);

--creando llaves foraneas

-- creacion de llave foranea en la tabla city
-- se altera la tabla
-- se agrega el constraint y el nombre del mismo
-- se agrega la columna de la tabla city la cual va a tener la relacion
-- por ultimo se hace la referencia de donde viene esa primary key con la tabla y la columna
ALTER TABLE CITY ADD CONSTRAINT FK_COUNTRYCODE FOREIGN KEY (COUNTRYCODE) REFERENCES COUNTRY(CODE);

INSERT INTO COUNTRY VALUES(
    'AFG',
    'Afghanistan',
    'Asia',
    'Southern Asia',
    652860,
    1919,
    40000000,
    62,
    69000000,
    NULL,
    'Afghanistan',
    'Totalitarian',
    NULL,
    NULL,
    'AF'
);

SELECT
    *
FROM
    CITY;

-- creacion de llave foranea en la tabla ejemplo
-- se altera la tabla con alter table
-- se agrega el constraint add constraint y el nombre del mismo
-- se agrega foreign key y la columna de la tabla ejemplo  la cual va a tener la relacion
-- por ultimo se hace la referencia references de donde viene esa primary key con la tabla y la columna
ALTER TABLE COUNTRYLANGUAGE ADD CONSTRAINT FK_COUNTRYCODE FOREIGN KEY (COUNTRYCODE) REFERENCES COUNTRY (CODE);

SELECT
    *
FROM
    COUNTRYLANGUAGE;

--eliminacion en cascada y actualizacion
--On delete cascade
---Al momento de eliminar en la tabla principal y poner delte cascade en las tablas donde recae la llave se elimina todo
--On update cascade