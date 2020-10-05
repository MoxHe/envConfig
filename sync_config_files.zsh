#!/bin/zsh
# Hard link all config files containing init.vim, tmux.conf, .zshrc and etc.
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
