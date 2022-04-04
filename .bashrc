#
# ~/.bashrc
#

export MICRO_TRUECOLOR=1
export EDITOR=micro
export TERMINAL=$TERM

# ls
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias ls=exa
alias cat="bat"
alias g="cd ~/dev/geminae; source activate"
alias h="cd ~/dev/heatflask/backend; source activate; cd .."

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_PAGER="less -nRF"

# We store npm packages locally to avoid giving them elevated priviledges
export npm_config_prefix=$HOME/.node_modules_global
export PATH="$HOME/bin:$npm_config_prefix/bin:$PATH"

# If not running interactively, we can leave now
[[ $- != *i* ]] && return

source $HOME/.config/nnn/nnnrc

# set up Starship prompt
eval "$(starship init bash)"

# fzf stuff
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash


# Extracting
extract () {

 if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"

 fi
}

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
