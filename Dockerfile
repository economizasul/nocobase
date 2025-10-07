FROM nocobase/nocobase:1.8.24-full

# Instala dependências com legacy-peer-deps para ignorar conflicts
RUN npm install --legacy-peer-deps

EXPOSE $PORT

CMD ["npx", "@nocobase/cli", "start", "--host", "0.0.0.0", "--port", "$PORT"]
