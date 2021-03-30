#!/bin/bash -eux
set -o pipefail

source $HOME/.cargo/env

pushd demo

# Compile Rust code
xargo build --target powerpc-unknown-linux-gnu

# Compile C code
/opt/nfast/gcc/bin/powerpc-codesafe-linux-gnu-gcc -mpowerpc -mcpu=e5500 -mno-toc -mbig-endian -mhard-float -mno-multiple -mno-string -meabi -mprototype -mstrict-align -memb -fno-builtin -DNF_CROSSCC=1 -DNFAST_CONF_H="nfast-conf-auto.h" -DNF_CROSSCC_PPC_GCC=1 -D_THREAD_SAFE -DBYTE_ORDER=4321 -c main.c

# Link
/opt/nfast/gcc/bin/powerpc-codesafe-linux-gnu-gcc -lm -Wl,-wrap=read -Wl,-wrap=write -Wl,-wrap=socket -Wl,-wrap=send  -Wl,-wrap=sendto -Wl,-wrap=recv -Wl,-wrap=recvfrom -Wl,-wrap=listen -Wl,-wrap=connect -Wl,-wrap=bind -Wl,-wrap=setsockopt -Wl,-wrap=select -Wl,-wrap=accept -Wl,-wrap=poll -Bstatic -o ncipher_rust main.o target/powerpc-unknown-linux-gnu/debug/libncipher_rust.a /opt/nfast/c/csd/lib-ppc-linux-gcc/hoststdioeinetsocks.o /opt/nfast/c/csd/lib-ppc-linux-gcc/libfaksys.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libcutils.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libvfsextras.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libseewrpr.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libipccore.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libsolotrace.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libnfstub.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libfaksys.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libseewrpr.a /opt/nfast/c/csd/lib-ppc-linux-gcc/seelib.a /opt/nfast/c/csd/lib-ppc-linux-gcc/libipccore.a -lpthread -lrt

popd
