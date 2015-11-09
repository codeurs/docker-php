FROM codeurs/nodejs
MAINTAINER Ben Merckx

RUN apk add --update && apk add libcap && rm -rf /var/cache/apk/*
RUN setcap 'cap_net_bind_service=+ep' /usr/bin/node

RUN mkdir /app
WORKDIR /app

VOLUME /var/webdav

RUN npm install md5 jsDAV --production --silent

ADD server.js server.js
RUN chmod -R 777 /app

EXPOSE 80

CMD ["/usr/bin/node", "/app/server.js"]