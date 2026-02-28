local helpers = require('core.helpers')

vim.api.nvim_create_user_command("Cpadmin", ":!cpadmin <cfile> '%:p:h' <CR>", {})

-- Close all buffers except the current one
vim.api.nvim_create_user_command('OnlyCurrent', function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- skip the current buffer and any unloaded buffers
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      -- delete the buffer (you can use force = false if you want to prevent losing unsaved changes)
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, {
  desc = "Close all buffers except the current one",
})

vim.api.nvim_create_user_command('JQCopy', "!jq -c . % | jq -Rs | pbcopy", {})


vim.api.nvim_create_user_command('CopyFileName', function()
  helpers.copy_filename_without_extension()
end, { nargs = 0 })
