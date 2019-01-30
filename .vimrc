syntax on "set colors
set nu
set clipboard=unnamed "for copypasta //doesn4t work :(
set colorcolumn=80
highlight ColorColumn ctermbg=17
set timeout timeoutlen=5000 ttimeoutlen=100 "<O> is now instant

"those commands needs autocmd to be effective at lauch
autocmd Vimenter * set comments=sl:/*,mb:**,elx:*/
autocmd Bufenter * set comments=sl:/*,mb:**,elx:*/ "Bufenter is for split
autocmd Vimenter * source ~/.vimsyntax.vim
autocmd Bufenter * source ~/.vimsyntax.vim

"automatically resize when split
autocmd Bufenter * vertical resize 84

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
inoremap kj <Esc>
