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
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    PRIMARY KEY (idCliente),
    FOREIGN KEY (idDireccion) REFERENCES Encargos.Direcciones (idDireccion)
);

CREATE TABLE Encargos.Pedido
(
    idPedido INTEGER NOT null,
    idArticulo INTEGER NOT NULL,
    idCliente INTEGER NOT NULL,
    fechapedido DATE NOT NULL,
    fechaenvio DATE NOT NULL,
    PRIMARY KEY (idPedido),
    FOREIGN KEY (idArticulo) REFERENCES Encargos.Articulo (idArticulo),
    FOREIGN KEY (idCliente) REFERENCES Encargos.Cliente (idCliente)
);

CREATE TABLE Encargos.Direcciones
(
    idDireccion INTEGER NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    gmail VARCHAR(60) NOT null,
    telefono INTEGER NOT NULL,
    PRIMARY KEY (idDireccion)
);

CREATE TABLE Encargos.Articulo
( 
    idArticulo INTEGER NOT NULL,
    distribuidor VARCHAR(60) NOT NULL,
    stock INTEGER NOT NULL,
    descripcion VARCHAR(120) NOT NULL,
    precio DECIMAL NOT NULL,
    PRIMARY KEY (idArticulo)
);
-- ppis poishpos