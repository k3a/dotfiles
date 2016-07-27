call pathogen#infect()			" include pathogen plugins
syntax on						" enable syntax highlight

set modeline
set cindent						" use cindent for indentation
set cinkeys-=0#					" don't auto-indent lines starting with #
set ruler						" (ru) show the cursor position at all times
set showcmd						" (sc) display an incomplete command in the lower right
set history=50					" (hi) keep 50 lines of command history
"set number						" (nu) show line numbers
set showmatch					" (sm) briefly jump to matching bracket when inserting one
"set textwidth=80				 " (tw) number of columns before an automatic line break is inserted (see formatoptions)
"set formatoptions=croq			 " (fo) influences how vim automatically formats text
set backspace=indent,eol,start	" (bs) allows backspacing beyond starting point of insert mode, indents and line breaks
"set linebreak					 " (lbr) wrap long lines at a space instead of in the middle of a word
set incsearch					" (is) highlights what you are searching for as you type
set hlsearch					" (hls) highlights all instances of the last searched string
set encoding=utf-8				" encoding displayed
set fileencoding=utf-8			" encoding written to file

" tab behaviour - tabs (displayed as 4 cahrs)
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" tab behaviour - spaces (4 chars)
"set softtabstop=4 shiftwidth=4 expandtab

" tab utils (http://vim.wikia.com/wiki/Super_retab)
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Tell vim to remember certain things when we exit
"  '10	:  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20	:  up to 20 lines of command-line history will be remembered
"  %	:  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" It fixes a problem where the cursor position will not be restored if the file only has a single line
function! ResCur()
  if line("'\"") <= line("$")
	normal! g`"
	return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" convert binary plists to xml1
autocmd BufReadPre *.plist set autoread
autocmd BufReadPre *.plist silent !plutil -convert xml1 <afile> 2>&1 >/dev/null

" status line
set laststatus=2											"display status line always
set statusline=
set statusline+=%1*\[%n]									"buffernr
set statusline+=%2*\ %<%F\ 									"File+path
set statusline+=%3*\ %y\ 									"FileType
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}		"Encoding
set statusline+=%4*\%{(&bomb?\",BOM\":\"\")}\ 				"Encoding2
set statusline+=%5*\ %{&ff}\ 								"FileFormat (dos/unix..) 
set statusline+=%6*\ %=
set statusline+=%7*\ row:%l/%L\ (%03p%%)					"Row/total (%)
set statusline+=%7*\ \|\ col:%03c\ 							"Column
set statusline+=%0*\ %m%r%w\ %P\ \ 							"Modified? Readonly? Top/bot.

hi User1 cterm=bold ctermbg=52 ctermfg=white
hi User2 ctermbg=52 ctermfg=white
hi User3 ctermbg=160 ctermfg=white
hi User4 ctermbg=94 ctermfg=white
hi User5 ctermbg=28 ctermfg=white
hi User6 ctermbg=23 ctermfg=white
hi User7 ctermbg=53 ctermfg=white

" set clipboard to * register
set clipboard=unnamed

" Go: automatically add imports (use goimports instead of gofmt)
let g:go_fmt_command = "goimports"

" Syntastic
let g:syntastic_go_checkers = 'gofmt' "['golint', 'govet', 'errcheck', 'gofmt', 'goimports']
let g:go_list_type = "quickfix"

