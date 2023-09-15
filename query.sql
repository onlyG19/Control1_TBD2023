-- Pregunta 1
-- lista de profesores con su sueldo he indicado si son o no profesores jefe y 
-- alumnos de su jefatura, si corresponde
SELECT
    P.nombre,
    P.apellido,
    E.sueldo,
    PC.profesor_jefe,
    CASE
        WHEN PC.profesor_jefe = true THEN
            ARRAY_AGG(A.nombre || ' ' || A.apellido) 
        ELSE
            ARRAY['No aplica']::varchar[]
    END AS Alumnos_Jefatura
	FROM Profesor P
	INNER JOIN Empleado E ON P.id_empleado = E.id_empleado
	LEFT JOIN Profesor_Curso PC ON P.id_profesor = PC.id_profesor
	LEFT JOIN Curso C ON PC.id_curso = C.id_curso
	LEFT JOIN Curso_Alumno CA ON C.id_curso = CA.id_curso
	LEFT JOIN Alumno A ON CA.id_alumno = A.id_alumno
	GROUP BY P.id_profesor, E.sueldo, PC.profesor_jefe
	ORDER BY PC.profesor_jefe DESC;

-- Pregunta 2 
-- lista de alumnos con más inasistencias por mes por curso el 2019
SELECT EXTRACT(YEAR FROM FH.dia), EXTRACT(MONTH FROM FH.dia) as Mes, 
 A.nombre, A.apellido, SUM(CASE WHEN asistencia = true THEN 0 ELSE 1 END) AS asistencia_a
FROM alumno A 
INNER JOIN franja_alumno FA ON FA.id_alumno = A.id_alumno
INNER JOIN franja_horaria FH ON FH.id_franja = FA.id_franja
WHERE EXTRACT(YEAR FROM FH.dia) = 2023 -- Deberia ser 2019
GROUP BY EXTRACT(YEAR FROM FH.dia),EXTRACT(MONTH FROM FH.dia), A.id_alumno
ORDER BY EXTRACT(MONTH FROM FH.dia), SUM(CASE WHEN asistencia = true THEN 0 ELSE 1 END) DESC


--Pregunta 3 
-- lista de empleados identificando su rol, sueldo y comuna de residencia, debe esta ordenada por comuna y sueldo
SELECT P.nombre, P.apellido, R.nombre_rol, E.sueldo as sueldo, C.nombre as comuna
FROM profesor P
INNER JOIN empleado E ON E.id_empleado = P.id_empleado
INNER JOIN empleado_rol ER ON E.id_empleado = ER.id_empleado
INNER JOIN rol R ON R.id_rol = ER.id_rol
INNER JOIN comuna C ON C.id_comuna = E.id_comuna
UNION
SELECT EA.nombre, EA.apellido, R.nombre_rol, E.sueldo as sueldo, C.nombre as comuna
FROM empleado_administrativo EA
INNER JOIN empleado E ON E.id_empleado = EA.id_empleado
INNER JOIN empleado_rol ER ON E.id_empleado = ER.id_empleado
INNER JOIN rol R ON R.id_rol = ER.id_rol
INNER JOIN comuna C ON C.id_comuna = E.id_comuna
ORDER BY comuna, sueldo DESC


--Pregunta 4
-- curso con menos alumnos por año
SELECT C.nivel, C.letra, count(C.id_curso) as numero_alumos
FROM curso C
INNER JOIN curso_alumno CA ON CA.id_curso = C.id_curso
INNER JOIN alumno A ON A.id_alumno = CA.id_alumno
GROUP BY C.id_curso
ORDER BY count(C.id_curso) ASC
LIMIT 1

--Pregunta 5
-- identificar al alumno que no ha faltado nunca por curso
SELECT A.nombre, A.apellido, SUM(CASE WHEN asistencia = true THEN 0 ELSE 1 END) AS asistencia_a
FROM alumno A
INNER JOIN franja_alumno FA ON FA.id_alumno = A.id_alumno
GROUP BY A.id_alumno
HAVING SUM(CASE WHEN asistencia = true THEN 0 ELSE 1 END) = 0
ORDER BY A.apellido, A.nombre
--LIMIT 1 para obtener solo un alumno

--Pregunta 6
-- profesor con más horas de clases y mostrar su sueldo
SELECT P.nombre, P.apellido, P.id_profesor,ROUND(
    SUM(
        (
            EXTRACT(HOUR FROM FH.hora_fin) * 3600 +
            EXTRACT(MINUTE FROM FH.hora_fin) * 60 -
            EXTRACT(HOUR FROM FH.hora_inicio) * 3600 +
            EXTRACT(MINUTE FROM FH.hora_inicio) * 60
        ) / 3600
    )::numeric, 2
) as horas_clases, E.sueldo
FROM profesor P
INNER JOIN empleado E ON E.id_empleado = P.id_empleado
INNER JOIN profesor_curso PC ON PC.id_profesor = P.id_profesor
INNER JOIN profesor_curso_franja PCF ON PCF.id_profesor_curso = PC.id_profesor_curso
INNER JOIN franja_horaria FH ON FH.id_franja = PCF.id_franja
GROUP BY P.id_profesor, E.sueldo
ORDER BY E.sueldo DESC
LIMIT 1


--Pregunta 7
--profesor con menos horas de clases y mostrar sus sueldo
SELECT P.nombre, P.apellido, P.id_profesor,ROUND(
    SUM(
        (
            EXTRACT(HOUR FROM FH.hora_fin) * 3600 +
            EXTRACT(MINUTE FROM FH.hora_fin) * 60 -
            EXTRACT(HOUR FROM FH.hora_inicio) * 3600 +
            EXTRACT(MINUTE FROM FH.hora_inicio) * 60
        ) / 3600
    )::numeric, 2
) as horas_clases, E.sueldo
FROM profesor P
INNER JOIN empleado E ON E.id_empleado = P.id_empleado
INNER JOIN profesor_curso PC ON PC.id_profesor = P.id_profesor
INNER JOIN profesor_curso_franja PCF ON PCF.id_profesor_curso = PC.id_profesor_curso
INNER JOIN franja_horaria FH ON FH.id_franja = PCF.id_franja
GROUP BY P.id_profesor, E.sueldo
ORDER BY E.sueldo ASC
LIMIT 1


--Pregunta 8
-- listado alumnos por curso donde el apoderado no es su padre o madre(al menos uno de los apoderados no es su padre o madre)
SELECT C.nivel, C.letra, A.nombre, A.apellido, AA.es_padreBiologico
FROM Alumno A
INNER JOIN curso_alumno CA ON CA.id_alumno = A.id_alumno
INNER JOIN curso C ON C.id_curso = CA.id_curso
INNER JOIN alumno_apoderado AA ON AA.id_alumno = A.id_alumno
GROUP BY C.id_curso, A.id_alumno, AA.es_padreBiologico
HAVING AA.es_padreBiologico = false


--Pregunta 9
--colegio con mayor promedio de asistencia el año 2019, identificando la comuna
SELECT COL.nombre, C.nombre, COL.id_colegio, ROUND(AVG(CASE WHEN asistencia = true THEN 1 ELSE 0 END), 2) as promedio_asistencia
FROM colegio COL
INNER JOIN comuna C ON C.id_comuna = COL.id_comuna
INNER JOIN alumno A ON A.id_colegio = COL.id_colegio
INNER JOIN franja_alumno FA ON FA.id_alumno = A.id_alumno
INNER JOIN franja_horaria FH ON FH.id_franja = FA.id_franja
WHERE EXTRACT(YEAR FROM FH.dia) = 2023 -- 2019
GROUP BY COL.id_colegio, C.id_comuna
ORDER BY promedio_asistencia DESC
LIMIT 1


--Pregunta 10
--lista colegios con mayor número de alumnos por año
SELECT COL.nombre, COUNT(A.id_alumno) as numero_alumnos
FROM colegio COL
INNER JOIN alumno A ON A.id_colegio = COL.id_colegio
INNER JOIN curso_alumno CA ON CA.id_alumno = A.id_alumno
WHERE CA.anio = 2023 -- 2019
GROUP BY COL.id_colegio
ORDER BY numero_alumnos DESC





