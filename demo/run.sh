#!/bin/bash -eu
set -o pipefail

# Run the code
/opt/nfast/bin/tct2 --pack --infile=ncipher_rust --outfile=ncipher_rust.sar
echo dummy > dummy
/opt/nfast/bin/cpioc ncipher_rust.cpio dummy
/opt/nfast/bin/see-stdioe-serv --machine ncipher_rust.sar --userdata-raw ncipher_rust.cpio
