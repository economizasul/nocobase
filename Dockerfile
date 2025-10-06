FROM node:18-alpine

WORKDIR /app

# Copie os arquivos de configuração
COPY package*.json ./

# Instale apenas as dependências de produção
RUN npm install --only=production

# Copie o restante do código
COPY . .

# Construa o projeto
RUN npm run build

# Exponha a porta (ajuste conforme necessário)
EXPOSE $PORT

# Comando para iniciar a aplicação
CMD ["sh", "-c", "node dist/index.js --port $PORT"]
