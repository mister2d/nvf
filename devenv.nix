{ pkgs, ... }:

{
  # Provides packages required to interact with the codebase, matching the
  # tools available in the default devShell. Includes Nix static analysis,
  # formatters, and plugin source management via npins.
  languages.nix = {
    enable = true;
    lsp.enable = true; # nixd
  };

  packages = with pkgs; [
    # Nix static analysis
    statix  # lints and suggestions
    deadnix # unused binding detection

    # Plugin source management
    npins

    # Formatters
    alejandra # Nix
    deno      # Markdown
    fd        # used by the formatting scripts
  ];

  enterShell = ''
    echo "nvf dev environment ready"
    echo "  nix fmt         — format Nix and Markdown"
    echo "  nix flake check — run format and lint checks"
    echo "  statix check .  — lint Nix sources"
    echo "  deadnix .       — find unused bindings"
    echo "  npins           — manage plugin sources"
  '';
}
