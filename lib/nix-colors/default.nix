{ inputs
, snowfall-inputs
, lib
}:

{
  imports = [inputs.nix-colors.nixosModule.default];
  
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
}
