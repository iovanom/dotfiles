"=====================
" Plug Plugins
"=====================

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes/'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', { 'for': ['css', 'html', 'js', 'vue']}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'crusoexia/vim-javascript-lib', {'for': 'javascript'}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'editorconfig/editorconfig-vim'

" vue.js
"Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }

Plug 'hdima/python-syntax', { 'for': 'python' }
"Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }

"Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

" Color schemes
Plug 'gruvbox-community/gruvbox'
"Plug 'flazz/vim-colorschemes'
"Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'relastle/bluewery.vim'
Plug 'NLKNguyen/papercolor-theme'

" DB management
"Plug 'tpope/vim-dadbod'
"Plug 'kristijanhusak/vim-dadbod-ui'

"Plug 'inkarkat/vim-mark'

call plug#end()

"=====================
"
set hidden

" Set 7 lines to the cursor
set so=7

" Always show current position
set ruler

filetype plugin indent on

"" Set auto read when a file is changed
set autoread

"" Line Number
set number
set relativenumber

"" Cursor
set cursorline

set history=500

"" Leader Key
let mapleader = ","
let g:mapleader = ","

"" Marks
set viminfo='200,f1

"" Bufers keys
noremap <Leader>n :bnext<CR>
noremap <Leader>m :bprevious<CR>
noremap <Leader>x :bd<CR>

noremap ]p :cp <cr>
noremap ]n :cn <cr>

"" Splits navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

"" Search selected text
vnoremap // y/<C-R>"<CR>

"" Hidden chars
"" Command to show `:set list`
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" set list

" Ignore case when searching
"set ignorecase
"set smartcase
set hlsearch

" Don't redraw while executing macros (goot performance config)
set lazyredraw

set encoding=utf8

" Use Unix as the standart file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" NERDTree
let NERDTreeIgnore=['\.pyc$']
"nmap <c-e> :NERDTreeToggle <cr>
nmap <c-e> :CocCommand explorer<CR>

syntax on

" Colors ---->
"colorscheme monokain
colorscheme gruvbox
"colorscheme bluewery-light
"colorscheme onehalflight
set background=dark
set termguicolors
" <-----------
" Enable 256 colors palette
set t_Co=256

"let &colorcolumn=81
"highlight ColorColumn ctermbg=234

set colorcolumn=80,120
highlight ColorColumn ctermbg=234

" Undo files
set undofile
set undodir=/home/ivan/.vimundo/

" FZF
nmap <Leader>t :FZF <cr>
nmap \ :Buffers <cr>

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""
" Abreviations
" """"""""""""""""""""""""""
iab pdb import pdb;pdb.set_trace()<Esc>
iab eslintdis //eslint-disable-next-line<Esc>
iab jsonstring JSON.stringify(<Esc>

cab adddailynote :e $HOME/notes/daily/`date +\%d.\%m.\%Y`.md<CR>:-1read $HOME/notes/daily/.template<CR>:w<CR>

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
"let g:airline_theme='cool'
let g:airline_theme='onehalfdark'
"let g:airline_theme='onehalflight'

" folds
set foldmethod=manual
set foldlevelstart=99
autocmd FileType coffee setlocal foldmethod=indent

" " Copy current the file path
nnoremap cp :let @"=expand("%")<cr>
" " Copy to clipboard the file path
nnoremap <leader>cp :let @+=expand("%")<cr>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" nvim options
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height=3


" COC Settings

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noswapfile

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" COC CONFIGS
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" Disable lint from vim-go because of lint in coc-go
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 1

" Highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc.actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
