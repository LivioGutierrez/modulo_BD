-- Lo primero a realizar es concetarse a la base de datos


--Paso 1: Accedemos al cliente de postgresql via el terminal.
--> comando para conectarse psql -U postgres, (postgres es el usuario) luego añades la contraseña

-- Paso 2: Crea una base de datos llamada prueba1.
CREATE DATABASE prueba1;

--Paso 3: Lista las bases de datos creadas.(comando de postgres va sin ";" ")
\l

--Paso 4: Conéctate a la base de datos. (comando de postgres va sin ";" ")
\c prueba1

--Paso5: salir de la base de datos
\q

-- LISTAR LAS TABLAS DE UNA BADE DE DATO
\d

-- DESCRIBE UNA TABLA
\d clientes
\d+ clientes

CREATE DATABASE "Livio"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- FUNCIONES DE AGREGADO
-- SUMA
SELECT SUM(columna) FROM TABLA--SUMA

SELECT AVG(columna) FROM TABLA--PROMEDIO

SELECT MAX(columna) FROM TABLA--MAXIMO

SELECT MIN(columna) FROM TABLA--MINIMO

SELECT COUNT(*) FROM TABLA

--ELIMIANR TABLA
DROP TABLE nombre de la tabla

--MODIFICANDO LA TABLA
alter table nombre de la tabla