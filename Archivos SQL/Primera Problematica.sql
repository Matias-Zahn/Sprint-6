--PRIMERA PROBLEMATICA

CREATE TABLE tipo_cuenta(
id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
nombre TEXT NOT NULL
);

INSERT INTO tipo_cuenta (account_type_description)
VALUES
  ("Caja de ahorro en Pesos"),
  ("Cuenta corriente en Pesos");

CREATE TABLE tipo_cliente (
	id integer not null PRIMARY KEY AUTOINCREMENT,
	nombre text not null	
);

INSERT INTO tipo_cliente (customer_type_description)
VALUES
  ("Classic"),
  ("Gold"),
  ("Black");
  
  
 CREATE TABLE marca_tarjeta(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
);
  

 CREATE TABLE tarjeta(
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	numero TEXT NOT NULL CHECK( length(numero) <=20 ),
	cvv INTEGER NOT NULL,
	fecha_otorgamiento DATE NOT NULL,
	fecha_expiracion DATE NOT NULL,
	tipo TEXT NOT NULL CHECK(card_type='débito' OR card_type='crédito'),
	cliente_id INTEGER NOT NULL,
	marca_tarjeta_id INTEGER NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES cliente(customer_id),
	FOREIGN KEY (marca_tarjeta_id) REFERENCES marca_tarjeta(id)
);


INSERT INTO tarjeta (numero,cvv,fecha_otorgamiento,card_expire_date,card_cvv,card_type,customer_id)
VALUES  -- EJEMPLOS 
	  ("4485718343564426","325","01/29/2025","12/06/2021","Debito",1,283),
	  ("429342 7365257453","634","08/21/2025","05/08/2024","Credito",1,210),
	  ("4916 994 35 2659","249","04/10/2024","06/24/2022","Credito",2,23),
	  ("543882 7859593433","558","06/11/2025","01/05/2023","Credito",1,166),
	  ("527427 282188 3785","277","06/07/2025","01/02/2022","Credito",2,466);
	  

CREATE TABLE direccion (
id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
calle TEXT NOT NULL,
ciudad TEXT NOT NULL,
codigo_postal TEXT NOT NULL,
tipo_entidad TEXT NOT NULL,
entidad_id TEXT NOT NULL
);

INSERT INTO direccion (calle,calle,ciudad,ciudad,codigo_postal,tipo_entidad, entidad_id)
VALUES --EJEMPLOS
	("Ap #310-6352 Aliquam Rd.", "Paulista", "24686", "cliente", 343),
	("142-1105 Aliquam St.", "Municipal District", "6209-5885", "cliente", 181);
	  
	  
--EJEMPLOS
UPDATE `cuenta` SET `tipo_cuenta_id` = 1 WHERE `account_id` = 2;
UPDATE `cuenta` SET `tipo_cuenta_id` = 2 WHERE `account_id` = 3;
UPDATE `cuenta` SET `tipo_cuenta_id` = 2 WHERE `account_id` = 4;
UPDATE `cuenta` SET `tipo_cuenta_id` = 2 WHERE `account_id` = 5;
UPDATE `cuenta` SET `tipo_cuenta_id` = 2 WHERE `account_id` = 6;
UPDATE `cuenta` SET `tipo_cuenta_id` = 2 WHERE `account_id` = 7;
UPDATE `cuenta` SET `tipo_cuenta_id` = 1 WHERE `account_id` = 8;


UPDATE empleado
SET employee_hire_date = (substr(employee_hire_date, 7, 4) || '-' || substr(employee_hire_date, 4, 2) || '-' || substr(employee_hire_date, 1, 2)) 
WHERE employee_hire_date <> '';