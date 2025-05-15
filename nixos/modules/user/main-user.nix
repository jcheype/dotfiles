
{lib, config, pkgs, ...}:

let
  cfg = config.main-user;
in
{
    options.main-user = {
        enable = lib.mkEnableOption "Enable the main user";
        username = lib.mkOption {
          type = lib.types.str;
          description = "The main user name";
        };
      };

      config = lib.mkIf cfg.enable {
        users.users."${cfg.username}" = {
          isNormalUser = true;
          description = cfg.username;
          extraGroups = [
            "networkmanager"
            "wheel"
            "dialout"
            "tty"
            "docker"
          ];
          packages = with pkgs; [
          ];
          shell = pkgs.zsh;
        };
      };
  }
