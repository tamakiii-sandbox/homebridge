FROM alpine:3.10.1

RUN apk add --no-cache make nodejs npm dbus avahi avahi-compat-libdns_sd avahi-dev

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
WORKDIR /app

RUN npm install --only=production

ENTRYPOINT npx --no-install homebridge
