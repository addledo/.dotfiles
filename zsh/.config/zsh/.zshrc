#Makes Neovim sudo editor. Use command 'sudoedit'
export SUDO_EDITOR="nvim"

# Have move this to /etc/profile :
#export PATH="/home/jonty/.local/bin:$PATH"

export PATH="/home/jonty/development/flutter/bin:$PATH"
#export PATH="/home/jonty/.dotnet:$PATH"
#export PATH="/home/jonty/.dotnet/tools:$PATH"

# For Android/Flutter dev:
export JAVA_HOME="/home/jonty/.jdks/corretto-17.0.14/"
export ANDROID_HOME="/home/jonty/Android/Sdk/"
export ANDROID_AVD_HOME="/home/jonty/.config/.android/avd"
export PATH="$ANDROID_HOME/emulator/:$PATH"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jonty/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source $XDG_CONFIG_HOME/zsh/.zsh_aliases

# enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      alias dir='dir --color=auto'
      alias vdir='vdir --color=auto'
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
  fi

# some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

#. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
