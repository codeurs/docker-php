FROM alpine:edge
MAINTAINER Ben Merckx

RUN apk --update upgrade && apk add curl && rm -rf /var/cache/apk/*
RUN mkdir /opt
RUN mkdir /tmp/neko

ENV NEKO_VERSION 2.0.0
ENV NEKOPATH /opt/neko/neko-$NEKO_VERSION-linux
RUN mkdir /opt/neko
RUN curl http://nekovm.org/_media/neko-$NEKO_VERSION-linux64.tar.gz |\
	tar xzf - -C /opt/neko

ENV LD_LIBRARY_PATH $NEKOPATH
ENV PATH "$NEKOPATH:$PATH"

#RUN chmod +x $NEKOPATH