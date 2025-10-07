FROM nocobase/nocobase:1.8.24-full

# Copia os arquivos do projeto para o diretório de trabalho
COPY . /app/

# Limpa o cache do npm e instala dependências
RUN npm cache clean --force
RUN npm install --legacy-peer-deps

EXPOSE $PORT

CMD ["yarn", "start", "--port", "$PORT", "--host", "0.0.0.0"]
