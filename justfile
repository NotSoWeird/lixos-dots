# alias r := rebuild
# alias rr := remote-rebuild
# alias e := eval
# alias ea := eval-all
# alias u := update
# alias ui := update-input

flake_var := env_var('FLAKE')
flake := if flake_var =~ '^\.*$' { justfile_directory() } else { flake_var }

# flake := justfile_directory()

rebuild := "nixos-rebuild"

[private]
default:
    @just --list --unsorted

# rebuild group

[group('rebuild')]
[private]
classic goal *args:
    sudo {{ rebuild }} {{ goal }} \
      --flake {{ flake }} \
      {{ args }} \
      |& nom

[group('rebuild')]
[private]
builder goal *args:
    nh {{ "os" }} {{ goal }} {{ args }}

# rebuild the boot
[group('rebuild')]
boot *args: (builder "boot -H" args)

# test what happens when you switch
[group('rebuild')]
test *args: (builder "test -H" args)

# switch the new system configuration
[group('rebuild')]
switch *args: (builder "switch -H" args)

# package group

# build the package, you must specify the package you want to build
[group('package')]
build pkg:
    nix build {{ flake }}#{{ pkg }} \
      --log-format internal-json \
      -v \
      |& nom --json

# build the iso image, you must specify the image you want to build
[group('package')]
iso image: (build "nixosConfigurations." + image + ".config.system.build.isoImage")

# build the tarball, you must specify the host you want to build
[group('package')]
tar host:
    sudo nix run {{ flake }}#nixosConfigurations.{{ host }}.config.system.build.tarballBuilder

# dev group

# check the flake for errors
[group('dev')]
check:
    nix flake check --no-allow-import-from-derivation

# update a set of given inputs
[group('dev')]
update *input:
    nix flake update {{ input }} \
      --refresh \
      --commit-lock-file \
      --commit-lockfile-summary "chore: update {{ if input == "" { "all inputs" } else { input } }}" \
      --flake {{ flake }}

# build & serve the docs locally
[group('dev')]
serve:
    nix run {{ flake }}#docs.serve

# utils group

alias fix := repair
alias fmt := format

# verify the integrity of the nix store
[group('utils')]
verify *args:
    nix-store --verify {{ args }}

# repairs the nix store from any breakages it may have
[group('utils')]
repair: (verify "--check-contents --repair")

# clean the nix store and optimise it
[group('utils')]
clean:
    nix-collect-garbage --delete-older-than 3d
    nix store optimise

# Formats files
[group('utils')]
format:
    nix fmt
