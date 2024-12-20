let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
  pkgs = import nixpkgs { config.allowUnfree = true; overlays = [ ]; };
in

pkgs.mkShellNoCC {

  # https://search.nixos.org/packages?channel=24.11&size=50&sort=relevance&type=packages
  packages = with pkgs; [
    busybox         # For common command line utilities
    git             # For SCM
    trunk-io        # For linting / SCA.
    rbenv           # For managing ruby versions (incase we want to use RAKEFILES later).
    tenv            # For managing terraform versions.
    terraspace      # For terraspace.
    terraform-docs  # For generating automatic terraform module documentation.
    commitizen      # For version bumping and commit management.  
    python3         # For pre-commit.
    pre-commit      # for pre-commit.
  ];

  GREETING = ''=== Welcome to the nix cicd shell for tf  ==='';

  TENV_AUTO_INSTALL = true; # Tells TENV to automatically install detected versions from .terraform-version

  shellHook = ''
    echo -e $GREETING 
    
    bumpVersionMinor() {
        echo "Updating Changelog..."
        changelogger update 

        echo "Bumping tag version..."
        bumpTagVersion "MINOR"
    }
  '';
}
