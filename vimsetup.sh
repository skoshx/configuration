#!/bin/sh
set -e

mkdir -p ~/.vim/undodir

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ripgrep
brew install ripgrep

echo "
syntax on

set noerrorbells
set tabstop=2 softtabstop=4
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set clipboard=unnamed

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

\" Plugins
Plug 'joshdick/onedark.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'

call plug#end()

if executable('rg')
  let g:rg_derive_root='true'
endif

let mapleader = \" \"
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>vr :vertical resize 60<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

\" Tabs
nnoremap <Leader>tn :tabnew<SPACE>
nnoremap <Leader>te :tabedit<SPACE>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <silent> <Leader>n :tabn<CR>

\" Indentation
nnoremap <Leader>if gg=G<CR>
nnoremap <Leader>ib =%<CR>

\" YCM, The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>gb <C-O>
" > ~/.vimrc
echo "Vim configuration installed…"
echo "Please execute command ':PlugInstall' in Vim to install plugins, then run postinstall.sh"

