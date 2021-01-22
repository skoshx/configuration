#!/bin/sh
set -e

mkdir -p ~/.vim/undodir

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
\" Syntax highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let mapleader = \" \"
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :Vexplore<CR>
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
" > ~/.vimrc
echo "Vim has been setup! Enjoy!"

