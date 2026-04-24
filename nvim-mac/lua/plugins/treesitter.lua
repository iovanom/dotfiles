vim.filetype.add({
  extension = {
    d2 = function()
      return "d2", function(bufnr)
        vim.bo[bufnr].commentstring = "# %s"
      end
    end,
  },
})

return {
  {
    'romus204/tree-sitter-manager.nvim',
    lazy = false,
    opts = {
      auto_install = true,
      highlight = true,
      languages = {
        d2 = {
          install_info = {
            url = "https://github.com/ravsii/tree-sitter-d2",
            use_repo_queries = true,
          },
        },
      },
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
        "earthfile",
        "scala",
        "d2",
        -- Salesforce
        "apex",
        "soql",
        "sosl",
        "sflog",
      },
    },
  },
}
