require("gitsigns").setup({
  -- Recommended config for NeoVim < 0.7
  -- https://github.com/lewis6991/gitsigns.nvim/blob/11425117a9dcd533e5d42e083248ee0caea88b04/README.md#keymaps
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend(
        "force",
        { noremap = true, silent = true },
        opts or {}
      )
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map(
      "n",
      "]c",
      "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
      { expr = true }
    )
    map(
      "n",
      "[c",
      "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
      { expr = true }
    )

    -- Actions
    map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
    map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
    map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
    map(
      "n",
      "<leader>hb",
      '<cmd>lua require"gitsigns".blame_line{full=true}<CR>'
    )
    map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
    map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

    -- Text object
    map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
})
