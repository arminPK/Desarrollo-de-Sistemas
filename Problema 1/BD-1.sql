DROP DATABASE IF EXISTS Encargos;
CREATE DATABASE Encargos;
USE Encargos;
CREATE TABLE Encargos.Cliente
( 
    idCliente INTEGER NOT NULL, 
    idDireccion VARCHAR(60) NOT NULL,
    saldo DECIMAL NOT NULL,
    limeteCrediticio DECIMAL NOT NULL,
    descuento DECIMAL NOT NULL,
    descuento DECIMAL NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    PRIMARY KEY (idCliente),
    CONSTRAINT FK_Cliente_Direcciones FOREIGN KEY (idDireccion) REFERENCES Encargos.Direcciones (idDireccion)
);

CREATE TABLE Encargos.Pedido
(
    idPedido INTEGER NOT null,
    idCuerpo INTEGER NOT NULL,
    idCabecera INTEGER NOT NULL,
    PRIMARY KEY (idPedido),
    CONSTRAINT FK_Pedido_Cabecera FOREIGN KEY (idCabecera) REFERENCES Encargos.Cabecera (idCabecera),
    CONSTRAINT FK_Pedido_Cuerpo FOREIGN KEY (idCuerpo) REFERENCES Encargos.Cuerpo (idCuerpo)
);

CREATE TABLE Encargos.Cabecera
(
    idCabecera INTEGER NOT NULL,
    idCliente INTEGER NOT NULL,
    direccEnvio VARCHAR(60) NOT NULL,
    fechapedido DATETIME NOT NULL,
    idDireccion INTEGER NOT NULL,
    PRIMARY KEY (idCabecera),
    CONSTRAINT FK_Cabecera_Cliente FOREIGN KEY (idCliente) REFERENCES Encargos.Cliente (idCliente),
    CONSTRAINT FK_Cabecera_Direcciones FOREIGN KEY (idDireccion) REFERENCES Encargos.Direcciones (idDireccion)
);

CREATE TABLE Encargos.Cuerpo
(
    idCuerpo INTEGER NOT NULL,
    articuloPedido VARCHAR(60) NOT NULL,
    cantidadArticulos INTEGER NOT NULL,
    idArticulo INTEGER NOT NULL,
    PRIMARY KEY (idCuerpo),
    CONSTRAINT FK_Cuerpo_Articulo FOREIGN KEY (idArticulo) REFERENCES Encargos.Articulo (idArticulo) 
);

CREATE TABLE Encargos.Direcciones
(
    idDireccion INTEGER NOT NULL,
    calle VARCHAR(60) NOT NULL,
    comuna VARCHAR(60) NOT null,
    ciudad INTEGER NOT NULL,
    PRIMARY KEY (idDireccion)
);

CREATE TABLE Encargos.Articulo
( 
    idArticulo INTEGER NOT NULL,
    distribuidor VARCHAR(60) NOT NULL,
    stock INTEGER NOT NULL,
    descripcion VARCHAR(120) NOT NULL,
    precio DECIMAL NOT NULL,
    idFabrica INTEGER NOT NULL,
    PRIMARY KEY (idArticulo),
    CONSTRAINT FK_Articulo_Fabrica FOREIGN KEY (idFabrica) REFERENCES Encargos.Fabrica (idFabrica)
);

CREATE TABLE Encargos.Fabrica
(
    idFabrica INTEGER NOT NULL,
    telefContac INTEGER NOT NULL,
    stockProveer INTEGER NOT NULL,
    PRIMARY KEY (idFabrica)
);

CREATE TABLE Encargos.Alternativa
(
    idAlternativa INTEGER NOT NULL,
    idFabrica INTEGER NOT NULL,
    nombreFabrica VARCHAR(60) NOT NULL,
    PRIMARY KEY (idAlternativa),
    CONSTRAINT FK_Alternativa_Fabrica FOREIGN KEY (idFabrica) REFERENCES Encargos.Fabrica (idFabrica)
)