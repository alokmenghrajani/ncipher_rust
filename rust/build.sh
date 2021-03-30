#!/bin/bash -eux
set -o pipefail

# The second Docker image builds on top of the first image and adds rust, xargo,
# etc. It then compiles the demo code.

pushd rust
docker build -t ncipher-rust .
popd
