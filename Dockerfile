FROM nocobase/nocobase:1.8.24-full

EXPOSE $PORT

CMD ["npx", "@nocobase/cli", "start", "--host", "0.0.0.0", "--port", "$PORT"]
