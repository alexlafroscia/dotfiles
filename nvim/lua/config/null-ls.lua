local null_ls = require("null-ls")
local lspconfig = require("config.lspconfig")

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.prettierd.with({
      filetypes = {
        -- Defaults
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        -- Additional
        "handlebars",
      },
    }),
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.stylua,

    -- Diagnostics
    null_ls.builtins.diagnostics.eslint_d,

    -- Code Actions
    null_ls.builtins.code_actions.eslint_d,
  },

  -- Pass through to LSP config
  on_attach = lspconfig.on_attach,
})
