#!/bin/bash
set -euo pipefail

avahi-daemon --daemonize --no-drop-root

echo "$(envsubst < /etc/snapserver.conf)" > /etc/snapserver.conf

exec snapserver
