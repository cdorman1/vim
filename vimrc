filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'wgibbs/vim-irblack'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/google.vim'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'avakhov/vim-yaml'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'airblade/vim-gitgutter'
Bundle 'MarcWeber/ultisnips'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'othree/html5.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'mileszs/ack.vim'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'nathanaelkane/vim-indent-guides'

set rtp+=$GOROOT/misc/vim

filetype plugin indent on

let mapleader = ","

"--------------------
" Basic Setup
"--------------------
set nocompatible
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8
set autoindent
set colorcolumn=81
" let &colorcolumn=join(range(81,999), ",")
set modeline

"--------------------
" Whitespace
"--------------------
set nowrap
set ts=4 sw=4 sts=4 et
set backspace=indent,eol,start    " backspace through everything in insert mode
" au BufWrite * silent! %s/\s\+$//ge

"--------------------
" Menu
"--------------------
set wildmenu
set wildmode=list:longest,full

"--------------------
" List Characters
"--------------------
set list
" set nolist
" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
" set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:⋅
" set showbreak=↪

"--------------------
" File Ignores
"--------------------
set wildignore+=*.swp
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.waf|\.git$|\.hg$|\.svn$|vendor|node_modules|bower_components)',
            \ 'file': '\v(core\..*\.\d\+|\.lock.*|\.o|\.so|\.cc)$',
            \ }

let g:ctrlp_root_markers = ['.vim-ctrlp-root']
" let g:ctrlp_working_path_mode='r'

"--------------------
" Searching
"--------------------
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"--------------------
" Backup and swap files
"--------------------
set backupdir=~/.vim/backup/    " where to put backup files.
" set nobackup
" set nowritebackup
set backupcopy=yes
set directory=~/.vim/swap/      " where to put swap files.

"--------------------
" UI + Colorscheme
"--------------------
set equalalways
set number            " Show line numbers
set ruler             " Show line and column number
set laststatus=2
set cursorline
set t_Co=256
set background=dark
colorscheme ir_black
hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=underline
hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE      ctermfg=black       ctermbg=darkgray    cterm=NONE
hi PmenuSel       guifg=#000000     guibg=#cae682     gui=NONE      ctermfg=black       ctermbg=darkmagenta cterm=NONE
hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=black       ctermbg=magenta     cterm=NONE
hi ColorColumn    guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=0           cterm=NONE

let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black

"--------------------
" Mappings
"--------------------
" sudo write
cmap w!! %!sudo tee > /dev/null %

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" Toggle text wrapping
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Toggle hlsearch
nmap <leader>h :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Toggle paste
map <leader>p :set invpaste!<CR>:set paste?<CR>

" Make Y act more like C and D
map Y y$

" Toggle list characters
noremap <leader>sl :set list!<CR>

" Close/open quickfix window
map <leader>qc :cclose<cr>
map <leader>qo :copen<cr>

" Move cursor with wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

map <leader>tc :Tabularize /,\zs<cr>

" camelCase <-> underscore
" map <leader>x_ :s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g<cr>
" map <leader>xc :s#_\(\l\)#\u\1#g<cr>
" map <leader>xC :s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g<cr>

map <leader>r :RainbowParenthesesToggle<cr>

"--------------------
" Plugin Settings
"--------------------
let NERDShutUp = 1
let NERDSpaceDelims = 1

map <leader>n :NERDTreeToggle<CR><C-w>=
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" let g:syntastic_mode_map = {'mode': 'passive'}

" let g:clang_use_library = 1
" let g:clang_library_path = "/home/lchan/lib"
" let g:clang_complete_copen = 1
" let g:clang_complete_auto = 0

" let g:snips_trigger_key = '<C-\>'
" imap <C-\> <Plug>snipMateNextOrTrigger

" let g:UltiSnips = {}
" let g:UltiSnips.always_use_first_snippet = 1
let g:UltiSnipsExpandTrigger = '<C-J>'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview

map <leader>pc :CtrlPClearAllCaches<cr>

au FileType jade setl ts=2 sw=2 sts=2 et
au FileType javascript setl ts=2 sw=2 sts=2 et
au FileType coffee setl ts=2 sw=2 sts=2 et
au FileType html setl ts=2 sw=2 sts=2 et
au FileType html5 setl ts=2 sw=2 sts=2 et
au FileType coffee setl ts=2 sw=2 sts=2 et
au FileType less setl ts=2 sw=2 sts=2 et
au FileType css setl ts=2 sw=2 sts=2 et

au FileType cpp let c_no_curly_error=1
au FileType cpp nmap <silent> <leader>m :FSHere<cr>

au FileType go setl ts=2 sw=2 sts=2 noet nolist

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgray',    'firebrick3'],
    \ ]

let g:gitgutter_eager = 0

let g:buffergator_suppress_keymaps = 1
nnoremap <silent><leader>b :BuffergatorToggle<cr>
nnoremap <silent><leader>t :BuffergatorTabsToggle<cr>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
nnoremap <silent>[] :lnext<cr>
nnoremap <silent>][ :lprev<cr>

let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
nnoremap <leader>g :TagbarOpenAutoClose<cr>

let g:syntastic_python_flake8_args='--ignore=E501'
