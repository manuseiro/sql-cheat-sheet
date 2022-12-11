# SQL Basics Cheat Sheet

## SQL:
Structured Query Language, ou Linguagem de Consulta Estruturada ou SQL, é a linguagem de pesquisa declarativa padrão para banco de dados relacional. Muitas das características originais do SQL foram inspiradas na álgebra relacional.

## Dados de Exemplo:
### COUNTRY (País)
| id | name | population | area |
| :---: | :---: | :---: | :---: |
| 1 | Italia | 66600000 | 640680 |
| 2 | Brazil | 80700000 | 357000 |
| ... | ... | ... | ... |

### CITY (Cidade)
| id | name | country_id | population | rating |
| :---: | :---: | :---: | :---: | :---: |
| 1 | Florença | 1 | 2243000 | 5 |
| 2 | Fortaleza | 2 | 3460000 | 3 |
| ... | ... | ... | ... | ... |

## CONSULTANDO UMA TABELA ÚNICA(QUERYING SINGLE TABLE)

### Consultar todas(`*`) as colunas da tabela de `COUNTRY`:
```bash
SELECT *
FROM country;
```
### Consultar as colunas `id` e `name` da tabela `CITY`:
```bash
SELECT id, name
FROM city;
```
### Consultar os `NAME` das `CITY` classificados pela coluna `RATING` na ordem Crescente (ASC):
```bash
SELECT name
FROM city
ORDER BY rating [ASC];
```
### Consultar os `NAME` das `CITY` classificados pela coluna `RATING` na ordem Decrescente (DESC):
```bash
SELECT name
FROM city
ORDER BY rating DESC;
```

## APELIDOS (ALIASES)

### Coluna `NAME` da tabela `CITY`
```bash
SELECT name AS city_name
FROM city;
```

### Colunas `NAME` das tabelas `CITY` e `COUNTRY`
```bash
SELECT co.name, ci.name
FROM city AS ci
JOIN country AS co
  ON ci.country_id = co.id;
```

Segue algumas dicas para utilizar no SQL

Neste exemplo nossa tabela tem o nome de `District`, view de `V` e Coluna de `C`:

OBS: Comando utilzados no Microsoft SQL Server.

## 1. GERENCIANDO TABELAS (MANAGING TABLES)

### Criar uma nova tabela chamada `DISTRICT` com três colunas (id, name, price)

### District (Bairro)
| id | name | price |
| :---: | :---: | :---: |
| ... | ... | 0 | 

```bash
CREATE TABLE DISTRICT (id INT PRIMARY KEY, name VARCHAR NOT NULL,price INT DEFAULT 0)
```
### Excluir a tabela `district` do banco de dados

```bash
DROP TABLE district
```

### Adicionar uma nova coluna `WEALTH` à tabela `DISTRICT`
```bash
ALTER TABLE district ADD COLUMN wealth
```

### Excluir coluna `WEALTH` da tabela `DISTRICT`
```bash
ALTER TABLE district DROP COLUMN wealth
```

### Adicionar uma restrição(`CONSTRAINT`)
```bash
ALTER TABLE district ADD constraint
```
OBS: As restrições(CONSTRAINT) podem ser especificadas quando a tabela é criada com a instrução CREATE TABLE ou depois que a tabela é criada com a instrução ALTER TABLE.

### Excluir uma restrição(CONSTRAINT)

```bash
ALTER TABLE district DROP constraint
```

### Renomear tabela "T1" para "T2"
```bash
ALTER TABLE tl REMANE TO t2
```

### Renomear Coluna "C1" para "C2" da tabela "T1"
```bash
ALTER TABLE tl RENANE cl TO c2
```

### Remover todos os dados da tabela "T"
```bash
TRUNCATE TABLE t
```

## 2. GERENCIANDO GATILHOS(MANAGING TRIGGERS)

### Criar ou modificar um gatilho(TRIGGER)
Neste exemplo o gatilho tera o nome de "trigger_name" 
```bash
CREATE OR MODIFY TRIGGER trigger_name
WHEN EVENT
ON table_nane TRIGGER TYPE
EXECUTE stored_procedure;
```
### WHEN<br>
- BEFORE -invocar(invoke) antes(BEFORE) que o evento ocorra<br>
- AFTER -invocar(invoke) despois(AFTER) do evento ocorrer<br>
### EVENT<br>
- INSERT - invoke for INSERT<br>
- UPDATE - invoke for UPDATE<br>
- DELETE - invoke for DELETE<br>
### TRIGGER_TYPE<br>
- FOR EACH ROW<br>
- FOR EACH STATEMENT<br>

### Crie um gatilho(TRIGGER) invocado antes que uma nova linha seja inserida na person table
```bash
CREATE TRIGGER
BEFORE INSERT
ON person FOR EACH ROW
EXECUTE stored_procedure ;
```
### Excluir um gatilho(TRIGGER) específico
```bash
DROP TRIGGER trigger_name
```

## 3. GERENCIANDO VIEWS(MANAGING VIEWS)
### Crie uma nova VIEW que consiste em cl e c2
```bash
CREATE VIEW v(c1,c2) AS
SELECT cl, c2
FROM t
```
### Crie uma nova VIEW com a opção de verificação
```bash
CREATE VIEW v(c1,c2) AS
SELECT Cl, CZ
FROM t
```
### Criar uma VIEW recursiva
```bash
WITH [CASCADED | LOCAL] CHECK OPTION
CREATE RECURSIVE VIEW v AS
select-statement —- anchor part
UNION [ALL]
select-statement —- recursive part
```
### Criar uma VIEW temporária
```bash
CREATE TEMPORARY VIEW v AS
SELECT cl, C2
FROM t
```
### Excluir uma VIEW
```bash
DROP VIEW view_name
```
## MODIFICANDO DADOS (MODIFYING DATA)

### Inserir uma linha(ROW) em uma tabela(TABLE)
```bash
INSERT INTO t(column_list)
VALUES( value_list);
```
### Inserir várias linhas(ROWS) em uma tabela(TABLE)
```bash
INSERT INTO t(column_list)
VALUES 	(vatue_list),
		(vatue_list), ....;
```
### Insert rows from t2 into tl
```bash
INSERT INTO t1(column_list)
SELECT column_list 
	FROM t2;
```
### Update new value in the column cl for all rows
```bash
UPDATE t
SET cl = neu_value;
```
### Update values in the column cl, c2 that match the condition
```bash
UPDATE t
SET	cI = neu_value,
	c2 = neu_value
WHERE condition;
```
### Delete all data in a table
```bash
DELETE FROM t;
```
### Delete subset of rows in a table
```bash
DELETE FROM t
WHERE condition;
```
## 4. CONSULTANDO EM VÁRIAS TABELAS (QUERYING FROM MULTIPLE TABLES)

### Junção(JOIN) interna(INNER) Tl e T2
SELECT cl, c2
FROM tl
INNER JOIN t2 ON condition;

### Junção(JOIN) Esquerda(LEFT) Tl e Tl
```bash
SELECT cl, C2
FROM t1
LEFT JOIN t2 ON condition;
```

### Junção(JOIN) Direita(RIGHT) Tl E T2
```bash
SELECT cl, c2
FROM tl
RIGHT JOIN t2 ON condition;
```

### Executar Junção(JOIN) externa(OUTER) completa(FULL)
```bash
SELECT Cl, CZ
FROM tl
FULL OUTER JOIN t2 ON condition;
```

### Produzir um produto cartesiano de linhas em tabelas
```bash
SELECT cl, C2
FROM tl
CROSS JOIN t2;
```

```bash
SELECT cl, c2
FROM tl, t2;
```
### Outra Maneira de Executar Junção(JOIN) Cruzada/Mistura(Cross)
```bash
SELECT Cl, C2
FROM tl A
```
## 5. USANDO RESTRIÇÕES SQL (USING SQL CONSTRAINTS)

### Definir C1 e CZ como chave-primária(primary-key)
```bash
CREATE TABLE t(
	cl INT, C2 INT, C3 VARCHAR,
	PRIMARY KEY (cl,c2)
);
```
### Defina a coluna c2 como uma chave-estrangeira(foreign-key)
```bash
CREATE TABLE t1(
Cl INT PRIMARY KEY,
C2 INT,
FOREIGN KEY (c2) REFERENCES t2(c2)
);
```
### Torne os valores em cl e c2 exclusivos(UNIQUE)
```bash
CREATE TABLE t(
cl INT, cl INT,
UNIQUE(c2, c3)
);
```
### Certifique-se de que cl > 0 e valores em cl>=c2
```bash
CREATE TABLE t(
cl INT, c2 INT,
CHECK(c1> 0 AND cl >= c2)
);
```
### Definir valores na coluna c2 não é nulo (NOT NULL)
```bash
CREATE TABLE t(
cl INT PRIMARY KEY,
c2 VARCHAR NOT NULL
);
```
## 6. USANDO OPERADORES SQL (USING SQL OPERATORS)

### Combine Rows From Two Queries
```bash
SELECT cl, C2 FROM tl
UNION [ALL]
SELECT Cl, C2 FROM t2;
```
### Return The Intersection Of TWO Queries
```bash
SELECT cl, c2 FROM t1
INTERSECT
SELECT Cl, C2 FROM T2;
```
### Subtract A Result Set From Another Result Set
```bash
SELECT cl, c2 FROM tl
MINUS
SELECT cl, C2 FROM t2;
```
### Query Rows Using Pattern Matching _
```bash
SELECT cl, c2 FROM tl
WHERE Cl [NOT] LIKE pattern;
```
### Query Rows In A List
```bash
SELECT Cl, c2 FROM t
WHERE cl [NOT] IN value_list;
```
### Query Rows Between Two Values
```bash
SELECT cl, c2 FROM t
WHERE cl BETWEEN low AND high;
```
### Check If Values In A Table IS NULL Or Not
```bash
SELECT cl, C2 FROM t
WHERE cl IS [NOT] NULL;
```


## Referência

 - [W3Schools - SQL Tutorial](https://www.w3schools.com/sql)
 - [LearnSQL.com](https://learnsql.com/blog/sql-basics-cheat-sheet/sql-basics-cheat-sheet-a4.pdf)
