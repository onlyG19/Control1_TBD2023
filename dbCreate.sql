--Debe crearse una base de datos, por ejemplo con el nombre "control1"

CREATE TABLE IF NOT EXISTS Rol(
    id_rol serial PRIMARY KEY,
    nombre_rol varchar(30)
);

CREATE TABLE IF NOT EXISTS Curso(
    id_curso serial PRIMARY KEY,
    nivel int,
    letra char(1)
);

CREATE TABLE IF NOT EXISTS Comuna(
    id_comuna serial PRIMARY KEY,
    nombre varchar(30)
);

CREATE TABLE IF NOT EXISTS Colegio(
    id_colegio serial PRIMARY KEY,
    id_comuna serial,
    nombre varchar(30),
    FOREIGN KEY (id_comuna) REFERENCES Comuna(id_comuna)
);

CREATE TABLE IF NOT EXISTS Franja_Horaria(
    id_franja serial PRIMARY KEY,
    hora_inicio time,
    hora_fin time,
    dia date
);

CREATE TABLE IF NOT EXISTS Empleado(
    id_empleado serial PRIMARY KEY,
    id_comuna serial,
    id_colegio serial,
    sueldo money,
    FOREIGN KEY (id_comuna) REFERENCES Comuna(id_comuna),
    FOREIGN KEY (id_colegio) REFERENCES Colegio(id_colegio)
);

CREATE TABLE IF NOT EXISTS Profesor(
    id_profesor serial PRIMARY KEY,
    id_empleado serial,
    nombre varchar(30),
    apellido varchar(30),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE IF NOT EXISTS Profesor_Curso(
    id_profesor_curso serial PRIMARY KEY,
    id_profesor serial,
    id_curso serial,
    profesor_jefe boolean,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_profesor),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE IF NOT EXISTS Profesor_Curso_Franja(
    id_profesor_curso serial,
    id_franja serial,
    PRIMARY KEY (id_profesor_curso, id_franja),
    FOREIGN KEY (id_profesor_curso) REFERENCES Profesor_Curso(id_profesor_curso),
    FOREIGN KEY (id_franja) REFERENCES franja_horaria(id_franja)
);

CREATE TABLE IF NOT EXISTS Alumno(
    id_alumno serial PRIMARY KEY,
    id_colegio serial,
    id_comuna serial,
    nombre varchar(30),
    apellido varchar(30),
    FOREIGN KEY (id_colegio) REFERENCES Colegio(id_colegio),
    FOREIGN KEY (id_comuna) REFERENCES Comuna(id_comuna)
);

CREATE TABLE IF NOT EXISTS Franja_Alumno(
    id_franja serial,
    id_alumno serial,
    asistencia boolean,
    PRIMARY KEY (id_franja, id_alumno),
    FOREIGN KEY (id_franja) REFERENCES Franja_Horaria(id_franja),
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno)
);

CREATE TABLE IF NOT EXISTS Curso_Alumno(
    id_alumno serial,
    id_curso serial,
    anio int,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE IF NOT EXISTS Apoderado(
    id_apoderado serial PRIMARY KEY,
    id_comuna serial,
    nombre varchar(30),
    apellido varchar(30),
    sexo char(1),
    FOREIGN KEY (id_comuna) REFERENCES Comuna(id_comuna)
);

CREATE TABLE IF NOT EXISTS Alumno_Apoderado(
    id_alumno serial,
    id_apoderado serial,
    es_padreBiologico boolean,
    PRIMARY KEY (id_alumno, id_apoderado),
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
    FOREIGN KEY (id_apoderado) REFERENCES Apoderado(id_apoderado)
);

CREATE TABLE IF NOT EXISTS Empleado_Rol(
    id_empleado serial,
    id_rol serial,
    PRIMARY KEY (id_empleado, id_rol),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

CREATE TABLE IF NOT EXISTS Empleado_Administrativo(
    id_administrativo serial PRIMARY KEY,
    id_empleado serial,
    nombre varchar(30),
    apellido varchar(30),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);