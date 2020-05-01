#!/bin/sh

set -euo pipefail

autoreconf -v -i

echo Running configure with arguments "$@"
./configure $@
