USE Biblioteca;

-- Informar los géneros que no tuvieron libros alquilados
SELECT DISTINCT G.descripcion
FROM Genero G
JOIN Libro L ON G.idGenero = L.idGenero
WHERE NOT EXISTS (
    SELECT 1
    FROM Alquiler A
    WHERE L.cod_Libro = A.cod_Libro
);

-- Informar los géneros que tienen libros pero que no registran alquileres
SELECT DISTINCT G.descripcion
FROM Genero G
JOIN Libro L ON G.idGenero = L.idGenero
WHERE NOT EXISTS (
    SELECT 1
    FROM Alquiler A
    LEFT JOIN Libro L2 ON L2.cod_Libro = A.cod_Libro
    WHERE L2.idGenero = G.idGenero AND A.cod_Libro IS NOT NULL
);

-- Se desea conocer los clientes que devolvieron el libro con una demora mayor al promedio de los alquileres.
SELECT DISTINCT C.nombre
FROM Cliente C
JOIN Alquiler A ON C.id_Cliente = A.id_Cliente
WHERE A.f_devolucion > (
    SELECT AVG(DATEDIFF(A2.fecha, A2.f_devolucion))
    FROM Libro L
    JOIN Alquiler A2 ON L.cod_Libro = A2.cod_Libro
    WHERE A2.id_Cliente = C.id_Cliente
);

-- Informar los libros que no fueron alquilados por el cliente con DNI 2222
SELECT L.titulo AS NOMBRE FROM Libro L
LEFT JOIN Alquiler A ON L.cod_Libro = A.cod_Libro
WHERE A.cod_Libro IS NULL
AND EXISTS (
	SELECT 1 FROM Cliente C
	JOIN Alquiler A2 ON C.id_Cliente = A2.id_Cliente
	WHERE C.nro_doc = '2222');

-- Informar el género con mayor recaudación
SELECT DISTINCT G.descripcion
FROM Genero G
JOIN Libro L ON G.idGenero = L.idGenero
WHERE G.idGenero = (
    SELECT G2.idGenero
    FROM Genero G2
    JOIN Libro L2 ON G2.idGenero = L2.idGenero
    JOIN Alquiler A ON L2.cod_Libro = A.cod_Libro
    GROUP BY G2.idGenero
    ORDER BY SUM(A.importe) DESC
    LIMIT 1
);
    
-- Se desea conocer el detalle de los libros que nunca se alquilaron
SELECT *
FROM Libro L
WHERE NOT EXISTS (
    SELECT 1
    FROM Alquiler A
    WHERE L.cod_Libro = A.cod_Libro OR A.cod_Libro IS NULL
);


-- Se desea conocer el detalle de los clientes que nunca han realizado alquileres.
SELECT *
FROM Cliente C
WHERE NOT EXISTS (
    SELECT 1
    FROM Alquiler A
    WHERE C.id_Cliente = A.id_Cliente
);
    
-- Informar los códigos de libros coincidentes entre el cliente con DNI 2222 y DNI 3333
SELECT A1.cod_Libro
FROM Alquiler A1
JOIN Cliente C1 ON A1.id_Cliente = C1.id_Cliente
WHERE C1.nro_doc = '2222' AND EXISTS (
    SELECT 1
    FROM Alquiler A2
    JOIN Cliente C2 ON A2.id_Cliente = C2.id_Cliente
    WHERE C2.nro_doc = '3333' AND A1.cod_Libro = A2.cod_Libro
);

-- Informar los clientes que realizaron mas del promedio de alquileres
SELECT C.id_Cliente, C.nombre
FROM Cliente C
JOIN Alquiler A ON C.id_Cliente = A.id_Cliente
GROUP BY C.id_Cliente, C.nombre
HAVING COUNT(A.id_Alquiler) > (
    SELECT AVG(COUNT(id_Alquiler))
    FROM Alquiler
    GROUP BY id_Cliente
);