"Memory allocation functions
syn keyword	cMemoryFunc	ft_lstnew malloc ft_memalloc ft_memmove ft_strdup ft_strndup ft_strnew ft_strsplit ft_strsub ft_swap ft_strjoin ft_itoa strsplit_multi getcwd ft_strtrim

"terminal output functions
syn keyword cPrintf	printf ft_putchar ft_putstr ft_putendl ft_putnbr ft_put_nultab ft_putchar_fd ft_putstr_fd ft_putendl_fd syntax_error_near dprintf print_line ft_endl_tty ft_printf ft_dprintf

"C type keyword
syn keyword cType	t_dlst t_lst t_tetri_coo t_opt t_ldir t_myenv t_cmdlst t_token t_bool t_tklst t_ast

hi cMemoryFunc	guifg=Brown ctermfg=Brown term=bold
hi cPrintf guifg=darkgreen ctermfg=darkgreen term=bold
hi cType guifg=lightgreen ctermfg=lightgreen term=bold
