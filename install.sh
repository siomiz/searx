#!/bin/sh
set -e

packages="gcc git libffi-dev libxml2-dev libxslt-dev musl-dev openssl-dev py-pip python-dev sudo"

apk add ${packages}

adduser searx -D -h /opt/searx

git clone --depth=1 https://github.com/asciimoo/searx.git /opt/searx
git checkout ${SERAX_VERSION:-"master"}

sudo -u searx -- pip install --user -r requirements.txt

chown -R searx:searx * .*

apk del --purge ${packages}

