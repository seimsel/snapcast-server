#!/bin/bash
set -euo pipefail

avahi-daemon --daemonize --no-drop-root

envsubst < /etc/snapserver.conf

exec snapserver
