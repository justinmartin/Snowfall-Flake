#!/bin/sh
#

if [ -f "flake.nix" ]; then
    echo "The file flake.nix exists in the current directory."
else
    echo "The file flake.nix does not exist in the current directory."
    exit 1
fi

nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
nix-channel --add https://nixos.org/channels/nixos-unstable nixos


sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

    echo "Enter nix-shell?"
    read confirmation

if [ "$confirmation" = "y" ]; then
	nix-shell
    else
        echo "Disko was not applied"
    fi


    echo "Set user password?"
    read password_confirmation

if [ "$password_confirmation" = "y" ]; then
	passwd
    fi



