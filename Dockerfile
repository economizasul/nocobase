FROM nocobase/nocobase:latest

WORKDIR /app

EXPOSE 13000

CMD ["yarn", "start"]
