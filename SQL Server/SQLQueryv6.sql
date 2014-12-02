
CREATE TABLE Casino (
                cod_casino NVARCHAR(11) NOT NULL,
                pass NVARCHAR(20) NOT NULL,
                CONSTRAINT Casino_pk PRIMARY KEY (cod_casino)
)

CREATE TABLE Menu (
                cod_tipo CHAR NOT NULL,
                cod_dia DATETIME NOT NULL,
                dia TINYINT NOT NULL,
                fondo NVARCHAR(20) NOT NULL,
                entrada NVARCHAR(50) NOT NULL,
                postre NVARCHAR(20) NOT NULL,
                CONSTRAINT Menu_pk PRIMARY KEY (cod_tipo, cod_dia)
)

CREATE TABLE Alumno (
                cod_alumno NVARCHAR(11) NOT NULL,
                nombre NVARCHAR(20) NOT NULL,
                apellido NVARCHAR(20) NOT NULL,
                pass NVARCHAR(20) NOT NULL,
                CONSTRAINT Alumno_pk PRIMARY KEY (cod_alumno)
)

CREATE TABLE Asignatura (
                cod_asig NVARCHAR(6) NOT NULL,
                cod_curso NVARCHAR(5) NOT NULL,
                nom_asig NVARCHAR(35) NOT NULL,
                CONSTRAINT Asignatura_pk PRIMARY KEY (cod_asig, cod_curso)
)

CREATE TABLE alumno_asignatura (
                cod_alumno NVARCHAR(11) NOT NULL,
                cod_asig NVARCHAR(6) NOT NULL,
                cod_curso NVARCHAR(5) NOT NULL,
                CONSTRAINT alumno_asignatura_pk PRIMARY KEY (cod_alumno, cod_asig, cod_curso)
)

CREATE TABLE horario_asignatura (
                cod_asig NVARCHAR(6) NOT NULL,
                cod_curso NVARCHAR(5) NOT NULL,
                cod_dia TINYINT NOT NULL,
                cod_bloque TINYINT NOT NULL,
                edificio CHAR NOT NULL,
                sala INT NOT NULL,
                CONSTRAINT horario_asignatura_pk PRIMARY KEY (cod_asig, cod_curso, cod_dia, cod_bloque)
)

CREATE TABLE Profesor (
                cod_profesor NVARCHAR(11) NOT NULL,
                nombre NVARCHAR(20) NOT NULL,
                apellido NVARCHAR(20) NOT NULL,
                pass NVARCHAR(20) NOT NULL,
                CONSTRAINT Profesor_pk PRIMARY KEY (cod_profesor)
)

CREATE TABLE profesor_asignatura (
                cod_profesor NVARCHAR(11) NOT NULL,
                cod_asig NVARCHAR(6) NOT NULL,
                cod_curso NVARCHAR(5) NOT NULL,
                CONSTRAINT profesor_asignatura_pk PRIMARY KEY (cod_profesor, cod_asig, cod_curso)
)

CREATE TABLE Noticia (
                cod_profesor NVARCHAR(11) NOT NULL,
                cod_curso NVARCHAR(5) NOT NULL,
                cod_fecha DATETIME NOT NULL,
                cod_asig NVARCHAR(6) NOT NULL,
                noticia NVARCHAR(140) NOT NULL,
                CONSTRAINT Noticia_pk PRIMARY KEY (cod_profesor, cod_curso, cod_fecha, cod_asig)
)

CREATE TABLE horario_profesor (
                cod_profesor NVARCHAR(11) NOT NULL,
                cod_dia TINYINT NOT NULL,
                cod_bloque TINYINT NOT NULL,
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
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INSERTAMOS LOS DATOS

INSERT INTO Profesor VALUES('18564556-8','KEVIN','GUTIERREZ','0602');

INSERT INTO Alumno VALUES('201292807-9','KEVIN','GUTIERREZ','0602');

INSERT INTO Casino VALUES('casino','admin');


---192-A Y B
INSERT INTO ASIGNATURA VALUES('ADM000','192-A','ADMINISTRACIÓN');
INSERT INTO ASIGNATURA VALUES('ACF001','192-A','ACTIVIDAD FORMATIVA I');
INSERT INTO ASIGNATURA VALUES('ACF002','192-A','ACTIVIDAD FORMATIVA II');
INSERT INTO ASIGNATURA VALUES('MAT001','192-A','MATEMATICAS I');
INSERT INTO ASIGNATURA VALUES('MAT002','192-A','MATEMATICAS II');
INSERT INTO ASIGNATURA VALUES('ELP000','192-A','ELEMENTOS DE PROGRAMACION');
INSERT INTO ASIGNATURA VALUES('ING001','192-A','INGLES I');
INSERT INTO ASIGNATURA VALUES('ING002','192-A','INGLES II');
INSERT INTO ASIGNATURA VALUES('SI001','192-A','SISTEMAS DE INF. I');
--
INSERT INTO ASIGNATURA VALUES('ADM000','192-B','ADMINISTRACIÓN');
INSERT INTO ASIGNATURA VALUES('ACF001','192-B','ACTIVIDAD FORMATIVA I');
INSERT INTO ASIGNATURA VALUES('ACF002','192-B','ACTIVIDAD FORMATIVA II');
INSERT INTO ASIGNATURA VALUES('MAT001','192-B','MATEMATICAS I');
INSERT INTO ASIGNATURA VALUES('MAT002','192-B','MATEMATICAS II');
INSERT INTO ASIGNATURA VALUES('ELP000','192-B','ELEMENTOS DE PROGRAMACION');
INSERT INTO ASIGNATURA VALUES('ING001','192-B','INGLES I');
INSERT INTO ASIGNATURA VALUES('ING002','192-B','INGLES II');
INSERT INTO ASIGNATURA VALUES('SI001','192-B','SISTEMAS DE INF. I');


---292-A Y B
INSERT INTO ASIGNATURA VALUES('DA001','292-A','DESARROLLO DE APP. I');
INSERT INTO ASIGNATURA VALUES('DA002','292-A','DESARROLLO DE APP. II');
INSERT INTO ASIGNATURA VALUES('EST000','292-A','ESTADISTICA');
INSERT INTO ASIGNATURA VALUES('BD000','292-A','BASE DE DATOS');
INSERT INTO ASIGNATURA VALUES('SI002','292-A','SISTEMAS DE INF. II');
INSERT INTO ASIGNATURA VALUES('SI003','392-A','SISTEMAS DE INF. III');
INSERT INTO ASIGNATURA VALUES('RDC000','292-A','REDES DE COMPUTADORES');
INSERT INTO ASIGNATURA VALUES('ING001','292-A','INGLES I');
INSERT INTO ASIGNATURA VALUES('ING002','292-A','INGLES II');
INSERT INTO ASIGNATURA VALUES('SO000','292-A','SISTEMAS OPERATIVOS');

--
INSERT INTO ASIGNATURA VALUES('DA001','292-B','DESARROLLO DE APP. I');
INSERT INTO ASIGNATURA VALUES('DA002','292-B','DESARROLLO DE APP. II');
INSERT INTO ASIGNATURA VALUES('EST000','292-B','ESTADISTICA');
INSERT INTO ASIGNATURA VALUES('BD000','292-B','BASE DE DATOS');
INSERT INTO ASIGNATURA VALUES('SI002','292-B','SISTEMAS DE INF. II');
INSERT INTO ASIGNATURA VALUES('SI003','292-B','SISTEMAS DE INF. III');
INSERT INTO ASIGNATURA VALUES('RDC000','292-B','REDES DE COMPUTADORES');
INSERT INTO ASIGNATURA VALUES('ING001','292-B','INGLES I');
INSERT INTO ASIGNATURA VALUES('ING002','292-B','INGLES II');
INSERT INTO ASIGNATURA VALUES('SO000','292-B','SISTEMAS OPERATIVOS');


---392-A Y B


INSERT INTO ASIGNATURA VALUES('TDS000','192-A','TALLER DE SOFTWARE');
INSERT INTO ASIGNATURA VALUES('TT000','192-A','TRABAJO DE TITULO');
INSERT INTO ASIGNATURA VALUES('TDS000','392-A','TALLER DE SOFTWARE');
INSERT INTO ASIGNATURA VALUES('TDS000','192-A','TALLER DE COMPUTACIÓN');
--
INSERT INTO ASIGNATURA VALUES('TDS000','192-B','TALLER DE SOFTWARE');
INSERT INTO ASIGNATURA VALUES('TT000','192-B','TRABAJO DE TITULO');
INSERT INTO ASIGNATURA VALUES('TDS000','392-B','TALLER DE SOFTWARE');
INSERT INTO ASIGNATURA VALUES('TDS000','192-B','TALLER DE COMPUTACIÓN');

---122 (TELECO Y REDES)
INSERT INTO ASIGNATURA VALUES('ACF001','122-A','ACTIVIDAD FORMATIVA I');
INSERT INTO ASIGNATURA VALUES('TCI000','122-A','TECNOLOGIAS DE INFORMACIÓN');
INSERT INTO ASIGNATURA VALUES('MAT001','122-A','MATEMATICAS I');
INSERT INTO ASIGNATURA VALUES('MAT002','122-A','MATEMATICAS II');
INSERT INTO ASIGNATURA VALUES('ING001','122-A','INGLES I');
INSERT INTO ASIGNATURA VALUES('ING002','122-A','INGLES II');

--222
INSERT INTO ASIGNATURA VALUES('SO000','222-A','SISTEMAS OPERATIVOS');






---PROFESORES
INSERT INTO profesor_asignatura VALUES('18564556-8','MAT001','192-A');
INSERT INTO profesor_asignatura VALUES('18564556-8','DA001','192-A');
INSERT INTO profesor_asignatura VALUES('18564556-8','EST000','292-A');

INSERT INTO profesor_asignatura VALUES('18564556-8','MAT001','192-B');
INSERT INTO profesor_asignatura VALUES('18564556-8','EST001','192-B');
INSERT INTO profesor_asignatura VALUES('18564556-8','DA001','192-B');

INSERT INTO profesor_asignatura VALUES('18564556-8','MAT001','122-A');
INSERT INTO profesor_asignatura VALUES('18564556-8','EST001','122-A');







-------------------------------------------------------------------------
INSERT INTO Profesor VALUES('18037354-3','MIGUEL','BARAHONA','1803');


INSERT INTO Asignatura VALUES('ELP001','192-A','ELEMENTOS I');
INSERT INTO Asignatura VALUES('OMA001','192-A','ORG Y MANEJO I');
INSERT INTO Asignatura VALUES('DA002','192-A','DESARROLLO DE APP I');

INSERT INTO profesor_asignatura VALUES('18037354-3','ELP001','192-A');
INSERT INTO profesor_asignatura VALUES('18037354-3','OMA001','192-A');
INSERT INTO profesor_asignatura VALUES('18037354-3','DA002','192-A');

--------------------------------------------------------------------------

go

-- CREAMOS LOS PROCEDIMIENTOS

create procedure InicioSesion
@user nvarchar(11),
@clave nvarchar(20),
@msje varchar(100) output
as begin
if exists(select * from Casino where cod_casino=@user and pass=(select CAST(@clave as varbinary(250))))
	begin	
		set @Msje='Usuario Casino'
	end
	else
	    if exists(select * from Profesor where cod_profesor=@user and pass=(select CAST(@clave as varbinary(250))))
		  begin
		      set @Msje='Usuario Profesor'
		  end
		  else
		       if exists(select * from Alumno where cod_alumno=@user and pass=(select CAST(@clave as varbinary(250))))
		         begin
		          set @Msje='Usuario Alumno'
		         end
				 else
		           set @msje='Error, Usuario no existe o datos incorrectos'
end
go

------Ejecutamos procedimiento---------

declare @msje varchar(100)
exec InicioSesion 'mari','mari',@msje output
select @msje
go

declare @msje varchar(100)
exec InicioSesion 'casino','admin',@msje output
select @msje
go

declare @msje varchar(100)
exec InicioSesion '18564556-8','0602',@msje output
select @msje
go

declare @msje varchar(100)
exec InicioSesion '201292807-9','0602',@msje output
select @msje
go


--------------------------------------------------------------------------------------------------------------

select ha.cod_bloque,ha.cod_dia,ha.cod_asig,asi.nom_asig,ha.cod_curso,ha.edificio,ha.sala 
from alumno a,alumno_asignatura a_as,Asignatura asi,horario_asignatura ha 
where 
a.cod_alumno = '201292807-9' and
a.cod_alumno = a_as.cod_alumno and
a_as.cod_asig = asi.cod_asig and
a_as.cod_curso = asi.cod_curso and
asi.cod_asig = ha.cod_asig and 
asi.cod_curso = ha.cod_curso
order by ha.cod_bloque,ha.cod_dia;

select * from Alumno;
select * from alumno_asignatura;
select * from horario_asignatura;

insert into horario_asignatura values ('ADM000','192-A',1,1,'H',101);
insert into horario_asignatura values ('SI002','292-A',1,2,'R',103);
insert into horario_asignatura values ('TDS000','392-A',1,3,'U',1);

insert into horario_asignatura values ('ADM000','192-A',2,1,'H',101);
insert into horario_asignatura values ('SI002','292-A',2,2,'R',103);
insert into horario_asignatura values ('TDS000','392-A',2,3,'U',1);


insert into horario_asignatura values ('ADM000','192-A',3,1,'H',101);
insert into horario_asignatura values ('SI002','292-A',3,2,'R',103);
insert into horario_asignatura values ('TDS000','392-A',3,3,'U',1);

insert into horario_asignatura values ('ADM000','192-A',4,1,'H',101);
insert into horario_asignatura values ('SI002','292-A',4,2,'R',103);
insert into horario_asignatura values ('TDS000','392-A',4,3,'U',1);


