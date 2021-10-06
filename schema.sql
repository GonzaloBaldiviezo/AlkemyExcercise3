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
