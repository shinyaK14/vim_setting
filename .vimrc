if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><Space>e :NERDTreeToggle<CR>
noremap <Space>h :Unite file_mru<CR>

NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'gregsexton/gitv'
NeoBundle 'ctrlpvim/ctrlp.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on
colorscheme jellybeans
set relativenumber
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

map <silent> <Space>y :call YanktmpYank()<CR> 
map <silent> <Space>p :call YanktmpPaste_p()<CR> 
map <silent> <Space>P :call YanktmpPaste_P()<CR>

map <Space>s <Esc>:w<CR>

set mouse=a

command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

set spell

map <Space>w <C-w>
map <Leader>sc <Esc>:e db/schema.rb<CR>

hi clear SpellBad
hi SpellBad cterm=underline

