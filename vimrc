set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/modelica'
Plugin 'vim-scripts/modeliner'
Plugin 'sukima/xmledit'
"Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'fs111/pydoc.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rollxx/vim-antlr'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" auto save folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 


" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

set clipboard^=unnamedplus

au BufNewFile,BufRead *.g4 set filetype=antlr3

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

set ts=4
set sw=4
set sts=0
set ruler

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
colorscheme koehler 
set background=dark


