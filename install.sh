#!/bin/sh
set -e

packages="gcc libffi-dev libxml2-dev libxslt-dev musl-dev openssl-dev py-pip python-dev sudo"

apk add ${packages}

adduser searx -D -h /opt/searx

sudo -u searx -- pip install --user -r requirements.txt

chown -R searx:searx * .*

apk del --purge ${packages}

