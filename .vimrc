if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

runtime macros/matchit.vim

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
NeoBundle 'Shougo/neocomplete'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'rking/ag.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'ujihisa/neco-look'

" NeoBundle 'croaker/mustang-vim'
" NeoBundle 'jeetsukumaran/vim-nefertiti'
" NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
" NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'kchmck/vim-coffee-script'

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

if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif

filetype plugin indent on
syntax on
set relativenumber
let g:indent_guides_enable_on_vim_startup = 1
set bs=start
set tabstop=2
set autoindent
set expandtab
set cursorline
highlight CursorLine ctermbg=16
" highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
set shiftwidth=2
set mouse=a
" set spelllang+=cjk
" set spell
set scrolloff=10
set ignorecase
set hlsearch
set wrap
set clipboard=unnamed,autoselect
set fencs=utf-8,iso-2022-jp,sjis,euc-jp
set enc=utf-8
" set fenc=utf-8

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

noremap <Space>h :Unite file_mru<CR>
map <silent> <Space>y :call YanktmpYank()<CR> 
map <silent> <Space>p :call YanktmpPaste_p()<CR> 
map <silent> <Space>P :call YanktmpPaste_P()<CR>
map <Space>s <Esc>:w!<CR>
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
noremap <Leader>j J
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
map <Space>ss :split<CR>
map <Space>e :%s///g
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
map <Space>= $
map <Space>1 ^
nnoremap gv :vertical wincmd f<CR>
nnoremap <Leader><Leader> <Esc>:nohlsearch<CR>
" map <Leader>routes <Esc>:vs routes<CR><Esc>:r !rake routes<CR>
map <Space>ag <Esc>:Ag 
map ; :
map <S-a> <C-a>
map <S-x> <C-x>
vmap <C-c> :w !pbcopy<CR><CR>
map <Space>diff <Esc>:vertical diffsplit 
map <Leader>fp <Esc>:echo expand("%:p")<CR>
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)
noremap <S-q> <nop>

hi clear SpellBad
hi SpellBad cterm=underline

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp


" --------------------------------
"  " neocomplete.vim
"  " --------------------------------
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" let s:neco_dicts_dir = $HOME . 'dotfiles/dicts'
" if isdirectory(s:neco_dicts_dir)
"   let g:neocomplete#sources#dictionary#dictionaries = {
"         \   'ruby': s:neco_dicts_dir . '/ruby.dict'
"         \ }
" endif
" let g:neocomplete#max_list = 20

map :gpull :Git pull
map <Leader>av <Esc>:AV<CR>
map <Leader>cp <Esc>:!pbcopy < "%:p"<CR><CR>
map <Leader>ct <Esc>:!ctags -R<CR><CR>

" Called once right before you start selecting multiple cursors
" function! Multiple_cursors_before()
"   if exists(':NeoCompleteLock')==2
"     exe 'NeoCompleteLock'
"   endif
" endfunction
"
" " Called once only when the multiple selection is canceled (default<Esc>)
" function! Multiple_cursors_after()
"   if exists(':NeoCompleteUnlock')==2
"     exe 'NeoCompleteUnlock'
"   endif
" endfunction

" taglist
set tags=tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_one_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
map <Space>l :TlistToggle <CR>

inoremap <silent> <Space>pp <C-p>
