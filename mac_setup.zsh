#!/bin/zsh
# Author: MoxHe
# About: This script is used to set up a developing evironmnet for MacOS using zsh, nvim, tmux,
#        iterm2, fzf and powerline and etc.
# Note: This sript is intended for setting up freshed MacOS. It's assuming you are using zsh
#       Please read through the script and comment out software you don't want. It will
#       overlap your exiting .zshrc, init.vim, tmux.conf, and pwerline configs for tmux.
#       Please be careful, and back up your exiting config files before running this script.

echo "Start setting up...\n"
echo "Checking software that need to be installed...\n"

# Check for xcode tools, Install if we don't have it
echo "Installing xcode-select..."
xcode-select --install

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Check for Homebrew, Install if we don't have it
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Update Homebrew
echo "Updating Homebrew..."
brew update
brew tap homebrew/cask-versions

# Check for git, Install if we don't have it
echo "Installing git..."
brew install git

# Check for fzf, Install if we don't have it
echo "Installing fzf..."
brew install fzf

# Check for ripgrep, Install if we don't have it
echo "Installing ripgrep..."
brew install ripgrep

# Check for tmux, Install if we don't have it
echo "Installing tmux..."
brew install tmux

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
brew install zsh-autosuggestions

# Check for neovim, Install if we don't have it
echo "Installing neovim..."
brew install neovim

# Check for bat, Install if we don't have it
echo "Installing bat..."
brew install bat

# Install python3
echo "Installing python3..."
brew install python3
brew link --overwrite python@3.8

# Install pynvim
echo "Installing pynvim..."
pip3 install pynvim

# Install powerline
echo "Installing powerline..."
pip3 install powerline-status

# Hard link .zshrc
if [ -f ~/.zshrc ]; then
  echo "Rmeoved existing .zshrc"
  rm ~/.zshrc
fi
echo "Hard link .zshrc"
ln ./zsh/.zshrc ~/.zshrc

# Hard link .zshenv
if [ -f ~/.zshenv ]; then
  echo "Rmeoved existing .zshenv"
  rm ~/.zshenv
fi
echo "Hard link .zshenv"
ln ./zsh/.zshenv ~/.zshenv

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | sh

# Install node.js
echo "Installing Node.js..."
nvm install stable

# Install yarn
echo "Installing yarn..."
brew install yarn

# Install node neovim
echo "Installing node neovim..."
sudo npm install -g neovim

mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/bat/config
mkdir -p ~/.config/bat/themes
mkdir -p ~/.config/powerline/themes/tmux
mkdir -p ~/.config/powerline/colorschemes/tmux
mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai
mkdir -p ~/.config/limelight

# install yabai
brew install koekeishiya/formulae/yabai
# install jq (Lightweight and flexible command-line JSON processor)
brew install jq
# install skhd
brew install koekeishiya/formulae/skhd

# Hard link ~/.config/yabai/window-focus-on-destroy.zsh
if [ -f ~/.config/yabai/window-focus-on-destroy.zsh ]; then
  echo "Rmeoved existing ~/.config/yabai/window-focus-on-destroy.zsh"
  rm ~/.config/yabai/window-focus-on-destroy.zsh
fi
echo "Hard link window-focus-on-destroy.zsh"
ln ./yabai/window-focus-on-destroy.zsh ~/.config/yabai/window-focus-on-destroy.zsh

# Hard link ~/.config/skhd/skhdrc
if [ -f ~/.config/skhd/skhdrc ]; then
  echo "Rmeoved existing ~/.config/skhd/skhdrc"
  rm ~/.config/skhd/skhdrc
fi
echo "Hard link skhdrc"
ln ./skhd/skhdrc ~/.config/skhd/skhdrc

# Hard link ~/.config/limelight/limelightrc
if [ -f ~/.config/limelight/limelightrc ]; then
  echo "Rmeoved existing ~/.config/limelight/limelightrc"
  rm ~/.config/limelight/limelightrc
fi
echo "Hard link limelightrc"
ln ./limelight/limelightrc ~/.config/limelight/limelightrc

# Hard link ~/.config/yabai/yabairc
if [ -f ~/.config/yabai/yabairc ]; then
  echo "Rmeoved existing ~/.config/yabai/yabairc"
  rm ~/.config/yabai/yabairc
fi
echo "Hard link yabairc"
ln ./yabai/yabairc ~/.config/yabai/yabairc

# Hard link ~/.tmux.conf
if [ -f ~/.tmux.conf ]; then
  echo "Rmeoved existing ~/.tmux.conf"
  rm ~/.tmux.conf
fi
echo "Hard link ~/.tmux.conf"
ln ./tmux/.tmux.conf ~/.tmux.conf

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Hard link init.vim
if [ -f ~/.config/nvim/init.vim ]; then
  echo "Rmeoved existing init.vim"
  rm ~/.config/nvim/init.vim
fi
echo "Hard link init.vim"
ln ./nvim/init.vim ~/.config/nvim/init.vim

# Hard link fugitive.vim
if [ -f ~/.config/nvim/after/ftplugin/fugitive.vim ]; then
  echo "Rmeoved existing fugitive.vim"
  rm ~/.config/nvim/after/ftplugin/fugitive.vim
fi
echo "Hard link fugitive.vim"
ln ./nvim/after/ftplugin/fugitive.vim ~/.config/nvim/after/ftplugin/fugitive.vim

# Hard link coc-settings.json
if [ -f ~/.config/nvim/coc-settings.json ]; then
  echo "Rmeoved existing coc-settings.json"
  rm ~/.config/nvim/coc-settings.json
fi
echo "Hard link coc-settings.json"
ln ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# Install vim plug manager
echo "Installing vim plug manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Hard link bat.conf
if [ -f ~/.config/bat/config/bat.conf ]; then
  echo "Rmeoved existing bat.conf"
  rm ~/.config/bat/config/bat.conf
fi
echo "Hard link bat.conf"
ln ./bat/config/bat.conf ~/.config/bat/config/bat.conf

# Hard link gruvbox.tmTheme
if [ -f ~/.config/bat/themes/gruvbox.tmTheme ]; then
  echo "Rmeoved existing bat.conf"
  rm ~/.config/bat/themes/gruvbox.tmTheme
fi
echo "Hard link gruvbox.tmTheme"
ln ./bat/themes/gruvbox.tmTheme ~/.config/bat/themes/gruvbox.tmTheme

# Update bat binary cache
echo "Update bat binary cache..."
bat cache --build

# Hard link powerline/colors.json
if [ -f ~/.config/powerline/colors.json ]; then
  echo "Rmeoved existing powerline/colors.json"
  rm ~/.config/powerline/colors.json
fi
echo "Hard link powerline/colors.json"
ln ./powerline/colors.json ~/.config/powerline/colors.json

# Hard link powerline/config.json
if [ -f ~/.config/powerline/config.json ]; then
  echo "Rmeoved existing powerline/config.json"
  rm ~/.config/powerline/config.json
fi
echo "Hard link powerline/config.json"
ln ./powerline/config.json ~/.config/powerline/config.json

# Hard link powerline/themes/tmux/default.json
if [ -f ~/.config/powerline/themes/tmux/default.json ]; then
  echo "Rmeoved existing powerline/themes/tmux/default.json"
  rm ~/.config/powerline/themes/tmux/default.json
fi
echo "Hard link powerline/themes/tmux/default.json"
ln ./powerline/themes/tmux/default.json ~/.config/powerline/themes/tmux/default.json

# Hard link powerline/colorschemes/gruvbox_dark.json
if [ -f ~/.config/powerline/colorschemes/gruvbox_dark.json ]; then
  echo "Rmeoved existing powerline/colorschemes/gruvbox_dark.json"
  rm ~/.config/powerline/colorschemes/gruvbox_dark.json
fi
echo "Hard link powerline/colorschemes/gruvbox_dark.json"
ln ./powerline/colorschemes/gruvbox_dark.json ~/.config/powerline/colorschemes/gruvbox_dark.json

# Hard link powerline/colorschemes/tmux/gruvbox_dark.json
if [ -f ~/.config/powerline/colorschemes/tmux/gruvbox_dark.json ]; then
  echo "Rmeoved existing powerline/colorschemes/tmux/gruvbox_dark.json"
  rm ~/.config/powerline/colorschemes/tmux/gruvbox_dark.json
fi
echo "Hard link powerline/colorschemes/tmux/gruvbox_dark.json"
ln ./powerline/colorschemes/tmux/gruvbox_dark.json ~/.config/powerline/colorschemes/tmux/gruvbox_dark.json

# Hard link nvim/github-markdown.css
if [ -f ~/.config/nvim/github-markdown.css ]; then
  echo "Rmeoved existing github-markdown.css"
  rm ~/.config/nvim/github-markdown.css
fi
echo "Hard link github-markdown.css"
ln ./nvim/github-markdown.css ~/.config/nvim/github-markdown.css

# Copy iterm2 preference file com.googlecode.iterm2.plist
if [ -f ~/Library/Preferences/com.googlecode.iterm2.plist ]; then
  echo "Rmeoved existing com.googlecode.iterm2.plist"
  rm ~/Library/Preferences/com.googlecode.iterm2.plist
fi
echo "Copy com.googlecode.iterm2.plist"
cp ./iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# Install java
echo "Installing java11..."
brew cask install java11

# Install nerd font
echo "Installing nerd font..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "Updating terminfo to add abilities of showing italics and curly underline"
tic -x ./terminfo/xterm-256color.terminfo
tic -x ./terminfo/tmux.terminfo
tic -x ./terminfo/tmux-256color.terminfo

# install limelight
cd ~
git clone https://github.com/koekeishiya/limelight.git
cd limelight
make
ln -s ~/limelight/bin/limelight /usr/local/bin/limelight
cd ~

echo "\nDone!"

