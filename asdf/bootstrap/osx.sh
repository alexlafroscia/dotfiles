#!/bin/sh

# Clone `asdf`
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.0

# Install dependencies
brew install automake autoconf openssl libyaml readline libxslt libtool unixodbc
