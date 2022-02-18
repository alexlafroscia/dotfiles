local null_ls = require("null-ls")
local lspconfig = require("config.lspconfig")

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = {
        "handlebars",
      },
      condition = function(utils)
        return utils.root_has_file({ ".prettierrc" })
      end,
    }),
    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
      end,
    }),
    null_ls.builtins.formatting.stylua,

    -- Diagnostics
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
      end,
    }),

    -- Code Actions
    null_ls.builtins.code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
      end,
    }),
  },

  -- Pass through to LSP config
  on_attach = lspconfig.on_attach,
})
