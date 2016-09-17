"-----------------------------------------------------------------------
" MY .vimrc FOR MACINTOSH
" VERSION: vim8.0
" UPDATE: 09/16/2016
"-----------------------------------------------------------------------

"========== BASIC SETTING ==============================================
" Turn vi-compatible off
set nocompatible
scriptencoding UTF-8
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
"-----------------------------------------------------------------------
" reset vimrc autocmd group
"-----------------------------------------------------------------------
augroup vimrc
  autocmd!
augroup END
"-----------------------------------------------------------------------
" indent 
"-----------------------------------------------------------------------
" Replace Tab with Space
set expandtab shiftwidth=2 tabstop=2
" Indent by # of shiftwidth with Tab key
set smarttab
autocmd vimrc FileType sh     setlocal expandtab shiftwidth=2 softtabstop=2
autocmd vimrc FileType python setlocal expandtab shiftwidth=4 softtabstop=4
" Return long code w/ indent beautifully
set breakindent
" Keep the same indent level as the current indent
set autoindent
"-----------------------------------------------------------------------
" search
"-----------------------------------------------------------------------
" Do incremental search
set incsearch
" Highlight search results
set hlsearch
" Turn case-sensitive off
set ignorecase
" Trun case-sensitive on if upper-case is found while searching
set smartcase
" Clear highlights by search
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>|
"-----------------------------------------------------------------------
" edit
"-----------------------------------------------------------------------
" Not distinguish cases when complimenting somthing
set infercase
" Curso can move to place where no character exists
set virtualedit=all
" Delete everything by Backspace
set backspace=indent,eol,start
"-----------------------------------------------------------------------
" display 
"-----------------------------------------------------------------------
" Highlight corresponding brackets
set showmatch
" # seconds to highlight brackets
set matchtime=3
" Fold codes
set wrap
" Show line #
set number
" Show cursor line
set cursorline
" Show a line in column # (speficied)jjkj
set colorcolumn=80
" Display invisible characters (Tab, EOL, etc.)
"set list
" Show xx lines while scrolling
set scrolloff=4
"-----------------------------------------------------------------------
" mouse & window
"-----------------------------------------------------------------------
set mouse=a
" Move among windows by Ctrl + hjkl
nnoremap <C-h> <C-w>h|
nnoremap <C-j> <C-w>j|
nnoremap <C-k> <C-w>k|
nnoremap <C-l> <C-w>l|
"-----------------------------------------------------------------------
" buffer
"-----------------------------------------------------------------------
" Move previous buffer by <
nnoremap < :bp<CR>|
" Move next buffer by >
nnoremap > :bn<CR>|
"-----------------------------------------------------------------------
" backup/swap
"-----------------------------------------------------------------------
set nowritebackup
set nobackup
set noswapfile
set clipboard=unnamed


"-----------------------------------------------------------------------
" dein.vim
"-----------------------------------------------------------------------
if &compatible
  set nocompatible
endif
" Required:
" Directory where plugins are installed
let s:dein_dir = expand('~/.cache/dein')
" devin.vim itself
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Install dein automatically if dein.vim doesn't exist
if &runtimepath !~# 'dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" START - Setting
" NOTE: Activate dein#load_state & dein#save_state when creating cache
"if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " TOML file
"  let g:rc_dir	= expand('~/.vim/rc')
"  let s:toml		= g:rc_dir . '/dein.toml'
"  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  let s:toml		= '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  " Read TOML file
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
" END - Setting
  call dein#end()
"  call dein#save_state()
"endif
" If you want to install new plugins on startup.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" Required:
filetype plugin indent on
syntax enable
"-----------------------------------------------------------------------
