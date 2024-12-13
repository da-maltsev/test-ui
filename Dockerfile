FROM node:20.18.1-slim as builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:20.18.1-slim

WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/package.json .
RUN npm install --production

ENV PORT=3000
EXPOSE 3000

CMD ["node", "build"] 