-- Configure local Glimmer grammar
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.glimmer = {
  install_info = {
    url = "~/Code/tree-sitter-glimmer",
    files = {
      "src/parser.c",
      "src/scanner.c"
    }
  },
  filetype = "handlebars",
}

require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained",
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  highlight = {
    enable = true,

    custom_captures = {
      -- HTML Customization
      -- Highlight a DOCTYPE like a comment
      ["doctype"] = "Comment",
    },
  },
}
