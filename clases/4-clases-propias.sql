SELECT
    DISTINCT CONTINENT
FROM
    COUNTRY
ORDER BY
    CONTINENT ASC;

CREATE TABLE CONTINENT (
    CODE SERIAL NOT NULL,
    NAME TEXT NOT NULL
);

ALTER TABLE CONTINENT ADD PRIMARY KEY (CODE);

SELECT
    *
FROM
    CONTINENT;

--se puede hacer un select dentro de un insert para agilizar los campos
INSERT INTO CONTINENT (
    NAME
)
    SELECT
        DISTINCT CONTINENT
    FROM
        COUNTRY
    ORDER BY
        CONTINENT ASC;

--pasamos una tabla a la copia de la tabla
SELECT
    *
FROM
    COUNTRYCOPY;

INSERT INTO COUNTRYCOPY
    SELECT
        *
    FROM
        COUNTRY;

SELECT
    C.NAME,
    C.CONTINENT,
    (
        SELECT
            CON.CODE
        FROM
            CONTINENT CON
        WHERE
            CON.NAME = C.CONTINENT
    )
FROM
    COUNTRY   C;

--actualizacion masiva
UPDATE COUNTRY C
SET
    CONTINENT = (
        SELECT
            CON.CODE
        FROM
            CONTINENT CON
        WHERE
            CON.NAME = C.CONTINENT
    );

SELECT
    *
FROM
    COUNTRY;

--deberia ser hasta int4 pero dio un error y nos pidio agregar el using
ALTER TABLE COUNTRY ALTER COLUMN CONTINENT TYPE INT4 USING CONTINENT::INTEGER;

--deberia ser hasta int4 pero dio un error y nos pidio agregar el using
ALTER TABLE COUNTRY ALTER COLUMN CONTINENT TYPE INT4 USING CONTINENT::INTEGER;

--hacer la relacion
ALTER TABLE COUNTRY ADD CONSTRAINT FK_CONTINENT_CODE FOREIGN KEY (CONTINENT) REFERENCES CONTINENT(CODE) SELECT * FROM COUNTRY