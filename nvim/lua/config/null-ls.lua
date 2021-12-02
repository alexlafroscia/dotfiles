local null_ls = require("null-ls")

null_ls.config({
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
})
