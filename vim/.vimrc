set nocompatible
filetype off

set runtimepath+=~/custom_vim,~/custom_vim/autoload
call plug#begin('~/custom_vim/plugged')
" Plug 'joonty/vdebug'
" Plug 'vim-scripts/mru.vim'
"
" colorscheme's ----------------
Plug 'tpope/vim-sensible'
Plug 'smurfd/winterd'
Plug 'vim-scripts/solarized'
Plug 'vim-scripts/navajo-night'
Plug 'sickill/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'
" ------------------------------
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'hdima/python-syntax'

Plug 'ryanss/vim-hackernews'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/tagbar'
Plug 'vim-scripts/dbext.vim'

Plug 'tpope/vim-surround'

Plug 'vim-scripts/vim-javascript'
Plug 'vim-scripts/vim-jsbeautify'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'shougo/neocomplete.vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

Plug 'easymotion/vim-easymotion'
Plug 'epeli/slimux'
Plug 'vim-scripts/tComment'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'wmvanvliet/vim-ipython'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ntpeters/vim-better-whitespace'
Plug 'takac/vim-hardtime'
Plug 'matze/vim-move'
Plug 'junegunn/gv.vim'
Plug 'wincent/ferret'
Plug 'davidhalter/jedi-vim'
Plug '907th/vim-auto-save'

Plug 'vim-scripts/Align'
Plug 'vim-scripts/SQLUtilities'

" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'vim-scripts/cscope.vim'


call plug#end()

filetype plugin indent on
syntax on

autocmd FileType cpp highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType cpp match OverLength /\(\%81v.\+\)\|\( \+$\)/
autocmd FileType c highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType c match OverLength /\(\%81v.\+\)\|\( \+$\)/
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\(\%81v.\+\)\|\( \+$\)/
autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim map <buffer> <leader>rr :source %<CR>


let mapleader = ","
ca tn tabnew
" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

set laststatus=2
set clipboard=unnamedplus
set modelines=0
set ttyfast
set ruler
" Why is this not a default
set hidden
" Don't update the display while executing macros
set lazyredraw
" At least let yourself know what mode you're in
set showmode
" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
set wildmode=list:longest
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo,hor
" Set the search scan to wrap around the file
set wrapscan
" Make command line two lines high
" set ch=2
set ch=1
" set visual bell -- I hate that damned beeping
set novb
" Allow backspacing over indent, eol, and the start of an insert
set backspace=2
" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac
set guioptions+=M
set guioptions-=T
set guioptions-=r
set guioptions-=m

" set guifont=DejaVu\ Sans\ Mono\ 10
" set guifont=Liberation\ Mono\ 9.5
" set guifont=Monospace\ 10
" set guifont=Liberation\ Mono\ 10
set guifont=Ubuntu\ Mono\ 11

" Hide the mouse pointer while typing
set mousehide
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=19
" Allow the cursor to go in to "invalid" places 
set virtualedit=all
" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
" set the search scan to wrap lines
set wrapscan
" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase
" When completing by tag, show the whole tag, not just the function name
set showfulltag
" Turn tabs into spaces
set expandtab
" Incrementally match the search
set incsearch
set hlsearch
set showcmd " показывать незавершенные команды в статусбаре (автодополнение ввода)
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set confirm " использовать диалоги вместо сообщений об ошибках

set nowrap
set nu
set relativenumber

set cindent
set cino=M1(0,W4

" При вставке фрагмента сохраняет отступы
set pastetoggle=
"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)
set foldenable " включить фолдинг
set foldmethod=syntax " определять блоки на основе синтаксиса файла
set foldmethod=indent " определять блоки на основе синтаксиса файла
set foldcolumn=0 " показать полосу для управления сворачиванием
set foldlevel=99 " что бы по умолчанию всё были раскрыты заебало каждый раз zR


"" Разворачивать окно редактора на весь экран
if has('gui')
"" set guioptions-=T " отключить меню в GUI
    au GUIEnter * :set lines=60 columns=120
endif

" что бы нормально отображался man
if has("gui_running")
  runtime ftplugin/man.vim
  nmap K :Man <cword><CR>
endif

syntax enable
if has('gui_running')
    set background=dark
    colorscheme PaperColor
    hi Search guibg=Yellow guifg=Black 
else
    colorscheme elflord
endif

set encoding=utf-8
set wildmenu
set wcm=<Tab>

menu Encoding.UTF-8    :e ++enc=utf-8<CR>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
map <F8> :emenu Encoding.<TAB>


" Подсвечиваем все строки шире 80
" Подсвечиваем пробелы в конце строк


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: tcomment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call tcomment#DefineType('python',           '# %s'             )


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_do_shade = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: CtlrP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_root_markers = ['WORK_ADCOMBO', 'mor']
let g:ctrlp_use_caching = 1
let g:ctrlp_by_filename = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: python-syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "\'g"
let g:jedi#goto_assignments_command = "\'d"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = ""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIgnore=['\~$', '\.pyc$', ]
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=50
nnoremap <F2> :NERDTreeToggle<cr>
nmap <leader><leader>f :NERDTreeFind<CR>
nmap mf :NERDTreeFind<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<Leader>p'
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader><Leader>m :CtrlPMRUFiles<CR>
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_root_markers = ['WORK_ADCOMBO', 'mor']
" подумай как go поступить
let g:ctrlp_use_caching = 1
let g:ctrlp_by_filename = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader><Leader> <Plug>(easymotion-prefix)
" map ' <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :TagbarToggle<CR>
let g:tagbar_usearrows = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: Slimux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <leader><leader>r :w<CR> :SlimuxSendKeysLast<CR>
nmap <leader>r<leader> :w<CR> :SlimuxSendKeysLast<CR>
imap <M-9> <C-\><C-o>:w<CR><C-\><C-o>:SlimuxSendKeysLast<CR>
nmap <M-9> :w<CR>:SlimuxSendKeysLast<cr>

imap <F7> <C-\><C-o>:w<CR><C-\><C-o>:SlimuxSendKeysLast<CR>
nmap <F7> :w<CR>:SlimuxSendKeysLast<cr>

" imap <leader><leader>r <ESC>:w<CR> :SlimuxSendKeysLast<CR> :startinsert<CR>
map <leader>kk :SlimuxSendKeysPrompt<CR>
nmap <leader>cc :SlimuxSendKeysConfigure<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: HardTime
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:hardtime_default_on = 0
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: IPython
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ipython_run_flags = ['-i']
map  <buffer> <silent> <C-Return>        <Plug>(IPython-RunFile)
map  <buffer> <silent> <M-S>             <Plug>(IPython-RunLineAsTopLevel)

" ctrl - shift - s
xmap <buffer> <silent> <M-S>             <Plug>(IPython-RunLines)

" cell это когда ###
map  <buffer> <silent> <Leader><Leader>x <Plug>(IPython-RunCell)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: Neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :NeocompleteEnable
let g:neocomplete#enable_at_startup = 0

let g:neocomplete#force_overwrite_completefunc      = 1
let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#auto_completion_start_length      = 0
let g:neocomplete#sources#syntax#min_keyword_length = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_bin_path = expand("~/.gotools")
let g:go_fmt_command = "goimports"
autocmd FileType go map <buffer> 'g <Plug>(go-def-tab)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsJumpForwardTrigger="<a-b>"
" let g:UltiSnipsJumpForwardTrigger="<a-g>"
" let g:UltiSnipsJumpBackwardTrigger="<a-f>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"   " or Enter
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: dbext
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dbext_default_pgsql_bin                = 'psql'
let g:dbext_default_pgsql_cmd_header         = ''
let g:dbext_default_pgsql_cmd_terminator     = ''
let g:dbext_default_pgsql_cmd_options        = ''
let g:dbext_default_pgsql_extra              = ''
let g:dbext_default_pgsql_pgpass             = expand('$home/.pgpass')
let g:dbext_default_buffer_lines = 15
source ~/Dropbox/dotFiles/vim/vimrc_dbext.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
" let g:EasyMotion_do_shade = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug: auto-pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsMapCh = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/Dropbox/dotFiles/vim/vimrc_python.vim

" if has("python3")
"     map <a-y> :py3 EvaluateCurrentRange()
" endif
"
" if has("python")
"     map <a-y> :py EvaluateCurrentRange()
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-c> "+y
map <leader><c-v> "+p

nnoremap <c-h> 5h
nnoremap <c-j> 5j
nnoremap <c-k> 5k
nnoremap <c-l> 5l

vnoremap <c-h> 5h
vnoremap <c-j> 5j
vnoremap <c-k> 5k
vnoremap <c-l> 5l

nnoremap j gj
nnoremap k gk
 
imap <C-BS> <C-W>
" imap <a-l> <Right>
" imap <a-h> <Left>
imap <c-l> <Right>
" imap <c-h> <Backspace>
" imap <c-h> <Left>
" imap <a-j> <Down>
" imap <a-k> <Down>

" nnoremap <c-n> :tabnext<cr>
" nnoremap <c-p> :tabprev<cr>
" vnoremap <c-n> :tabnext<cr>
" vnoremap <c-p> :tabprev<cr>

nnoremap <M-0> :tabnext<cr>
nnoremap <M-8> :tabprev<cr>
inoremap <M-0> <C-o>:tabnext<cr>
inoremap <M-8> <C-o>:tabprev<cr>
vnoremap <M-0> :tabnext<cr>
vnoremap <M-8> :tabprev<cr>

nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
