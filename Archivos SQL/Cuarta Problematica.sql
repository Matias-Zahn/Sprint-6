--CUARTA PROBLEMATICA

--#1
SELECT sucursal.branch_name, COUNT(cliente.customer_name) AS cantidad_clientes
FROM cliente
INNER JOIN sucursal ON sucursal.branch_id = cliente.branch_id
GROUP BY sucursal.branch_name
ORDER BY cantidad_clientes DESC;


--#2
SELECT s.branch_name, CAST( COUNT(c.customer_name) AS REAL ) / COUNT(e.employee_name)  AS empleados_x_cliente 
FROM 
cliente c
LEFT JOIN sucursal s ON s.branch_id = c.branch_id
LEFT JOIN empleado e ON e.branch_id = s.branch_id 
GROUP BY s.branch_name
ORDER BY s.branch_name;


--#3
SELECT s.branch_name,  COUNT(t.id) as cantidad_de_tarjetas 
FROM tarjeta t
INNER JOIN cliente c ON t.cliente_id = c.customer_id
INNER JOIN sucursal s ON s.branch_id = c.branch_id
GROUP BY s.branch_name;



--#4

SELECT branch_name, loan_type, avg(loan_total) AS promedio_creditos FROM prestamo 

INNER JOIN cliente ON prestamo.customer_id = cliente.customer_id 

INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id 

GROUP BY branch_name ORDER BY branch_name;





--#5

CREATE TABLE auditoria_cuenta(

	old_id INTEGER, 

	new_id INTEGER, 

	old_balance REAL, 

	new_balance REAL,

	old_iban TEXT, 

	new_iban TEXT, 

	old_type TEXT, 

	new_type TEXT,

	user_action TEXT, 

	created_at TEXT DEFAULT CURRENT_TIMESTAMP

);





--#5.A

CREATE TRIGGER actualizar_auditoria 

AFTER UPDATE ON cuenta

WHEN OLD.balance <> NEW.balance

	OR OLD.iban <> NEW.iban

	OR OLD.tipo_cuenta_id <> NEW.tipo_cuenta_id

BEGIN

	INSERT INTO auditoria_cuenta (

		old_id,

        new_id,

        old_balance,

        new_balance,

        old_iban,

        new_iban,

        old_type,

        new_type,

        user_action,

        created_at

	)

	VALUES (

		OLD.account_id,

        NEW.account_id,

        OLD.balance,

        NEW.balance,

        OLD.iban,

        NEW.iban,

        OLD.tipo_cuenta_id,

        NEW.tipo_cuenta_id,

        'UPDATE',

        DATETIME('now')

	);

END;





--#5.B

UPDATE cuenta 

SET balance = balance - 100

WHERE account_id IN (10,11,12,13,14);



--#6

CREATE INDEX dni_indice ON cliente(customer_DNI);



--#7

CREATE TABLE movimientos (

	 id_movimiento INTEGER PRIMARY KEY AUTOINCREMENT,

	 numero_cuenta INTEGER,

	 monto REAL,

	 tipo_operacion TEXT,

	 hora DATETIME

);



BEGIN TRANSACTION;

	INSERT INTO movimientos(numero_cuenta,monto, tipo_operacion, hora)

	VALUES( 200, -1000, 'Transferencia', datetime('now'));

	UPDATE cuenta

	SET balance = balance - 1000 WHERE account_id = 200;

	INSERT INTO movimientos(numero_cuenta,monto, tipo_operacion, hora)

	VALUES (400, 1000, 'Deposito', datetime('now'));

	UPDATE cuenta

	SET balance = balance + 1000 WHERE account_id = 400;

COMMIT;



























