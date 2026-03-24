FROM node:6.17.1-alpine

WORKDIR /app

# Installer les dépendances système pour compiler les modules natifs
RUN apk add --no-cache python make g++ postgresql-client

# Copier package.json seul d'abord (pour le cache)
COPY package.json ./

# Forcer l'installation en ignorant les erreurs de peer deps
RUN npm install --production || npm install --production --force

# Copier le reste
COPY . .

# Exposer le port
EXPOSE 2016

# Commande de démarrage
CMD ["npm", "start"]
