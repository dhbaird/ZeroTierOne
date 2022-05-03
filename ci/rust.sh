#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $# -eq 0 ]; then
    echo "This script requires RUST_TRIPLET as an argument"
    exit 1
else
    export RUST_TRIPLET=$1
fi

cd /tmp
# curl --proto "=https" --tlsv1.2 -sSf "https://static.rust-lang.org/rustup/dist/${RUST_TRIPLET}/rustup-init" -O rustup-init
curl -sSf "https://static.rust-lang.org/rustup/dist/${RUST_TRIPLET}/rustup-init" -O rustup-init
chmod +x ./rustup-init
./rustup-init --default-host ${RUST_TRIPLET} --default-toolchain stable -y

/root/.cargo/bin/rustup install 1.60.0
/root/.cargo/bin/rustc --version
/root/.cargo/bin/cargo --version
