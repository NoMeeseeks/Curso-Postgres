-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX

SELECT
    U.FIRST_NAME,
    U.LAST_NAME,
    U.LAST_CONNECTION
FROM
    USERS U
WHERE
    U.LAST_CONNECTION LIKE '221%';

-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas

SELECT
    U.FIRST_NAME,
    U.LAST_NAME,
    U.FOLLOWERS
FROM
    USERS U
WHERE
    U.FOLLOWERS > 4600;