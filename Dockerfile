FROM alpine

# Installs latest packages.
RUN apk add --no-cache \
      nodejs \
      yarn

WORKDIR /app
RUN apk update
RUN apk add npm
RUN apk add nodejs-current
COPY ./ ./
RUN chmod -R 777 /app/
RUN npm i -g nodemon
RUN npm i -g ts-node
RUN npm install
CMD ["npm","run","start"]