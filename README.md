# SQL-CHEAT-SHEET
Segue algumas dicas para utilizar no SQL
Neste exemplo nossa tabela tem o nome de "T", view de "V" e Coluna de "C":

OBS: Comando utilzados no Microsoft SQL Server.

## 1. GERENCIANDO TABELAS (MANAGING TABLES)

### Criar uma nova tabela chamada 't' com três colunas (id, nome, price)

```bash
CREATE TABLE t (id INT PRIMARY KEY, name VARCHAR NOT NULL,price INT DEFAULT 0)
```
### Excluir a tabela do banco de dados

```bash
DROP TABLE t
```

### Adicionar uma nova coluna à tabela
```bash
ALTER TABLE t ADD COLUMN c
```

### Excluir coluna "C" da tabela "T"
```bash
ALTER TABLE t DROP COLUMN c
```

### Adicionar uma restrição(CONSTRAINT)
```bash
ALTER TABLE t ADD constraint
```
OBS: As restrições(CONSTRAINT) podem ser especificadas quando a tabela é criada com a instrução CREATE TABLE ou depois que a tabela é criada com a instrução ALTER TABLE.

### Excluir uma restrição(CONSTRAINT)

```bash
ALTER TABLE t DROP constraint
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

