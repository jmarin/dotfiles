syntax on
set t_Co=256
set termguicolors
set background=dark

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'neomake/neomake', { 'for': ['rust'] }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sheerun/vim-polyglot'
Plug 'rafi/awesome-vim-colorschemes'

" NeoVim theme
Plug 'nightsense/carbonized'
" Plug 'lifepillar/vim-solarized8'

" Language plugins
" Scala plugins
if executable('scalac')
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif

" Rust Plugins
if executable('rustc')
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif

nnoremap <c-p> :FZF<cr>

call plug#end()

if !has('nvim')
  set encoding=utf-8
endif

set number
colorscheme carbonized-dark

let g:rustfmt_autosave = 1
