############## Build Image

FROM node:10 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ /app
RUN npm run build


############# Production Image
FROM node:10
#
##not be the first pid , and all signal will proxied to the node.js process
#
USER node
WORKDIR /app
COPY --chown=node:node ./ /app
COPY --chown=node:node --from=build /app/node_modules /app/node_modules
#
#EXPOSE 3000 
CMD [ "npm", "start"]


