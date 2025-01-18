FROM alpine

# Installs latest packages.
RUN apk add --no-cache \
      nodejs \
      yarn

WORKDIR /app
RUN apk update
# Install Python
RUN apk install python3.6 && ln -s /usr/bin/python3.6 /usr/bin/python3
RUN python3 -V
RUN apk add npm
RUN apk add nodejs-current
COPY ./ ./
RUN chmod -R 777 /app/
RUN npm i -g nodemon
RUN npm i -g ts-node
RUN npm install
CMD ["npm","run","start"]