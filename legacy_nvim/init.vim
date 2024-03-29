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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', { 'for': ['css', 'html', 'js', 'typescriptreact', 'vue', 'handlebars']}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'crusoexia/vim-javascript-lib', {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'editorconfig/editorconfig-vim'

" vue.js
"Plug 'posva/vim-vue', { 'for': 'vue' }
"Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }

Plug 'hdima/python-syntax', { 'for': 'python' }
"Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }

"Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

" Color schemes
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
"Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'relastle/bluewery.vim'
Plug 'NLKNguyen/papercolor-theme'

" DB management
"Plug 'tpope/vim-dadbod'
"Plug 'kristijanhusak/vim-dadbod-ui'

"Plug 'inkarkat/vim-mark'

Plug 'puremourning/vimspector'


" Snippets
Plug 'honza/vim-snippets'

" Web APIs
Plug 'mattn/webapi-vim'

" GraphQL Schema
Plug 'jparise/vim-graphql'

" Plantuml preview
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'

Plug 'dhruvasagar/vim-table-mode'

call plug#end()

"=====================
"

" CocExtensions
"
let g:coc_global_extensions = [
  \'coc-actions',
  \'coc-angular',
  \'coc-clangd',
  \'coc-cspell-dicts',
  \'coc-css',
  \'coc-db',
  \'coc-diagnostic',
  \'coc-eslint',
  \'coc-explorer',
  \'coc-go',
  \'coc-highlight',
  \'coc-html',
  \'coc-java',
  \'coc-json',
  \'coc-kite',
  \'coc-lists',
  \'coc-markdownlint',
  \'coc-marketplace',
  \'coc-phpls',
  \'coc-pyright',
  \'coc-restclient',
  \'coc-rls',
  \'coc-rust-analyzer',
  \'coc-snippets',
  \'coc-spell-checker',
  \'coc-tabnine',
  \'coc-toml',
  \'coc-tsserver',
  \'coc-vetur',
  \'coc-yaml'
\]

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
nnoremap <leader>; ,

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

nmap <C-up> :resize -2<CR>
nmap <C-down> :resize +2<CR>
nmap <C-left> :vert resize -2<CR>
nmap <C-right> :vert resize +2<CR>

vnoremap // y/<C-R>"<CR>

inoremap jk <ESC>
inoremap <C-c> <nop>
nnoremap <C-f>w :Ag <C-r><C-w><CR>


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

augroup my_group_for_specific_lang
  autocmd!
  autocmd FileType python,php set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
  autocmd FileType coffee,python,php setlocal foldmethod=indent
  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
augroup end

" Coffeescript
let coffee_watch_vert = 1

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
if (has("termguicolors"))
  set termguicolors
endif

" <-----------
" Enable 256 colors palette
set t_Co=256

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

"let &colorcolumn=81
"highlight ColorColumn ctermbg=234

set colorcolumn=80,120
highlight ColorColumn ctermbg=234

" Undo files
set undofile
set undodir=/home/ivan/.vimundo/

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
nmap <Leader>t :FZF <cr>
nmap \ :Buffers <cr>

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" emmet
let g:user_emmet_leader_key='<C-Z>'

" coc-snippets
vnoremap <C-s> <Plug>(coc-convert-snippet)

""""""""""""""""""""""""""""
" Abreviations
" """"""""""""""""""""""""""
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

iab pdb import pdb;pdb.set_trace()<Esc>
iab eslintdis //eslint-disable-next-line<Esc>
iab jsonstring JSON.stringify(<C-R>=Eatchar('\s')<CR>
iabbrev ssig -- <cr>Ivan Majeru<cr>ivanmajeru@gmail.com


" notes
cab adddailynote :e $HOME/notes/daily/`date +\%d.\%m.\%Y`.md<CR>:%!cat $HOME/notes/daily/.template<CR>:%s/\$DATE/\=system('date +\%d.\%m.\%Y')/g"<CR>:w<CR>

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
"let g:airline_theme='cool'
let g:airline_theme='onehalfdark'
"let g:airline_theme='onehalflight'

" folds
set foldmethod=syntax
set foldlevelstart=99

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

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height=3

" mouse use
"set mouse=a

" COC Settings

set backupdir=~/.vimbackup/
set directory=~/.vimswp/
set undodir=~/.vimundo/

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" open vimrc/init.vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Prettier
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" =============
" COC CONFIGS
" =============

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

" Highlight the symbol and its references when holding the cursor.
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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

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
nnoremap <silent> <c-space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <c-space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <c-space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <c-space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <c-space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <c-space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <c-space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <c-space>p  :<C-u>CocListResume<CR>
" Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" Disable lint from vim-go because of lint in coc-go
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 1

" Highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" ================
" End coc configs
" ================
