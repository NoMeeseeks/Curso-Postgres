-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS LANGUAGE_CODE_SEQ;

-- Table Definition
CREATE TABLE "public"."language" (
    "code" INT4 NOT NULL DEFAULT NEXTVAL('language_code_seq'::REGCLASS),
    "name" TEXT NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE COUNTRYLANGUAGE ADD COLUMN LANGUAGECODE VARCHAR(3);

-- Empezar con el select para confirmar lo que vamos a actualizar
select language ,
(select * code from language l where cl.language = l.name)
from countrylanguage cl

-- Actualizar todos los registros
insert into language (name) select distinct cl.language from countrylanguage cl order by cl.language asc

update countrylanguage cl set languagecode = (select code from language l where cl.language = l.name)

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
alter table countrylanguage alter column languagecode type int4 using languagecode::INTEGER 
-- Crear el forening key y constraints de no nulo el language_code
alter table countrylanguage add constraint FK_LANGUAGE_CODE FOREIGN KEY
	(languagecode) REFERENCES language(CODE)
-- Revisar lo creado