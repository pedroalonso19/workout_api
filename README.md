# Workout API

API REST para gerenciamento de atletas, categorias e centros de treinamento, construída com FastAPI, SQLAlchemy, PostgreSQL e Docker.

## Funcionalidades

- Cadastro, consulta, edição e remoção de **atletas**, **categorias** e **centros de treinamento**
- Filtros por nome e CPF nos endpoints de atletas
- Filtros por nome nos endpoints de categorias e centros de treinamento
- Customização de resposta nos endpoints de listagem
- Paginação com [fastapi-pagination](https://github.com/uriyyo/fastapi-pagination)
- Tratamento de exceções de integridade (ex: CPF duplicado, nome duplicado)
- Docker para banco de dados PostgreSQL

## Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seuusuario/workout-api.git
   cd workout-api
   ```

2. **Suba o banco de dados com Docker**
   ```bash
   docker-compose up -d
   ```

3. **Crie e ative o ambiente virtual**
   ```bash
   python -m venv meuambiente
   .\meuambiente\Scripts\activate
   ```

4. **Instale as dependências**
   ```bash
   pip install -r requirements.txt
   ```

5. **Execute as migrações**
   ```bash
   make create-migrations d="init"
   make run-migrations
   ```

6. **Inicie a API**
   ```bash
   make run
   ```
   Ou diretamente:
   ```bash
   uvicorn workout_api.main:app --reload --port 8001
   ```

## Endpoints principais

### Atletas
- `POST /atletas/` — Cadastra novo atleta
- `GET /atletas/` — Lista atletas (com filtros e paginação)
- `GET /atletas/{id}` — Consulta atleta por ID
- `PATCH /atletas/{id}` — Edita atleta
- `DELETE /atletas/{id}` — Remove atleta

### Categorias
- `POST /categorias/` — Cadastra nova categoria
- `GET /categorias/` — Lista categorias (com filtros e paginação)
- `GET /categorias/{id}` — Consulta categoria por ID

### Centros de Treinamento
- `POST /centros_treinamento/` — Cadastra novo centro de treinamento
- `GET /centros_treinamento/` — Lista centros de treinamento (com filtros e paginação)
- `GET /centros_treinamento/{id}` — Consulta centro de treinamento por ID

## Filtros e paginação

- **Atletas:** filtros por `nome`, `cpf`
- **Categorias:** filtro por `nome`
- **Centros de treinamento:** filtro por `nome`
- Paginação: `limit`, `offset`
- Exemplo:
  ```
  GET /atletas/?nome=João&limit=5&offset=0
  GET /categorias/?nome=Infantil&limit=10
  GET /centros_treinamento/?nome=Academia&limit=10
  ```


## Documentação

Acesse [http://localhost:8001/docs](http://localhost:8001/docs) para a documentação interativa Swagger.

## Banco de dados

- Usuário: `workout`
- Senha: `workout`
- Banco: `workout`
- Porta: `5432` (configurado no `docker-compose.yml`)