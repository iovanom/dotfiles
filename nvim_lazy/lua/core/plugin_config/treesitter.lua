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

--vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
