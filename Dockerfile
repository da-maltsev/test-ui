FROM node:20.18.1-slim as builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20.18.1-slim

WORKDIR /app
COPY --from=builder /app/build build/
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

ENV PORT=3000
EXPOSE 3000

USER node
CMD ["node", "build"] 