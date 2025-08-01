-- vim.go.python3_host_prog = '/usr/bin/python3'
-- vim.go.python_host_prog = '/usr/bin/python'

vim.opt.backupdir = vim.fn.expand('~/.vimbackup/')
vim.opt.directory = vim.fn.expand('~/.vimswp/')

-- Better display for messages
vim.opt.cmdheight = 2

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.so = 7
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = 'utf8'
vim.opt.ffs = 'unix,dos,mac'

-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Undo files
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vimundo/')

-- history
vim.opt.history = 50

-- hidden chars; use `:set list` and `:set list!` to show or hide special chars
vim.opt.listchars='tab:→ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»'

-- search options
vim.opt.hlsearch = true

-- Don't redraw while executing macros (goot performance config)
vim.opt.lazyredraw = true

-- ------------
-- folds
-- ------------

-- Set the global fold method to use Treesitter
vim.opt.foldmethod = 'expr'

-- Set the expression that Treesitter will use to determine folds
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Start with folds closed
vim.opt.foldlevelstart = 99

-- By default, don't fold files
vim.opt.foldenable = true

-- ------------
-- folds end
-- ------------

-- completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- need for bufferline plugin
vim.opt.termguicolors = true

-- Set ignorecase
vim.opt.ignorecase = false

-- Set smartcase
vim.opt.smartcase = true
