{
  description = "LaTeX shell";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:vkleen/nixpkgs/local";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          name = "latex";
          buildInputs = with pkgs; [
            texlive.combined.scheme-full
            texlab
            bibtool
            pandoc
            (hunspellWithDicts [ hunspellDicts.en-us
                                 hunspellDicts.de-de
                               ])
          ];
          shellHook = ''
            export ASPELL_CONF="dict-dir ${pkgs.aspellDicts.en}/lib/aspell/"
          '';
        };
      }
    );
}
