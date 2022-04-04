FROM node:10 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ /app

############## Production Image
#FROM node:16 AS build 
#
##not be the first pid , and all signal will proxied to the node.js process
#
#USER node
#WORKDIR /src/app
#COPY --chown=node:node package*.json ./
#COPY --chown=node:node --from=build /src/app/dist ./dist
#
#EXPOSE 3000 
#CMD [ "npm", "start"]
