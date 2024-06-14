				/*CRUD with SQL*/

		/*CREATE: Register a new coder into the database*/

INSERT INTO coders (nombre , apellido , tipo_de_identificacion , 
numero_de_identificacion , fecha_de_nacimiento , clan, correo_electronico, 
numero_de_telefono, numero_de_emergencia, direccion, team_leader_desarrollo)
VALUES ('franco', 'blandon', 'cedula de ciudadania', '1023592055', '2004-05-11',
'gates','franccoina@gmail.com','3504691236','3504691236','cl 9 # 12 - 6',
'javier combita');

		/*READ: Selecting things from the database*/

/*1. Selecciona todos los campos de todos los coders.*/
SELECT * FROM coders;

/*2. Selecciona los nombres y apellidos de todos los coders.*/
SELECT nombre, apellido FROM coders;

/*3. Selecciona los coders cuyo clan sea gates.*/
SELECT * FROM coders WHERE clan = 'gates';

/*4. Selecciona los coders nacidos después del 1 de enero de 1990.*/
SELECT * FROM coders WHERE fecha_de_nacimiento > '1990-01-01';

/*5. Selecciona los nombres y correos electrónicos de todos los coders.*/
SELECT nombre,correo_electronico FROM coders;

/*6. Selecciona los coders cuyo número de identificación termina en 7.*/
SELECT * FROM coders WHERE numero_de_identificacion LIKE '%7';

/*7. Selecciona los coders cuyo team_leader_desarrollo es carlos gomez.*/
SELECT * FROM coders WHERE team_leader_desarrollo = 'carlos gomez';

/*8. Selecciona los nombres y clanes de los coders ordenados por nombre en orden
ascendente.*/
SELECT nombre,clan FROM coders ORDER BY nombre ASC;

/*9. Selecciona los coders cuya direccion contenga la palabra cra.*/
SELECT * FROM coders WHERE direccion LIKE '%cra%';

/*10. Selecciona los coders con correo_electronico que terminen en @example.com.*/
SELECT * FROM coders WHERE correo_electronico LIKE '%@example.com';

/*11. Cuenta el número de coders en cada clan.*/
SELECT COUNT(*) AS total_coders FROM coders GROUP BY clan;

/*12. Selecciona los coders que no tienen numero_de_emergencia registrado.*/
SELECT * FROM coders WHERE numero_de_emergencia IS NULL ;

/*13. Selecciona el nombre, apellido y dirección de los coders cuyo clan no 
es gates ni dell.*/
SELECT nombre,apellido,direccion FROM coders WHERE clan != 'gates'
AND clan != 'dell';

SELECT nombre,apellido,direccion FROM coders WHERE clan NOT LIKE '%gates%'
AND clan NOT LIKE '%dell%'; 

SELECT nombre,apellido,direccion FROM coders WHERE clan NOT IN ('gates','dell'); 

/*14. Selecciona el nombre y el número de teléfono de los coders cuyo 
numero_de_telefono comienza con 320.*/
SELECT nombre,numero_de_telefono FROM coders WHERE numero_de_telefono LIKE '320%';

/*15. Selecciona todos los coders y ordénalos por fecha_de_nacimiento de manera
descendente.*/
SELECT * FROM coders ORDER BY fecha_de_nacimiento DESC;

		/*UPDATE: Updating data from the database*/

/*1. Actualiza el número de teléfono de un coder específico a un nuevo número.*/
UPDATE coders SET numero_de_telefono = '112' WHERE nombre = 'franco';

/*2. Cambia el clan a hopper para todos los coders cuyo clan sea gates.*/
UPDATE coders SET clan = 'hopper' WHERE clan = 'gates';

/*3. Actualiza la dirección de un coder específico a una nueva dirección.*/
UPDATE coders SET direccion = 'cl. 4 #8 - 12' WHERE nombre = 'franco';

/*4. Cambia el team_leader_desarrollo de todos los coders que tienen como
team_leader_desarrollo a juan perez por maria diaz.*/
UPDATE coders SET team_leader_desarrollo = 'maria diaz' WHERE 
team_leader_desarrollo = 'juan perez';

		/*DELETE: Deleting data from the database*/

/*1. Elimina el coder con un numero_de_identificacion específico.*/
DELETE FROM coders WHERE numero_de_identificacion = '1023592055';

/*2. Elimina todos los coders cuyo clan sea jeff bezos.*/
DELETE FROM coders WHERE clan = 'jeff bezos';

/*3. Elimina los coders cuyo correo_electronico contenga @example.com.*/
DELETE FROM coders WHERE correo_electronico LIKE '%@example.com%';







