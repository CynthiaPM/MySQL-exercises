CONSULTA 1

SELECT nombre FROM producto;

CONSULTA 2

SELECT nombre, precio FROM producto;

CONSULTA 3

SELECT * FROM producto;

CONSULTA 4

SELECT nombre,precio, CAST(precio * 1.10 AS DECIMAL(5,2)) From producto;

CONSULTA 5

SELECT nombre AS "nombre del producto",precio AS "precio en euros", 
CAST(precio * 1.10 AS DECIMAL(5,2)) AS "precio en dolares estadounidenses" From producto;

CONSULTA 6

SELECT UPPER(nombre), precio From producto;

CONSULTA 7

SELECT LOWER(nombre), precio From producto;

CONSULTA 8

SELECT nombre,UPPER(substring(nombre,1,2)) From fabricante;

CONSULTA 9

SELECT nombre, ROUND(precio) From producto;

CONSULTA 10

SELECT nombre, truncate(precio,0) FROM producto;

CONSULTA 11

SELECT  codigo_fabricante from producto;

CONSULTA 12

SELECT DISTINCT codigo_fabricante from producto;

CONSULTA 13

SELECT nombre FROM fabricante ORDER BY nombre ASC;

CONSULTA 14

SELECT nombre FROM fabricante ORDER BY nombre DESC;

CONSULTA 15

SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

CONSULTA 16

SELECT * FROM fabricante LIMIT 5;

CONSULTA 17

SELECT * FROM fabricante LIMIT 3,2;

CONSULTA 18

SELECT nombre,precio FROM producto ORDER BY precio ASC LIMIT 1;

CONSULTA 19

SELECT nombre,precio FROM producto ORDER BY precio DESC LIMIT 1;

CONSULTA 20

SELECT nombre FROM producto WHERE codigo_fabricante LIKE "2";

CONSULTA 21

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

CONSULTA 22

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;

CONSULTA 23

SELECT producto.codigo, producto.nombre, producto.precio, producto.codigo_fabricante,
fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

CONSULTA 24

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY precio ASC LIMIT 1;

CONSULTA 25

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY precio DESC LIMIT 1;

CONSULTA 26

SELECT producto.nombre, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE "Lenovo";

CONSULTA 27

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre = "Crucial" AND precio > 200 ;

CONSULTA 28

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard" OR  
fabricante.nombre = "Seagate";

CONSULTA 29

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre IN ("Asus", "Hewlett-Packard", "Seagate") ;

CONSULTA 30

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre LIKE "%e";

CONSULTA 31 

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre LIKE "%w%";

CONSULTA 32

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  producto.precio >= 180 ORDER BY precio DESC, producto.nombre ASC ;

CONSULTA 33

SELECT fabricante.codigo, fabricante.nombre
FROM fabricante
INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.codigo;

CONSULTA 34

SELECT producto.nombre, fabricante.nombre
FROM fabricante
LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;

CONSULTA 35

SELECT producto.nombre, fabricante.nombre
FROM fabricante
LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.codigo IS NULL
ORDER BY fabricante.nombre;

CONSULTA 36

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE fabricante.codigo = (SELECT codigo FROM fabricante WHERE nombre = "lenovo")
;

CONSULTA 37
SELECT producto.codigo, producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.precio = ( SELECT MAX(precio) FROM producto WHERE
 codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "lenovo"))
;


CONSULTA 38

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre LIKE "Lenovo" ORDER BY precio DESC lIMIT 1;

CONSULTA 39

SELECT producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE  fabricante.nombre LIKE "Hewlett-Packard" ORDER BY precio ASC lIMIT 1;

CONSULTA 40

SELECT producto.codigo, producto.nombre, producto.precio, fabricante.nombre
FROM producto, fabricante
WHERE producto.precio >= ( SELECT MAX(precio) FROM producto WHERE
 codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "lenovo"))
 ;

 CONSULTA 41

 SELECT nombre, precio
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE 
nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto);