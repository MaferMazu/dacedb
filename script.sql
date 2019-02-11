CREATE TABLE Estudiante (
    cohorte char(2),
    numero int,
    cedula int NOT NULL UNIQUE,
    nombre varchar(30) NOT NULL,
    indice numeric(3, 2) NOT NULL DEFAULT 0.00,
    CONSTRAINT PK_Estudiante PRIMARY KEY(cohorte, numero)
);

CREATE TABLE Asignatura (
    codigo int CONSTRAINT PK_Asignatura PRIMARY KEY,
    nombre varchar(15) NOT NULL,
    ncredito int NOT NULL CONSTRAINT CK_Asignatura_ncredito CHECK(ncredito IN (0,2,3,4,5,8,9))
);

CREATE TABLE Trimestre(
    inicio int CONSTRAINT CK_Trimestre_inicio CHECK(inicio IN (1,4,7,9)),
    fin int CONSTRAINT CK_Trimestre_fin CHECK(fin IN (3,7,8,12)),
    anho int,
    CONSTRAINT PK_Trimestre PRIMARY KEY(inicio, fin, anho)
);

CREATE TABLE Inscribe(
    cohorte char(2),
    numero int,
    codigo int REFERENCES Asignatura,
    inicio int,
    fin int,
    anho int,
    CONSTRAINT FK_Inscribe_Estudiante FOREIGN KEY(cohorte,numero) REFERENCES Estudiante,
    CONSTRAINT FK_Inscribe_Trimestre FOREIGN KEY(inicio,fin,anho) REFERENCES Trimestre
);