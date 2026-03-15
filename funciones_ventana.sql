-- 1. DDL para la creación de la tabla
/*
CREATE TABLE registro_produccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia DATE NOT NULL,
    empleado VARCHAR(50) NOT NULL,
    seccion VARCHAR(50) NOT NULL,
    produccion INT NOT NULL
);
*/

-- 2. Inserción de los registros
/*
INSERT INTO registro_produccion (dia, empleado, seccion, produccion) 
VALUES 
('2026-03-14', 'Juan', 'Materia Prima', 450),
('2026-03-14', 'Emma', 'Envasado', 1200),
('2026-03-14', 'Angel', 'Materia Prima', 380),
('2026-03-15', 'Anna', 'Envasado', 1150),
('2026-03-15', 'Juan', 'Envasado', 980);
*/


SELECT 
	id, 
	dia, 
	empleado, 
	seccion, 
	produccion,
	sum(produccion) over(partition by dia, seccion) as prod_dia_sec,
	sum(produccion) over(partition by dia) as prod_dia_tot
FROM plantas.registro_produccion;