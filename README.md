# Rust on nCipher 🦀🛡️

Running Rust code on nCipher HSMs (using CodeSafe).

# Context

We tend to write CodeSafe code in C (e.g. see [Subzero](https://github.com/square/subzero),
Square's HSM-based Bitcoin Cold Storage wallet). This repo is a prototype
showing how the same result could be achieved using Rust.

The main appeal for using Rust is memory safety/better guarantees compared
to C. Rust also enables leveraging a rich ecosystem of packages and libraries.

# Try it out

Compile the Rust code with:
```
install Docker
git clone https://github.com/alokmenghrajani/ncipher_rust.git
get CodeSafe-linux64-dev-12.50.2.iso from your vendor and drop it in the codesafe/ folder
./codesafe/build.sh
./rust/build.sh
docker run --rm -it -v $PWD/demo:/demo ncipher-rust /demo/compile.sh
```

Run on the device with the nCipher HSM:
```
scp -r demo <host>:~/
ssh <host>
$ cd ./demo
$ ./run.sh
```
