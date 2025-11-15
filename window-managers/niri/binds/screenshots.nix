{ lib
, config
, ...
}:
let
  cfgCheck = config.desktops.window-manager == "niri";
in
{
  config = lib.mkIf cfgCheck {
    programs.niri.settings = {
      binds = with config.lib.niri.actions; {
        # Screenshots
        "Mod+P".action.screenshot = {
          show-pointer = false;
        };
        "Mod+Alt+P".action.screenshot-window = {
          write-to-disk = false;
        };
        # "Mod+Shift+P".action = screenshot-screen;
      };
    };
  };
}
