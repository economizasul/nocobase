FROM nocobase/nocobase:latest

WORKDIR /app

EXPOSE 13000

CMD ["sh", "-c", "yarn start --port $PORT"]
