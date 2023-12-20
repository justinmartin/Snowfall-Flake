#!/bin/sh
if [ -f "flake.nix" ]; then
	echo
else
	echo "The file flake.nix does not exist in the current directory."
	exit 1
fi

# Function to run Disko with the new hostname
run_disko() {
	setHostname=${1:-$(hostname)}

	echo "./systems/x86_64-linux/$setHostname/disko.nix"

	echo "Are you sure you want to run disko? (y/n)"
	read confirmation

	if [ "$confirmation" = "y" ]; then
		# Run the command with the new hostname
		sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./systems/x86_64-linux/$setHostname/disko.nix
	else
		echo "Disko was not applied"
	fi
}

# Get the current hostname
hostname=$(hostname)

echo -e "Provide different flake name than the current hostname? (y/n): \n"
read prompt

if [ "$prompt" = "y" ]; then
	echo -e "Enter the new hostname: \n"
	read newHostname
	# Run disko with the new hostname
	run_disko $newHostname
else
	# Run disko with the current hostname
	run_disko
fi
