let

  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  latest = nixpkgs.latest.rustChannels.stable;

in

with nixpkgs;

stdenv.mkDerivation {
  name = "psl";
  buildInputs = [ latest.rust ];
  OPENSSL_DIR = "${openssl.dev}";
  OPENSSL_LIB_DIR = "${openssl.out}/lib";
}
