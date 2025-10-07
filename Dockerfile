FROM nocobase/nocobase:0.21-full

EXPOSE $PORT

CMD ["sh", "-c", "yarn start --port $PORT"]
