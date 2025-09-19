--[[
-- Keymaps
--]]

vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.keymap.set('n', '<leader>;', ',', { noremap = true })

-- Copy current the file path
vim.keymap.set('n', 'cp', ':let @"=expand("%")<cr>', { noremap = true })
-- Copy to clipboard the file path
vim.keymap.set('n', '<leader>cp', ':let @+=expand("%")<cr>', { noremap = true })
vim.keymap.set('n', '<leader>cf', ':CopyFileName<cr>', { noremap = true })

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>yy', '"+yy', { noremap = true })
vim.keymap.set('n', '<leader>Y', '"+yg', { noremap = true })

-- Paste from clipboard
vim.keymap.set('v', '<leader>P', '"+p', { noremap = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true })

-- bufers keymaps
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>n', ':bnext<CR>')
vim.keymap.set('n', '<leader>m', ':bprevious<CR>')
vim.keymap.set('n', '<leader>x', ':bd<CR>')

-- splits navigation
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { silent = true })

-- resize splits
vim.keymap.set('n', '<C-up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-left>', ':vert resize -2<CR>')
vim.keymap.set('n', '<C-right>', ':vert resize +2<CR>')

-- find selection
vim.keymap.set('v', '//', 'y/<C-R>"<CR>', { noremap = true })

-- escape
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })
vim.keymap.set('i', '<C-c>', '<nop>', { noremap = true })

-- move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- The test function for testing some ideas
function Test_function()

  local file = vim.fn.expand('%')
  local buf = vim.api.nvim_create_buf(false, true)
  local height = vim.api.nvim_win_get_height(0) - 10
  local width = vim.api.nvim_win_get_width(0) - 10
  vim.api.nvim_open_win(buf, true, {
    relative='editor',
    style='minimal',
    col=5,
    row=5,
    width=width,
    height=height,
    border='double',
  })
  vim.api.nvim_call_function("termopen", {"python " .. file})
end
-- vim.keymap.set('n', 'rr', "<cmd>lua Test_function()<cr>", { noremap = true })


vim.api.nvim_create_autocmd('FileType', {
  pattern = "make",
  callback = function()
    vim.keymap.set('n', '<leader>ph', '^yt:ko.PHONY: <Esc>p')
  end
})
