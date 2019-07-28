FROM alpine:3.10.1

COPY . /app
WORKDIR /app

RUN apk add --no-cache make nodejs npm
RUN npm install --only=production

ENTRYPOINT npx --no-install homebridge
