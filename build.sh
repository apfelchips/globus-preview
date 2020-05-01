#!/usr/bin/env bash

set -euo pipefail

autoreconf -v -i

echo Running configure with arguments "$@"
./configure $@
