# JavaScript Template

A minimal JavaScript development template using Nix. Key features:

- Nix + Flakes for reproducible environments
- Bun (fast JavaScript runtime)
- Vite (development server & build tool)
- ESLint + Prettier (linting & formatting)
- Devshell commands via just

## Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled
- [direnv](https://direnv.net/) (optional but recommended)

## Getting Started

Initialize a new project using [omnix](https://omnix.page):

```sh
nix run nixpkgs#omnix -- \
  init github:sajenim/javascript-template -o ./my-project
```

Then enter the development environment:

```sh
cd my-project
direnv allow  # Or use: nix develop
just dev
```

**NixOS users:** If bun-installed binaries fail to find system libraries, enable FHS compatibility:

```nix
# nix/modules/devshell.nix
fhs = true;
```

## Customization

This template provides minimal, sensible defaults. Customize as needed:

- Add dependencies: `just add <package>`
- Modify linting rules in `eslint.config.js`
- Add Prettier config via `.prettierrc` if needed
- Extend `Justfile` with project-specific commands

## Acknowledgments

- [srid's haskell-template](https://github.com/srid/haskell-template)
