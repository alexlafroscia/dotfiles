local map = vim.api.nvim_set_keymap

-- Configuration
require("trouble").setup({
  use_diagnostic_signs = true,
})

-- Recommended Keymaps
map(
  "n",
  "<leader>xx",
  "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
map(
  "n",
  "<leader>xw",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
map(
  "n",
  "<leader>xf",
  "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
map(
  "n",
  "<leader>xl",
  "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
map(
  "n",
  "<leader>xq",
  "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
map(
  "n",
  "gr",
  "<cmd>Trouble lsp_references<cr>",
  { silent = true, noremap = true }
)
