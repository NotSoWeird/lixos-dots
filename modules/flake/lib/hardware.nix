let
  /**
    assume the first monitor in the list of monitors is primary
    get its name from the list of monitors

    # Arguments

    - [config] the configuration that nixosConfigurations provides

    # Type

    ```
    primaryMonitor :: AttrSet -> String
    ```

    # Example

    ```nix
    primaryMonitor osConfig
    => "DP-1"
    ```
  */
  primaryMonitor = config: builtins.elemAt config.wave.device.monitors 0;
in
{
  inherit primaryMonitor;
}
