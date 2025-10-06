FROM nocobase/nocobase:latest

WORKDIR /app/nocobase

EXPOSE 13000

CMD ["yarn", "start"]
