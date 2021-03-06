FROM node:10-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

#set the working directory of the application to /home/node/app
WORKDIR /home/node/app

#copy the package.json and package-lock.json (for npm 5+) files
COPY package*.json ./

USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080

CMD [ "node", "index.js" ]


