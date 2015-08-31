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
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()
    
filetype plugin indent on
    
NeoBundleCheck

syntax on
colorscheme jellybeans
set number
" autocmd VimEnter * execute 'NERDTree'
let g:NERDTreeDirArrows=0
let g:indent_guides_enable_on_vim_startup = 1

set bs=start

set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

map <silent> yyy :call YanktmpYank()<CR> 
map <silent> ppp :call YanktmpPaste_p()<CR> 
map <silent> PPP :call YanktmpPaste_P()<CR>

set mouse=a

command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)


