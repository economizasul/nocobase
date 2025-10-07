# 1. Use a imagem base do Nocobase
FROM nocobase/nocobase:1.8.24-full

# 2. Defina o diretório de trabalho (geralmente /app/nocobase é o padrão para nocobase)
WORKDIR /app/nocobase

# 3. Copie os arquivos de configuração de dependências
# O ponto crucial: Copiar o package.json que o log diz que está faltando
COPY package*.json ./

# 4. Instale as dependências (yarn é o mais comum no ecossistema nocobase/node)
# Isso garantirá que o @nocobase/cli e o @nocobase/server estejam instalados
RUN yarn install --production --frozen-lockfile

# 5. Copie o resto da aplicação (se houver customizações ou outros arquivos)
# Se você tiver um diretório 'packages' ou 'storage', copie eles também
# Exemplo (se os arquivos nocobase estão no diretório raiz do seu projeto Railway):
COPY . /app/nocobase

# Exponha a porta (Railway usa $PORT)
EXPOSE $PORT

# Comando de start oficial
CMD ["sh", "-c", "npx @nocobase/cli start --host 0.0.0.0 --port $PORT"]
