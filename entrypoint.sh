#!/bin/sh

# applies settings.local.yml over searx/settings.yml
python config_setup.py

exec "$@"

