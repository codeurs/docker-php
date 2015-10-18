FROM alpine:edge
MAINTAINER Ben Merckx

RUN apk add --update && apk add nodejs && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app

ADD package.json package.json
RUN npm install --production --silent

ADD app.js app.js

EXPOSE 80

CMD ["/usr/bin/node", "/app/app.js"]