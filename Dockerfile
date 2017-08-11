FROM alpine:3.6

MAINTAINER Tomohisa Kusano <siomiz@gmail.com>

RUN apk add -U \
    libxslt \
    openssl \
    python

ADD https://github.com/asciimoo/searx/archive/v0.12.0.tar.gz /opt

RUN ls -la /opt

RUN mv /opt/searx-* /opt/searx

WORKDIR /opt/searx

COPY . .

RUN /bin/sh install.sh

USER searx

CMD ["/usr/bin/python", "searx/webapp.py"]

EXPOSE 8888

ENTRYPOINT ["/bin/sh", "/opt/searx/entrypoint.sh"]
