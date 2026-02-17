#Makes Neovim sudo editor. Use command 'sudoedit'
export SUDO_EDITOR="nvim"

# Source aliases
source $XDG_CONFIG_HOME/zsh/.zsh_aliases

# Moved to /etc/profile :
#export PATH="/home/jonty/.local/bin:$PATH"

export PATH="/home/jonty/.local/scripts/:$PATH"
export PATH="/home/jonty/development/flutter/bin:$PATH"
#export PATH="/home/jonty/.dotnet:$PATH"
export PATH="/home/jonty/.dotnet/tools:$PATH"

# # For Android/Flutter dev:
# export JAVA_HOME="/home/jonty/.jdks/corretto-17.0.14/"
# export ANDROID_HOME="/home/jonty/Android/Sdk/"
# export ANDROID_AVD_HOME="/home/jonty/.config/.android/avd"
# export PATH="$ANDROID_HOME/emulator/:$PATH"

#Workflow
# source /usr/share/fzf/key-bindings.zsh
bindkey ^p up-line-or-search
bindkey ^n down-line-or-search


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v


#---------------    AUTOCOMPLETE   ---------------------
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jonty/.zshrc'

# Autocomplete to include hidden files if nothing else matches
zstyle ':completion:*' file-patterns '*(D):hidden-files' '*'

# Enable autocompletion (includes git branch completion)
autoload -Uz compinit
compinit
# End of lines added by compinstall
#<<<------------     AUTOCOMPLETE   ---------------------



#------------------    FUNCTIONS    ---------------------
# Make git works on windows fs
git() {
  if pwd | grep -q "^/mnt/c"; then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}
compdef _git git

# Yazi wrapper
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# Fuzzyfind in repo and cd
# (s)earch (r)epo
function sr() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Not in a git repo"
    return 1
  fi
  local repo="$(git rev-parse --show-toplevel)"
  local dir="$(find "$repo" -type d -not -path '*/.git/*' | fzf)"
  if [[ -z $dir ]]; then
    # No directory chosen
    return 0
  fi
  cd "$dir"
}

function dfiles() {
  pushd ~/.dotfiles
  ./copy-dotfiles.sh
  popd
}

function hr() {
  pkill hyprpaper
  hyprpaper & disown
}

function zath() {
  zathura "$@" & disown
}

function pw() {
  powershell.exe -F "$@"
}

function cmd() {
  cmd.exe /C "$@"
}

#<<<---------------    FUNCTIONS    ---------------------


# COLOURS
export LS_COLORS=$LS_COLORS:'ow=30;42:'

alias ls='eza'
# # enable color support of ls and also add handy aliases
#   if [ -x /usr/bin/dircolors ]; then
#       test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#       alias ls='ls --color=auto'
#       alias dir='dir --color=auto'
#       alias vdir='vdir --color=auto'
#       alias grep='grep --color=auto'
#       alias fgrep='fgrep --color=auto'
#       alias egrep='egrep --color=auto'
#   fi


eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# Start tmux on open
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach-session -t default || tmux new-session -s default
# fi
