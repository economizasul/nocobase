FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache bash git postgresql-client

COPY package*.json ./
# CORRIGIDO: Mudança de 'npm ci' para 'npm install' para evitar o erro de 'package-lock.json'
RUN npm install --only=production

COPY . .
RUN npm run build

EXPOSE $PORT

# Seu comando CMD original mantido:
CMD ["sh", "-c", "PORT=$PORT node ./dist/index.js --port $PORT"]

