--Tercera Problematica


--#1
SELECT *
FROM cuenta
where balance < 0;

--#2
SELECT nombre, Apellido, edad 
FROM vista_clientes 
WHERE Apellido like("%Z%");


--#3
SELECT 
    vc.nombre, 
    vc.apellido, 
    vc.edad,
    s.branch_name as "Nombre de Sucursal"
FROM 
    vista_clientes vc
JOIN 
    sucursal s ON vc.sucursal = s.branch_id
WHERE 
    vc.nombre = 'Brendan'
ORDER BY 
    s.branch_name;	

--#4
SELECT loan_total FROM prestamo WHERE loan_total/100 > 80000 

UNION SELECT loan_type FROM prestamo WHERE loan_type LIKE "prendario";

--#5
SELECT * FROM prestamo WHERE loan_total > (SELECT avg(loan_total) FROM prestamo);

--#6
SELECT COUNT(nombre) as "Total de menores a 50"
FROM vista_clientes
WHERE EDAD < 50;


--#7
SELECT * FROM cuenta WHERE balance > 8000 LIMIT 5;


--#8
SELECT * FROM prestamo WHERE (strftime('%m', loan_date)) IN ("04", "06", "08")
ORDER BY loan_total;

--#9
SELECT loan_type, sum(loan_total) AS loan_total_accu FROM prestamo 

GROUP BY loan_type;

