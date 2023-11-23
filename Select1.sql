USE Biblioteca;

-- Todos los clientes que tienen un titular en su cuenta
SELECT * FROM Cliente
	WHERE id_Cliente_tit > 0;

-- Todos los clientes que no tienen titular en su cuenta
SELECT * FROM Cliente
	WHERE id_Cliente_tit IS NULL;
    
-- Código y título de los libros del proveedor con CUIT 33665465410 ordenado por código
SELECT cod_Libro AS Codigo, titulo FROM Libro
	WHERE CUIT_PROV = '33665465410'
    ORDER BY cod_libro;

-- Código y titulo de los libros que empiezan con la letra M
SELECT cod_Libro AS Codigo, titulo FROM Libro
	WHERE  titulo LIKE 'M%';

-- Fecha de cada alquiler y el importe cobrado
SELECT fecha AS Fecha_Alquiler, importe FROM Alquiler;

-- Todos los alquileres del mes de enero y febrero, ordenados por fecha de alquiler
SELECT * From Alquiler
		WHERE MONTH(fecha) IN (1,2)
        ORDER BY fecha;

--  Todos los alquileres que duraron mas de un día
SELECT * FROM Alquiler
	WHERE DATEDIFF(f_devolucion, fecha) > 1;
    
--  Id de los clientes que alquilaron el libro A6
SELECT id_Cliente FROM Alquiler
	WHERE cod_Libro = 6;
