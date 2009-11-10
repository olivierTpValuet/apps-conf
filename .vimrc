" vim & co.
if v:progname =~? "evim"
	finish
en
set nocompatible " pure vim, no vi
set backupdir  =$HOME/.vim.backupdir

" user
let g:Perl_AuthorName = 'olivier tp valuet'
let g:Perl_AuthorRef  = 'M.'                         
let g:Perl_Email      = 'oliviertp@valuet.net'
let g:Perl_Company    = 'olivier valuet - demelia'

" cursor
se ww=<,>,[,],h,l,b,s,~ "whichwrap: specified keys can move to n/p line

" screen
se ls=0   " laststatus: display window status
se nu     " number    : display line numbers on the left
se ru     " ruler     : display cursor position
se fdc=4  " foldcolumn: display fold markers on the left
se sc     " showcmd   : display incomplete commands

" languages
let g:perl_fold      = 1 " enable automatic folding for perl
let perl_fold_blocks = 1 " ... even for blocks
"unlet perl_nofold_packages " seems not working
syn on    " syntax    : enable automatic colored syntax
se ts=4  " tabstop: number of columns for a tab
se sw=4  " shiftwidth: number of spaces to indent
se sts=4 " softtabstop: number of columns for BS for a tab

" registers
se clipboard=unnamed " unnamed register is *

" search
se hls " hlsearch : highlight all matches
se is  " incsearch: do incremental searching
se sm  " showmatch: show matching brackets

" files
se nobk   " nobackup : no back up copy of original file 
" suffixes with lower priority on tab completion for filenames
" (files not wanted to be edited or read)
se suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" only when compiled with autocommands
if has("autocmd")
	" enable file type detection with plugin and indention on
	" use default filetype settings
	" so that mail gets 'tw' set to 72, 'cindent' is on in C files, etc.
	" also load indent files, to automatically do language-dependent indenting
	filet plugin indent on " enable load of any plugin

	" put these in an autocmd group, so that we can delete them easily
	aug vimrcEx
	au!

	" for all text files set 'textwidth' to 78 characters
	au FileType text setl textwidth=78

	" jump to last known cursor position when opening file
	" unless position invalid or inside an event handler
	" (happens when dropping a file on gvim)
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	aug END
el
	se ai   "autoindent: always set autoindenting on
en
