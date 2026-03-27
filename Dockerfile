FROM node:18-slim

RUN apt-get update && \
  apt-get install -y ffmpeg imagemagick webp && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && npm install -g pm2 qrcode-terminal

COPY . .

EXPOSE 8000

CMD ["npm", "start"]
