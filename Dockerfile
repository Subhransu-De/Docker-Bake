FROM node:25-alpine

WORKDIR /app

COPY package-lock.json ./

COPY package.json ./

RUN npm install

COPY index.js .

EXPOSE 8080

CMD ["npm", "start"]
