""" Vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'                        
Plug 'scrooloose/nerdcommenter'                  
Plug 'jistr/vim-nerdtree-tabs'                   
Plug 'Xuyuanp/nerdtree-git-plugin'               
Plug 'ryanoasis/vim-devicons'                    
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'   
Plug 'airblade/vim-gitgutter'                     
Plug 'tpope/vim-fugitive'
Plug 'myusuf3/numbers.vim'                        
Plug 'kien/ctrlp.vim'                             
Plug 'bling/vim-airline'                          
Plug 'flazz/vim-colorschemes'                     
Plug 'vim-airline/vim-airline-themes'             
Plug 'leafgarland/typescript-vim'                 
Plug 'peitalin/vim-jsx-typescript'                
Plug 'natebosch/vim-lsc'                          
Plug 'neoclide/coc.nvim', {'branch': 'release'}   
Plug 'w0rp/ale'

call plug#end()

""" Color scheme
syntax on
set t_Co=256
colorscheme mopkai
hi Normal ctermbg=NONE
hi Normal guibg=NONE

""" ALE
let g:ale_linters = { 'python': ['pylint', 'pylint'], 'javascript': ['eslint'] }
let g:ale_fixers = { 'python': ['autopep8', 'yapf'], 'javascript': ['prettier'], '*': ['remove_trailing_lines', 'trim_whitespace'] }
let b:ale_warn_about_trailing_whitespace = 0


""" Nerd tree
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeMouseMode=3
let g:nerdtree_tabs_open_on_console_startup=2       
let NERDTreeShowHidden=1

""" Other
filetype plugin on                                  
command! CP execute "CtrlP"                         
set shiftwidth=4                                    
set tabstop=4                                       
set textwidth=79
set expandtab                                       
set autoindent
set fileformat=unix
set number                                          
set showcmd                                         
set encoding=utf8                                   
set mouse=a                                         
set ttymouse=xterm2                                 
set clipboard=unnamed                               
set backspace=indent,eol,start                      
set belloff=all                                     
set showmatch                                       
let mapleader=","                                   
let g:pymode_virtualenv=1                         


""" Autocommands
""" 	1. Remember the last position in each file
""" 	2. Open Vim with NERDTree 
""" 	3. Vim cursor in the file opened
""" 	4. Close Vim if NERDTree is the only window left
""" 	5. Open NERDTree with each new tab
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	au VimEnter * NERDTree
	au VimEnter * wincmd p
	au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	au BufWinEnter * NERDTreeMirror
endif

