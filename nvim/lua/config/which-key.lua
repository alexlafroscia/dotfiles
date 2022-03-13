local wk = require("which-key")

wk.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})

wk.register({
  g = {
    -- LSP-powered Navigation
    a = {
      "<cmd>CodeActionMenu<CR>",
      "Show Code Actions",
    },
    D = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "Go to Implementation",
    },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    R = {
      "<cmd>lua vim.lsp.buf.rename()",
      "Rename",
    },
    t = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Go to Type Definition",
    },
  },

  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },

  -- -- Navigate Diagnostics
  ["["] = {
    d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to Next Diagnostic" },
    e = {
      "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
      "Go to Next Error",
    },
  },
  ["]"] = {
    d = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Go to Previous Diagnostic",
    },
    e = {
      "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
      "Go to Previous Error",
    },
  },
})

-- Visual-Mode Key Bindings
wk.register({
  g = {
    -- LSP-powered Navigation
    a = {
      "<cmd>CodeActionMenu<CR>",
      "Show Code Actions",
    },
  },
})
