require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "html",
    "svelte",
    "css",
    "javascript",

    "c",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "java",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "markdown",
    "markdown_inline",
    "nginx",
    "php",
    "python",
    "query",
    "rust",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "http",
  },
  highlight = {
    enable = true,              -- Enable highlighting
    disable = {},               -- Do not disable any languages by default
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,              -- Enable indentation
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.d2 = {
  install_info = {
    url = "https://github.com/ravsii/tree-sitter-d2",
    files = { "src/parser.c" },
    branch = "main"
  },
  filetype = "d2",
}

-- we also need to tell neovim to use "d2" filetype on "*.d2" files, as well as
-- token comment.
-- ftplugin/autocmd is also an option.
vim.filetype.add({
  extension = {
    d2 = function()
      return "d2", function(bufnr)
        vim.bo[bufnr].commentstring = "# %s"
      end
    end,
  },
})
