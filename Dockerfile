# Use imagem oficial pré-build
FROM nocobase/nocobase:1.8.24-full

# Exponha a porta (Railway usa $PORT)
EXPOSE $PORT

# Comando de start com host e porta configuráveis
CMD ["sh", "-c", "npm start -- --host 0.0.0.0 --port $PORT"]
