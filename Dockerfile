# Use imagem oficial pré-build para evitar build lento
FROM nocobase/nocobase:1.8.24-full

WORKDIR /app

# Copie apenas arquivos de config (se precisar customizar)
COPY package*.json ./

# Instale dependências de produção (rápido, pois base já tem muito)
RUN npm ci --only=production --no-optional

# Copie o código fonte (se houver customizações)
COPY . .

# Exponha a porta padrão do NocoBase (13000, mas Railway usa $PORT)
EXPOSE $PORT

# Comando de start oficial (usa variáveis de env para DB, etc.)
CMD ["npm", "start"]
