-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like
SELECT
    COUNT(*)
FROM
    USERS
WHERE
    EMAIL LIKE '%@google.com'
 -- 2. De qué países son los usuarios con cuentas de @google.com
 -- Tip: distinct
    SELECT
        DISTINCT(COUNTRY)
    FROM
        USERS
    WHERE
        EMAIL LIKE '%@google.com';

-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
SELECT
    COUNT(*),
    U.COUNTRY
FROM
    USERS U
GROUP BY
    U.COUNTRY
 -- 4. Listado de direcciones IP de todos los usuarios de Iceland
 -- Campos requeridos first_name, last_name, country, last_connection
    SELECT
        U.FIRST_NAME,
        U.LAST_NAME,
        U.COUNTRY,
        U.LAST_CONNECTION
    FROM
        USERS U
    WHERE
        U.COUNTRY = 'Iceland';

-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT
    COUNT(*)
FROM
    USERS U
WHERE
    U.COUNTRY = 'Iceland'
    AND U.LAST_CONNECTION LIKE '112.%';

-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis
SELECT
    U.FIRST_NAME,
    U.LAST_NAME,
    U.COUNTRY,
    U.LAST_CONNECTION
FROM
    USERS U
WHERE
    U.COUNTRY = 'Iceland'
    AND (U.LAST_CONNECTION LIKE '112.%'
    OR U.LAST_CONNECTION LIKE '188.%');

-- cuando no se agrupa por parentesis no respeta la condicion where

-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también
SELECT
    U.FIRST_NAME,
    U.LAST_NAME,
    U.COUNTRY,
    U.LAST_CONNECTION
FROM
    USERS U
WHERE
    U.COUNTRY = 'Iceland'
    AND (U.LAST_CONNECTION LIKE '112.%'
    OR U.LAST_CONNECTION LIKE '188.%')
ORDER BY
    U.FIRST_NAME,
    U.LAST_NAME ASC;

-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)
SELECT
    U.FIRST_NAME,
    U.LAST_NAME,
    U.COUNTRY
FROM
    USERS U
WHERE
    U.COUNTRY IN ('Mexico', 'Honduras', 'Costa Rica')
ORDER BY
    U.COUNTRY,
    U.FIRST_NAME,
    U.LAST_NAME ASC;

-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc
SELECT
    COUNT(*),
    U.COUNTRY
FROM
    USERS U
WHERE
    U.COUNTRY IN ('Mexico', 'Honduras', 'Costa Rica')
GROUP BY
    U.COUNTRY
ORDER BY
    U.COUNTRY ASC;