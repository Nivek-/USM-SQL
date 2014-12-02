
CREATE TABLE Alumno (
                cod_alumno NVARCHAR(11) NOT NULL,
                nombre NVARCHAR(20) NOT NULL,
                apellido NVARCHAR(20) NOT NULL,
                pass VARCHAR(10) NOT NULL,
                CONSTRAINT Alumno_pk PRIMARY KEY (cod_alumno)
)

CREATE TABLE Asignatura (
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                nom_asig NVARCHAR(20) NOT NULL,
                CONSTRAINT Asignatura_pk PRIMARY KEY (cod_asig, cod_curso)
)

CREATE TABLE alumno_asignatura (
                cod_alumno NVARCHAR(11) NOT NULL,
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                CONSTRAINT alumno_asignatura_pk PRIMARY KEY (cod_alumno, cod_asig, cod_curso)
)

CREATE TABLE horario_asignatura (
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                cod_dia INT NOT NULL,
                cod_bloque INT NOT NULL,
                edificio CHAR NOT NULL,
                sala INT NOT NULL,
                CONSTRAINT horario_asignatura_pk PRIMARY KEY (cod_asig, cod_curso, cod_dia, cod_bloque)
)

CREATE TABLE Profesor (
                cod_profesor NVARCHAR(10) NOT NULL,
                nombre NVARCHAR(20) NOT NULL,
                apellido NVARCHAR(20) NOT NULL,
                pass VARCHAR(10) NOT NULL,
                CONSTRAINT Profesor_pk PRIMARY KEY (cod_profesor)
)

CREATE TABLE profesor_asignatura (
                cod_profesor NVARCHAR(10) NOT NULL,
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                CONSTRAINT profesor_asignatura_pk PRIMARY KEY (cod_profesor, cod_asig, cod_curso)
)

CREATE TABLE Noticia (
                cod_profesor NVARCHAR(10) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                cod_fecha DATETIME NOT NULL,
                cod_asig VARCHAR(6) NOT NULL,
                cod_noticia INT IDENTITY NOT NULL,
                noticia NVARCHAR(80) NOT NULL,
                CONSTRAINT Noticia_pk PRIMARY KEY (cod_profesor, cod_curso, cod_fecha, cod_asig)
)

CREATE TABLE horario_profesor (
                cod_profesor NVARCHAR(10) NOT NULL,
                cod_dia INT NOT NULL,
                cod_bloque INT NOT NULL,
                estado CHAR NOT NULL,
                CONSTRAINT horario_profesor_pk PRIMARY KEY (cod_profesor, cod_dia, cod_bloque)
)

ALTER TABLE alumno_asignatura ADD CONSTRAINT Alumno_alumno_asignatura_fk
FOREIGN KEY (cod_alumno)
REFERENCES Alumno (cod_alumno)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Noticia ADD CONSTRAINT Asignatura_Noticia_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE horario_asignatura ADD CONSTRAINT Asignatura_horario_asignatura_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE profesor_asignatura ADD CONSTRAINT Asignatura_profesor_asignatura_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE alumno_asignatura ADD CONSTRAINT Asignatura_alumno_asignatura_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE horario_profesor ADD CONSTRAINT Profesor_horario_profesor_fk
FOREIGN KEY (cod_profesor)
REFERENCES Profesor (cod_profesor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Noticia ADD CONSTRAINT Profesor_Noticia_fk
FOREIGN KEY (cod_profesor)
REFERENCES Profesor (cod_profesor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE profesor_asignatura ADD CONSTRAINT Profesor_profesor_asignatura_fk
FOREIGN KEY (cod_profesor)
REFERENCES Profesor (cod_profesor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
