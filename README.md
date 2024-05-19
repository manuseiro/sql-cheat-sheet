# SQL Basics Cheat Sheet

Este repositório contém uma coleção abrangente de cheat sheets de SQL para ajudar desenvolvedores, analistas de dados e estudantes a realizar consultas e manipulações de banco de dados de maneira eficiente. O objetivo é fornecer uma referência rápida para os comandos SQL mais comuns, bem como exemplos práticos de uso.

## Introdução:
Structured Query Language, ou SQL, é a linguagem declarativa de consulta padrão para manipulação de dados mantidos em sistemas de gerenciamento de banco de dados relacional (**` RDBMS `** ) ou para processamento de fluxo em um sistema de gerenciamento de fluxo de dados relacional (**` RDSMS `** ). Foi desenvolvido pela primeira vez na década de 1970 pela **` IBM `** .

Embora todas as linguagens SQL compartilhem uma estrutura básica, alguns comandos e estilos específicos podem diferir ligeiramente. Dialectos populares incluem MySQL, SQLite, SQL Server, Oracle SQL, entre outros. O PostgreSQL é um bom ponto de partida, pois está próximo da sintaxe SQL padrão e pode ser facilmente adaptado para outros dialetos.

### Componentes
SQL consiste em vários componentes, cada um servindo a seu propósito exclusivo na comunicação do banco de dados:

Queries (Consultas): 
Este é o componente que permite recuperar dados de um banco de dados. A instrução SELECT é mais comumente usada para esse propósito.

Data Definition Language (DDL): 
Linguagem de definição de dados (DDL) permite criar, alterar ou excluir bancos de dados e seus objetos relacionados, como tabelas, visualizações, etc. Os comandos incluem CREATE, ALTER, DROP e TRUNCATE.

Data Manipulation Language (DML): 
Linguagem de manipulação de dados (DML) permite gerenciar dados dentro de objetos de banco de dados. Esses comandos incluem SELECT, INSERT, UPDATE e DELETE.

Data Control Language (DCL): 
Linguagem de controle de dados (DCL), inclui comandos como GRANT e REVOKE, que tratam principalmente de direitos, permissões e outras tarefas de gerenciamento de nível de controle para o sistema de banco de dados.

## Sintaxe SQL Básica 

SQL, ou Structured Query Language, usa um conjunto específico de comandos para interagir com um banco de dados. Inclui o uso de instruções semelhantes a palavras-chave para realizar diversas tarefas, como criar, excluir ou modificar tabelas, recuperar, inserir ou modificar dados. 

 A instrução **` SELECT `** é usada para recuperar dados de um banco de dados. Os dados retornados são armazenados em uma tabela de resultados, chamada conjunto de resultados. 

```sql
SELECT nome_coluna1, nome_coluna2 FROM nome_tabela; 
```

A instrução **` INSERT INTO `** é usada para inserir novas linhas de dados em uma tabela. 

```sql
INSERT INTO nome_tabela (nome_coluna1, nome_coluna2, nome_coluna3)
VALUES (valor1, valor2, valor3);
```

A instrução **` UPDATE `** é usada para modificar registros existentes em uma tabela.

```sql
UPDATE nome_tabela
SET nome_coluna1 = valor1, nome_coluna2 = valor2
WHERE condition;
```

A instrução **` DELETE `** é usada para remover linhas de uma tabela.

```sql
DELETE FROM nome_tabela WHERE condition;
```

A instrução **` CREATE TABLE `** é usada para criar uma nova tabela em um banco de dados.

```sql
CREATE TABLE nome_tabela (
    nome_coluna1 datatype constraints,
    nome_coluna2 datatype constraints,
    nome_coluna3 datatype constraints
);
```

A instrução **` ALTER TABLE `** é usada para adicionar, excluir/descartar ou modificar colunas na tabela existente. Também é usado para adicionar e eliminar restrições na tabela existente.

```sql
-- Para adicionar uma coluna
ALTER TABLE nome_tabela
ADD nome_coluna datatype;
```

```sql
-- Para excluir/descartar coluna
ALTER TABLE nome_tabela
DROP COLUMN nome_coluna;
```

```sql
-- Para modificar a coluna existente
ALTER TABLE nome_tabela
MODIFY COLUMN nome_coluna datatype;
```

A instrução DROP TABLE é usada para eliminar uma tabela existente em um banco de dados.

```sql
DROP TABLE nome_tabela;
```

### Palavras-chave (SQL keywords)

SQL emprega uma série de palavras-chave de comando padrão que são essenciais para interagir com bancos de dados. Palavras-chave em SQL fornecem instruções sobre qual ação deve ser executada.

Aqui estão algumas das principais palavras-chave SQL:

SELECT: Esta palavra-chave recupera dados de um banco de dados. Por exemplo,

```sql
SELECT * FROM tabela_clientes;
```

Na instrução acima ` * ` indica que todos os registros devem ser recuperados da tabela Clientes.

FROM: Usado em conjunto com **` SELECT `** para especificar a tabela da qual buscar dados.

WHERE: Usado para filtrar registros. Incorporando uma cláusula **` WHERE `**, você pode especificar condições que devem ser atendidas. Por exemplo,

```sql
SELECT * FROM tabela_clientes WHERE coluna_pais='Germany';
```

INSERT INTO: Este comando é usado para inserir novos dados em um banco de dados.

```sql
INSERT INTO tabela_clientes (coluna_cliente_ID, coluna_cliente_nome, coluna_nome_contato, coluna_endereco, Cidade, Codigo_Postal, coluna_pais)
VALUES ('Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');
```

UPDATE: esta palavra-chave atualiza os dados existentes em uma tabela. Por exemplo,

```sql
UPDATE tabela_clientes SET coluna_nome_contato='Alfred Schmidt', coluna_cidade='Frankfurt' WHERE coluna_cliente_ID=1;
```

DELETE: Este comando remove um ou mais registros de uma tabela. Por exemplo,

```sql
DELETE FROM tabela_clientes WHERE coluna_cliente_nome='Alfreds Futterkiste';
```

CREATE DATABASE: Como seu nome indica, esta palavra-chave cria um novo banco de dados.

```sql
CREATE DATABASE meu_banco_dados;
```

ALTER DATABASE, DROP DATABASE, CREATE TABLE, ALTER TABLE, DROP TABLE: Essas palavras-chave são usadas para modificar bancos de dados e tabelas.

Lembre-se de que o SQL não diferencia maiúsculas de minúsculas, o que significa que as palavras-chave podem ser escritas em letras minúsculas. O ideal é escreve-las em ` MAIÚSCULAS ` para facilitar a leitura. Existem muito mais palavras-chave em SQL, mas estas são algumas das mais comuns.

### Tipos de Dados (Data Types)

Os tipos de dados SQL definem o tipo de dados que podem ser armazenados na coluna de uma tabela de banco de dados. Dependendo do **SGBD**, os nomes dos tipos de dados podem diferir ligeiramente. Aqui estão os tipos gerais:

**` INT `** é usado para números inteiros. Por exemplo:

```sql
CREATE TABLE tabela_funcionarios (
    ID INT,
    coluna_nome VARCHAR(30)
);
```

**` DECIMAL `** é usado para números decimais e fracionários. Por exemplo:

```sql
CREATE TABLE tabela_itens (
    ID INT,
    coluna_preco DECIMAL(5,2)
);
```

**` CHAR `** é usado para strings de comprimento fixo. Por exemplo:

```sql
CREATE TABLE tabela_funcionarios (
    ID INT,
    coluna_inicial_nome CHAR(1)
);
```

**` VARCHAR `** é usado para strings de comprimento variável. Por exemplo:

```sql
CREATE TABLE tabela_funcionarios (
    ID INT,
    Name VARCHAR(30)
);
```

**` DATE `** é usado para datas no formato (YYYY-MM-DD).

```sql
CREATE TABLE tabela_funcionarios (
    ID INT,
    coluna_data_nascimento DATE
);
```

**` DATETIME `** é usado para valores de data e hora no formato (YYYY-MM-DD HH:MI:SS).

```sql
CREATE TABLE tabela_pedidos (
    ID INT,
    coluna_data_pedido DATETIME
);
```

**` BINARY `** é usado para strings binárias.

**` BOOLEAN `** é usado para valores booleanos (**` TRUE `** or **` FALSE `**).


*Lembre-se, a sintaxe específica para criar tabelas e definir tipos de dados de coluna pode variar um pouco dependendo do banco de dados SQL que você está usando (MySQL, PostgreSQL, SQL Server, SQLite, Oracle, etc.), mas o conceito geral e a organização dos tipos de dados são plataforma cruzada.*

### Operadores (Operators)

Operadores SQL são usados para realizar operações como comparações e cálculos aritméticos. Eles são muito cruciais na formação de consultas. Os operadores SQL são divididos nos seguintes tipos:

**Operadores Aritméticos**: São usados para realizar operações matemáticas. Aqui está uma lista desses operadores:

- **` + `** : Adição
- **` - `** : Subtração
- **` * `** : Multiplicação
- **` / `** : Divisão
- **` % `** : Modulo

Exemplo:

```sql
SELECT coluna_produto, coluna_preco, (coluna_preco * 0.18) as tax
FROM tabela_produtos;
```

**Operadores de comparação**: são usados na cláusula where para comparar uma expressão com outra. Alguns desses operadores são:

- **` = `**: Igual
- **` != or <> `**: Diferente
- **` > `**: Maior que
- **` < `**: Menor que
- **` >= `**: Maior ou Igual
- **` <= `**: Menor ou Igual

Exemplo:

```sql
SELECT name, coluna_idade
FROM tabela_estudante
WHERE age > 18;
```
**Operadores Lógicos**: São usados para combinar o conjunto de resultados de duas condições de componentes diferentes. Esses incluem:

- **` AND `**: Retorna verdadeiro se ambos os componentes forem verdadeiros.
- **` OU `**: Retorna verdadeiro se algum dos componentes for verdadeiro.
- **` NOT `**: Retorna o valor booleano oposto da condição.

Example:

```sql
SELECT * 
FROM tabela_funcionarios
WHERE coluna_salario > 50000 AND age < 30;
```

**Operadores bitwise (bit a bit)**: executam operações em nível de bit nas entradas. Aqui está uma lista desses operadores:

- **` & `**: Realiza uma conjunção lógica em duas expressões numéricas (E).
- **` | `**: Realiza uma disjunção lógica em duas expressões numéricas (OU).
- **` ^ `**: Executa uma exclusão lógica em duas expressões numéricas (OU Exclusivo).

Operadores Bitwise são muito menos usados em SQL do que outros tipos de operadores.

*Lembre-se de que o tipo de dados do resultado depende dos tipos dos operandos.*

## Tabelas para Exemplos de uso:

Tabela **TABELA_PAIS**:
| pais_ID | coluna_nome | coluna_populacao | coluna_area |
| :---: | :---: | :---: | :---: |
| 1 | Italia | 66600000 | 640000 |
| 2 | Brazil | 21400000 | 851000000 |
| 3 | Estados Unidads | 331900000 | 331893745 |
| 4 | Argentina | 36260130 | 2780400 |
| ... | ... | ... | ... |

Tabela **TABELA_CIDADE**:
| cidade_ID | name | pais_ID | populacao | rating |
| :---: | :---: | :---: | :---: | :---: |
| 1 | Florença | 1 | 22400000 | 3 |
| 2 | Fortaleza | 2 | 26800000 | 5 |
| 3 | São Paulo | 2 | 12300000 | 1 |
| 4 | Maranhão | 2 | 685000000 | 33 |
| ... | ... | ... | ... | ... |

Tabela **TABELA_FUNCIONARIOS**:
| funcionarios_ID | coluna_nome | coluna_idade |coluna_posicao | coluna_salario | departamento_ID |
| :---: | :---: | :---: | :---: | :---: | :---: |  
| 1 | Janete | 25 | Manager | 50000 | 01|
| 2 | Joao | 18 | Clerk | 30000 | 02 |
| 3 | Roberto | 19 | Engineer | 40000 | 03 |
| 4 | Carlos | 20 | CEO | 60000 | 04 |
| 5 | Julio | 21 | Engineer | 40000 | 04 |
| ... | ... | ... | ... | ... | ... |

Tabela **TABELA_DEPARTAMENTO**:
| departamento_ID | coluna_departamento |
| :---: | :---: | 
| 1 | Setor Pessoal |
| 2 | Compras |
| 3 | Contabilidade |
| 4 | Administração |
| ... | ... |

Tabela **TABELA_ESTUDANTE**:
| estudante_ID | coluna_nome | coluna_idade | coluna_genero | coluna_data_nascimento |
| :---: | :---: | :---: | :---: | :---: |  
| 1 | Janete | 33 | Feminino | 01/04/1990 |
| 2 | Joao | 32 | Mascolino | 02/03/1991 |
| 3 | Roberto | 31 | Mascolino | 03/02/1992 |
| 4 | Carlos | 30 | Mascolino | 04/01/1993 |
| ... | ... | ... | ... | ... | ... |

Tabela **TABELA_PRODUTOS**:
| produtos_ID | coluna_produto | coluna_preco |
| :---: | :---: | :---: |
| 1 | Chocolate | 50000 |
| 2 | Café | 30000 |
| 3 | Leite | 40000 |
| 4 | Mantega | 60000 | 
| ... | ... | ... | 

Tabela **TABELA_PEDIDOS**:
| pedidos_ID | coluna_pedido | cliente_id | coluna_valor_pedido | coluna_data_pedido |
| :---: | :---: | :---: | :---: | :---: |  
| 1 | 20230826001 | 01 | 50000 | 26-08-2023  00:00:00 |
| 2 | 20230826002 | 02 | 30000 | 26-08-2023  00:00:00 |
| 3 | 20230826003 | 03 | 40000 | 26-08-2023  00:00:00 |
| 4 | 20230826004 | 04 | 60000 | 26-08-2023  00:00:00 |
| ... | ... | ... | ... | ... |

## SELECT
A instrução ` SELECT ` em SQL é usada principalmente para buscar dados do banco de dados. É um dos elementos mais essenciais do SQL.

Esta será a aparência do seu comando SELECT:

Sintaxe:
```sql
SELECT coluna_nome1, coluna_nome2, ...
FROM tabela_cidade;
```
Se quiser selecionar todas as colunas de uma tabela, você pode usar * assim:

```sql
SELECT *
FROM tabela_nome;
```
### Exemplo - SELECT
Considere que temos uma tabela ` TABELA_FUNCIONARIOS ` com colunas ` coluna_nome `, ` coluna_posicao ` e ` coluna_salario `. Podemos usar ` SELECT ` da seguinte maneira:

```sql
SELECT coluna_nome, coluna_posicao 
FROM tabela_funcionarios;
```
Isso recuperará todos os nomes e posicao de todos os funcionários da tabela `  TABELA_FUNCIONARIOS `:
| coluna_nome | coluna_posicao |
| :---: | :---: |
| Janete | Manager |
| Joao | Clerk |
| Roberto | Engineer |
| Carlos | CEO |
| Julio | Engineer |
| ... | ... |


### SELECT DISTINCT
A instrução ` SELECT DISTINCT ` é usada para retornar apenas valores distintos (diferentes). A palavra-chave ` DISTINCT ` elimina registros duplicados dos resultados.

Sintaxe:
```sql
SELECT DISTINCT coluna_nome1, coluna_nome2, ...
FROM tabela_nome;
```

### Exemplo - SELECT DISTINCT
Se quisermos selecionar todas as POSIÇÃO exclusivas da tabela ` TABELA_FUNCIONARIOS `, a consulta ficará assim:

```sql
SELECT DISTINCT coluna_posicao 
FROM tabela_funcionarios;
```

A consulta retornaria os valores únicos encontrados na coluna coluna_posicao da tabela ` TABELA_FUNCIONARIOS `:
| coluna_posicao |
| :---: |
| Manager |
| Clerk |
| Engineer |
| CEO |

### SELECT WHERE
A instrução `SELECT` combinada com `WHERE` nos dá a capacidade de filtrar registros com base em uma condição.

Sintaxe:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

### Exemplo - SELECT WHERE
Comsiderando que temos a tabela ` TABELA_FUNCIONARIOS ` com as colunas ` funcionarios_ID `,	` coluna_nome `, ` coluna_posicao ` e ` coluna_salario `. Para selecionar funcionários com salário superior a 50.000, você pode usar esta consulta:

```sql
SELECT * 
FROM tabela_funcionarios 
WHERE coluna_salario > 50000;
```

A consulta retornaria somente os valores onde o Salario é superior a 50.000:

| funcionarios_ID | coluna_nome | coluna_posicao | coluna_salario | coluna_data_nascimento |
| :---: | :---: | :---: | :---: | :---: |  
| 4 | Carlos | CEO | 60000 | 04-01-1993 |

##  FROM

A cláusula FROM em SQL especifica as tabelas das quais a recuperação deve ser feita. É parte integrante das instruções SELECT e variantes de SELECT como ` SELECT INTO ` e ` SELECT WHERE `. ` FROM ` também pode ser usado para unir tabelas.

Normalmente, ` FROM ` é seguido por uma lista delimitada por espaço de tabelas nas quais a operação ` SELECT ` deve ser executada. Se precisar extrair dados de várias tabelas, separe cada tabela com uma vírgula.

Aqui estão alguns exemplos:

### Exemplo 1 – Uso Simples

Se você tiver uma tabela chamada ` TABELA_FUNCIONARIOS `, poderá selecionar todos os dados dos funcionários assim:

```sql
SELECT * 
FROM tabela_funcionarios;
```

Neste exemplo, ` * ` significa “todas as colunas”. Então, ` SELECT * FROM tabela_funcionarios; ` recuperará todos os dados da tabela de **Funcionários**.

### Exemplo 2 – FROM com múltiplas tabelas

Se você tiver várias tabelas, digamos, ` TABELA_FUNCIONARIOS ` e ` TABELA_DEPARTAMENTO `, e quiser selecionar dados de ambos, poderá fazer o seguinte:

```sql
SELECT tabela_funcionarios.coluna_nome, tabela_departamento.coluna_departamento 
FROM tabela_funcionarios, tabela_departamento 
WHERE tabela_funcionarios.departamento_ID = tabela_departamento.departamento_ID;
```
Neste exemplo, a cláusula FROM é seguida por duas tabelas: ` TABELA_FUNCIONARIOS ` e ` TABELA_DEPARTAMENTO `. ` tabela_funcionarios.coluna_nome ` e ` tabela_departamento.coluna_departamento.coluna_departamento ` indicam que estamos selecionando a ` coluna_nome ` da ` TABELA_FUNCIONARIOS ` e a coluna ` coluna_departamento ` da tabela ` TABELA_DEPARTAMENTO `.

| coluna_nome | coluna_departamento |
| :---------: | :-----------------: |
| Janete      | Setor Pessoal       |
| Joao        | Compras             |
| Roberto     | Contabilidade       |
| Carlos      | Administração       |
| Julio       | Administração       |
| ...         | ...                 |

Lembre-se, sempre respeite a ordem das operações no SQL. A cláusula ` FROM ` funciona somente após a identificação das tabelas.

Em consultas SQL complexas em que pode ser necessário extrair dados de diversas tabelas, os aliases são usados para renomear temporariamente as tabelas na instrução SQL individual.

### Exemplo 3 – FROM com Aliases

Abaixo está um exemplo de cláusula ` FROM ` com aliases:

```sql
SELECT e.coluna_nome, d.coluna_departamento 
FROM tabela_funcionarios AS e, tabela_departamento AS d
WHERE e.departamento_ID = d.departamento_ID;
```

Neste exemplo, as tabelas ` TABELA_FUNCIONARIOS ` e ` TABELA_DEPARTAMENTO ` são denominadas ` E ` e ` D `, respectivamente.

| coluna_nome | coluna_departamento |
| :---------: | :-----------------: |
| Janete      | Setor Pessoal       |
| Joao        | Compras             |
| Roberto     | Contabilidade       |
| Carlos      | Administração       |
| Julio       | Administração       |
| ...         | ...                 |

É isso! Lembre-se que ` FROM ` não se limita apenas a ` SELECT `. Também é aplicável às operações ` UPDATE ` e ` DELETE `.

## WHERE

SQL fornece uma cláusula ` WHERE ` que é basicamente usada para filtrar os registros. Se a condição especificada na cláusula ` WHERE ` for satisfeita, somente ela retornará o valor específico da tabela. Você deve usar a cláusula WHERE para filtrar os registros e buscar apenas os registros necessários.

A cláusula ` WHERE ` não é usada apenas na instrução ` SELECT `, mas também nas instruções ` UPDATE `, ` DELETE `, etc., que aprenderemos nos capítulos subsequentes.

Um exemplo de sua implementação é:

```sql
SELECT * FROM tabela_estudante WHERE coluna_idade > 10;
```

Neste exemplo, a instrução seleciona todos os campos da tabela ‘Alunos’ onde o valor do campo ‘Idade’ é maior que 10.

A cláusula ` WHERE ` pode ser combinada com os operadores ` AND `, ` OR ` e ` NOT `. Aqui está um exemplo:

```sql
SELECT * FROM tabela_estudante WHERE coluna_idade > 10 AND coluna_genero = 'Feminino';
```

Neste exemplo, a estrução seleciona todos os campos da tabela ‘tabela_estudante’ onde o valor do campo ‘Idade’ é maior que 10 e o ‘Sexo’ é Feminino.

A sintaxe geralmente é assim:

```sql
SELECT coluna_nome1, coluna_nome2, ...
FROM tabela_nome
WHERE condicao;
```
## ORDER BY

A cláusula ` ORDER BY ` em SQL é usada para classificar o conjunto de resultados de uma instrução ` SELECT ` em ordem crescente ou decrescente. Ele classifica os registros em ordem crescente por padrão. Se quiser classificar os registros em ordem decrescente, você deve usar a palavra-chave ` DESC `.

**Sintaxe para Ordem Crescente:**

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC;
```
Aqui, ` ASC ` é usado para ordem crescente. Se você usar ` ORDER BY ` sem ` ASC ` ou ` DESC `, ` ASC ` será usado por padrão.

**Sintaxe para Ordem Decrescente:**

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... DESC;
```

Aqui, ` DESC ` é usado para ordem decrescente.

**Exemplo de uso**

Considere a seguinte tabela ` TABELA_CLIENTES `:

| clientes_ID | coluna_nome | coluna_idade | coluna_salario | departamento_ID |
| :---: | :---: | :---: | :---: | :---: | :---: |  
| 1 | Janete | 25 | 50000 | 01|
| 2 | Joao | 18 | 30000 | 02 |
| 3 | Roberto | 19 | 40000 | 03 |
| 4 | Carlos | 20 | 60000 | 04 |
| 5 | Julio | 21  | 40000 | 04 |
| ... | ... | ... | ... | ... |

**Exemplo 1 - Ordem Crescente:**

Classifique a tabela pela coluna ` coluna_nome ` em Ordem Crescente:

```sql
SELECT * FROM tabela_clientes
ORDER BY NAME ASC;
```

**Exemplo 2 - Ordem Decrescente:**

Classifique a tabela pela coluna SALÁRIO em Ordem Decrescente:

```sql
SELECT * FROM tabela_clientes
ORDER BY coluna_salario DESC;
```

**Exemplo 3 - Múltiplas Colunas:**

Você também pode classificar por várias colunas. Classifique a tabela pela coluna ` coluna_idade ` em ordem crescente e depois ` coluna_salario ` em Ordem Decrescente:

```sql
SELECT * FROM tabela_clientes
ORDER BY coluna_idade ASC, coluna_salario DESC;
```

Neste caso, a cláusula ` ORDER BY ` primeiro classifica a tabela ` TABELA_CLIENTES ` pela coluna ` coluna_idade ` e depois classifica o resultado classificado pela coluna ` coluna_salario `.

## GROUP BY
“Group By” é uma cláusula SQL usada para organizar dados idênticos em grupos. Esta cláusula se enquadra na categoria de Funções de Grupo, junto com Contagem, Soma, Média, etc.

**A sintaxe para 'Group by' é:**

```sql
SELECT coluna_nome1, coluna_nome2
FROM tabela_nome
GROUP BY coluna_nome1, coluna_nome2;
```
Aqui, coluna_nome1, coluna_nome2, são os nomes das colunas com base nas quais queremos agrupar os resultados.

**Exemplo:**

Suponha que temos uma tabela ` TABELA_VENDAS `. Esta tabela possui três colunas: vendas_ID, coluna_item e coluna_valor.
| vendas_ID | coluna_item | coluna_valor |
| :---:     | :---:       | :---:        |
| 1         | carro       | 50000        |
| 2         | moto        | 30000        |
| 3         | barco       | 40000        | 
| 4         | casa        | 60000        |
| 5         | apartamento | 40000        |
| 6         | carro       | 30000        |
| 7         | casa        | 60000        |
| 8         | moto        | 30000        |
| ...       | ...         | ...          |

Execute a seguinte instrução SQL…

```sql
SELECT coluna_item, SUM(coluna_valor)
FROM tabela_vendas
GROUP BY coluna_item;
```
| coluna_item | SUM(coluna_valor) |
| ----------- | ----------------- |
| carro       | 80000             |
| moto        | 60000             |
| barco       | 40000             |
| casa        | 120000            |
| apartamento | 40000             |
| ...         | ...               |

Isso irá concatenar, ou “**agrupar**”, todos os itens iguais em uma linha, aplicando a função ` SUM() ` em seus respectivos Valores. A saída será então:

**Group By com cláusula Tendo**

A cláusula Group By também pode ser usada com a palavra-chave Tendo. A palavra-chave Tendo permite filtrar os resultados da função de grupo.

Por exemplo:

```sql
SELECT coluna_item, SUM(coluna_valor)
FROM tabela_vendas
GROUP BY coluna_item
HAVING SUM(coluna_valor) > 150;
```

Isso retornará todos os itens agrupados onde o valor total for superior a 150. Portanto, o resultado será:

| coluna_item | SUM(coluna_valor) |
| ----------- | ----------------- |
| casa        | 120000            |
| ...         | ...               |


## APELIDOS (ALIASES)

### Exemplo em Colunas
Um alias ou apelido é um nome alternativo que pode ser atribuído a uma tabela ou a uma coluna em uma consulta. Isso pode ser útil para simplificar a consulta, melhorar a legibilidade do código ou evitar conflitos de nome.

Exemplo de consulta utilizando alias na coluna ` coluna_nome ` da tabela ` TABELA_CLIDADE `, com o apelido (AS) ` coluna_cidade `:

```sql
SELECT name AS coluna_cidade
FROM city;
```
Neste exemplo, em vez de retornar a coluna ` coluna_nome ` com o nome original, a consulta retorna a mesma coluna com o apelido ` coluna_cidade `. Esse apelido pode ser usado para se referir à coluna em outras partes da consulta, como em cláusulas ` WHERE ` ou em outras junções.

Resultado:
| cidade_ID | coluna_cidade |
| :---: | :---: | 
| 4 | Maranhão | 
| 3 | São Paulo | 
| 2 | Fortaleza | 
| 1 | Florença | 
| ... | ... | 

### Exemplo em Tabela
Outra forma de utilizar aliases é atribuir apelidos às tabelas em uma consulta.

Exemplo de consulta utilizando alias nas tabelas CITY e COUNTRY, com os apelidos CI e CO, respectivamente:
```sql
SELECT co.name, ci.name
FROM city AS ci
JOIN country AS co
  ON ci.country_id = co.id;
```

Neste exemplo, as tabelas CITY e COUNTRY foram apelidadas de CI e CO, respectivamente. Isso permite referenciar as tabelas de forma mais concisa na consulta. A junção é realizada comparando os valores das colunas COUNTRY_ID da tabela CI (apelido para CITY) e ID da tabela CO (apelido para COUNTRY).

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

## SUBCONSULTAS (SUBQUERIES)
Uma subconsulta é uma consulta aninhada dentro de outra consulta ou dentro de outra subconsulta. Existem diferentes tipos de subconsultas.

### SINGLE VALUE
A subconsulta mais simples retorna exatamente uma coluna e exatamente uma linha. Pode ser usado com operadores de comparação =, <, <=, > ou >=.

Esta consulta encontra cidades com a mesma classificação de Paris:
```sql
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
```sql
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
```sql
SELECT *
FROM city main_city
WHERE population > (
	SELECT AVG(population)
	FROM city average_city
	WHERE average_city.country_id = main_city.country_id
);
```
Esta consulta encontra países que possuem pelo menos uma cidade:
```sql
SELECT name
FROM country
WHERE EXISTS (
	SELECT *
	FROM city
	WHERE country_id = country.id
);
```
### OPERADORES DE COMPARAÇÃO (COMPARISON OPERATORS)

a) Consultar **`NAME`** da **`CITY`** com **`RATING`** acima de 3
```sql
SELECT name
FROM city
WHERE rating > 3;
```
Resultado:
| name |
| :---: |
| Fortaleza |
| Maranhão |

b) Consultar **`NAME`** de **`CITY`** diferente de `FLORENÇA` e `FORTALEZA`
```sql
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

a) Consultar **`NAME`** de **`CITY`** que começam com 'f' ou terminam com 'a':
```sql
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

b) Consultar **`NAME`** de **`CITY`** que começe com qualquer letra seguida por 'ortaleza':
```sql
SELECT name
FROM city
WHERE name LIKE '_ortaleza';
```
Resultado:
| id | name |
| :---: | :---: |
| 2 | Fortaleza |

### OUTROS OPERADORES (OTHER OPERATORS)

a) Consultar **`NAME`** de **`CITY`** com `POPULATION` entre(between) 500K e 5M:
```sql
SELECT name
FROM city
WHERE population BETWEEN 500000 AND 5000000;
```
b) Consultar **`NAME`** de **`CITY`** que não possuem um valor de **`RATING`**:
```sql
SELECT name
FROM city
WHERE rating IS NOT NULL;
```
c) Consultar **`NAME`** de **`CITY`** que estão em `COUNTRY` com `IDs` 1, 4, 7 ou 8:
```sql
SELECT name
FROM city
WHERE country_id IN (1, 4, 7, 8);
```

## GERENCIANDO TABELAS (MANAGING TABLES)

Aqui estão algumas dicas para usar no SQL com uma tabela chamada DISTRICT, uma visualização representada por V e uma coluna representada por C:

a) Criar uma nova tabela chamada DISTRICT com três colunas (id, name, price):

```sql
CREATE TABLE district (id INT PRIMARY KEY, name VARCHAR NOT NULL,price INT DEFAULT 0)
```
Resultado após criar a tabela DISTRICT (Bairro):

| id | name | price |
| :---: | :---: | :---: |

OBS: Os valores para id, name e price devem ser inseridos nas respectivas colunas da tabela.

b) Para adicionar uma nova coluna chamada `WEALTH` à tabela **`DISTRICT`**, você pode usar a seguinte consulta:

```sql
ALTER TABLE district ADD COLUMN wealth
```
Resultado:
| id | name | price | wealth |
| :---: | :---: | :---: | :---: |

c) Para inserir os dados na tabela **`DISTRICT`**, você pode usar a seguinte consulta:
A nova linha foi adicionada à tabela district com o id igual a 1, o name igual a "Fortaleza", o price igual a 2000000 e o wealth igual a 4000000000.

```sql
INSERT INTO district (name, price, wealth) VALUES ('Fortaleza', 2000000, 4000000000);
```
Resultado:
| id | name | price | wealth |
| :---: | :---: | :---: | :---: |
| 1 | Fortaleza | 2000000 | 4000000000 |

d) Excluir coluna `WEALTH` da tabela **`DISTRICT`**

```sql
ALTER TABLE district DROP COLUMN wealth
```
Resultado:
| id | name | price |
| :---: | :---: | :---: |
| 1 | Fortaleza | 2000000 |

Adicionar uma restrição(`CONSTRAINT`)
```sql
ALTER TABLE district ADD constraint
```
OBS: As restrições(CONSTRAINT) podem ser especificadas quando a tabela é criada com a instrução CREATE TABLE ou depois que a tabela é criada com a instrução ALTER TABLE.

Excluir uma restrição(CONSTRAINT)

```sql
ALTER TABLE district DROP constraint
```

Renomear tabela "district1" para "T2"
```sql
ALTER TABLE district1 REMANE TO t2
```

Renomear Coluna "C1" para "C2" da tabela "district1"
```sql
ALTER TABLE district1 RENANE cl TO c2
```

Remover todos os dados da tabela **`DISTRICT`**
```sql
TRUNCATE TABLE district
```

Excluir a tabela **`DISTRICT`** do banco de dados

```sql
DROP TABLE district
```

## GERENCIANDO GATILHOS(MANAGING TRIGGERS)

Criar ou modificar um gatilho(TRIGGER), neste exemplo o gatilho terá o nome de **`trigger_name`** 
```sql
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
```sql
CREATE TRIGGER
BEFORE INSERT
ON person FOR EACH ROW
EXECUTE stored_procedure ;
```
Excluir um gatilho(TRIGGER) específico
```sql
DROP TRIGGER trigger_name
```

## GERENCIANDO VIEWS(MANAGING VIEWS)
Crie uma nova VIEW que consiste em cl e c2
```sql
CREATE VIEW v(c1,c2) AS
SELECT cl, c2
FROM district
```
Crie uma nova VIEW com a opção de verificação
```sql
CREATE VIEW v(c1,c2) AS
SELECT Cl, C2
FROM district
```
Criar uma VIEW recursiva
```sql
WITH [CASCADED | LOCAL] CHECK OPTION
CREATE RECURSIVE VIEW v AS
select-statement —- anchor part
UNION [ALL]
select-statement —- recursive part
```
Criar uma VIEW temporária
```sql
CREATE TEMPORARY VIEW v AS
SELECT cl, C2
FROM district
```
Excluir uma VIEW
```sql
DROP VIEW view_name
```
## MODIFICANDO DADOS (MODIFYING DATA)

Inserir(INSERT) uma linha(ROW) na tabela(TABLE) **`DISTRICT`**
```sql
INSERT INTO district(column_list)
VALUES( value_list);
```
Inserir várias linhas(ROWS) na tabela(TABLE) **`DISTRICT`**:
```sql
INSERT INTO district(column_list)
VALUES 	(vatue_list),
		(vatue_list), ....;
```
Inserir linhas(ROWS) da tabela(TABLE) `district2` no **`district1`**:
```sql
INSERT INTO district1(column_list)
SELECT column_list 
	FROM district2;
```
Update new value in the column cl for all rows
```sql
UPDATE district
SET cl = new_value;
```
Update values in the column cl, c2 that match the condition
```sql
UPDATE district
SET	cI = new_value,
	c2 = new_value
WHERE condition;
```
Delete all data in a table
```sql
DELETE FROM district;
```
Delete subset of rows in a table
```sql
DELETE FROM district
WHERE condition;
```
## CONSULTANDO EM MÚLTIPLAS TABELAS (QUERYING FROM MULTIPLE TABLES)

Tabela COUNTRY (País)
| id | name |
| :---: | :---: |
| 1 | Italia |
| 2 | Brazil |
| 3 | Estados Unidads |
| 4 | Argentina |
| ... | ... |

Tabela CITY (Cidade)
| id | name | country_id |
| :---: | :---: | :---: |
| 1 | Florença | 1 |
| 2 | Fortaleza | 2 |
| 3 | São Paulo | 2 |
| 4 | Maranhão | 2 |
| ... | ... | ... |

### INNER JOIN
JOIN (ou explicitamente INNER JOIN) retorna apenas as linhas das tabelas que têm correspondência na outra tabela. Em outras palavras, somente os registros que possuem valores correspondentes em ambas as tabelas são incluídos no resultado.
```sql
SELECT city.name, country.name
FROM city
[INNER] JOIN country
ON city.country_id = country.id;
```
Resultado:
| city.name | country.name |
| :---: | :---: |
| Florença | Italia |
| Fortaleza | Brazil |
| São Paulo | Brazil |
| Maranhão | Brazil |
| ... | ... |

### LEFT JOIN
LEFT JOIN retorna todas as linhas da tabela esquerda com linhas correspondentes da tabela à direita. Se não houver linha correspondente, NULLs são retornados como valores do segunda mesa.
```sql
SELECT city.name, country.name
FROM city
LEFT JOIN country
ON city.country_id = country.id;
```
### RIGHT JOIN
RIGHT JOIN retorna todas as linhas da tabela da direita com linhas correspondentes da tabela à esquerda. Se não houver linha correspondente, NULLs são retornados como valores da esquerda tabela.
```sql
SELECT city.name, country.name
FROM city
RIGHT JOIN country
ON city.country_id = country.id;
```
### FULL JOIN
FULL JOIN (ou explicitamente FULL OUTER JOIN) retorna todas as linhas de ambas as tabelas, incluindo registros que não têm correspondência na outra tabela. Quando um registro não possui correspondência na outra tabela, o valor para essa tabela é nulo. Em outras palavras, o resultado inclui todos os registros de ambas as tabelas, independentemente de haver correspondência ou não.
```sql
SELECT city.name, country.name
FROM city
FULL [OUTER] JOIN country
ON city.country_id = country.id;
```

### CROSS JOIN
CROSS JOIN retorna o produto cartesiano de duas tabelas. Em outras palavras, ele combina cada linha da primeira tabela com todas as linhas da segunda tabela, sem levar em consideração qualquer condição de junção. Existem duas sintaxes disponíveis.
```sql
SELECT city.name, country.name
FROM city
CROSS JOIN country;
```

```sql
SELECT city.name, country.name
FROM city, country;
```
### NATURAL JOIN
NATURAL JOIN combina duas tabelas usando todas as colunas com o mesmo nome automaticamente, sem precisar especificar as condições de junção explicitamente. Em outras palavras, o NATURAL JOIN compara as colunas de ambas as tabelas com o mesmo nome e retorna as linhas que têm valores iguais nessas colunas.

```sql
SELECT city.name, country.name
FROM city
NATURAL JOIN country;
```

## FUNÇÕES AGREGADAS (AGGREGATE FUNCTIONS)
Funções agregadas SQL são funções integradas usadas para realizar alguns cálculos nos dados e retornar um único valor. É por isso que eles formam a base para “consultas agregadas”. Essas funções operam em um conjunto de linhas e retornam um único resultado resumido.

- count(column_name) − Conta o número de linhas de uma coluna.
```sql
SELECT COUNT(column_name) 
FROM table_name 
WHERE condition;
```
- sum(column_name) − Retorna a soma de uma coluna numérica.
```sql
SELECT SUM(column_name) 
FROM table_name 
WHERE condition;
```
- avg(column_name) − Retorna o valor médio de uma coluna numérica.
```sql
SELECT AVG(column_name) 
FROM table_name 
WHERE condition;
```
- min(column_name) − Retorna o menor valor da coluna selecionada.
```sql
SELECT MIN(column_name) 
FROM table_name 
WHERE condition;
```
- max(column_name) − Retorna o maior valor da coluna selecionada.
```sql
SELECT MAX(column_name) 
FROM table_name 
WHERE condition;
```

Veja alguns exemplo de uso:

Descubra o número de cidades:
```sql
SELECT COUNT(rating)
FROM city;
```
Descubra o número de cidades com classificações não nulas:
```sql
SELECT COUNT(DISTINCT country_id)
FROM city;
```
Descubra o número de valores de país distintos:
```sql
SELECT MIN(population), MAX(population)
FROM country;
```
Descubra as menores e as maiores populações do país:
```sql
SELECT country_id, SUM(population)
FROM city
GROUP BY country_id;
```
Descubra a população total das cidades nos respectivos países:
```sql
SELECT country_id, AVG(rating)
FROM city
GROUP BY country_id
HAVING AVG(rating) > 3.0;
```
## AGRUPAMENTO (GROUPING)

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

Agrupo todos os valores da coluna **`pais_ID`** agrupados em uma coluna chamada **`Contagem`**.
```sql
SELECT pais_ID, COUNT(*) AS Contagem 
FROM tabela_cidade 
GROUP BY pais_ID;
```
Resultado:
| pais_ID | count | 
| :---:      | :---: |
| 1          | 2     | 
| 2          | 3     | 
| 3          | 2     | 
| ...        | ...   |

## USANDO RESTRIÇÕES SQL (USING SQL CONSTRAINTS)

Definir C1 e CZ como chave-primária(primary-key)
```sql
CREATE TABLE t(
	cl INT, C2 INT, C3 VARCHAR,
	PRIMARY KEY (cl,c2)
);
```
Defina a coluna c2 como uma chave-estrangeira(foreign-key)
```sql
CREATE TABLE district1(
Cl INT PRIMARY KEY,
C2 INT,
FOREIGN KEY (c2) REFERENCES t2(c2)
);
```
Torne os valores em cl e c2 exclusivos(UNIQUE)
```sql
CREATE TABLE t(
cl INT, cl INT,
UNIQUE(c2, c3)
);
```
Certifique-se de que cl > 0 e valores em cl>=c2
```sql
CREATE TABLE t(
cl INT, c2 INT,
CHECK(c1> 0 AND cl >= c2)
);
```
Definir valores na coluna c2 não é nulo (NOT NULL)
```sql
CREATE TABLE t(
cl INT PRIMARY KEY,
c2 VARCHAR NOT NULL
);
```
## USANDO OPERADORES SQL (USING SQL OPERATORS)

Combine Rows FROM districtwo Queries
```sql
SELECT cl, C2 FROM districtl
UNION [ALL]
SELECT Cl, C2 FROM district2;
```
Return The Intersection Of TWO Queries
```sql
SELECT cl, c2 FROM districdistrict1
INTERSECT
SELECT Cl, C2 FROM district2;
```
Subtract A Result Set From Another Result Set
```sql
SELECT cl, c2 FROM districtl
MINUS
SELECT cl, C2 FROM district2;
```
Query Rows Using Pattern Matching _
```sql
SELECT cl, c2 FROM districtl
WHERE Cl [NOT] LIKE pattern;
```
Query Rows In A List
```sql
SELECT Cl, c2 FROM district
WHERE cl [NOT] IN value_list;
```
Query Rows Between Two Values
```sql
SELECT cl, c2 FROM district
WHERE cl BETWEEN low AND high;
```
Check If Values In A Table IS NULL Or Not
```sql
SELECT cl, C2 FROM district
WHERE cl IS [NOT] NULL;
```

## Contribuição

Clone este repositório para o seu ambiente local:

```bash
git clone https://github.com/seu-usuario/sql-cheat-sheet.git
```
## Referência

 - [W3Schools - SQL Tutorial](https://www.w3schools.com/sql)
 - [SQL Basics Cheat Sheet - LearnSQL.com](https://learnsql.com/blog/sql-basics-cheat-sheet/)
 - [SQL Basics Cheat Sheet - DataCamp](https://www.datacamp.com/cheat-sheet/sql-basics-cheat-sheet)
 - [Roadmap.sh](https://roadmap.sh/sql)
