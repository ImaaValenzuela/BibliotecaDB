INSERT INTO Localidad (cod_postal, descripcion) VALUES 
	('1753','Villa Luzuriaga'),
    ('1752','Lomas del Mirador'),
    ('1754','San Justo'),
    ('1778','Ciudad Evita'),
    ('1785','Aldo Bonzi'),
    ('1768','Ciudad Madero'),
    ('1704','Ramos Mejia');

INSERT INTO Proveedor VALUES
	(23252221117,'Distribuidora1','Arieta 1555', '54662200','hola@htomail.com'),
    (45254544571,'Juan Perez', ' ','23523256', ' '),
    (33665465410,'Andres Gonzalez',' ','33665544','andres@gmail.com');

INSERT INTO Cliente (tipo_doc, nro_doc, nombre, telefono, direccion_calle, direccion_nro, direccion_piso, direccion_depto, idLocalidad, f_nacimiento, id_Cliente_tit)  VALUES
	('DNI', 1111, 'Juan', '111223344','Arieta', '1522','1','A',1,'1995-05-01',null),
    ('DNI', 2222, 'Andres', '111234556', 'Arieta', '3522', ' ',' ',3,'1985-12-18',1),
    ('DNI', 3333, 'Marcela', '111223355', 'Avenida de Mayo', '522', '4', 'C', 7, '1999-06-03',1),
    ('DNI', 4444, 'Jose', '111234577', 'Bolivar', '650', '6', '41', 7, '1977-02-04', null),
    ('DNI', 5555, 'Diego', '111223399', 'Rosales', '322', '1', 'A', 7, '1979-09-08', null),
    ('DNI', 6666, 'Mauro', ' ', 'Republica de Chile', '3052', ' ', ' ', 3,'1996-11-05', null),
    ('DNI', 7777, 'Karina', ' ', 'Jujuy', '3501', ' ', ' ', 3, '1999-08-10', 6),
    ('DNI', 8888, 'Valeria', '111234556','Alsina', '155', '3', 'C', 7, '1987-04-05', null),
    ('DNI', 9999, 'Lara', '111234556', 'Republica de Chile', '155',' ', ' ', 1, '1999-09-10', null);
    
INSERT INTO Genero (abreviatura, descripcion) VALUES
	('AUT', 'Autoayuda'),
    ('COMR', 'Comedia Romantica'),
    ('ACC', 'Accion'),
    ('AVE', 'Aventura'),
    ('DRA', 'Drama'),
    ('TER', 'Terror'),
    ('CFIC', 'Ciencia Ficcion'),
    ('BEL', 'Belica'),
    ('INF', 'Infantil'),
    ('SUSP', 'Suspenso');
    
INSERT INTO Libro(titulo, idGenero, CUIT_PROV) VALUES
	('Casa de Muñecas', 5,'23252221117'),
    ('El silencio de nuestras palabras', 5,'23252221117'),
    ('La muerte', 5,'33665465410'),
    ('La metamorfosis', 5,'33665465410'),
    ('La maquina del tiempo', 7,'45254544571'),
    ('En las montañas de la locura', 7,'45254544571'),
    ('Soy Leyenda', 7,'45254544571'),
    ('El fin de la eternidad', 7,'45254544571'),
    ('La chica del tren', 10,'33665465410'),
    ('El psicoanalista', 10,'33665465410'),
    ('No salgas de noche', 10,'23252221117'),
    ('El poder del ahora', 1,'23252221117'),
    ('Poder sin limites', 1,'33665465410'),
    ('Vacio emocional', 1,'33665465410'),
    ('Desembarco en las georgias', 8,'23252221117'),
    ('Las batallas del mundo', 8,'23252221117'),
    ('Linea de fuego', 8,'23252221117'),
    ('La isla del tesoro', 4,'33665465410'),
    ('La casa del peligro', 4,'33665465410'),
    ('La leyenda de los dragones', 4,'33665465410'),
    ('El mounstruo de colores', 9,'23252221117'),
    ('Alicia', 9,'23252221117');
    
INSERT INTO Alquiler (cod_Libro, id_Cliente, fecha, f_devolucion, importe) VALUES
	(5, 2, '2021-05-02','2021-05-03', 500),
    (6, 2, '2023-07-14','2023-07-16', 1000),
    (12, 3, '2023-07-20','2023-07-23', 1500),
    (17, 4, '2023-05-21','2023-05-23', 1000),
    (20, 3, '2023-04-12','2023-04-14', 100),
    (17, 3, '2023-05-14','2023-05-15', 500),
    (20, 7, '2023-01-02','2023-01-03', 500),
    (12, 8, '2023-07-23','2023-07-25', 1000),
    (19, 3, '2023-07-25','2023-07-26', 500),
    (7, 7, '2023-09-21','2023-09-24', 1500),
    (8, 2, '2023-03-11','2023-03-13', 1000),
    (20, 2, '2023-06-24','2023-06-25', 500),
    (12, 7, '2023-06-21','2023-06-22', 500),
    (7, 8, '2023-05-11','2023-05-13', 1000),
    (6, 9, '2023-02-01','2023-02-03', 1000),
    (5, 7, '2023-07-01','2023-07-02', 500);