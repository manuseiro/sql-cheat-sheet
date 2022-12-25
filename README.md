# SQL Basics Cheat Sheet

O SQL Basics Cheat Sheet fornece a sintaxe de todas as cláusulas básicas, mostra como escrever condições diferentes e tem exemplos.

## O que é SQL?:
Structured Query Language, ou Linguagem de Consulta Estruturada ou SQL, é a linguagem de pesquisa declarativa padrão para banco de dados relacional. Muitas das características originais do SQL foram inspiradas na álgebra relacional.

Embora todas as linguagens SQL compartilhem uma estrutura básica, alguns dos comandos e estilos específicos podem diferir ligeiramente. Os dialetos populares incluem MySQL, SQLite, SQL Server, Oracle SQL e muito mais. O PostgreSQL é um bom lugar para começar
— já que está próximo da sintaxe SQL padrão e é facilmente adaptável a outros dialetos.

## Dados de amostra:
Ao longo desta folha de dicas, usaremos as colunas listadas nas tabelas de amostra **`COUNTRY`** e **`CITY`**

COUNTRY (País)
| id | name | population | area |
| :---: | :---: | :---: | :---: |
| 1 | Italia | 66600000 | 640000 |
| 2 | Brazil | 21400000 | 851000000 |
| 3 | Estados Unidads | 331900000 | 331893745 |
| 4 | Argentina | 36260130 | 2780400 |
| ... | ... | ... | ... |

CITY (Cidade)
| id | name | country_id | population | rating |
| :---: | :---: | :---: | :---: | :---: |
| 1 | Florença | 1 | 22400000 | 3 |
| 2 | Fortaleza | 2 | 26800000 | 5 |
| 3 | São Paulo | 2 | 12300000 | 1 |
| 4 | Maranhão | 2 | 685000000 | 33 |
| ... | ... | ... | ... | ... |

## CONSULTANDO UMA TABELA ÚNICA(QUERYING SINGLE TABLE)

Consultar todas(`*`) as colunas da tabela de `COUNTRY`:
```bash
SELECT *
FROM country;
```
Resultado:
| id | name | population | area |
| :---: | :---: | :---: | :---: |
| 1 | Italia | 66600000 | 640000 |
| 2 | Brazil | 21400000 | 851000000 |
| 3 | Estados Unidads | 331900000 | 331893745 |
| 4 | Argentina | 36260130 | 2780400 |

Consultar as colunas `ID` e **`NAME`** da tabela **`CITY`**:
```bash
SELECT id, name
FROM city;
```
Resultado:
| id | name |
| :---: | :---: |
| 1 | Florença |
| 2 | Fortaleza |
| 3 | São Paulo |
| 4 | Maranhão |
| ... | ... |

Consultar os **`NAME`** das **`CITY`** classificados pela coluna **`RATING`** na ordem Crescente (ASC):
```bash
SELECT name
FROM city
ORDER BY rating [ASC];
```
Resultado:
| name | rating |
| :---: | :---: |
| São Paulo | 1 |
| Florença | 3 |
| Fortaleza| 5 |
| Maranhão | 33 |

Consultar os **`NAME`** das **`CITY`** classificados pela coluna **`RATING`** na ordem Decrescente (DESC):
```bash
SELECT name
FROM city
ORDER BY rating DESC;
```
Resultado:
| id | name |
| :---: | :---: | 
| 1 | Florença | 
| 2 | Fortaleza | 
| 3 | São Paulo | 
| 4 | Maranhão | 
| ... | ... | 

## APELIDOS (ALIASES)

### Columns
Consultar coluna **`NAME`** da tabela **`CITY`** com o apelido(AS) **`CITY_NAME`**:
```bash
SELECT name AS city_name
FROM city;
```
Resultado:
| id | city_name |
| :---: | :---: | 
| 4 | Maranhão | 
| 3 | São Paulo | 
| 2 | Fortaleza | 
| 1 | Florença | 
| ... | ... | 

### Tables
Consultar coluna **`NAME`** das tabelas **`CITY`** e **`COUNTRY`**, quando a coluna **`COUNTRY_ID`** da tabela **`COUNTRY`** retorna linhas que possuem valores correspondentes em ambas as tabelas. Neste exemplo as tabelas **`CITY`** e **`COUNTRY`** foram apelidadas de CI e CO respectivamente.
```bash
SELECT co.name, ci.name
FROM city AS ci
JOIN country AS co
  ON ci.country_id = co.id;
```
Resultado:
| id | name | population | area |
| :---: | :---: | :---: | :---: |
| 1 | Italia | 66600000 | 640000 |
| 2 | Brazil | 21400000 | 851000000 |

| id | name | country_id | population | rating |
| :---: | :---: | :---: | :---: | :---: |
| 1 | Florença | 1 | 22400000 | 3 |
| 2 | Fortaleza | 2 | 26800000 | 5 |
| 3 | São Paulo | 2 | 12300000 | 1 |
| 4 | Maranhão | 2 | 685000000 | 33 |



_OBS: JOIN (ou explicitamente INNER JOIN) retorna linhas que possuem valores correspondentes em ambas as tabelas._

## FILTRANDO A SAÍDA (FILTERING THE OUTPUT)

### OPERADORES DE COMPARAÇÃO (COMPARISON OPERATORS)

Consultar **`NAME`** da **`CITY`** com **`RATING`** acima de 3
```bash
SELECT name
FROM city
WHERE rating > 3;
```
Resultado:
| name |
| :---: |
| Fortaleza |
| Maranhão |

Consultar **`NAME`** de **`CITY`** diferente de `FLORENÇA` e `FORTALEZA`
```bash
SELECT name
FROM city
WHERE name != 'Florença'
  AND name != 'Fortaleza';
```
Resultado:
| name |
| :---: |
| São Paulo |
| Maranhão |

### OPERADORES DE TEXTO (TEXT OPERATORS)

Consultar **`NAME`** de **`CITY`** que começam com 'f' ou terminam com 'a':
```bash
SELECT name
FROM city
WHERE name LIKE 'f%'
  OR name LIKE '%a';
```
Resultado:
| id | name |
| :---: | :---: |
| 1 | Florença |
| 2 | Fortaleza |

Consultar **`NAME`** de **`CITY`** que começe com qualquer letra seguida por 'ortaleza':
```bash
SELECT name
FROM city
WHERE name LIKE '_ortaleza';
```
Resultado:
| id | name |
| :---: | :---: |
| 2 | Fortaleza |

### OUTROS OPERADORES (OTHER OPERATORS)

Consultar **`NAME`** de **`CITY`** com `POPULATION` entre(between) 500K e 5M:
```bash
SELECT name
FROM city
WHERE population BETWEEN 500000 AND 5000000;
```
Consultar **`NAME`** de **`CITY`** que não possuem um valor de **`RATING`**:
```bash
SELECT name
FROM city
WHERE rating IS NOT NULL;
```
Consultar **`NAME`** de **`CITY`** que estão em `COUNTRY` com `IDs` 1, 4, 7 ou 8:
```bash
SELECT name
FROM city
WHERE country_id IN (1, 4, 7, 8);
```


Segue algumas dicas para utilizar no SQL, Neste exemplo nossa tabela tem o nome de **`DISTRICT`**, view de `V` e Coluna de `C`:


## GERENCIANDO TABELAS (MANAGING TABLES)

Criar uma nova tabela chamada **`DISTRICT`** com três colunas (id, name, price)

```bash
CREATE TABLE district (id INT PRIMARY KEY, name VARCHAR NOT NULL,price INT DEFAULT 0)
```
Resultado ao criar tabela **`DISTRICT`** (Bairro):

| id | name | price |
| :---: | :---: | :---: |
| 1 | ... | 0 | 

Excluir a tabela **`DISTRICT`** do banco de dados

```bash
DROP TABLE district
```

Adicionar uma nova coluna `WEALTH` à tabela **`DISTRICT`**

```bash
ALTER TABLE district ADD COLUMN wealth
```
Resultado:
| id | name | price | wealth |
| :---: | :---: | :---: | :---: |
| 1 | ... | 0 | 1000000 |

Excluir coluna `WEALTH` da tabela **`DISTRICT`**

Resultado:
| id | name | price |
| :---: | :---: | :---: |
| 1 | ... | 0 |

```bash
ALTER TABLE district DROP COLUMN wealth
```

Adicionar uma restrição(`CONSTRAINT`)
```bash
ALTER TABLE district ADD constraint
```
OBS: As restrições(CONSTRAINT) podem ser especificadas quando a tabela é criada com a instrução CREATE TABLE ou depois que a tabela é criada com a instrução ALTER TABLE.

Excluir uma restrição(CONSTRAINT)

```bash
ALTER TABLE district DROP constraint
```

Renomear tabela "district1" para "T2"
```bash
ALTER TABLE district1 REMANE TO t2
```

Renomear Coluna "C1" para "C2" da tabela "district1"
```bash
ALTER TABLE district1 RENANE cl TO c2
```

Remover todos os dados da tabela **`DISTRICT`**
```bash
TRUNCATE TABLE district
```

## GERENCIANDO GATILHOS(MANAGING TRIGGERS)

Criar ou modificar um gatilho(TRIGGER), neste exemplo o gatilho terá o nome de **`trigger_name`** 
```bash
CREATE OR MODIFY TRIGGER trigger_name
WHEN EVENT
ON table_nane TRIGGER TYPE
EXECUTE stored_procedure;
```
WHEN
- BEFORE -invocar(invoke) antes(BEFORE) que o evento ocorra
- AFTER -invocar(invoke) despois(AFTER) do evento ocorrer
EVENT
- INSERT - invoke for INSERT
- UPDATE - invoke for UPDATE
- DELETE - invoke for DELETE
TRIGGER_TYPE
- FOR EACH ROW
- FOR EACH STATEMENT

Crie um gatilho(TRIGGER) invocado antes que uma nova linha seja inserida na person table
```bash
CREATE TRIGGER
BEFORE INSERT
ON person FOR EACH ROW
EXECUTE stored_procedure ;
```
Excluir um gatilho(TRIGGER) específico
```bash
DROP TRIGGER trigger_name
```

## GERENCIANDO VIEWS(MANAGING VIEWS)
Crie uma nova VIEW que consiste em cl e c2
```bash
CREATE VIEW v(c1,c2) AS
SELECT cl, c2
FROM district
```
Crie uma nova VIEW com a opção de verificação
```bash
CREATE VIEW v(c1,c2) AS
SELECT Cl, C2
FROM district
```
Criar uma VIEW recursiva
```bash
WITH [CASCADED | LOCAL] CHECK OPTION
CREATE RECURSIVE VIEW v AS
select-statement —- anchor part
UNION [ALL]
select-statement —- recursive part
```
Criar uma VIEW temporária
```bash
CREATE TEMPORARY VIEW v AS
SELECT cl, C2
FROM district
```
Excluir uma VIEW
```bash
DROP VIEW view_name
```
## MODIFICANDO DADOS (MODIFYING DATA)

Inserir(INSERT) uma linha(ROW) na tabela(TABLE) **`DISTRICT`**
```bash
INSERT INTO district(column_list)
VALUES( value_list);
```
Inserir várias linhas(ROWS) na tabela(TABLE) **`DISTRICT`**:
```bash
INSERT INTO district(column_list)
VALUES 	(vatue_list),
		(vatue_list), ....;
```
Inserir linhas(ROWS) da tabela(TABLE) `district2` no **`district1`**:
```bash
INSERT INTO district1(column_list)
SELECT column_list 
	FROM district2;
```
Update new value in the column cl for all rows
```bash
UPDATE district
SET cl = new_value;
```
Update values in the column cl, c2 that match the condition
```bash
UPDATE district
SET	cI = new_value,
	c2 = new_value
WHERE condition;
```
Delete all data in a table
```bash
DELETE FROM district;
```
Delete subset of rows in a table
```bash
DELETE FROM district
WHERE condition;
```
## CONSULTANDO EM MÚLTIPLAS TABELAS (QUERYING FROM MULTIPLE TABLES)

### INNER JOIN
JOIN (ou explicitamente INNER JOIN) retorna linhas que possuem valores correspondentes em ambas as tabelas
```bash
SELECT city.name, country.name
FROM city
[INNER] JOIN country
ON city.country_id = country.id;
```

### LEFT JOIN
LEFT JOIN retorna todas as linhas da tabela esquerda com linhas correspondentes da tabela à direita. Se não houver linha correspondente, NULLs são retornados como valores do segunda mesa.
```bash
SELECT city.name, country.name
FROM city
LEFT JOIN country
ON city.country_id = country.id;
```
### RIGHT JOIN
RIGHT JOIN retorna todas as linhas da tabela da direita com linhas correspondentes da tabela à esquerda. Se não houver linha correspondente, NULLs são retornados como valores da esquerda tabela.
```bash
SELECT city.name, country.name
FROM city
RIGHT JOIN country
ON city.country_id = country.id;
```
### FULL JOIN
FULL JOIN (ou explicitamente FULL OUTER JOIN) retorna todos linhas de ambas as tabelas - se não houver nenhuma linha correspondente no segunda tabela, NULLs são retornados.
```bash
SELECT city.name, country.name
FROM city
FULL [OUTER] JOIN country
ON city.country_id = country.id;
```

### CROSS JOIN
CROSS JOIN retorna todas as combinações possíveis de linhas de ambas as tabelas. Existem duas sintaxes disponíveis.
```bash
SELECT city.name, country.name
FROM city
CROSS JOIN country;
```

```bash
SELECT city.name, country.name
FROM city, country;
```
### NATURAL JOIN
NATURAL JOIN unirá tabelas por todas as colunas com o mesmo nome.
```bash
SELECT city.name, country.name
FROM city
NATURAL JOIN country;
```
## AGREGAÇÃO E AGRUPAMENTO (AGGREGATION AND GROUPING)

### GROUP BY
GROUP BY agrupa linhas que possuem os mesmos valores em colunas especificadas.
Ele calcula resumos (agregados) para cada combinação exclusiva de valores.

#### CITY (Cidade)
| id | name | country_id | 
| :---: | :---: | :---: | 
| 1 | Florença | 1 | 
| 2 | Fortaleza | 2 | 
| 3 | São Paulo | 2 | 
| 4 | Maranhão | 2 |
| 5 | Lyon | 3 | 
| 6 | Berlin | 1 | 
| 7 | Warsaw | 3 | 
| ... | ... | ... |

Agrupo todos os valores da coluna **`country_id`** agrupados em uma coluna chamada **`count`**.
```bash
SELECT country_id, COUNT(*) AS count 
FROM city 
GROUP BY country_id;
```
Resultado:
| country_id | count | 
| :---: | :---: |
| 1 | 2 | 
| 2 | 3 | 
| 3 | 2 | 
| ... | ... |

### FUNÇÕES AGREGADAS (AGGREGATE FUNCTIONS)
- avg(expr) − valor médio para linhas dentro do grupo
- count(expr) − contagem de valores para linhas dentro do grupo
- max(expr) − valor máximo dentro do grupo
- min(expr) − valor mínimo dentro do grupo
- sum(expr) − soma dos valores dentro do grupo

Descubra o número de cidades:
```bash
SELECT COUNT(rating)
FROM city;
```
Descubra o número de cidades com classificações não nulas:
```bash
SELECT COUNT(DISTINCT country_id)
FROM city;
```
Descubra o número de valores de país distintos:
```bash
SELECT MIN(population), MAX(population)
FROM country;
```
Descubra as menores e as maiores populações do país:
```bash
SELECT country_id, SUM(population)
FROM city
GROUP BY country_id;
```
Descubra a população total das cidades nos respectivos países:
```bash
SELECT country_id, AVG(rating)
FROM city
GROUP BY country_id
HAVING AVG(rating) > 3.0;
```
## SUBCONSULTAS (SUBQUERIES)
Uma subconsulta é uma consulta aninhada dentro de outra consulta ou dentro de outra subconsulta. Existem diferentes tipos de subconsultas.

### SINGLE VALUE
A subconsulta mais simples retorna exatamente uma coluna e exatamente uma linha. Pode ser usado com operadores de comparação =, <, <=, > ou >=.

Esta consulta encontra cidades com a mesma classificação de Paris:
```bash
SELECT name 
FROM city
WHERE rating = (
	SELECT rating
	FROM city
	WHERE name = 'Paris'
);
```
### MULTIPLE VALUES
Uma subconsulta também pode retornar várias colunas ou várias linhas. Essas subconsultas podem ser usadas com os operadores IN, EXISTS, ALL ou ANY.

Esta consulta encontra cidades em países com população acima de 20 milhões:
```bash
SELECT name
FROM city
WHERE country_id IN (
	SELECT country_id
	FROM country
	WHERE population > 20000000
);
```

### CORRELATED
Uma subconsulta correlacionada refere-se às tabelas introduzidas na consulta externa. Uma subconsulta correlacionada depende da consulta externa. Ele não pode ser executado independentemente da consulta externa.

Esta consulta encontra cidades com uma população maior que a população média do país:
```bash
SELECT *
FROM city main_city
WHERE population > (
	SELECT AVG(population)
	FROM city average_city
	WHERE average_city.country_id = main_city.country_id
);
```
Esta consulta encontra países que possuem pelo menos uma cidade:
```bash
SELECT name
FROM country
WHERE EXISTS (
	SELECT *
	FROM city
	WHERE country_id = country.id
);
```


## USANDO RESTRIÇÕES SQL (USING SQL CONSTRAINTS)

Definir C1 e CZ como chave-primária(primary-key)
```bash
CREATE TABLE t(
	cl INT, C2 INT, C3 VARCHAR,
	PRIMARY KEY (cl,c2)
);
```
Defina a coluna c2 como uma chave-estrangeira(foreign-key)
```bash
CREATE TABLE district1(
Cl INT PRIMARY KEY,
C2 INT,
FOREIGN KEY (c2) REFERENCES t2(c2)
);
```
Torne os valores em cl e c2 exclusivos(UNIQUE)
```bash
CREATE TABLE t(
cl INT, cl INT,
UNIQUE(c2, c3)
);
```
Certifique-se de que cl > 0 e valores em cl>=c2
```bash
CREATE TABLE t(
cl INT, c2 INT,
CHECK(c1> 0 AND cl >= c2)
);
```
Definir valores na coluna c2 não é nulo (NOT NULL)
```bash
CREATE TABLE t(
cl INT PRIMARY KEY,
c2 VARCHAR NOT NULL
);
```
## USANDO OPERADORES SQL (USING SQL OPERATORS)

Combine Rows FROM districtwo Queries
```bash
SELECT cl, C2 FROM districtl
UNION [ALL]
SELECT Cl, C2 FROM district2;
```
Return The Intersection Of TWO Queries
```bash
SELECT cl, c2 FROM districdistrict1
INTERSECT
SELECT Cl, C2 FROM district2;
```
Subtract A Result Set From Another Result Set
```bash
SELECT cl, c2 FROM districtl
MINUS
SELECT cl, C2 FROM district2;
```
Query Rows Using Pattern Matching _
```bash
SELECT cl, c2 FROM districtl
WHERE Cl [NOT] LIKE pattern;
```
Query Rows In A List
```bash
SELECT Cl, c2 FROM district
WHERE cl [NOT] IN value_list;
```
Query Rows Between Two Values
```bash
SELECT cl, c2 FROM district
WHERE cl BETWEEN low AND high;
```
Check If Values In A Table IS NULL Or Not
```bash
SELECT cl, C2 FROM district
WHERE cl IS [NOT] NULL;
```

## Referência

 - [W3Schools - SQL Tutorial](https://www.w3schools.com/sql)
 - [SQL Basics Cheat Sheet - LearnSQL.com](https://learnsql.com/blog/sql-basics-cheat-sheet/)
 - [SQL Basics Cheat Sheet - DataCamp](https://www.datacamp.com/cheat-sheet/sql-basics-cheat-sheet)
