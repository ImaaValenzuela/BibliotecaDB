USE Biblioteca;

ALTER TABLE Cliente 
	ADD COLUMN direccion_calle VARCHAR(20), 
	ADD COLUMN direccion_nro VARCHAR(8), 
	ADD COLUMN direccion_depto VARCHAR(5), 
    ADD COLUMN direccion_piso VARCHAR(5);

ALTER TABLE Cliente
	DROP COLUMN edad;
    
ALTER TABLE Cliente
	ADD COLUMN f_nacimiento DATETIME;

ALTER TABLE Cliente
	ADD COLUMN idLocalidad SMALLINT,
	ADD FOREIGN KEY (idLocalidad) REFERENCES Localidad (id);

ALTER TABLE Libro
	ADD COLUMN idGenero SMALLINT,
    ADD FOREIGN KEY (idGenero) REFERENCES Genero (idGenero);

ALTER TABLE Alquiler
	ADD COLUMN f_devolucion DATETIME,
    ADD COLUMN importe SMALLINT;

ALTER TABLE Alquiler
	ADD COLUMN id_Alquiler SMALLINT AUTO_INCREMENT,
	ADD PRIMARY KEY (id_Alquiler);