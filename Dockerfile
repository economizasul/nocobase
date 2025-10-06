FROM nocobase/nocobase:latest

WORKDIR /app

EXPOSE $PORT

CMD ["sh", "-c", "yarn start --port $PORT"]
