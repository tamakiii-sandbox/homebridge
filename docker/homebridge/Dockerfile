FROM alpine:3.10.1

RUN apk add --no-cache make nodejs npm dbus avahi avahi-compat-libdns_sd avahi-dev

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
WORKDIR /app

ENTRYPOINT npm install --only=production && npx --no-install homebridge
