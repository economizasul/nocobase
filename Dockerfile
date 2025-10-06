FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache bash git postgresql-client

COPY package*.json ./
RUN npm ci --only=production

COPY . .
RUN npm run build

EXPOSE $PORT

CMD ["sh", "-c", "npm run start --port $PORT"]
