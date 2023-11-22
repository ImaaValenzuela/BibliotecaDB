USE Biblioteca;

CREATE TABLE Localidad(
	id SMALLINT AUTO_INCREMENT PRIMARY KEY,
    cod_postal VARCHAR(6),
    descripcion VARCHAR(20)
);

CREATE TABLE Genero(
	idGenero SMALLINT AUTO_INCREMENT PRIMARY KEY,
    abreviatura VARCHAR(5),
    descripcion VARCHAR(20)
);
