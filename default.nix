{ pkgs ? import <nixpkgs> {} }:

let
  zola = pkgs.zola;
in
pkgs.stdenv.mkDerivation {
  name = "ChaosKollektiv E.V. Web";

  buildInputs = [ zola ];

  buildPhase = ''
    zola build
  '';

} // pkgs.mkShell {
  buildInputs = [ zola ];

  shellHook = ''
    export ZOLA_VERSION=$(zola --version | cut -d' ' -f2)
    echo "Using Zola version $ZOLA_VERSION"
  '';
}
