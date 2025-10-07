FROM nocobase/nocobase:1.8.24-full

# Copia os arquivos do projeto para o diretório de trabalho
COPY . /app/

# Instala dependências com legacy-peer-deps para ignorar conflitos
RUN npm install --legacy-peer-deps

EXPOSE $PORT

CMD ["npx", "@nocobase/cli", "start", "--host", "0.0.0.0", "--port", "$PORT"]
