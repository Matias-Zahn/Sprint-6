/*Pedido Problematica 2*/

--#1
SELECT *
from vista_clientes
WHERE edad > 40
ORDER by DNI ;

--#2
SELECT *
FROM vista_clientes
WHERE Nombre == "Anne" or Nombre == "Tyler"
ORDER by edad  

--#3
INSERT INTO cliente (customer_name, customer_surname, customer_DNI, branch_id, dob)
VALUES
('Lois', 'Stout', 47730534, 80, '1984-07-07'),
('Hall', 'Mcconnell', 52055464, 45, '1968-04-30'),
('Hilel', 'Mclean', 43625213, 77, '1993-03-28'),
('Jin', 'Cooley', 21207908, 96, '1959-08-24'),
('Gabriel', 'Harmon', 57063950, 27, '1976-04-01');

--#4
UPDATE cliente 
SET branch_id = 10
WHERE customer_id > 500 AND customer_id <506

--#5
DELETE from cliente
WHERE customer_name = "Noel" and customer_surname = "David";

--#6
SELECT 
	loan_type as "Tipo De Prestamo",
	loan_total as "Total del Pestamo"
FROM prestamo
ORDER by loan_total DESC
LIMIT 1;



