DROP DATABASE IF EXISTS Bienes;
CREATE DATABASE Bienes;
USE Bienes;
CREATE TABLE Bienes.Inventario
(
    idInventario INTEGER NOT NULL,
    nombre VARCHAR (45) NOT NULL,
    PRIMARY KEY (idInventario)
);

CREATE TABLE Bienes.SolicitudCompra
(
    idSolicitudCompra INTEGER NOT NULL,
    fecha DATETIME NOT NULL,
    idResponsable INTEGER NOT NULL,
    centroDeCostos INTEGER NOT NULL,
    rubroPresupustal INTEGER NOT NULL,
    idItem INTEGER NOT NULL,
    total INTEGER NOT NULL,
    PRIMARY KEY (idSolicitudCompra),
    CONSTRAINT FK_SolicitudCompra_Responsable FOREIGN KEY (idResponsable) REFERENCES Bienes.Responsable (idResponsable),
    CONSTRAINT FK_SolicitudCompra_Item FOREIGN KEY (idItem) REFERENCES Bienes.Item (idItem)
);

CREATE TABLE Bienes.Responsable
(
    idResponsable INTEGER NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    cedula INTEGER NOT NULL,
    centroDeCostos INTEGER NOT  NULL,
    PRIMARY KEY (idResponsable)
);

CREATE TABLE Bienes.Item
(
    idItem INTEGER NOT NULL,
    nombreBien INTEGER NOT NULL,
    solicitado INTEGER NOT NULL,
    valorUnitario DECIMAL NOT NULL,
    valorTotal DECIMAL NOT NULL,
    unidadMedidaDeBien INTEGER NOT NULL,
    codigoUniversalDeBien INTEGER NOT NULL,
    cantidadDespachada INTEGER NOT NULL,
    PRIMARY KEY (idItem)
);

CREATE TABLE Bienes.Proveedores
(
    idProveedor INTEGER NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    idItem INTEGER NOT NULL,
    PRIMARY KEY (idProveedor),
    CONSTRAINT FK_Proveedores_Item FOREIGN KEY (idItem) REFERENCES Bienes.Item (idItem)
);

CREATE TABLE Bienes.Almacen
(
    idAlamcen INTEGER NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    idEntradaAlmacen INTEGER NOT NULL,
    idSalidaAlmacen INTEGER NOT NULL,
    PRIMARY KEY (idAlamcen),
    CONSTRAINT FK_Almacen_EntradaAlmacen FOREIGN KEY (idEntradaAlmacen) REFERENCES Bienes.EntradaAlmacen (idEntradaAlmacen),
    CONSTRAINT FK_Almacen_SalidaAlmacen FOREIGN KEY (idSalidaAlmacen) REFERENCES Bienes.SalidaAlmacen (idSalidaAlmacen)
);

CREATE TABLE Bienes.EntradaAlmacen
(
    idEntradaAlmacen INTEGER NOT NULL,
    fecha DATETIME NOT NULL,
    numeroFactura INTEGER NOT NULL,
    bienesTotales DECIMAL NOT NULL,
    valorTotal DECIMAL NOT NULL,
    idProveedor INTEGER NOT NULL,
    PRIMARY KEY (idEntradaAlmacen),
    CONSTRAINT FK_EntradaAlmacen_Proveedores FOREIGN KEY (idProveedor) REFERENCES Bienes.Proveedores (idProveedor)
);

CREATE TABLE 
