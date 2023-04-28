DROP DATABASE IF EXISTS Olimpidas;
CREATE DATABASE Olimpidas;
USE Olimpidas;
CREATE TABLE Olimpidas.Evento
(
    idEvento INTEGER  NOT NULL,
    fecha DATE NOT NULL,
    equipamiendo VARCHAR(120) NOT NULL,
    duracion INTEGER NOT NULL,
    participantes INTEGER NOT NULL,
    idComisario INTEGER NOT NULL,
    PRIMARY KEY (idEvento),
    CONSTRAINT FK_Evento_Comisario FOREIGN KEY (idComisario) REFERENCES Olimpidas.Comisario (idComisario)
);

CREATE TABLE Olimpidas.Comisario
(
    idComisario INTEGER NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tarea VARCHAR(60) NOT NULL,
    PRIMARY KEY (idComisario)
);

CREATE TABLE Olimpidas.Complejo
(
    idComplejo INTEGER NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    jefeOrganizacion VARCHAR(45) NOT NULL,
    areaTotal DECIMAL NOT NULL,
    localizacion VARCHAR(60) NOT NULL,
    idEvento INTEGER NOT NULL,
    idComisario INTEGER NOT NULL,
    PRIMARY KEY (idComplejo),
    CONSTRAINT FK_Complejo_Evento FOREIGN KEY (idEvento) REFERENCES Olimpidas.Evento (idEvento),
    CONSTRAINT FK_Complejo_Comisario FOREIGN KEY (idComisario) REFERENCES Olimpidas.Comisario (idComisario)
);

CREATE TABLE Olimpidas.Sede
(
    idSede INTEGER NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    presupuesto DECIMAL NOT NULL,
    idComplejo INTEGER NOT NULL,
    PRIMARY KEY (idSede),
    CONSTRAINT FK_Sede_Complejo FOREIGN KEY (idComplejo) REFERENCES Olimpidas.Complejo (idComplejo)
);