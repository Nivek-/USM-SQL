
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

CREATE TABLE alumnoasignatura (
                cod_alumno NVARCHAR(11) NOT NULL,
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                CONSTRAINT alumnoasignatura_pk PRIMARY KEY (cod_alumno, cod_asig, cod_curso)
)

CREATE TABLE horarioasignatura (
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                cod_dia INT NOT NULL,
                cod_bloque INT NOT NULL,
                edificio CHAR NOT NULL,
                sala INT NOT NULL,
                CONSTRAINT horarioasignatura_pk PRIMARY KEY (cod_asig, cod_curso, cod_dia, cod_bloque)
)

CREATE TABLE Profesor (
                cod_profesor NVARCHAR(10) NOT NULL,
                nombre NVARCHAR(20) NOT NULL,
                apellido NVARCHAR(20) NOT NULL,
                pass VARCHAR(10) NOT NULL,
                CONSTRAINT Profesor_pk PRIMARY KEY (cod_profesor)
)

CREATE TABLE profesorasignatura (
                cod_profesor NVARCHAR(10) NOT NULL,
                cod_asig VARCHAR(6) NOT NULL,
                cod_curso VARCHAR(5) NOT NULL,
                CONSTRAINT profesorasignatura_pk PRIMARY KEY (cod_profesor, cod_asig, cod_curso)
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

CREATE TABLE horarioprofesor (
                cod_profesor NVARCHAR(10) NOT NULL,
                cod_dia INT NOT NULL,
                cod_bloque INT NOT NULL,
                estado CHAR NOT NULL,
                CONSTRAINT horario_profesor_pk PRIMARY KEY (cod_profesor, cod_dia, cod_bloque)
)

ALTER TABLE alumnoasignatura ADD CONSTRAINT Alumno_alumno_asignatura_fk
FOREIGN KEY (cod_alumno)
REFERENCES Alumno (cod_alumno)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Noticia ADD CONSTRAINT Asignatura_Noticia_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE horarioasignatura ADD CONSTRAINT Asignatura_horario_asignatura_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE profesorasignatura ADD CONSTRAINT Asignatura_profesor_asignatura_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE alumnoasignatura ADD CONSTRAINT Asignatura_alumno_asignatura_fk
FOREIGN KEY (cod_asig, cod_curso)
REFERENCES Asignatura (cod_asig, cod_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE horarioprofesor ADD CONSTRAINT Profesor_horario_profesor_fk
FOREIGN KEY (cod_profesor)
REFERENCES Profesor (cod_profesor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Noticia ADD CONSTRAINT Profesor_Noticia_fk
FOREIGN KEY (cod_profesor)
REFERENCES Profesor (cod_profesor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE profesorasignatura ADD CONSTRAINT Profesor_profesor_asignatura_fk
FOREIGN KEY (cod_profesor)
REFERENCES Profesor (cod_profesor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

INSERT INTO Profesor VALUES('18564556-8','KEVIN','GUTIERREZ','0602');

INSERT INTO ASIGNATURA VALUES('MAT001','192-A','MATEMATICAS I');
INSERT INTO ASIGNATURA VALUES('EST001','192-A','ESTADISTICAS I');
INSERT INTO ASIGNATURA VALUES('DA001','192-A','DESARROLLO DE APP I');

INSERT INTO ASIGNATURA VALUES('MAT001','192-B','MATEMATICAS I');
INSERT INTO ASIGNATURA VALUES('EST001','192-B','ESTADISTICAS I');
INSERT INTO ASIGNATURA VALUES('DA001','192-B','DESARROLLO DE APP I');


INSERT INTO profesorasignatura VALUES('18564556-8','MAT001','192-A');
INSERT INTO profesorasignatura VALUES('18564556-8','EST001','192-A');
INSERT INTO profesorasignatura VALUES('18564556-8','DA001','192-A');

INSERT INTO profesorasignatura VALUES('18564556-8','MAT001','192-B');
INSERT INTO profesorasignatura VALUES('18564556-8','EST001','192-B');
INSERT INTO profesorasignatura VALUES('18564556-8','DA001','192-B');



SELECT cod_curso FROM profesorasignatura WHERE cod_profesor = '18564556-8' 
                 GROUP BY cod_curso;

SELECT  FROM ASIGNATURA WHERE COD_CURSO='192-B';