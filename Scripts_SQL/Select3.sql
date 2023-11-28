USE Biblioteca;

-- Cantidad total de libros
SELECT COUNT(*) AS CantidadLibros FROM Libro;

-- Cuantos libros alquiló cada cliente. Ordenar la información por nombre del cliente
SELECT COUNT(*) as CantidadLibrosAlquilados, nombre as NombreCliente FROM Libro L
JOIN Alquiler A ON A.cod_Libro = L.cod_libro
JOIN Cliente C ON C.id_Cliente = A.id_Cliente
GROUP BY C.nombre
ORDER BY C.nombre;

-- Cuantos libros distintos alquiló cada cliente
SELECT COUNT(DISTINCT cod_Libro) AS LibrosDistintosAlquilados FROM Alquiler;

-- Valor máximo cobrado en los alquileres
SELECT MAX(importe) AS ValorMaximo FROM Alquiler;

-- Clientes han devuelto el libro con una demora de mas de dos días
SELECT COUNT(*) FROM Cliente C
JOIN Alquiler A ON A.id_Cliente = C.id_Cliente
WHERE DATEDIFF(A.f_devolucion,A.fecha) > 2;

-- Importe total de alquileres recaudado por libro, ordenado por título de libro
SELECT SUM(A.importe) AS TotalRecaudado, L.titulo FROM Alquiler A
JOIN Libro L ON L.cod_Libro = A.cod_Libro
GROUP BY L.titulo
ORDER BY L.titulo;

-- Importe total de alquileres recaudado por género
SELECT SUM(A.importe) AS TotalRecaudado, G.descripcion AS Genero FROM Alquiler A
JOIN Libro L ON L.cod_Libro = A.cod_Libro
JOIN Genero G ON G.idGenero = L.idGenero
GROUP BY G.descripcion;

-- Cantidad de libros que nunca se alquiló
SELECT COUNT(*) AS LibrosSinAlquilar 
FROM Libro L
LEFT JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
WHERE A.cod_Libro IS NULL;

-- Cantidad de libros que nunca se alquiló, por género
SELECT COUNT(*) AS LibrosSinAlquilar, G.descripcion 
FROM Libro L
LEFT JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
JOIN Genero G ON L.idGenero = G.idGenero
WHERE A.cod_Libro IS NULL
GROUP BY G.descripcion;

-- Cantidad y el importe de alquileres recaudado para el género “Infantil”
SELECT COUNT(*) AS Cantidad, SUM(A.importe) AS TotalRecaudado
FROM Libro L
JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
JOIN Genero G ON L.idGenero = G.idGenero
WHERE G.abreviatura = 'INF';

-- Máximo importe abonado por cada cliente
SELECT C.nombre, MAX(A.importe) FROM Alquiler A
JOIN Cliente C ON A.id_Cliente = C.id_Cliente
GROUP BY C.nombre;

-- Cuantos géneros no tienen ningún libro en la biblioteca
SELECT COUNT(*) AS GeneroSinLibro FROM Genero G
LEFT JOIN Libro L  ON G.idGenero = L.idGenero
WHERE L.idGenero IS NULL;

-- Cuantos libros y de cuantos géneros distintos provee cada proveedor
SELECT P.CUIT AS CUIT_Proveedor, COUNT(*) AS Libros, COUNT(DISTINCT L.idGenero) AS GenerosDistintos 
FROM Libro L
JOIN Proveedor P ON L.CUIT_PROV = P.CUIT
GROUP BY P.CUIT;

-- Cantidad de alquileres y el importe recaudado por mes en alquileres durante todo el año 2021 (FUNCION MONTH)
SELECT MONTH(A.fecha) AS Mes, COUNT(*) AS CantidadAlquiler, SUM(A.importe) AS ImporteRecaudado
FROM Alquiler A
WHERE YEAR(A.fecha) = 2021
GROUP BY Mes;

--  Cantidad de veces que se alquiló cada libro (informar cero para los que nunca se alquilaron)
SELECT L.titulo AS Libro, COUNT(A.cod_Libro) AS VecesQueSeAlquilo 
FROM Libro L
LEFT JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
GROUP BY L.titulo;
