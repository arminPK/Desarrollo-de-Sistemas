DROP DATABASE IF EXISTS Carreteras;
CREATE DATABASE Carreteras;
USE Carreteras;
CREATE TABLE Carreteras.Categoria
(
    idCategoria INTEGER NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    PRIMARY KEY (idCategoria)
);

CREATE TABLE Carreteras.Carretera
(
    idCarretera INTEGER NOT NULL,
    idCategoria INTEGER NOT NULL,
    idComuna INTEGER NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    PRIMARY KEY (idCarretera),
    CONSTRAINT FK_Carretera_Categoria FOREIGN KEY (idCategoria) REFERENCES Carreteras.Categoria (idCategoria),
    CONSTRAINT FK_Carretera_Comuna FOREIGN KEY (idComuna) REFERENCES Carreteras.Comuna (idComuna)
);

CREATE TABLE Carreteras.Comuna
(
    idComuna INTEGER NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    provincia VARCHAR(60) NOT NULL, 
    region VARCHAR(60) NOT NULL,
    PRIMARY KEY (idComuna)
);

CREATE TABLE Carreteras.Tramo
(
    idTramo INTEGER NOT NULL,
    idCarretera INTEGER NOT NULL,
    inicioKM INTEGER NOT NULL,
    finKM INTEGER NOT NULL,
    inicioComuna VARCHAR(60) NOT NULL,
    finComuna VARCHAR(60) NOT NULL,
    inicioCarretera VARCHAR(60) NOT NULL,
    finCarretera VARCHAR(60) NOT NULL,
    PRIMARY KEY (idTramo),
    CONSTRAINT FK_Tramo_Carretera FOREIGN KEY (idCarretera) REFERENCES Carreteras.Carretera (idCarretera)
)