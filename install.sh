# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.direnv \
	nixpkgs.neovim \
	nixpkgs.nodejs \
	nixpkgs.xsel \
	nixpkgs.nodePackages.npm\
	
# stow dotfiles
stow git
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins 
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Use kitty terminal on MacOS
[ `uname -s` = 'Darwin' ] && stow kitty

# moving nvim folder and cloing nvim cofig from lunar
sudo mv ~/.config/nvim ~/.config/nvim.old
git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim
sudo apt install -y python3-pip
