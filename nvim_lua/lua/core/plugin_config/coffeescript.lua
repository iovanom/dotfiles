vim.o.coffee_watch_vert = 1

vim.api.nvim_create_autocmd('FileType', {
  pattern = "coffee",
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end
})
