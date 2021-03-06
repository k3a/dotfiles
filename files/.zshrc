# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fishy"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# disable auto-escaping URLs
DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

source $ZSH/oh-my-zsh.sh

# User configuration --

# where to store history
HISTFILE=~/.zsh_histfile
# runtime line history kept
HISTSIZE=5000
# saved history lines
SAVEHIST=10000
# what chars are also considered part of word
WORDCHARS='*?_-.[]~=&;!#$%^\@'
# emacs keys
bindkey -e
bindkey '^[f' emacs-forward-word
bindkey '^[b' emacs-backward-word
bindkey "^W" kill-region
# ctrl+u backward kills the line
bindkey \^U backward-kill-line 
# do not use menu completionm menu
# (TAB would cycle through the menu requiring ENTER to confirm)
unsetopt AUTO_MENU
# Paste highlighting (added in 5.1) is now enabled by default to signal
# that accept-line hasn't occurred. It may be disabled via
zle_highlight+=(paste:none)

# load legacy bashrc --
if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

# helpers --
open() { 
	( nohup xdg-open $@ >/dev/null 2>&1 & )
}
run() {
	( nohup $@ >/dev/null 2>&1 & )
}
function __calc_plugin {
    echo "$*" | gore -autoimport
}
#aliases[=]='noglob __calc_plugin'


# Perl CPAN
PATH="/home/kexik/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kexik/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kexik/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kexik/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kexik/perl5"; export PERL_MM_OPT;


