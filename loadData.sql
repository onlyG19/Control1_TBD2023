
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
VALUES (1, 'Diane', 'Oxtarby', 'Female', 5),
       (2, 'Hazlett', 'Arntzen', 'Male', 12),
       (3, 'Van', 'Ravenshear', 'Male', 6),
       (4, 'Matthus', 'Flye', 'Male', 9),
       (5, 'Honey', 'Dawidowitsch', 'Female', 4),
       (6, 'Rheba', 'Burke', 'Female', 9),
       (7, 'Brigid', 'Edginton', 'Female', 7),
       (8, 'Hanson', 'Yaneev', 'Male', 5),
       (9, 'Pia', 'Figgs', 'Female', 7),
       (10, 'Alexa', 'Biset', 'Female', 8);

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

INSERT INTO rol (id_rol, nombre_rol) VALUES (1, 'Profesor');
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
       (11, 1),
       (12, 1),
       (13, 1),
       (14, 1),
       (15, 1);

INSERT INTO franja_horaria (id_franja, hora_inicio, hora_fin)
VALUES (1, '2023-09-12 08:00:00-03:00', '2023-09-12 09:00:00-03:00'),
       (2, '2023-09-12 09:00:00-03:00', '2023-09-12 10:00:00-03:00'),
       (3, '2023-09-12 10:00:00-03:00', '2023-09-12 11:00:00-03:00'),
       (4, '2023-09-12 11:00:00-03:00', '2023-09-12 12:00:00-03:00'),
       (5, '2023-09-12 13:00:00-03:00', '2023-09-12 14:00:00-03:00'),
       (6, '2023-09-12 14:00:00-03:00', '2023-09-12 15:00:00-03:00'),
       (7, '2023-09-12 16:00:00-03:00', '2023-09-12 17:00:00-03:00');


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
       (10, 4),
       (5, 6);

INSERT INTO franja_alumno (id_franja, id_alumno, asistencia)
VALUES (1, 1, true),
       (2, 2, true),
       (3, 3, false),
       (4, 4, true),
       (5, 5, true),
       (6, 6, false),
       (7, 7, false);
