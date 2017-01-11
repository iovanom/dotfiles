"""""""""""""""""""""
"" Common Settings 
"""""""""""""""""""""

filetype plugin indent on

"" Set auto read when a file is changed
set autoread

"" Line Number
set number
set relativenumber


"" Cursor
set cursorline

set history=500

"""""""""""""""""""""


"""""""""""""""""""""
"" Key Maps
"""""""""""""""""""""

"" Leader Key
let mapleader = ","
let g:mapleader = ","

"" Bufers keys
noremap <Leader>n :bnext<CR>
noremap <Leader>o :bprevious<CR>
noremap <Leader>x :bd<CR>

""""""""""""""""""""""


""""""""""""""""""""""
"" Vim UI
""""""""""""""""""""""

set hidden

" Set 7 lines to the cursor
set so=7

" Always show current position
set ruler

" Ignore case when searching
set ignorecase
set smartcase
set hlsearch

" Don't redraw while executing macros (goot performance config)
set lazyredraw

set encoding=utf8

" Use Unix as the standart file type
set ffs=unix,dos,mac

"""""""""""""""""""""""


"""""""""""""""""""""""
"" Color and Fonts
"""""""""""""""""""""""

syntax on

" Enable 256 colors palette
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme monokain
catch
endtry

set background=dark

"""""""""""""""""""""""""


"""""""""""""""""""""""""
"" Files, backup and undo
"""""""""""""""""""""""""
" Turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" Undo files
set undofile
set undodir=/home/ivan/.vimundo/

"""""""""""""""""""""""""


"""""""""""""""""""""""""
" Text, tab and inden
"""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

set smarttab

" Linebreak on 500 characters
set lbr
set tw=120
set ai "Auto indent
set si "Smart indent
set wrap "Wrap linest

"""""""""""""""""""""""""


"""""""""""""""""""""""""
" Plugins Settings
"""""""""""""""""""""""""

" NERDTree
let NERDTreeIgnore=['\.pyc$']
map <C-e> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

"Syntatic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']

"CtrlP
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode = 0

set wildignore+=*.pyc,node_modules/*


let &colorcolumn=81
highlight ColorColumn ctermbg=234


