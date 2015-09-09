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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'gregsexton/gitv'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'slim-template/vim-slim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on
colorscheme jellybeans
set relativenumber
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

map <Space>f :CtrlP<CR>
map <Space>o :only<CR>

nnoremap gv :vertical wincmd f<CR>

" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_enable_quick_match = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-y>  neocomplcache#close_popup()

