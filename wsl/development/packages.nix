{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [

		# Nix
		home-manager

		# Terminal / TTY
		zsh
		zsh-autosuggestions
		zsh-autocomplete
		zsh-syntax-highlighting
		starship
		tmux

		# Productivity
		neovim
		vimPlugins.packer-nvim
		git
		stow

		# Dev / Code
		gcc
		rbenv
		tenv
		terraform
		terraspace

		# Pretty stuff
		fira-code-nerdfont
	];
}
