{inputs, lib, ...}: let
  # FHS compatibility for NixOS (steam-run wrapper)
  # Enable if bun-installed binaries fail to find system libraries
  fhs = false;
in {
  perSystem = {system, ...}: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = fhs;
    };

    fhsPackages = lib.optionals fhs [
      pkgs.steam-run
    ];

    fhsSetup = lib.optionalString fhs ''
      alias bun="steam-run bun"
    '';
  in {
    devShells.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs;
        [
          bun
          eslint
          just
          prettierd
        ]
        ++ fhsPackages;

      shellHook = ''
        ${fhsSetup}

        if [ -f package.json ]; then
          echo "Installing dependencies..."
          bun install
        fi

        echo ""
        echo "💡 Run 'just' to see available commands"
      '';
    };
  };
}
