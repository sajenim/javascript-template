# List available commands
default:
    @just --list

# Start development server with hot reload
dev:
    bun run dev

# Start interactive REPL with auto-loaded helpers
repl:
    node --eval "await import('./.replrc.js')" -i

# Add a package dependency
add package:
    bun add {{package}}

# Add a dev dependency
add-dev package:
    bun add -d {{package}}

# Remove a package dependency
remove package:
    bun remove {{package}}

# Build for production
build:
    bun run build

# Preview production build
preview:
    bun run preview

# Install dependencies
install:
    bun install

# Update flake inputs
update:
    nix flake update

# Upgrade package dependencies
upgrade:
    bun update

# Clean build artifacts and dependencies
clean:
    rm -rf dist node_modules bun.lockb

# Format code with prettierd
format:
    prettierd --write .

# Check formatting without making changes
format-check:
    prettierd --check .

# Lint code with eslint
lint:
    eslint .

# Lint and auto-fix issues
lint-fix:
    eslint --fix .

# Check both formatting and linting
check: format-check lint
