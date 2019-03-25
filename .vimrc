syntax on "set colors
set nu
"set clipboard+=unnamed "for copypasta //doesn4t work :(
set colorcolumn=80
highlight ColorColumn ctermbg=17
highlight CursorLine cterm=none guibg=#303000 ctermbg=235
set timeout timeoutlen=5000 ttimeoutlen=100 "<O> is now instant

"those commands needs autocmd to be effective at lauch
"au = autocmd

" auto source my syntax file
augroup Sourcegroup
	au!
	autocmd Vimenter,Bufenter * source ~/.vimsyntax.vim
augroup END

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

"autocmd Bufenter * vertical resize 84 "automatically resize when split

" <f1> already maped to 42Header

" press f2 to toggle relative nu
map <f2> :set rnu! <CR>

"press <F3> to open bracket for a function.
map <f3> A<cr>{<cr>}<Esc>O

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

"while in insert mode, press k then j to <Esc>
"inoremap kj <Esc> nul

" <Alt-j> move current line down
no ∆ ddp
ino ∆ <Esc> ddpi
" <Alt-k> move current line up
no ˚ ddkP
ino ˚ <Esc> ddkpi
" <Alt-l> move all current line to the right
no ¬ V>
" <Alt-h> move all current line to the right
no ˙ V<

"fold brackets "i could find a better shortcut
no \\ zf%

"this prevent // to recomment the next newline
"https://vi.stackexchange.com/questions/15444/remove-automatic-comment-leader?rq=1
inoremap <silent><expr> <bs> getline('.') =~# '^//\s*$' ? "<c-u>" : "<bs>"

"this redirect swp files into ~/.vim/swp_files
set directory^=$HOME/.vim/swp_files//

"function My_func_test() "tejme plz
"	:Stdheader
"	:wq
"endfunction

"press gb to naviguate between buffers (Number or name(tab))
nnoremap gb :ls<CR>:b<Space>

set path+=**
set wildmenu
