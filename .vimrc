" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: penzo <marvin@42.fr>                       +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/03/25 17:57:53 by penzo             #+#    #+#              "
"    Updated: 2019/06/16 19:37:06 by penzo            ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

syntax on				"set colors
set nu					"display lines number
"set clipboard+=unnamed "for copypasta //doesn4t work :(
set colorcolumn=80		"display Norm column
highlight ColorColumn ctermbg=17
highlight CursorLine cterm=none guibg=#303000 ctermbg=235

"<O> is now instant
set timeout timeoutlen=5000 ttimeoutlen=100

"those commands needs autocmd to be effective at lauch
"au = autocmd

" auto source my syntax file
augroup Sourcegroup
	au!
	autocmd Vimenter,Bufenter * source ~/.vimsyntax.vim
augroup END

"create 42 comments style naturaly
augroup Commentgroup
"this line protect from multi including
	au!
	au VimEnter,WinEnter,BufWinEnter * set comments=sl:/*,mb:**,elx:*/
augroup END

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

"autocmd Bufenter * vertical resize 84 "automatically resize when split

" <f1> already maped to 42Header

" press f2 to toggle relative nu
map <f2> :set rnu! <CR>

" <Alt-j> move current line down
no ∆ ddp
" <Alt-k> move current line up
no ˚ ddkP
ino ˚ <Esc> ddkPi
" <Alt-l> move all current line to the right
no ¬ V>
" <Alt-h> move all current line to the right
no ˙ V<

"######FOLDING
set nofoldenable "will not autofold when opening a file
set	foldmethod=indent
set foldnestmax=1

command! WQ wq
command! Wq wq
command! W w
command! Q q


"fold brackets "i could find a better shortcut
"no \\ zf%
"set foldmethod=marker
"set foldmarker=/*,*/

"Map Y to yank until end of line
no Y y$

"Map U to reverse undo
map U <C-r>

"this prevent // to recomment the next newline
"https://vi.stackexchange.com/questions/15444/remove-automatic-comment-leader?rq=1
inoremap <silent><expr> <bs> getline('.') =~# '^//\s*$' ? "<c-u>" : "<bs>"

"this redirect swp files into ~/.vim/swp_files
set directory^=$HOME/.vim/swp_files//

"press gb to naviguate between buffers (Number or name(tab))
nnoremap gb :ls<CR>:b<Space>

"autocompletion options
set path+=**
set wildmenu
"set wildmode=list:full
set wildchar=<Tab>

set ignorecase	"no 'casesensitive' research
set smartcase	"unless pattern contain Maj

set nocompatible	"ignore old Vi
set	wrap			"this wrap around on big line ??

set splitright	"More natural spliting
set sb			"More natural spliting
set showcmd		"show command in status bar
set showmatch	"show matching parentheses

" SCROLLING
"set scrolloff=8		"keep 8 lines visible C'est bof

"Buffer and Split
nnoremap <C-c> :bp\|bd #<CR>	"<Ctrl-c> to close buffer without closing split" better use 'gd' macro
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set hidden		"buffer thing

nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
"nnoremap gd :bd<cr>

"show invisible character
map <f3> :set list! <CR>
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

set tw=80
" fill rest of linLe with characters----------------
function! FillLine( str )
	" set tw to the desired total length
	let tw = &textwidth
	if tw==0 | let tw = 80 | endif
	" strip trailing spaces first
	.s/[[:space:]]*$//
	" calculate total number of 'str's to insert
	let reps = (tw - col("$")) / len(a:str)
	" insert them, if there's room, removing trailing spaces (though forcing
	" there to be one)
	if reps > 0
		.s/$/\=(' '.repeat(a:str, reps))/
	endif
endfunction

map <F4> :call FillLine( '-' )<CR>
" ------------------------------------------------
"nnoremap <Leader>b :call DeleteCurBufferNotCloseWindow()<CR>
nnoremap gd :call DeleteCurBufferNotCloseWindow()<CR>

func! DeleteCurBufferNotCloseWindow() abort
	if &modified
		echohl ErrorMsg
		echom "E89: no write since last change"
		echohl None
	elseif winnr('$') == 1
		bd
	else  " multiple window
		let oldbuf = bufnr('%')
		let oldwin = winnr()
		while 1   " all windows that display oldbuf will remain open
			if buflisted(bufnr('#'))
				b#
			else
				bn
				let curbuf = bufnr('%')
				if curbuf == oldbuf
					enew    " oldbuf is the only buffer, create one
				endif
			endif
			let win = bufwinnr(oldbuf)
			if win == -1
				break
			else        " there are other window that display oldbuf
				exec win 'wincmd w'
			endif
		endwhile
		" delete oldbuf and restore window to oldwin
		exec oldbuf 'bd'
		exec oldwin 'wincmd w'
	endif
endfunc
let g:TabExplorer = {}

"---------------Multi buf list ?-----------------------------
nnoremap gh :TabExplorer<CR>

func! StoreBufTab()
	if !has_key(g:TabExplorer, tabpagenr())
		let  g:TabExplorer[tabpagenr()] = []
	endif

	if index(g:TabExplorer[tabpagenr()], bufname("%")) == -1 && bufname("%") != ""
		call add (g:TabExplorer[tabpagenr()],bufname("%"))
	endif
endfunc

func! DisplayTabExplorer()
	4split
	enew
	call append(".",g:TabExplorer[tabpagenr()])
	echo 'c nul ouech'
endfunc

au BufEnter * call StoreBufTab()

command! TabExplorer call DisplayTabExplorer()
"---------------Multi buf list ? 2 --------------------------
nnoremap gj :call WindowBufManagerNext()<CR>

if !exists("g:WindowBufManager") 
	let g:WindowBufManager= {}
endif

function! StoreBufTab()
	if !has_key(g:WindowBufManager, tabpagenr())
		let  g:WindowBufManager[tabpagenr()] = []
	endif

	" add the new buffer to our explorer
	if index(g:WindowBufManager[tabpagenr()], bufname("%")) == -1 && bufname("%") != ""
		call add (g:WindowBufManager[tabpagenr()],bufname("%"))
	endif
endfunction

function! WindowBufManagerNext() 
	" find the next index of the buffer
	let s = index(g:WindowBufManager[tabpagenr()], bufname("%"))
	if (s!= -1)
		let s = (s +1) % len(g:WindowBufManager[tabpagenr()])
		execute 'b ' . g:WindowBufManager[tabpagenr()][s]
	endif
endfunction

augroup WindowBufManagerGroup
	autocmd! BufEnter * call StoreBufTab()
augroup END

"---------------Multi buf list ? 2 --------------------------
nnoremap gl :args<CR>:b 
nnoremap 0dd iAu DD, j’la passe, la détaille, la pé-cou, la vi-sser, des regrets d’vant ton bébé<Esc>
