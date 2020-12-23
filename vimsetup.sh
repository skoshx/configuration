#!/bin/sh
set -e

mkdir -p ~/.vim/undodir

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ripgrep
brew install ripgrep

# Install Fonts for vim-devicons
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

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
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
\" TypeScript / JavaScript plugins
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g_coc_global_extensions = ['coc-tsserver']
\" NERDTree plugins
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()

\" Syntax highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>vr :vertical resize 60<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

\" Autoclosing
inoremap \" \"\"<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


\" CoC binds
inoremap <silent> <Leader>d :<C-u>CocList diagnostics<CR>
inoremap <silent> <Leader>gd <Plug>(coc-definition)
inoremap <silent> <Leader>gy <Plug>(coc-type-definition)
inoremap <silent> <Leader>gr <Plug>(coc-references)
inoremap <silent>K :call CocAction('doHover')<CR>
inoremap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>fx <Plug>(coc-fix-current)

\" Tabs
nnoremap <Leader>tn :tabnew<SPACE>
nnoremap <Leader>te :tabedit<SPACE>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <silent> <Leader>n :tabn<CR>

\" Indentation
nnoremap <Leader>if gg=G<CR>
nnoremap <Leader>ib =%<CR>


\" Make <CR> auto-select the first completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\"

\" Color schemes
colorscheme onedark
set background=dark
" > ~/.vimrc
# echo "Vim configuration installed… Please execute command ':PlugInstall' in Vim to install plugins."
echo "Vim has been setup! Enjoy!"
echo "Remember to change your terminal font to 'Hack Nerd Font' in Terminal Preferences settings."
echo "Please execute command ':PlugInstall' in Vim to install plugins."

