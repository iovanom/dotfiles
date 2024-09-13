require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "html",
    "java",
    "javascript",
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
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enabled = true,
  },
}
