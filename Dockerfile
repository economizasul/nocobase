FROM nocobase/nocobase:1.8.24-full

# Exponha a porta (Railway usa $PORT)
EXPOSE $PORT

# Comando de start oficial
CMD ["npm", "start"]
