if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'gregsexton/gitv'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'rking/ag.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'

" NeoBundle 'croaker/mustang-vim'
" NeoBundle 'jeetsukumaran/vim-nefertiti'
" NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
" NeoBundle 'w0ng/vim-hybrid'

NeoBundleCheck
call neobundle#end()

autocmd ColorScheme * hi Normal ctermfg=231 ctermbg=234
autocmd ColorScheme * hi NonText ctermfg=59 ctermbg=234
" colorscheme mustang
" colorscheme nefertiti
" colorscheme jellybeans
colorscheme monokai
" colorscheme hybrid

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
autocmd VimEnter,Colorscheme * :hi Pmenu ctermbg=17
autocmd VimEnter,Colorscheme * :hi PmenuSel ctermbg=88
autocmd VimEnter,Colorscheme * :hi PMenuSbar ctermbg=17

nnoremap <silent><Space>t :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=30
let g:NERDTreeDirArrows=0
filetype plugin indent on
syntax on
set relativenumber
let g:indent_guides_enable_on_vim_startup = 1
set bs=start
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set mouse=a
set spell
set scrolloff=10
set ignorecase
set hlsearch
set wrap
set clipboard=unnamed,autoselect
set fencs=iso-2022-jp,sjis,euc-jp
set enc=utf-8
set fenc=utf-8

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

noremap <Space>h :Unite file_mru<CR>
map <silent> <Space>y :call YanktmpYank()<CR> 
map <silent> <Space>p :call YanktmpPaste_p()<CR> 
map <silent> <Space>P :call YanktmpPaste_P()<CR>
map <Space>s <Esc>:w<CR>
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
map <S-j> <C-w>j
map <S-k> <C-w>k
map <S-h> <C-w>h
map <S-l> <C-w>l
map <S-w> <C-w>w
map <Leader>sc <Esc>:vs db/schema.rb<CR>
map <Space>f :CtrlP<CR>
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:24'
map <Space>o :only<CR>
map <Space>v :vs<CR>
map <Leader>gf <Esc>:vs Gemfile<CR>
map <Leader>bi <Esc>:!bundle install<CR>
map <Leader>vr <Esc>:vs ~/dotfiles/.vimrc<CR>
map <Space>qa <Esc>:qall<CR>
map <Space>qq <Esc>:q!<CR>
map <Leader>ra <Esc>:!rubocop -a<CR>
map <Space>gs <Esc>:Gstatus<CR>
map <Space>gv <Esc>:Gitv<CR>
map <Leader>rt <Esc>:vs config/routes.rb<CR>
noremap g<CR> g;
nnoremap q :<C-u>q<CR>
map <Space>= <Esc>:vertical resize 100<CR>
map <Space>3 <Esc>:vertical resize 30<CR>
map <Space>0 $
map <Space>1 ^
nnoremap gv :vertical wincmd f<CR>
nnoremap <Leader><Leader> <Esc>:nohlsearch<CR>
map <Leader>routes <Esc>:vs routes<CR><Esc>:r !rake routes<CR>
map <Space>ag <Esc>:Ag 
map ; :
map <S-a> <C-a>
map <S-x> <C-x>
map <Space>diff <Esc>:vertical diffsplit 
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

hi clear SpellBad
hi SpellBad cterm=underline

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


