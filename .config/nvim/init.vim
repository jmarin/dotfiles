if empty(glob('~/.vim/autoload/plug.vim'))
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

nnoremap <c-p> :FZF<cr>

call plug#end()
