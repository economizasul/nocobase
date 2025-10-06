FROM node:18-alpine

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production=false

COPY . .

RUN yarn build

RUN yarn nocobase init --non-interactive --db-type=postgres --db-host=postgres.railway.internal --db-port=5432 --db-database=railway --db-username=postgres --db-password=KjxxuQXrjTgxeUIFiiKetPjENTAILFma --admin-user=admin --admin-password=admin123 --skip-git

EXPOSE 13000

CMD ["yarn", "start"]
