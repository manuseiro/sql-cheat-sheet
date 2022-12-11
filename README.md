# SQL-CHEAT-SHEET
Segue algumas dicas para utilizar no SQL

# 1. GERENCIANDO TABELAS (MANAGING TABLES)

## Criar uma nova tabela chamada 't' com três colunas (id, nome, price)

```bash
CREATE TABLE t (id INT PRIMARY KEY, name VARCHAR NOT NULL,price INT DEFAULT 0)
```
## Excluir a tabela do banco de dados

```bash
DROP TABLE t
```

## Adicionar uma nova coluna à tabela
```bash
ALTER TABLE t ADO column;
```

## Drop c f rom the table
```bash
ALTER TABLE t DROP COLUMN c
```

## Adicionar uma restrição
```bash
ALTER TABLE t ADO constraint;
```

## Drop a constraint
```bash
ALTER TABLE t DROP constraint;
```

## Renomear uma tabela de tl para t2
```bash
ALTER TABLE tl REMANE TO t2;
```

## Renomeie a coluna cl para c2
```bash
ALTER TABLE tl RENANE cl TO c2
```

## Remover dados em uma tabela
```bash
TRUNCATE TABLE t;
```
