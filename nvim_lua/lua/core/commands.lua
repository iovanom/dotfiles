vim.cmd("cab adddailynote :e $HOME/notes/daily/`date +\\%d.\\%m.\\%Y`.md<CR>:%!cat $HOME/notes/daily/.template<CR>:%s/\\$DATE/\\=system('date +\\%d.\\%m.\\%Y')/g\"<CR>:w<CR>")

vim.api.nvim_create_user_command("Ag", ":Telescope<cr>", {})
vim.api.nvim_create_user_command("AddDaily", ":e $HOME/notes/daily/`date +\\%d.\\%m.\\%Y`.md<CR>:%!cat $HOME/notes/daily/.template<CR>:%s/\\$DATE/\\=system('date +\\%d.\\%m.\\%Y')/g\"<CR>:w<CR>", {})
