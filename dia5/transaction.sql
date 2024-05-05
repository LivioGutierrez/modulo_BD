-- ● Paso 1: Creamos la base de datos transacciones y nos conectamos.
create database transacciones;
\c transacciones;

-- ● Paso 2: Creamos una tabla llamada cuentas con los campos numero_cuenta y balance.
create table cuentas (
    numero_cuenta int primary key, 
    balance float check(balance >= 0.00)
);

-- ● Paso 3: Insertamos dos registros a la tabla.
insert into cuentas (numero_cuenta, balance) values (1, 1000);
insert into cuentas (numero_cuenta, balance) values (2, 1000);

SELECT * FROM cuentas;

-- ● Paso 4: Si quisiéramos hacer una transferencia de $1000 desde nuestra cuenta 1 a la cuenta 2, una forma de asegurarnos que el monto de nuestro balance disminuya en $1000 y el de la segunda cuenta aumenta en la misma cifra, podría escribirse de la siguiente manera:

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;

-- ● Paso 5: Verificamos el estado de la tabla.
SELECT * FROM cuentas;

-- ● Paso 6: Confirmamos la transacción con commit.
commit;

-- ● Paso 7: Continuemos con el ejercicio anterior y apliquemos el uso de ROLLBACK. Para ello haremos un nuevo insert a la base de datos.
insert into cuentas (numero_cuenta, balance) values (3, 1000);

-- ● Paso 8: Iniciamos una transacción para transferir 1000 de la cuenta 3 a la 1.
begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 3;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 1;

-- ● Paso 9
ROLLBACK;

-- SAVE POIN
SELECT * FROM cuentas;

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 3;

SAVEPOINT descuento3;

UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 1;

ROLLBACK TO descuento3;

UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;

commit;