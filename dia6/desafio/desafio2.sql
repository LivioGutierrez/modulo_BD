-- ● Paso 1 ingresar a postgres
psql -U postgres

-- ● Paso 2 crear una base de datos con mi nombre y unos digitos
create database desafio2_livio_gutierrez_002;

-- ● Paso 3 entrar a la base de datos
\c desafio2_livio_gutierrez_002;

-- ● Paso 4 ingresar los datos
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- ● Paso 5 verificar los datos

SELECT * FROM INSCRITOS;


-- ● Paso 6 completar las siguientes preguntas

-- ¿Cuántos registros hay?

SELECT COUNT(cantidad) as registros FROM INSCRITOS; -- CORRECTO

-- ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) as total FROM INSCRITOS;

-- ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT cantidad, fecha FROM INSCRITOS ORDER BY fecha ASC LIMIT 3;

-- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY fecha ASC;

-- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM INSCRITOS GROUP BY fecha ORDER BY inscritos_por_dia DESC LIMIT 1;

