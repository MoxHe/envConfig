# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# PATH="$HOME/Library/Python/3.7/bin:${PATH}"
# export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

export PATH="/usr/local/mysql/bin:$PATH"

export EDITOR="nvim"

export BAT_THEME="gruvbox"

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

# default to Java 11
java11

alias vim="nvim"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# loading nvm is too show and nvm is not often used. So create an alias to load it on demand.
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias loadnvm=". ${NVM_DIR}/nvm.sh"

# reset-cursor() {
#   printf '\033]50;CursorShape=1\x7'
# }
# export PS1="$(reset-cursor)$PS1"


# Get the shells parent process name.
ppid_name() { echo $(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=) }

# Enable changing cursor shape based on vi mode
# if [ "$ITERM_PROFILE" != "" ] && [ "$TMUX" = "" ]; then
if [ "$TMUX" = "" ]; then
  # iTerm2 cursor shape escape sequences outside tmux
  cursor_block="\e]50;CursorShape=0\C-G"
  cursor_line="\e]50;CursorShape=1\C-G"
elif [ "$(ppid_name)" != "python2" ]; then
  # iTerm2 inside tmux or VTE compatible cursor shape escape sequences,
  # exclude Guake even though it's VTE based it doesn't like these
  cursor_block="\e[2 q"
  cursor_line="\e[6 q"
fi
print -n -- "$cursor_line";
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

print -n -- "\e]50;CursorShape=1\C-G";
# if [[ ! -z "$cursor_block" && ! -z "$cursor_line" ]]; then
#   print -n -- "$cursor_line" ;
  # # Change cursor shape when vi mode changes
  # function zle-keymap-select zle-line-init {
  #   case $KEYMAP in
  #     vicmd)      print -n -- "$cursor_block" ;;
  #     viins|main) print -n -- "$cursor_line" ;;
  #   esac
  #   zle reset-prompt
  #   zle -R
  # }

  # # Change cursor shape when line editing is finished
  # function zle-line-finish { print -n -- "$cursor_block" }

  # Register cursor shape hooks
  # zle -N zle-keymap-select
  # zle -N zle-line-init
  # zle -N zle-line-finish
# fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  dotenv
  osx
  rake
  last-working-dir
  web-search
  extract
  history
  sudo
  yarn
  z
)

alias update="source ~/.zshrc"
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
