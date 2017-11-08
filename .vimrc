" ============================= Plugin =============================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:/Users/home/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERD Tree
Plugin 'scrooloose/nerdtree'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Code syntax check
Plugin 'scrooloose/syntastic'

" Comment functions
Plugin 'scrooloose/nerdcommenter'

" Tag list
Plugin 'taglist-plus'

" State line
Plugin 'vim-airline/vim-airline'

" Pairs
Plugin 'Auto-Pairs'

" SnipMate 
Plugin 'snipMate'

" vim-cpp-enhanced-hilight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Colorscheme base16
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line               " required

" ============================= Plugin details =============================

" NERDTree
" autocmd vimenter * NERDTree

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" NERDcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Tag list
let Tlist_Ctags_Cmd = "C:/ctags58/ctags.exe"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

" ============================= General settings =============================

" indent
set autoindent 
set cindent
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent

" view
syntax on
set ballooneval
set laststatus=2
set linebreak
set linespace=5
set number
set ruler
set showmatch
set title
set visualbell
set wrap

" search 
set hlsearch
set ignorecase
set incsearch
set nowrapscan " does not comback to the first line at the end of the document when searching

" edit
set autoread
set autowrite
set backspace=eol,start,indent
set fencs=ucs-bom,utf-8,euc-kr,latin1
set fileencoding=utf-8
set history=1000
set mouse=a
set nobackup

" GUI
if has("gui_running") && has("gui_win32")
    autocmd GUIEnter * simalt ~x " open maximize in Windows
    set cursorline
    set guicursor+=a:blinkon0 " disable blinking cursor
    set guifont=Consolas:h12
    set guioptions= " disable all UI options
    colorscheme hybrid_material
endif

" ============================= General key mapping =============================

" function folding
nnoremap <silent> <F2> v]}zf
" refresh 
nnoremap <silent> <F5> :w<CR> :source %<CR> 
" visualize all lines 
nnoremap <silent> <C-a> ggVG<CR>
" copy to clipboard
nnoremap <silent> <C-p> "+p<CR>
" paste from clipboard
vnoremap <silent> <C-c> "+y<CR>
" fix indent of all lines
nnoremap <silent> <C-i> gg=G<CR>
" toggle tag list
map <F8> :TlistToggle<CR>
" toggle NERDTree
map <F4> :NERDTreeToggle<CR> 
" toggles the comment state of the selected line(s)
nmap <C-\> <leader>ci
vmap <C-\> <leader>ci

" ============================= Functions =============================

function! SetUpCConfig()
    nmap <silent> <F9> :w <CR> :!gcc -O2 % -o %< && %< < input.txt<CR>
    nmap <silent> <C-F9> :w <CR> :!gcc -O2 % -o %< && %< <CR>
    nmap <silent> <F3> :30vs input.txt<CR>
endfunction

function! SetUpCppConfig()
    nmap <silent> <F9> :w <CR> :!g++ -std=c++11 -O2 % -o %< && %< < input.txt<CR>
    nmap <silent> <C-F9> :w <CR> :!g++ -std=c++11 -O2 % -o %< && %< <CR>
    nmap <silent> <F3> :30vs input.txt<CR>
endfunction

function! SetUpPythonConfig()
    nnoremap <silent> <F9> :w<CR> :!python %<CR>
endfunction


" ============================= Automatic commands =============================

autocmd BufNewFile *.cpp r ~/.vim/format.cpp
autocmd filetype c :call SetUpCConfig()
autocmd filetype cpp :call SetUpCppConfig()
autocmd filetype python :call SetUpPythonConfig()

