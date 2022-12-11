# SQL Basics Cheat Sheet

## SQL:
Structured Query Language, ou Linguagem de Consulta Estruturada ou SQL, é a linguagem de pesquisa declarativa padrão para banco de dados relacional. Muitas das características originais do SQL foram inspiradas na álgebra relacional.

## Dados de Exemplo:

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

## 1.1. CONSULTANDO UMA TABELA ÚNICA(QUERYING SINGLE TABLE)

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

## 1.2. APELIDOS (ALIASES)

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

## 1.3. FILTRANDO A SAÍDA (FILTERING THE OUTPUT)

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


## 2. GERENCIANDO TABELAS (MANAGING TABLES)

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

## 3. GERENCIANDO GATILHOS(MANAGING TRIGGERS)

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

## 4. GERENCIANDO VIEWS(MANAGING VIEWS)
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
## 5. MODIFICANDO DADOS (MODIFYING DATA)

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
## 6. CONSULTANDO EM VÁRIAS TABELAS (QUERYING FROM MULTIPLE TABLES)

Junção(JOIN) interna(INNER) Tl e T2

SELECT cl, c2
FROM districtl
INNER JOIN t2 ON condition;

Junção(JOIN) Esquerda(LEFT) Tl e Tl
```bash
SELECT cl, C2
FROM districdistrict1
LEFT JOIN t2 ON condition;
```

Junção(JOIN) Direita(RIGHT) Tl E T2
```bash
SELECT cl, c2
FROM districtl
RIGHT JOIN t2 ON condition;
```

Executar Junção(JOIN) externa(OUTER) completa(FULL)
```bash
SELECT Cl, CZ
FROM districtl
FULL OUTER JOIN t2 ON condition;
```

Produzir um produto cartesiano de linhas em tabelas
```bash
SELECT cl, C2
FROM districtl
CROSS JOIN t2;
```

```bash
SELECT cl, c2
FROM districtl, t2;
```
Outra Maneira de Executar Junção(JOIN) Cruzada/Mistura(Cross)
```bash
SELECT Cl, C2
FROM districtl A
```

## 6. USANDO RESTRIÇÕES SQL (USING SQL CONSTRAINTS)

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
## 7. USANDO OPERADORES SQL (USING SQL OPERATORS)

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
 - [LearnSQL.com](https://learnsql.com/blog/sql-basics-cheat-sheet/sql-basics-cheat-sheet-a4.pdf)
