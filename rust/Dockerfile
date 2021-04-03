FROM ncipher-rust-codesafe:latest

# Install Rust
RUN apt-get install -y \
    build-essential \
    curl && \
    curl https://sh.rustup.rs -sSf | bash -s -- -y && \
    echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

SHELL ["/bin/bash", "-c"]

RUN source $HOME/.cargo/env && \
    rustup default nightly && \
    rustup component add rust-src && \
    rustup target add powerpc-unknown-linux-gnu
