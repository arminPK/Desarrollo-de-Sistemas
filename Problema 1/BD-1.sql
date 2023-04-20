DROP DATABASE IF EXISTS Encargos;
CREATE DATABASE Encargos;
CREATE TABLE Encargos.Cliente
( 
    idCliente INT NOT NULL PRIMARY KEY, 
    

);
CREATE TABLE Encargos.Pedido
(
    idPedido int not null PRIMARY KEY
);
CREATE TABLE Encargos.Direcciones
(
    idDireccion int not null PRIMARY KEY
);
CREATE TABLE Encargos.Articul
( 
    idArticulo int not null PRIMARY KEY
);
