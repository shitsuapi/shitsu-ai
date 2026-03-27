FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y ffmpeg imagemagick webp git && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && npm install -g pm2 qrcode-terminal

COPY . .

EXPOSE 8000

CMD ["pm2-runtime", "index.js"]
