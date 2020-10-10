FROM node:12.19.0-alpine3.12

# Build rapidoc dist file
WORKDIR /tmp/rapidoc_git
COPY ./src/rapidoc_git .
RUN npm install
RUN npm run build

# Build node server
WORKDIR /usr/src/app
COPY ./src/package.json .
COPY ./src/index.html .
COPY ./src/server.js .
COPY ./src/spec.json .
RUN cp /tmp/rapidoc_git/dist/rapidoc-min.js .
RUN cp /tmp/rapidoc_git/dist/rapidoc-min.js.map .
RUN npm install


EXPOSE 8080
CMD ["node", "server.js"]
