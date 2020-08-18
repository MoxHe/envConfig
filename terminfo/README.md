Iterm2 and Neovim have the ability to show curly underline and italics. We need to
update terminfo to send corresponding sequence to adopt these new abilities.
By running ```tic```, we can add new terminfo entry. Outside of tmux, new entry is
based on xterm-256color. Inside tmux, new entry is based on screen-256color. New entries
are save in ```$HOME/terminfo```. System default entries are in ```/usr/share/terminfo```.
