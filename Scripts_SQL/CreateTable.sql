CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Cliente (
    id_Cliente SMALLINT AUTO_INCREMENT PRIMARY KEY,
    tipo_doc VARCHAR(5),
    nro_doc SMALLINT,
    nombre VARCHAR(20),
    telefono VARCHAR(20),
    domicilio VARCHAR(30),
    edad SMALLINT,
    id_Cliente_tit SMALLINT,
    FOREIGN KEY (id_Cliente_tit) REFERENCES Cliente(id_Cliente)
);

CREATE TABLE Proveedor (
    CUIT VARCHAR(30) PRIMARY KEY,
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    telefono VARCHAR(15),
    mail VARCHAR(50)
);

CREATE TABLE Libro(
	cod_Libro SMALLINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(20),
    CUIT_PROV VARCHAR(30),
    FOREIGN KEY (CUIT_PROV) REFERENCES Proveedor (CUIT)
);

CREATE TABLE Alquiler(
	cod_Libro SMALLINT,
    id_Cliente SMALLINT,
    fecha DATETIME,
    FOREIGN KEY (cod_Libro) REFERENCES Libro (cod_Libro),
    FOREIGN KEY (id_Cliente) REFERENCES Cliente (id_Cliente)
);
