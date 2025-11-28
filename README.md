# sales-relational-db


Banco de dados relacional (Postgrees) modelando um sistema de vendas: clientes, produtos, pedidos, pagamentos e funcionários.


## Conteúdo do repositório
- `schema.sql` — DDL: criação de schema e tabelas
- `seed_data.sql` — dados de exemplo (INSERTs)
- `queries.sql` — queries analíticas para KPIs
- `docker-compose.yml` — levantar Postgres localmente
- `erd.png` — (opcional) diagrama ER


## Como rodar (localmente com Docker)
1. `docker-compose up -d`
2. Acesse o container: `docker-compose exec db psql -U postgres -d postgres -f /docker-entrypoint-initdb.d/schema.sql`
3. Em seguida rode `seed_data.sql` e `queries.sql` conforme desejar.


## Tecnologias
Postgres, SQL


## O que demonstra
- Modelagem relacional, DDL, integridade referencial
- Consultas analíticas (joins, agregações)
- Organização de repositório para pipelines de dados
