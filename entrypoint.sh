#!/bin/bash
set -euo pipefail

avahi-daemon --daemonize --no-drop-root

exec snapserver
