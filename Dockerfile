FROM node:18-alpine

WORKDIR /app

# Instala dependências básicas
RUN apk add --no-cache bash git postgresql-client

# Copia arquivos e instala dependências
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production=false

COPY . .

# Apenas build (sem init no build)
RUN yarn build

# Expõe a porta
EXPOSE 13000

# Copia script de entrada
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

CMD ["/app/docker-entrypoint.sh"]
