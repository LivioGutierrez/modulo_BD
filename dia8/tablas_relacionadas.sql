-- ● Paso 1: Creamos las tablas libros y autores con el siguiente código.

CREATE TABLE autores (
    id INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE libros (
    id INT  PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autores (id)
);

-- ● Paso 2: Insertamos algunos datos en ambas tablas
INSERT INTO autores (id, nombre)
VALUES
    (1, 'Juan Pérez'),
    (2, 'María García'),
    (3, 'Pedro Rodríguez');

INSERT INTO libros (id, titulo, autor_id)
VALUES
    (1, 'El Quijote', 1),
    (2, 'La Divina Comedia', 2),
    (3, 'Hamlet', 3);

-- ● Paso 3: Consultamos los datos de ambas tablas
SELECT libros.titulo, autores.nombre
FROM libros
INNER JOIN autores
ON libros.autor_id = autores.id;

-- ● Paso 4: Comprobación de la restricción de clave foránea.
delete from autores;

