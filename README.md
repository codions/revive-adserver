# Revive Adserver v5.5

<img src="logo.png" alt="revive">

Este é um setup Docker otimizado para executar o **Revive Adserver v5.5.x** com tecnologias modernas e configurações de produção.

## 🚀 Tecnologias Utilizadas

- **Revive Adserver**: v5.5.x (mais recente)
- **PHP**: 8.1 (versão mais recente compatível)
- **Servidor Web**: Nginx
- **Banco de Dados**: MySQL 8.0
- **Sistema Base**: Alpine Linux

## 🛠️ Instalação Rápida

1. **Clone o repositório e acesse o diretório:**
   ```bash
   cd revive-adserver
   ```

2. **Inicie os containers:**
   ```bash
   docker-compose up -d
   ```

3. **Acesse a instalação:**
   - Revive Adserver: http://localhost:8080


## 🔧 Configuração

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
   - **Senha**: `secret` (ou conforme configurado no .env)

## 📄 Licença

Este setup Docker é fornecido sob a mesma licença do Revive Adserver.