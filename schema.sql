CREATE TABLE profesor (
id INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
fecha_nacimiento DATE NOT NULL,
salario FLOAT NOT NULL,
  PRIMARY KEY(id)
);

INSERT INTO profesor VALUES (1, "Juan", "Perez", "1990/06/06", 55000);
INSERT INTO profesor VALUES (2, "Maria Emilia", "Paz", "1984/07/15", 72000);
INSERT INTO profesor VALUES (3, "Martin", "Correa", "1987/12/007", 63000);
INSERT INTO profesor VALUES (4, "Lucia", "Diaz", "1991/02/24", 45000);
INSERT INTO profesor VALUES (5, "Raul", "Martinez", "1980/10/15", 85000);
INSERT INTO profesor VALUES (6, "Mabel", "Rios", "1982/06/12", 83000);

CREATE TABLE curso (
 codigo INT NOT NULL,
 nombre VARCHAR(45) NOT NULL,
 descripcion VARCHAR(45),
 cupo INT NOT NULL DEFAULT 20,
 turno VARCHAR(45) NOT NULL,
 PROFESOR_ID int NOT NULL,
 PRIMARY KEY(codigo),
 foreign key (PROFESOR_ID) references profesor(id)
);

INSERT INTO curso VALUES (101, "Algoritmos", "Algoritmos y Estructura de Datos", 20, "Mañana", 1);
INSERT INTO curso VALUES (102, "Matematica Discreta", NULL, 20, "Tarde", 2);
INSERT INTO curso VALUES (103, "Programacion Java", "POO en Java", 35, "Noche", 4);
INSERT INTO curso VALUES (104, "Programacion Web", NULL, 35, "Noche", 5);
INSERT INTO curso VALUES (105, "Programacion C#", ".NET, Visual Studio 2019", 30, "Noche", 6);

SELECT profesor.Apellido , curso.Nombre, curso.turno FROM profesor LEFT JOIN curso ON profesor.id = curso.PROFESOR_id;

select p.nombre, p.apellido, p.fecha_nacimiento from profesor p order by p.fecha_nacimiento asc;
select * from profesor where salario >= 65000;
select * from profesor where fecha_nacimiento between "1980/1/1" and "1989/12/31";
select * from profesor limit 5;
select * from profesor where apellido like 'P%';
select * from profesor where (fecha_nacimiento between "1980/1/1" and "1989/12/31") and (salario > 80000);

#Ejercicios Modulo 2
CREATE TABLE estudiante (
legajo INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
fecha_nacimiento DATE NOT NULL,
carrera VARCHAR(45) NOT NULL,
  PRIMARY KEY(legajo)
);

INSERT INTO estudiante VALUES(36485, "Romina", "Nieva", "1999-11-26", "Mecanica");
INSERT INTO estudiante VALUES(39685, "Brenda", "Medrano", "2000-09-25", "Sistemas");
INSERT INTO estudiante VALUES(41258, "Ramiro", "Rios", "1994-12-06", "Sistemas");
INSERT INTO estudiante VALUES(43651, "Cristian", "Gomez", "1995-03-19", "Mecanica");
INSERT INTO estudiante VALUES(47521, "Maria", "Velazquez", "1998-01-02", "Sistemas");
INSERT INTO estudiante VALUES(47961, "Alexis", "Reinoso", "1994-12-17", "Sistemas");
INSERT INTO estudiante VALUES(48952, "Gabriel", "Morales", "1996-10-03", "Sistemas");
INSERT INTO estudiante VALUES(51200, "Lourdes", "Martinez", "2001-12-13", "Sistemas");

#1. Escriba una consulta para saber cuantos estudiantes son de la carrera Mecanica
SELECT COUNT(*) FROM estudiante WHERE carrera = "Mecanica";

#Escriba una consulta para saber, de la tabla PROFESOR, el salario mínimo de los profesores nacidos en la década del 80.
SELECT MIN(salario) from profesor where (fecha_nacimiento between "1980/1/1" and "1989/12/31");

#Tablas pais-pasajero-pago
CREATE TABLE pais (
idpais INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY(idpais)
);

INSERT INTO pais VALUES(01, "Argentina");
INSERT INTO pais VALUES(02, "Brasil");
INSERT INTO pais VALUES(03, "Uruguay");
INSERT INTO pais VALUES(04, "Mexico");
INSERT INTO pais VALUES(05, "Colombia");
INSERT INTO pais VALUES(06, "Venezuela");

CREATE TABLE pasajero (
idpasajero INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
apaterno VARCHAR(45) NOT NULL,
amaterno VARCHAR(45) NOT NULL,
tipo_documento VARCHAR(10) NOT NULL,
nro_documento INT NOT NULL,
fecha_nacimiento DATE NOT NULL,
idpais INT NOT NULL,
telefono INT NOT NULL,
email VARCHAR(45) NOT NULL,
clave VARCHAR(45) NOT NULL,
  PRIMARY KEY(idpasajero),
  FOREIGN KEY (idpais) REFERENCES pais(idpais)
);

INSERT INTO pasajero VALUES(101, "Juan", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 01, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(102, "Jose", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 02, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(103, "Pedro", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 01, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(104, "Pepe", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 03, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(105, "Luis", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 01, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(106, "Julio", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 04, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(107, "Alberto", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 03, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(108, "Daniel", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 05, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(109, "Juan", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 01, 123456789, "email@email.com", "1234");
INSERT INTO pasajero VALUES(110, "Julian", "Perez", "Rodriguez", "DNI", 33333333, "1999-01-01", 02, 123456789, "email@email.com", "1234");

CREATE TABLE pago (
idpago INT NOT NULL,
idreserva INT NOT NULL,
fecha DATE NOT NULL,
idpasajero INT NOT NULL,
monto FLOAT NOT NULL,
tipo_comprobante VARCHAR(10) NOT NULL,
num_comprobante INT NOT NULL,
impuesto FLOAT NOT NULL,
  PRIMARY KEY(idpago),
  FOREIGN KEY (idpasajero) REFERENCES pasajero(idpasajero)
);

INSERT INTO pago VALUES(2001, 1001, "2000-10-10", 101, 33.3333, "Ticket", 123123, 0.3333);
INSERT INTO pago VALUES(2002, 1011, "2000-10-10", 105, 36.0000, "Ticket", 123123, 0.3600);
INSERT INTO pago VALUES(2003, 1111, "2000-10-10", 102, 101.70, "Ticket", 123123, 1.0170);
INSERT INTO pago VALUES(2004, 0111, "2000-10-10", 102, 150.00, "Ticket", 123123, 1.5000);

#Cantidad de pasajeros por país
SELECT p1.nombre, COUNT(*) FROM pais p1 JOIN pasajero p2 ON p2.idpais = p1.idpais GROUP BY p1.nombre;

#Suma de todos los pagos realizados
SELECT SUM(p.monto) FROM pago p;

#Suma de todos los pagos que realizó un pasajero. El monto debe aparecer con dos decimales.
SELECT p1.nombre, ROUND(SUM(p2.monto), 2) FROM pago p2 JOIN pasajero p1 ON p1.idpasajero = p2.idpasajero GROUP BY p1.nombre;

#Promedio de los pagos que realizó un pasajero.
SELECT p1.nombre, AVG(p2.monto) FROM pago p2 JOIN pasajero p1 ON p1.idpasajero = p2.idpasajero GROUP BY p1.nombre;

#Multiple Tables

CREATE TABLE inscripcion (
numero INT NOT NULL,
CURSO_codigo INT NOT NULL,
ESTUDIANTE_legajo INT NOT NULL,
fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(numero),
FOREIGN KEY (CURSO_codigo) REFERENCES curso(codigo),
FOREIGN KEY (ESTUDIANTE_legajo) REFERENCES estudiante(legajo)
);

INSERT INTO inscripcion VALUES(01, 101, 47521, DEFAULT);
INSERT INTO inscripcion VALUES(02, 101, 41258, DEFAULT);
INSERT INTO inscripcion VALUES(03, 102, 39685, DEFAULT);
INSERT INTO inscripcion VALUES(04, 102, 43651, DEFAULT);
INSERT INTO inscripcion VALUES(05, 103, 36485, DEFAULT);

#Nombre, apellido y cursos que realiza cada estudiante
SELECT e.nombre, e.apellido, c.nombre 
FROM estudiante e 
JOIN inscripcion i 
ON i.ESTUDIANTE_legajo = e.legajo 
JOIN curso c 
ON c.codigo = i.CURSO_codigo;

#Nombre, apellido y cursos que realiza cada estudiante, ordenados por el nombre del curso
SELECT e.nombre, e.apellido, c.nombre 
FROM estudiante e 
JOIN inscripcion i 
ON i.ESTUDIANTE_legajo = e.legajo 
JOIN curso c 
ON c.codigo = i.CURSO_codigo
ORDER BY c.nombre;

#Nombre, apellido y cursos que dicta cada profesor
SELECT p.nombre, p.apellido, c.nombre 
FROM profesor p 
JOIN curso c 
ON c.PROFESOR_ID = p.id;

#Nombre, apellido y cursos que dicta cada profesor, ordenados por el nombre del curso
SELECT p.nombre, p.apellido, c.nombre 
FROM profesor p 
JOIN curso c 
ON c.PROFESOR_ID = p.id
ORDER BY c.nombre;

#Cupo disponible para cada curso (Si el cupo es de 35 estudiantes y hay 5 inscriptos, el cupo disponible será 30)- COUNT(e.legajo)
SELECT c.nombre AS Curso, (c.cupo - COUNT(i.CURSO_codigo)) AS 'Cupo Disponible' 
FROM curso c JOIN inscripcion i ON c.codigo = i.CURSO_codigo
GROUP BY i.CURSO_codigo;

#Cursos cuyo cupo disponible sea menor a 10
SELECT * FROM curso c WHERE c.cupo < 10;

#Indices

#Crear una tabla persona sin primary key y solamente con dos campos: id y nombre

CREATE TABLE indices (
id INT NOT NULL,
nombre VARCHAR(45) NOT NULL
);

#Inserte datos siguiendo un orden no secuencial para el id.

INSERT INTO indices VALUES(12, "Juan");
INSERT INTO indices VALUES(69, "Jose");
INSERT INTO indices VALUES(65, "Pedro");
INSERT INTO indices VALUES(91, "Pablo");
INSERT INTO indices VALUES(33, "Luis");

#Consulte los datos para visualizar el orden de registros.

SELECT * FROM alkemy.indices;

#Agregue una clave primaria para el campo id.

ALTER TABLE indices ADD PRIMARY KEY (id);

#Consulte los datos para visualizar el orden de registros.

SELECT * FROM alkemy.indices;

#Queries Anidadas

#Escriba una consulta que devuelva la cantidad de profesores que dictan más de un curso en el turno Noche.
SELECT COUNT(c.PROFESOR_ID) AS 'Cant Profesores'
FROM curso c 
JOIN profesor p
ON p.id = c.PROFESOR_ID 
WHERE c.turno = "Noche"
GROUP BY c.PROFESOR_ID
HAVING COUNT(c.PROFESOR_ID) > 0;

#Escriba una consulta para obtener la información de todos los estudiantes que no realizan el curso con código 105
SELECT * FROM estudiante e 
JOIN inscripcion i 
ON e.legajo = i.ESTUDIANTE_legajo
JOIN curso c
ON c.codigo = i.CURSO_codigo
WHERE i.CURSO_codigo != 105;


#EJERCITACION FINAL

#Escriba una consulta que devuelva el legajo y la cantidad de cursos que realiza cada estudiante.
SELECT e.legajo AS Legajo, COUNT(i.CURSO_codigo) AS 'Cant Cursos'
FROM estudiante e JOIN inscripcion i ON e.legajo = i.ESTUDIANTE_legajo
GROUP BY i.CURSO_codigo;

#Escriba una consulta que devuelva el legajo y la cantidad de cursos de los estudiantes que realizan más de un curso.
SELECT e.legajo AS Legajo, COUNT(i.CURSO_codigo) AS 'Cant Cursos'
FROM estudiante e JOIN inscripcion i ON e.legajo = i.ESTUDIANTE_legajo
GROUP BY i.CURSO_codigo
HAVING COUNT(i.CURSO_codigo) > 1;

#Escriba una consulta que devuelva la información de los estudiantes que no realizan ningún curso.
SELECT * FROM estudiante e 
LEFT JOIN inscripcion i 
ON e.legajo = i.ESTUDIANTE_legajo
LEFT JOIN curso c
ON c.codigo = i.CURSO_codigo
GROUP BY e.legajo
HAVING COUNT(c.codigo) < 1;

#Escriba para cada tabla, los index (incluyendo su tipo) que tiene cada una.
#Tabla CURSO: codigo (indice clousterizado), PROFESOR_ID (indice no clousterizado)
#Tabla Profesor: id (indice clousterizado)
#Tabla Estudiante: legajo (indice clousterizado)
#Tabla Inscripcion: numero (indice clousterizado), CURSO_codigo (indice no clousterizado), ESTUDIANTE_legajo (indice no clousterizado)

#Liste toda la información sobre los estudiantes que realizan cursos con los profesores de apellido “Pérez” y “Paz”.
SELECT * FROM estudiante e
JOIN inscripcion i
ON e.legajo = i.ESTUDIANTE_legajo
JOIN curso c
ON c.codigo = i.CURSO_codigo
JOIN profesor p
ON c.PROFESOR_ID = p.id
WHERE p.apellido = "Perez"
OR p.apellido = "Paz";
