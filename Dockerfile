FROM alpine

# Installs latest packages.
RUN apk add --no-cache \
      nodejs \
      yarn

WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install nibabel pydicom matplotlib pillow
RUN pip3 install med2image
RUN apk update
RUN apk add npm
RUN apk add nodejs-current
COPY ./ ./
RUN chmod -R 777 /app/
RUN npm i -g nodemon
RUN npm i -g ts-node
RUN npm install
CMD ["npm","run","start"]