# Revive Adserver v5.5

<img src="logo.png" alt="revive">

Este é um setup Docker otimizado para executar o **Revive Adserver v5.5.x** com tecnologias modernas e configurações de produção.

## 🚀 Tecnologias Utilizadas

- **Revive Adserver**: v5.5.x (mais recente)
- **PHP**: 8.1 (versão mais recente compatível)
- **Servidor Web**: Nginx (otimizado para performance)
- **Banco de Dados**: MySQL 8.0
- **Sistema Base**: Alpine Linux (imagem leve e segura)
- **Orquestração**: Docker Compose v3.8

## 🛠️ Instalação Rápida

1. **Clone o repositório e acesse o diretório:**
   ```bash
   cd revive-adserver
   ```

2. **Configure as variáveis de ambiente:**
   ```bash
   cp .env.example .env
   ```
   Edite o arquivo `.env` conforme necessário.

3. **Inicie os containers:**
   ```bash
   docker-compose up -d
   ```

4. **Acesse a instalação:**
   - Revive Adserver: http://localhost:8080
   - Mailpit (teste de emails): http://localhost:8025


## 🔧 Configuração

### Variáveis de Ambiente

| Variável | Padrão | Descrição |
|----------|--------|-----------|
| `APP_PORT` | `8080` | Porta da aplicação |
| `DB_DATABASE` | `revive` | Nome do banco de dados |
| `DB_USERNAME` | `revive` | Usuário do banco |
| `DB_PASSWORD` | `revive123` | Senha do banco |
| `DB_ROOT_PASSWORD` | `root123` | Senha root do MySQL |
| `TZ` | `America/Sao_Paulo` | Timezone do container |
| `SMTP_HOST` | `mailpit` | Servidor SMTP para testes |
| `SMTP_PORT` | `1025` | Porta SMTP |
| `MAILPIT_WEB_PORT` | `8025` | Porta web do Mailpit |

### Volumes Persistentes

- **`revive_mysql_data`**: Dados do MySQL
- **`revive_images`**: Imagens e criativos do Revive
- **`revive_delivery`**: Scripts de entrega de anúncios
- **`revive_var`**: Cache e configurações do Revive

## 🎯 Instalação do Revive Adserver

1. Após iniciar os containers, acesse: http://localhost:8080
2. Siga o assistente de instalação web
3. Use as seguintes configurações de banco:
   - **Servidor**: `mysql`
   - **Porta**: `3306`
   - **Database**: `revive` (ou conforme configurado no .env)
   - **Usuário**: `revive` (ou conforme configurado no .env)
   - **Senha**: `revive123` (ou conforme configurado no .env)

## 📄 Licença

Este setup Docker é fornecido sob a mesma licença do Revive Adserver.