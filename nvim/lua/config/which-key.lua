local wk = require("which-key")

wk.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})

-- Normal-Mode Key Bindings
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
    r = { "<cmd>Trouble lsp_references<cr>", "Open References in Trouble" },
    t = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Go to Type Definition",
    },
  },

  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },

  -- Navigate Diagnostics
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

wk.register({
  x = {
    f = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Open Document Diagnostics in Trouble",
    },
    l = { "<cmd>TroubleToggle loclist<cr>", "Open loclist in Trouble" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Open quickfix in Trouble" },
    x = { "<cmd>TroubleToggle<cr>", "Open Trouble" },
    w = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Open Workspace Diagnostics in Trouble",
    },
  },
}, { prefix = "<leader>" })

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
