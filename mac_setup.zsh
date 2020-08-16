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
if [ ! $(which xcode-select) ]; then
  echo "Installing xcode-select..."
  xcode-select --install
else
  echo "xcode-select has already been installed. Skipped"
fi

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Check for Homebrew, Install if we don't have it
if [ ! $(which brew) ]; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew has already been installed. Skipped"
fi

echo "Updating Homebrew..."
brew update

# Check for git, Install if we don't have it
if [ ! $(which git) ]; then
  echo "Installing git..."
  brew install git
else
  echo "git has already been installed. Skipped"
fi

# Check for fzf, Install if we don't have it
if [ ! $(which fzf) ]; then
  echo "Installing fzf..."
  brew install fzf
else
  echo "fzf has already been installed. Skipped"
fi

# Check for ripgrep, Install if we don't have it
if [ ! $(which rg) ]; then
  echo "Installing ripgrep..."
  brew install ripgrep
else
  echo "ripgrep has already been installed. Skipped"
fi

# Check for tmux, Install if we don't have it
if [ ! $(which tmux) ]; then
  echo "Installing tmux..."
  brew install tmux
else
  echo "tmux has already been installed. Skipped"
fi

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting..."
brew install zsh-syntax-highlighting

# Install zsh-autosuggestions
 echo "Installing zsh-autosuggestions..."
brew install zsh-autosuggestions

# Check for neovim, Install if we don't have it
if [ ! $(which nvim) ]; then
  echo "Installing neovim..."
  brew install neovim
else
  echo "neovim has already been installed. Skipped"
fi

# Check for bat, Install if we don't have it
if [ ! $(which bat) ]; then
  echo "Installing bat..."
  brew install bat
else
  echo "bat has already been installed. Skipped"
fi

# Install python3
if [ ! $(which python3) ]; then
  echo "Installing python3..."
  brew install python3
else
  echo "python3 has already been installed. Skipped"
fi

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

echo "Sourcing .zshrc"
source ~/.zshrc

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Install node.js
if [ ! $(nvm which current) ]; then
  echo "Installing Node.js..."
  nvm install stable
else
  echo "Node.js has already been installed. Skipped"
fi

# Install node neovim
echo "Installing node neovim..."
sudo npm install -g neovim

mkdir -p ~/.config/nvim/after/ftplugin
mkdir -p ~/.config/bat/config
mkdir -p ~/.config/bat/themes
mkdir -p ~/.config/powerline/themes/tmux
mkdir -p ~/.config/powerline/colorschemes/tmux

# Hard link ~/.tmux.conf
if [ -f ~/.tmux.conf ]; then
  echo "Rmeoved existing ~/.tmux.conf"
  rm ~/.tmux.conf
fi
echo "Hard link ~/.tmux.conf"
ln ./tmux/.tmux.conf ~/.tmux.conf

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

echo "Sourcing .zshrc"
source ~/.zshrc

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

# Install iterm2
echo "Installing iterm2..."
brew cask install iterm2

# Install nerd font
echo "Installing nerd font..."
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

echo "\nDone!"

