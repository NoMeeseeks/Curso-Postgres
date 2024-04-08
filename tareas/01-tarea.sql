-- 1. Ver todos los registros
SELECT
    *
FROM
    USERS;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT
    *
FROM
    USERS
WHERE
    ID = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT
    *
FROM
    USERS
WHERE
    NAME LIKE 'Jim %';

-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT
    *
FROM
    USERS
WHERE
    NAME LIKE '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE USERS
SET
    NAME = 'Xavier Santamaria'
WHERE
    ID = 1;

-- 6. Borrar el último registro de la tabla
DELETE FROM USERS
WHERE
    ID = (
        SELECT
            MAX(ID)
        FROM
            USERS
    );