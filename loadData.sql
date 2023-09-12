
-- Inserción de comunas de la Región Metropolitana (continuación)
--
INSERT INTO comuna (id_comuna, nombre)
VALUES (1, 'Maipú'),
       (2, 'Ñuñoa'),
       (3, 'La Florida'),
       (4, 'Puente Alto'),
       (5, 'Peñalolén'),
       (6, 'La Reina'),
       (7, 'San Bernardo'),
       (8, 'Quilicura'),
       (9, 'Pudahuel'),
       (10, 'Independencia');

INSERT INTO apoderado (id_apoderado, nombre, apellido, sexo, id_comuna)
VALUES (1, 'Diane', 'Oxtarby', 'F', 5),
       (2, 'Hazlett', 'Arntzen', 'M', 10),
       (3, 'Van', 'Ravenshear', 'M', 6),
       (4, 'Matthus', 'Flye', 'M', 9),
       (5, 'Honey', 'Dawidowitsch', 'F', 4),
       (6, 'Rheba', 'Burke', 'F', 9),
       (7, 'Brigid', 'Edginton', 'F', 7),
       (8, 'Hanson', 'Yaneev', 'M', 5),
       (9, 'Pia', 'Figgs', 'F', 7),
       (10, 'Alexa', 'Biset', 'F', 8);

INSERT INTO curso (id_curso, nivel, letra)
VALUES (1, 4, 'B'),
       (2, 5, 'D'),
       (3, 5, 'A'),
       (4, 2, 'B'),
       (5, 1, 'C'),
       (6, 6, 'D'),
       (7, 5, 'F'),
       (8, 7, 'B'),
       (9, 5, 'C'),
       (10, 4, 'F');

INSERT INTO rol (id_rol, nombre_rol) VALUES
 (1, 'Profesor'),
 (2, 'Conserje'),
 (3, 'Inspector'),
 (4, 'Rector'),
 (5, 'Secretaria');

INSERT INTO franja_horaria (id_franja, hora_inicio, hora_fin, dia)
VALUES 
    (1, '08:00:00', '09:00:00', '2023-09-12'),
    (2, '09:00:00', '10:00:00', '2023-09-12'),
    (3, '10:00:00', '11:00:00', '2023-09-12'),
    (4, '11:00:00', '12:00:00', '2023-09-12'),
    (5, '13:00:00', '14:00:00', '2023-09-12'),
    (6, '14:00:00', '15:00:00', '2023-09-12'),
    (7, '16:00:00', '17:00:00', '2023-09-12');


INSERT INTO colegio (id_colegio, nombre, id_comuna)
VALUES (1, 'Colegio San Ignacio', 1),
       (2, 'Colegio Santa Úrsula', 2),
       (3, 'Colegio San Francisco', 3),
       (4, 'Colegio Los Andes', 4),
       (5, 'Colegio Santa María', 1);

INSERT INTO empleado (id_empleado, sueldo, id_comuna, id_colegio)
VALUES (1, 550000, 1, 1),
       (2, 625000, 2, 2),
       (3, 720000, 3, 3),
       (4, 575000, 4, 4),
       (5, 850000, 5, 5),
       (6, 900000, 2, 1),
       (7, 730000, 7, 2),
       (8, 610000, 8, 3),
       (9, 700000, 3, 4),
       (10, 800000, 2, 5),
       (11, 575000, 1, 1),
       (12, 920000, 2, 2),
       (13, 680000, 3, 3),
       (14, 750000, 4, 4),
       (15, 820000, 5, 5);
	   
INSERT INTO empleado_rol (id_empleado, id_rol)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (7, 1),
       (8, 1),
       (9, 1),
       (10, 1),
       (11, 2),
       (12, 3),
       (13, 4),
       (14, 5),
       (15, 2);

INSERT INTO alumno (id_alumno, nombre, apellido, id_colegio, id_comuna)
VALUES (1, 'Mateo', 'Muñoz', 1, 7),
       (2, 'Agustín', 'Rojas', 4, 2),
       (3, 'Santiago', 'Díaz', 2, 6),
       (4, 'Tomás', 'Pérez', 3, 10),
       (5, 'Benjamín', 'Soto', 5, 3),
       (6, 'Lucas', 'Contreras', 1, 5),
       (7, 'Gaspar', 'Silva', 2, 9),
       (8, 'Alonso', 'Torres', 4, 8),
       (9, 'Vicente', 'Muñoz', 5, 1),
       (10, 'Maximiliano', 'Rojas', 3, 4);


INSERT INTO profesor (id_profesor, nombre, apellido, id_empleado)
VALUES (1, 'Joe', 'Doe', 1),
(2, 'Santino', 'Renedo', 2),
(3, 'Alejandra', 'Arostegui', 3),
(4, 'Micaela', 'Blanque', 4),
(5, 'Maria', 'Figuereo', 5),
(6, 'Constanza', 'Ugartemendia', 6),
(7, 'Emiliano', 'Shi', 7),
(8, 'Concepción', 'Tabares', 8),
(9, 'Aarón', 'Masa', 9),
(10, 'Juana', 'Lambert', 10);

INSERT INTO curso_alumno (id_alumno, id_curso, semestre)
VALUES (1, 1, 'primer'),
       (2, 2, 'primer'),
       (3, 3, 'primer'),
       (4, 4, 'primer'),
       (5, 5, 'primer'),
       (6, 6, 'primer'),
       (7, 7, 'primer'),
       (8, 8, 'primer'),
       (9, 9, 'primer'),
       (10, 10, 'primer');

INSERT INTO alumno_apoderado (id_alumno, id_apoderado, es_padreBiologico)
VALUES (1, 9, false),
       (5, 7, true),
       (4, 9, false),
       (9, 6, false),
       (10, 5, false),
       (10, 10, false),
       (1, 2, true),
       (4, 6, true),
       (7, 1, true),
       (9, 4, true);

INSERT INTO profesor_curso (id_profesor, id_curso, profesor_jefe, id_profesor_curso)
VALUES (1, 1, true,1),
       (2, 2, false, 2),
       (3, 3, false, 3),
       (4, 4, true, 4),
       (5, 5, true, 5),
       (6, 6, false, 6),
       (7, 7, false, 7),
       (8, 8, true, 8),
       (9, 9, true, 9),
       (10, 10, false, 10);

INSERT INTO profesor_curso_franja (id_profesor_curso, id_franja)
VALUES (4, 5),
       (8, 5),
       (10, 4),
       (7, 1),
       (7, 7),
       (1, 6),
       (10, 5),
       (2, 5),
       (5, 6);

INSERT INTO franja_alumno (id_franja, id_alumno, asistencia)
VALUES (1, 1, true),
       (2, 2, true),
       (3, 3, false),
       (4, 4, true),
       (5, 5, true),
       (6, 6, false),
       (7, 7, false);

INSERT INTO Empleado_Administrativo (id_administrativo, nombre, apellido, id_empleado)
VALUES
    (1, 'Juan', 'González', 11),
    (2, 'María', 'Martínez', 12),
    (3, 'Pedro', 'López', 13),
    (4, 'Carolina', 'Fernández', 14),
    (5, 'Luis', 'Pérez', 15);