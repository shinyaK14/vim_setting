if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'

" NeoBundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1

NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()
    
filetype plugin indent on
    
NeoBundleCheck

syntax on
colorscheme jellybeans
set number

