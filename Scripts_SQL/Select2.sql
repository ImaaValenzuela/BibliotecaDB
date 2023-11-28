USE Biblioteca;

-- Todos los libros y la descripción del género de cada uno
SELECT L.titulo, G.descripcion From Libro L
	LEFT JOIN Genero G ON L.idGenero = G.idGenero;
    
-- Informar Nombre, Fecha de Nacimiento y Descripción de la localidad, de todos los clientes de San Justo y Ramos Mejía
SELECT C.nombre, C.f_nacimiento, L.descripcion FROM Cliente C
	LEFT JOIN Localidad L ON C.idLocalidad = L.id
    WHERE L.descripcion = 'San Justo' OR L.descripcion = 'Ramos Mejia';

-- Nombre y género de los libros que fueron alquilados en algún momento, ordenados por descripción del género y fecha de alquiler
SELECT L.titulo AS Titulo, G.descripcion AS Genero, A.fecha AS FechaAlquiler FROM Libro L
	JOIN Genero G ON L.idGenero = G.idGenero
    LEFT JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
    WHERE A.f_devolucion IS NOT NULL
    ORDER BY G.descripcion, A.fecha;

-- Nombre y género de los libros que nunca fueron alquilados
SELECT L.titulo AS Titulo, G.abreviatura AS Genero FROM Libro L
	JOIN Genero G ON L.idGenero = G.idGenero
    LEFT JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
    WHERE A.fecha IS NULL;
    
-- Nombre de los clientes que tardaron mas de un día en devolver algún libro alquilado
SELECT C.nombre AS Nombre FROM Cliente C
	JOIN Alquiler A ON C.id_Cliente = A.id_Cliente
    WHERE DATEDIFF(f_devolucion, fecha) > 1;
    
-- Nombre del libro, y el nombre del proveedor que la provee, ordenado por nombre del proveedor
SELECT L.titulo, P.nombre FROM Libro L
	JOIN Proveedor P ON L.CUIT_PROV = P.CUIT
    ORDER BY P.nombre;

-- Tipo y número de documento, de los clientes que alquilaron algún libro del genero infantil
SELECT C.tipo_doc AS TipoDocumento, C.nro_doc AS NumeroDocumento FROM Cliente C
	JOIN Alquiler A ON C.id_Cliente = A.id_Cliente
	JOIN Libro L ON A.cod_Libro = L.cod_Libro
	JOIN Genero G ON G.idGenero = L.idGenero
    WHERE G.abreviatura = 'INF';

-- Género, Nombre y fecha de alquiler, de todos los libros alquilados, ordenado por género, y nombre
SELECT G.descripcion AS Genero, L.titulo AS Nombre, A.fecha AS FechaAlquiler FROM Genero G
	JOIN Libro L ON G.idGenero = L.idGenero
    LEFT JOIN Alquiler A ON A.cod_Libro = L.cod_Libro
    WHERE A.fecha IS NOT NULL
    ORDER BY G.descripcion, L.titulo;

-- Nombre de libro, fecha de alquiler y nombre de cliente, de todos los alquileres del mes de Septiembre 2022
SELECT L.titulo AS Nombre, A.fecha AS FechaAlquiler, C.nombre AS NombreCliente FROM Libro L
	JOIN Alquiler A ON A.cod_Libro = L.cod_Libro
    LEFT JOIN Cliente C ON C.id_Cliente = A.id_Cliente
    WHERE MONTH(A.fecha) IN (9) AND YEAR(A.fecha) IN (2022);

-- Para cada cliente, informar el id y nombre del titular de su cuenta
SELECT C.id_Cliente AS ID, C.nombre AS Titular FROM Cliente C
	JOIN Cliente CT ON CT.id_Cliente_tit = C.id_Cliente;
    
-- Para cada cliente, informar el id y nombre del titular de su cuenta, si es que tiene
SELECT C.id_Cliente AS ID, C.nombre AS Titular FROM Cliente C
	JOIN Cliente CT ON CT.id_Cliente_tit = C.id_Cliente
    WHERE C.id_Cliente_tit IS NOT NULL;


-- Nombre de los libros, alquilados del mes de Septiembre, que hayan sido realizados por los clientes de San Justo que viven en la calle Arieta
SELECT L.titulo AS Nombre FROM Libro L
	JOIN Alquiler A ON A.cod_Libro = L.cod_Libro
    JOIN Cliente C ON C.id_Cliente = A.id_Cliente
    JOIN Localidad LC ON LC.id = C.idLocalidad
    WHERE MONTH(A.fecha) IN (9) 
		AND  LC.descripcion = 'San justo' 
        AND C.direccion_calle = 'Arieta';
    