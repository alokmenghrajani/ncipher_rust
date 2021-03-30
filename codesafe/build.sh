#!/bin/bash -eux
set -o pipefail

# The first Docker image only needs to be built once. It takes the CodeSafe iso,
# unpacks it with xorriso and then untars all the tars.
pushd codesafe

# Check that we have the correct CodeSafe iso
shasum -a 256 -c checksum.txt

# Build the Docker image
docker build -t ncipher-rust-codesafe -f Dockerfile.codesafe .

popd
