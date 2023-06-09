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

CREATE TABLE Bienes.SalidaAlmacen
( 
    idSalidaAlmacen INTEGER NOT NULL,
    fechaSalida DATETIME NOT NULL,
    fechaEntrega DATETIME NOT NULL,
    idEmpleado INTEGER NOT NULL,
    PRIMARY KEY (idSalidaAlmacen),
);

CREATE TABLE Bienes.ArticuloOrdenContractual
(
    idItemOrdenContractual INTEGER NOT NULL,
    idBien INTEGER NOT NULL,
    cantidadSolicitada INTEGER NOT NULL,
    cantidadDespachada INTEGER NOT NULL,
    valorUnitario DECIMAL NOT NULL,
    valorTotal DECIMAL NOT NULL,
    idOrdenContractual INTEGER NOT NULL,
    PRIMARY KEY (idItemOrdenContractual),
    CONSTRAINT FK_ArticuloOrdenContractual_OrdenContractual FOREIGN KEY (idOrdenContractual) REFERENCES Bienes.OrdenContractual (idOrdenContractual)
);

CREATE TABLE Bienes.ItemEntradaALmacen
(
    idItemEntradaALmacen INTEGER NOT NULL,
    idBien INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    idEntradaAlmacen INTEGER NOT NULL,
    PRIMARY KEY (idItemEntradaALmacen),
    CONSTRAINT FK_ItemEntradaALmacen_EntradaAlamcen FOREIGN KEY (idEntradaAlmacen) REFERENCES Bienes.EntradaAlmacen (idEntradaAlmacen)
);

CREATE TABLE Bienes.OrdenContractual
(
    idOrdenContractual INTEGER NOT NULL,
    fechaOrden DATETIME NOT NULL,
    montoTotal DECIMAL NOT NULL,
    fechaEntrega DATETIME NOT NULL,
    idCotizacion INTEGER NOT NULL,
    nit INTEGER NOT NULL,
    nombreDeProveedor VARCHAR(45),
    idItem INTEGER NOT NULL,
    idSolicitudCompra INTEGER NOT NULL,
    PRIMARY KEY (idOrdenContractual),
    CONSTRAINT FK_OrdenContractual_Item FOREIGN KEY (idItem) REFERENCES Bienes.Item (idItem)
);

CREATE TABLE Bienes.Compras 
(
    idCompra INTEGER NOT NULL,
    fecha DATETIME NOT NULL,
    idOrdenContractual INTEGER NOT NULL,
    idCotizacion INTEGER NOT NULL,
    idSolicitudCompra INTEGER NOT NULL,
    PRIMARY KEY (idCompra),
    CONSTRAINT FK_Compras_OrdenContractual FOREIGN KEY (idOrdenContractual) REFERENCES Bienes.OrdenContractual (idOrdenContractual),
    CONSTRAINT FK_Compras_Cotizacion FOREIGN KEY (idCotizacion) REFERENCES Bienes.Cotizacion (idCotizacion)
);

CREATE TABLE Bienes.Cotizacion 
(
    idCotizacion INTEGER NOT NULL,
    idProveedor INTEGER NOT NULL,
    PRIMARY KEY (idCotizacion),
    CONSTRAINT FK_Cotizacion_Proveedores FOREIGN KEY (idProveedor) REFERENCES Bienes.Proveedores (idProveedor)
);

CREATE TABLE Bienes.ItemSalidaAlmacen 
(
    idItemSalidaAlmacen INTEGER NOT NULL,
    idBien INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    idSalidaAlmacen INTEGER NOT NULL,
    PRIMARY KEY (idItemSalidaAlmacen),
    CONSTRAINT FK_ItemSalidaAlmacen_SalidaAlamcen FOREIGN KEY (idSalidaAlmacen) REFERENCES Bienes.SalidaAlmacen (idSalidaAlmacen)
);