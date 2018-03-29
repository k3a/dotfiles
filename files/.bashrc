# should be in /etc/locale.conf but let's overwrite anyway
export LANG=en_US.UTF-8
export LANGUAGE=en
export LC_ADDRESS=cs_CZ.UTF-8
export LC_COLLATE=cs_CZ.UTF-8
export LC_CTYPE=cs_CZ.UTF-8
export LC_MONETARY=cs_CZ.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_PAPER=cs_CZ.UTF-8
export LC_RESPONSE=en_US.UTF-8
export LC_TELEPHONE=cs_CZ.UTF-8
export LC_TIME=cs_CZ.UTF-8
export LC_MEASUREMENT=cs_CZ.UTF-8

export EDITOR=vim
export TERM=xterm-256color

unamestr=`uname`

#---------------- OS Conditions --------------------------

if [[ "$unamestr" == 'Darwin' ]]; then
	export CLICOLOR=1
	export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
	alias grep='grep --color=auto'

	# MacPorts Installer addition on 2012-08-14_at_02:13:38: adding an appropriate PATH variable for use with MacPorts.
	export PATH="/theos/bin:/droid/tools:/droid/platform-tools:/droid/sdk/platform-tools:/k3abin:/Volumes/Shared/bin-mac:/Work/docker/esp8266/:$PATH"
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	# Finished adapting your PATH environment variable for use with MacPorts.

	# theos
	export THEOS_DEVICE_IP=ufoxy
	export THEOS_DEVICE_PORT=2222

	# iTMSTransporter
	export TRANSPORTER_HOME=`xcode-select --print-path`/../Applications/Application\ Loader.app/Contents/MacOS/itms/bin
	export PATH="$TRANSPORTER_HOME:$PATH"

	# RVM
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
	source /Users/kexik/.rvm/scripts/rvm

	# OSX SDK
	export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk
	
	# android
	export PATH="/android/platform-tools:$PATH"

	# LLVM
	PATH="$PATH:/opt/llvm/bin"

	# GNU
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

	# Homebrew
	export PATH="/usr/local/bin/:$PATH"

	# PHP
	export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

else
	# color wrapper
	# export PATH="/usr/libexec/cw:/usr/local/bin:$PATH"

	# extra LD path
	export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

	# colored ls
	alias ls='ls --color=auto'

	# android stuff
	export ANDROID_HOME="$HOME/Android/Sdk"
	export PATH="/opt/android-studio/gradle/gradle-3.2/bin:$PATH"
fi

hn=`hostname`

# ---------------- Hostname conditions ----------------------

if [[ "$hn" == "zephyr" ]]; then
	dynmotd
	. /usr/local/Calpont/bin/calpontAlias

elif [[ "$hn" == "lizard" ]];  then
	# allow root Xorg apps in Wayland
	xhost +si:localuser:root &> /dev/null

	# use gnome-keyring in the session
	if [ -n "$DESKTOP_SESSION" ];then
		eval $(gnome-keyring-daemon --start)
		export SSH_AUTH_SOCK
	fi
fi

# --------------------- General settings ---------------------

export EDITOR="vim"

# colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GROFF_NO_SGR=1

# my scripts
export PATH="$HOME/bin:$PATH"

# GO
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/go/bin"

# Node (Yarn)
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"



export LOL=xxxx
