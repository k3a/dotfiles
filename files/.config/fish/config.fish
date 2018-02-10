set PATH $PATH ~/bin ~/go/bin ~/.cargo/bin/ ~/.config/yarn/global/node_modules/.bin/

function open
	nohup xdg-open $argv >/dev/null 2>&1 &
end
