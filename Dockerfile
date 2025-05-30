ARG NODE_VERSION=20

FROM node:${NODE_VERSION}-alpine

WORKDIR /app

COPY package-lock.json ./

COPY package.json ./

RUN npm install

COPY index.js .

EXPOSE 8080

CMD ["npm", "start"]
