USE empresaTeisConsultas;
-- ------------------------------------------------------------
-- 1. Consultas Básicas
--      SELECT * FROM tabla
--      SELECT atributo1, ..., atributoN FROM tabla
--      SELECT DISTINCT atributo1, ..., atributoN FROM tabla
--
-- 2. Con filtros
--      SELECT * FROM tabla1 WHERE atributo1 <filtro> valor          -- =, >=, <=, <>, !=, <, >
--      SELECT * FROM tabla1 WHERE atributo1 IN (valor1, ..., valorN)
--      SELECT * FROM tabla1 WHERE atributo1 BETWEEN valor1 AND valorN
SELECT * FROM PRODUCTO WHERE ID_Producto IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);

--      SELECT * FROM tabla1 WHERE atributo1 IS NULL
--      SELECT * FROM tabla1 WHERE atributo1 LIKE 'patrón'           -- _ = un carácter, % = varios
--      SELECT * FROM tabla1 WHERE atributo1 REGEXP 'expresión'      -- ^, $, ., |, ?, +, *, etc.
--      SELECT * FROM tabla1 LIMIT filas;                            -- o LIMIT offset, filas
--
-- 3. Con ordenación
--      SELECT * FROM tabla1 ORDER BY atributo1 [ASC|DESC];
SELECT * FROM PRODUCTO ORDER BY ID_Producto desc;
SELECT * FROM PRODUCTO ORDER BY Precio desc;
SELECT * FROM PRODUCTO ORDER BY Nombre desc;
SELECT * FROM PRODUCTO ORDER BY Precio asc;
--
-- 4. Con resumen
--      SELECT atributo1, COUNT(*) FROM tabla1 GROUP BY atributo1;   -- ⚠️ En MySQL, los campos no agregados deben estar en GROUP BY (modo ONLY_FULL_GROUP_BY)
SELECT Precio FROM PRODUCTO GROUP BY Precio ORDER BY 1;
-- 5. Multitabla
--      Composición Interna
--          SELECT * FROM tabla1 INNER JOIN tabla2 ON tabla1.id = tabla2.id;
--          -- NATURAL JOIN existe, pero se desaconseja
--
--      Composición Externa
--          SELECT * FROM tabla1 LEFT JOIN tabla2 ON tabla1.id = tabla2.id;
--          SELECT * FROM tabla1 RIGHT JOIN tabla2 ON tabla1.id = tabla2.id;
--          -- ❌ FULL OUTER JOIN NO EXISTE en MySQL → usar UNION de LEFT + RIGHT
--
-- 6. Subconsultas
--          SELECT * FROM tabla1 WHERE atributo1 = (subconsulta escalar);
--          SELECT * FROM tabla1 WHERE atributo1 IN (subconsulta);
--          SELECT * FROM tabla1 WHERE atributo1 > ANY (subconsulta);
--          SELECT * FROM tabla1 WHERE EXISTS (subconsulta);
--
SELECT * FROM PRODUCTO WHERE Nombre LIKE '%e%e%'; -- busca una palabra que lleve dos letras 'e'
SELECT * FROM PRODUCTO WHERE Nombre LIKE '%';
-- 7. Reflexivas
--          SELECT T1.col, T2.col FROM tabla1 AS T1 INNER JOIN tabla1 AS T2 ON T1.id = T2.id_padre;
--
-- 8. Derivadas (tablas derivadas)
--          SELECT T1.* FROM (SELECT col1, col2 FROM tabla1 WHERE col3 = valor) AS T1;
-- ------------------------------------------------------------

