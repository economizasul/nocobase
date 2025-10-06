FROM node:18-alpine

WORKDIR /app

# Instala dependências básicas e ferramentas necessárias
RUN apk add --no-cache bash git postgresql-client libpq-dev

# Define usuário root para evitar problemas de permissão
USER root

# Copia arquivos e instala dependências
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production=false

COPY . .

# Build e inicialização do NocoBase
RUN yarn build
RUN yarn nocobase init --non-interactive --db-type=postgres --db-host=${DB_HOST} --db-port=${DB_PORT} --db-database=${DB_DATABASE} --db-username=${DB_USERNAME} --db-password=${DB_PASSWORD} --admin-user=${ADMIN_USER} --admin-password=${ADMIN_PASSWORD} --skip-license --license-type=community --skip-git

EXPOSE 13000

CMD ["yarn", "start"]
