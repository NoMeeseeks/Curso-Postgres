SELECT
    ID,
    UPPER(NAME)                               AS UPPER_NOMBRE, -- mayusculas
    LOWER(NAME)                               AS LOWER_NOMBRE, -- minusculas
    LENGTH(NAME)                              AS LENGTH_LONGITUD, -- cantidad de caracteres
    12 AS CONSTANTE, -- un valor constante
    CONCAT(ID, '-', NAME)                     AS CONCAT, --concatenacion con concat
    ID
    ||'-'
    ||NAME
    ||'-'                                     AS CONCATENACION, -- concatenacion por barras dobles
    SUBSTRING(NAME, 0, POSITION(' ' IN NAME)) AS PRIMER, -- me permite generar un substring de un string con un inicio hasta un final
    SUBSTRING(NAME, POSITION(' ' IN NAME)+1)  AS SEGUNDO, --position me permite saber la poscicion de un caracter
    POSITION(' ' IN NAME), -- me da la poscicion de la letra entre comillas en el campo name
    TRIM(NAME) -- quita los espacios
FROM
    USERS LIMIT 50;

SELECT
    *
FROM
    USERS;

SELECT
    SUBSTRING(NAME, 0, POSITION(' ' IN NAME)), -- me permite generar un substring de un string con un inicio hasta un final
    SUBSTRING(NAME, POSITION(' ' IN NAME)+1) --position me permite saber la poscicion de un caracter
FROM
    USERS UPDATE USERS SET FIRST_NAME = SUBSTRING(NAME,
    0,
    POSITION(' ' IN NAME)),
    LAST_NAME = SUBSTRING(NAME,
    POSITION(' ' IN NAME)+1);