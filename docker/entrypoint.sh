#!/bin/bash

set -e

export PATH=$PATH:/usr/local/texlive/2025/bin/x86_64-linux
export ACCESS_WS=/home/accessibility_ws

cd $ACCESS_WS

exec "$@"
