FROM node:12.19.0-alpine3.12

ARG EXPOSE_PORT

# Build rapidoc dist file
WORKDIR /tmp/rapidoc_vendor
COPY ./vendor .
RUN npm install
RUN npm run build

# Build node server
WORKDIR /usr/src/app
COPY ./src/ .
COPY ./src/assets/ ./assets
COPY ./resources/openapi_v3.json ./resources/openapi_v3.json
RUN rm -rf ./assets/js
RUN mkdir ./assets/js
RUN cp /tmp/rapidoc_vendor/dist/rapidoc-min.js ./assets/js/rapidoc-min.js
RUN cp /tmp/rapidoc_vendor/dist/rapidoc-min.js.map ./assets/js/rapidoc-min.js.map
RUN npm install

EXPOSE $EXPOSE_PORT
CMD ["node", "server.js"]
