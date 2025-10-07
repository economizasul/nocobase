# Fase de build
FROM node:20.19.5 AS builder

WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Limpa cache e instala dependências
RUN npm cache clean --force
RUN npm config set registry https://registry.npmmirror.com/
RUN npm install --legacy-peer-deps

# Fase de runtime
FROM nocobase/nocobase:1.8.24-full

WORKDIR /app

# Copia apenas as dependências instaladas
COPY --from=builder /app/node_modules ./node_modules
COPY . .

EXPOSE $PORT

CMD ["npm", "start", "--port", "$PORT", "--host", "0.0.0.0"]
