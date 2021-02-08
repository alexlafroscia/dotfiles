lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,

    custom_captures = {
      -- HTML Customization
      -- Highlight a DOCTYPE like a comment
      ["doctype"] = "Comment",
    },
  },
}
EOF
