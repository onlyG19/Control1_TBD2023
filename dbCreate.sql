-- Debe crearse una base de datos, por ejemplo con el nombre 'control1'


CREATE TABLE IF NOT EXISTS Rol(
    id_rol serial PRIMARY KEY,
    nombre_rol varchar(30)
);

CREATE TABLE IF NOT EXISTS Curso(
    id_curso serial PRIMARY KEY,
    nivel int,
    letra char(1)
);


CREATE TABLE IF NOT EXISTS Comuna (
    id_comuna serial PRIMARY KEY,
    nombre varchar(30)
);


CREATE TABLE IF NOT EXISTS Colegio (
    id_colegio serial PRIMARY KEY,
    nombre varchar(30),
    id_comuna serial REFERENCES Comuna(id_comuna)
  
);

CREATE TABLE IF NOT EXISTS Franja_Horaria(
    id_franja serial PRIMARY KEY,
    hora_inicio timestamptz,
    hora_fin timestamptz
);

CREATE TABLE IF NOT EXISTS Empleado (
    id_empleado serial PRIMARY KEY,
    sueldo money,
    id_comuna serial REFERENCES Comuna(id_comuna),
    id_colegio serial REFERENCES Colegio(id_colegio)

);

-- Crear la tabla 'Profesor'
CREATE TABLE IF NOT EXISTS Profesor (
    id_profesor serial PRIMARY KEY,
    nombre varchar(30),
    apellido varchar(30),
    id_empleado serial REFERENCES Empleado(id_empleado)
);

CREATE TABLE IF NOT EXISTS Profesor_Curso(
    id_profesor_curso serial PRIMARY KEY,
    profesor_jefe boolean,
    id_profesor serial REFERENCES Profesor(id_profesor),
    id_curso serial REFERENCES Curso(id_curso)
    
);

CREATE TABLE IF NOT EXISTS Profesor_Curso_Franja(
    
    id_profesor_curso serial REFERENCES Profesor_Curso(id_profesor_curso),
    id_franja serial REFERENCES Franja_Horaria(id_franja)
    
);

CREATE TABLE IF NOT EXISTS Alumno(
    id_alumno serial PRIMARY KEY,
    nombre varchar(30),
    apellido varchar(30),
    id_colegio serial REFERENCES Colegio(id_colegio),
    id_comuna serial REFERENCES Comuna(id_comuna)
    
);


CREATE TABLE IF NOT EXISTS Franja_Alumno(
    id_franja serial REFERENCES Franja_Horaria(id_franja),
    id_alumno serial REFERENCES Alumno(id_alumno),
    asistencia boolean
);



CREATE TABLE IF NOT EXISTS Curso_Alumno(
    id_alumno serial REFERENCES Alumno(id_alumno),
    id_curso serial REFERENCES Curso(id_curso),
    semestre varchar(30)
    
);



CREATE TABLE IF NOT EXISTS Apoderado(
    id_apoderado serial PRIMARY KEY,
    nombre varchar(30),
    apellido varchar(30),
    sexo varchar(30),
    id_comuna serial REFERENCES Comuna(id_comuna)
);


CREATE TABLE IF NOT EXISTS Alumno_Apoderado(
    id_alumno serial REFERENCES Alumno(id_alumno),
    id_apoderado serial REFERENCES Apoderado(id_apoderado),
    es_padreBiologico boolean 
    
);


CREATE TABLE IF NOT EXISTS Empleado_Rol(
    id_empleado serial REFERENCES Empleado(id_empleado),
    id_rol serial REFERENCES Rol(id_rol)
);

