--GERENCIANDO TABELAS (MANAGING TABLES)

CREATE TABLE t (
id INT PRIMARY KEY,
name VARCHAR NOT NULL,
price INT DEFAULT 0

--Criar uma nova tabela com três colunas
DROP TABLE t
--Excluir a tabela do banco de dados
ALTER TABLE t ADO column;
--Adicionar uma nova coluna à tabela
ALTER TABLE t DROP COLUMN c
--Drop c f rom the table
ALTER TABLE t ADO constraint;
--Adicionar uma restrição
ALTER TABLE t DROP constraint;
--Drop a constraint
ALTER TABLE tl REMANE TO t2;
--Renomear uma tabela de tl para t2
ALTER TABLE tl RENANE cl TO c2
--Renomeie a coluna cl para c2
TRUNCATE TABLE t;
--Remover dados em uma tabela

-- GERENCIANDO GATILHOS(MANAGING TRIGGERS)
CREATE OR MODIFY TRIGGER trigger_name
WHEN EVENT
ON table_nane TRIGGER TYPE
EXECUTE stored_procedure;
-- Criar ou modificar um gatilho(TRIGGER)
WHEN
-- BEFORE -invocar(invoke) antes(BEFORE) que o evento ocorra
-- AFTER -invocar(invoke) despois(AFTER) do evento ocorrer
EVENT
-- INSERT - invoke for INSERT
-- UPDATE - invoke for UPDATE
-- DELETE - invoke for DELETE
TRIGGER_TYPE
-- FOR EACH ROW
-- FOR EACH STATEMENT
CREATE TRIGGER
BEFORE INSERT
ON person FOR EACH ROW
EXECUTE stored_procedure ;
--Crie um gatilho(TRIGGER) invocado antes que uma nova linha seja inserida na person table
DROP TRIGGER trigger_name
--Excluir um gatilho(TRIGGER) específico

-- GERENCIANDO VIEWS(MANAGING VIEWS)
CREATE VIEW v(c1,c2)
AS
SELECT cl, c2
FROM t;
--Crie uma nova VIEW que consiste em cl e c2
CREATE VIEW v(c1,c2)
AS
SELECT Cl, CZ
FROM t;
WITH [CASCADED | LOCAL] CHECK OPTION;
--Crie uma nova VIEW com a opção de verificação
CREATE RECURSIVE VIEW v
AS
select-statement —- anchor part
UNION [ALL]
select-statement; —- recursive part
--Criar uma VIEW recursiva
CREATE TEMPORARY VIEW v
AS
SELECT cl, C2
FROM t;
--Criar uma VIEW temporária
DROP VIEW view_name
--Excluir uma VIEW

-- MODIFICANDO DADOS (MODIFYING DATA)
INSERT INTO t(column_list)
VALUES( value_list);
--Inserir uma linha(ROW) em uma tabela(TABLE)
INSERT INTO t(column_list)
VALUES 	(vatue_list),
		(vatue_list), ....;
--Inserir várias linhas(ROWS) em uma tabela(TABLE)
INSERT INTO t1(column_list)
SELECT column_list
FRON t2;
--Insert rows from t2 into tl
UPDATE t
SET cl = neu_value;
--Update new value in the column cl for all rows
UPDATE t
SET	cI = neu_value,
	c2 = neu_value
WHERE condition;
--Update values in the column cl, c2 that match the condition
DELETE FROM t;
--Delete all data in a table
DELETE FROM t
WHERE condition;
--Delete subset of rows in a table

-- CONSULTANDO EM VÁRIAS TABELAS (QUERYING FROM MULTIPLE TABLES)
SELECT cl, c2
FROU tl
INNER JOIN t2 ON condition;
--Junção(JOIN) interna(INNER) Tl e T2
SELECT cl, C2
FROM tl
LEFT JOIN t2 ON condition;
--Junção(JOIN) Esquerda(LEFT) Tl e Tl
SELECT cl, c2
FROM tl
RIGHT JOIN t2 ON condition;
-- Junção(JOIN) Direita(RIGHT) Tl E T2
SELECT Cl, CZ
FROM tl
FULL OUTER JOIN t2 ON condition;
-- Executar Junção(JOIN) externa(OUTER) completa(FULL)
SELECT cl, C2
FROM tl
CROSS JOIN t2;
-- Produzir um produto cartesiano de linhas em tabelas
SELECT cl, c2
FROM tl, t2;
-- Outra Maneira de Executar Junção(JOIN) Cruzada/Mistura(Cross)
SELECT Cl, C2
FROM tl A

--USANDO RESTRIÇÕES SQL (USING SQL CONSTRAINTS)

CREATE TABLE t(
	cl INT, C2 INT, C3 VARCHAR,
	PRIMARY KEY (cl,c2)
);
--Definir C1 e CZ como chave-primária(primary-key)
CREATE TABLE t1(
Cl INT PRIMARY KEY,
C2 INT,
FOREIGN KEY (c2) REFERENCES t2(c2)
);
--Defina a coluna c2 como uma chave-estrangeira(foreign-key)
CREATE TABLE t(
cl INT, cl INT,
UNIQUE(c2, c3)
);
--Torne os valores em cl e c2 exclusivos(UNIQUE)
CREATE TABLE t(
cl INT, c2 INT,
CHECK(c1> 0 AND cl >= c2)
);
--Certifique-se de que cl > 0 e valores em cl>=c2
CREATE TABLE t(
cl INT PRIMARY KEY,
c2 VARCHAR NOT NULL
);
--Definir valores na coluna c2 não é nulo (NOT NULL)

-- USANDO OPERADORES SQL (USING SQL OPERATORS)
SELECT cl, C2 FROM tl
UNION [ALL]
SELECT Cl, C2 FROM t2;
--Combine Rows From Two Queries
SELECT cl, c2 FROM t1
INTERSECT
SELECT Cl, C2 FROM T2;
--Return The Intersection Of TWO Queries
SELECT cl, c2 FROM tl
MINUS
SELECT cl, C2 FROM t2;
--Subtract A Result Set From Another Result Set
SELECT cl, c2 FROM tl
WHERE Cl [NOT] LIKE pattern;
--Query Rows Using Pattern Matching _
SELECT Cl, c2 FROM t
WHERE cl [NOT] IN value_list;
--Query Rows In A List
SELECT cl, c2 FROM t
WHERE cl BETWEEN low AND high;
--Query Rows Between Two Values
SELECT cl, C2 FROM t
WHERE cl IS [NOT] NULL;
--Check If Values In A Table IS NULL Or Not
