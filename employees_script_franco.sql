/*A.Selecciona todas las filas de la tabla blood_types.*/
SELECT * FROM blood_types LIMIT 100;

/*B.Selecciona solo los nombres de los tipos de sangre.*/
SELECT name FROM blood_types LIMIT 100;

/*C.Selecciona el nombre y la abreviatura de los tipos de sangre que tienen
ID mayor que 3.*/
SELECT name, abbreviation  FROM blood_types WHERE id > 3 LIMIT 100;

/*D.Cuenta el número total de tipos de sangre en la tabla.*/
SELECT COUNT(*) AS total_of_blood_types FROM blood_types LIMIT 100;

/*E.Encuentra la abreviatura más larga entre todos los tipos de sangre.*/
SELECT abbreviation FROM (SELECT abbreviation FROM blood_types ORDER BY
LENGTH(abbreviation) DESC LIMIT 1) AS max_abbreviation;

/*F.Selecciona todas las filas de la tabla document_types.*/
SELECT * FROM document_types LIMIT 100;

/*G.Selecciona solo los nombres de los tipos de documentos.*/
SELECT name FROM document_types LIMIT 100;

/*H.Selecciona el nombre y la abreviatura de los tipos de documentos cuya descripción
contenga la palabra "identificación".*/
SELECT name, abbreviation  FROM document_types WHERE description = "identificación"
OR description = "identificacion" LIMIT 100;

/*I.Selecciona todos los empleados de la tabla employees.*/
SELECT * FROM employees LIMIT 100;

/*J.Selecciona solo los nombres y apellidos de los empleados.*/
SELECT name,last_name FROM employees LIMIT 100;

/*J.• Selecciona los empleados que tienen un correo electrónico único.*/
SELECT email FROM employees GROUP BY email HAVING COUNT(*) = 1 LIMIT 100;

/*K.Selecciona los empleados cuyos nombres comiencen con la letra 'A'.*/
SELECT name FROM employees WHERE LEFT(name,1) = "a" LIMIT 100;

/*L.Selecciona los empleados que tengan más de 30 años.*/
SELECT TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS employees_age FROM employees LIMIT 100;

/*M.Selecciona los empleados que tengan un número de teléfono de respaldo especificado.*/
SELECT name,last_name,backup_phone FROM employees WHERE backup_phone = '(220) 574-0027' LIMIT 100;

/*N.Selecciona los nombres y correos electrónicos de los empleados que tengan un tipo
de género específico.*/
SELECT name,email FROM employees WHERE type_gender = 1 LIMIT 100;

/*O.Selecciona los empleados que tengan un tipo de documento y un grupo sanguíneo específicos.*/
SELECT name, blood_type, type_document_id FROM employees WHERE blood_type = 2 AND type_document_id = 1;

/*P.Selecciona los empleados que tengan alergias o dependencia de medicamentos
especificadas.*/
SELECT name, allergies, medication_dependence FROM employees WHERE allergies LIKE "et aliquid voluptatem sit 
reiciendis. esse minima eveniet rerum architecto praesentium rem perspiciatis reprehenderit. quia aut sunt 
veritatis impedit rem aut dolor.%" OR medication_dependence LIKE "%x%" LIMIT 100;

/*Q.Cuenta el número total de empleados en la tabla.*/
SELECT COUNT(*) AS total_of_employees FROM employees LIMIT 100;

/*R.Encuentra el empleado más joven y el empleado más viejo.*/
SELECT MIN(TIMESTAMPDIFF(YEAR, birthdate, CURDATE())) AS min_age_employee FROM employees LIMIT 100;
SELECT MAX(TIMESTAMPDIFF(YEAR, birthdate, CURDATE())) AS max_age_employee FROM employees LIMIT 100;

/*S.Calcula el promedio de edades de todos los empleados.*/
SELECT AVG(TIMESTAMPDIFF(YEAR, birthdate, CURDATE())) AS average_age_employees FROM employees LIMIT 100;

/*T.Obten el nombre del tipo de documento y el nombre del género para cada empleado.*/
SELECT employees.name, employees.last_name, document_types.name AS document_type, gender_types.name
AS gender FROM employees INNER JOIN document_types ON employees.type_document_id = document_types.id
INNER JOIN gender_types ON employees.type_gender = gender_types.id LIMIT 100;

/*U.Obten el nombre del rol y el tipo de sangre para cada empleado.*/
SELECT employees.name, employees.last_name, roles.name AS role, blood_types.name
AS blood_type FROM employees INNER JOIN roles ON employees.role_id = roles.id
INNER JOIN blood_types ON employees.blood_type = blood_types.id LIMIT 100;

/*V.Actualiza el número de teléfono de respaldo para un empleado específico.*/
UPDATE employees SET backup_phone = 2 WHERE id = 112 LIMIT 100;
SELECT name, last_name, backup_phone FROM employees WHERE id = 112 LIMIT 100;

/*W.Elimina a un empleado que tenga una cuenta de correo electrónico duplicada.*/
/*Tomado de CHATGPT, ni idea de como se hace*/
DELETE FROM employees WHERE id IN (SELECT id FROM (SELECT id,ROW_NUMBER() 
OVER (PARTITION BY email ORDER BY id) AS row_num FROM employees) AS t WHERE row_num > 1);







