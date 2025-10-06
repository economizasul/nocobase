FROM nocobase/nocobase:latest

ENV PORT=13000
ENV HOST=0.0.0.0

EXPOSE 13000

CMD ["yarn", "start"]
