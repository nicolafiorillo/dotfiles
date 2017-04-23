set backspace=2          " backspace in insert mode works like normal editor
syntax on                " syntax highlighting
filetype indent on       " activates indenting for files
set autoindent           " auto indenting
set number               " line numbers
colorscheme elflord	 " colorscheme desert
set nobackup             " get rid of anoying ~file

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

