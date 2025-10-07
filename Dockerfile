FROM nocobase/nocobase:1.8.1-full

EXPOSE $PORT

CMD ["sh", "-c", "yarn start --port $PORT"]
