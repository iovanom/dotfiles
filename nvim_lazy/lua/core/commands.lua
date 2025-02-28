vim.api.nvim_create_user_command("Cpadmin", ":!cpadmin <cfile> '%:p:h' <CR>", {})
