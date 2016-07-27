export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

unamestr=`uname`

if [[ "$unamestr" == 'Darwin' ]]; then
	export CLICOLOR=1
	export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
	#alias ls='ls -G'
	alias ls='ls --color=auto' #GNU
	alias grep='grep --color=auto'

	# MacPorts Installer addition on 2012-08-14_at_02:13:38: adding an appropriate PATH variable for use with MacPorts.
	export PATH="/theos/bin:/droid/tools:/droid/platform-tools:/droid/sdk/platform-tools:/k3abin:/Work/docker/esp8266/:$PATH"
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

	# GO
	export GOPATH="$HOME/go"
	export PATH="/usr/local/go/bin/:$HOME/go/bin:$PATH"

else
	# color wrapper
	export PATH="/usr/libexec/cw:/usr/local/bin:$PATH"

	# extra LD path
	export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
fi

hn=`hostname`

if [[ "$hn" == "zephyr" ]]; then
	dynmotd
	. /usr/local/Calpont/bin/calpontAlias
fi

# colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GROFF_NO_SGR=1


