CONSULTA 1

SELECT apellido1, apellido2 , nombre FROM persona WHERE tipo = "alumno";

CONSULTA 2

SELECT apellido1, apellido2 , nombre FROM persona WHERE tipo = "alumno" AND telefono IS NULL;

CONSULTA 3

SELECT apellido1, apellido2 , nombre FROM persona WHERE tipo = "alumno" AND fecha_nacimiento LIKE "%1999%";


CONSULTA 4

SELECT apellido1, apellido2 , nombre FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%k";

CONSULTA 5

SELECT nombre FROM universidad.asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

CONSULTA 6

SELECT apellido1, apellido2, persona.nombre, departamento.nombre as departamento
FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor
INNER JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = "profesor"
ORDER BY apellido1, apellido2, nombre;

CONSULTA 7

SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM persona
INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE persona.nif = '26902806M';

CONSULTA 8

SELECT departamento.nombre
FROM departamento
JOIN profesor ON departamento.id = profesor.id_departamento
JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
JOIN grado ON asignatura.id_grado = grado.id
WHERE  grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

CONSULTA 9

SELECT persona.nombre, persona.apellido1, persona.apellido2
FROM persona
JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE  curso_escolar.anyo_inicio = "2018" AND curso_escolar.anyo_fin = "2019" group by persona.nombre;


CONSULTAS LEFT Y RIGHT JOIN 

CONSULTA 1 

SELECT departamento.nombre, persona.apellido2, persona.apellido1,  persona.nombre
FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre, persona.apellido2, persona.apellido1, persona.nombre;

CONSULTA 2

SELECT departamento.nombre, persona.apellido2, persona.apellido1,  persona.nombre
FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
WHERE departamento.nombre IS NULL ;

CONSULTA 3

SELECT departamento.nombre
FROM departamento
LEFT JOIN profesor ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento IS NULL;


CONSULTA 4 

SELECT persona.nombre, persona.apellido1, persona.apellido2 
FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
WHERE persona.id IS NOT NULL 
AND profesor.id_profesor NOT IN ( SELECT asignatura.id_profesor 
FROM asignatura JOIN profesor ON asignatura.id_profesor = profesor.id_profesor);

CONSULTA 5

SELECT asignatura.nombre
FROM asignatura
LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;


CONSULTA 6

SELECT departamento.nombre
FROM departamento
WHERE departamento.id NOT IN (
SELECT DISTINCT profesor.id_departamento
  FROM profesor
  INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
  INNER JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
  INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
)

CONSULTAS RESUMEN

CONSULTA 1

SELECT COUNT(persona.id) 
FROM persona
WHERE tipo LIKE "alumno";

CONSULTA 2

SELECT COUNT(persona.id) 
FROM persona
WHERE fecha_nacimiento LIKE "%1999%" AND tipo LIKE "alumno";

CONSULTA 3

SELECT  departamento.nombre, COUNT(profesor.id_profesor) AS numero_profesores
FROM departamento
INNER JOIN profesor ON departamento.id = profesor.id_departamento
INNER JOIN persona ON profesor.id_profesor = persona.id
WHERE profesor.id_profesor IS NOT NULL
GROUP BY departamento.nombre ORDER BY numero_profesores;

CONSULTA 4

SELECT  departamento.nombre, COUNT(profesor.id_profesor) AS numero_profesores
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
LEFT JOIN persona ON profesor.id_profesor = persona.id
GROUP BY departamento.nombre ORDER BY numero_profesores;

CONSULTA 5

SELECT  grado.nombre, COUNT(asignatura.id) AS numero_asignaturas
FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
ORDER BY numero_asignaturas;




