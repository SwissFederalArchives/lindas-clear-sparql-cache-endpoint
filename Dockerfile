FROM index.docker.io/library/node:26.13.1-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --omit=dev
COPY index.js ./
COPY lib/ ./lib/

CMD [ "npm", "run", "start" ]
