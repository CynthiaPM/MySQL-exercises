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
