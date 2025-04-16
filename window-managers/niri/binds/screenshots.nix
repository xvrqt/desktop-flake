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
        "Mod+P".action = screenshot;
        "Mod+Alt+P".action = screenshot-window;
        "Mod+Shift+P".action = screenshot-screen;
      };
    };
  };
}
