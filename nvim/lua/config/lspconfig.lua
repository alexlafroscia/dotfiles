local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

-- Add custom entry for Ember Language Server
if not lspconfig.els then
  configs.els = {
    default_config = {
      cmd = {'/Users/alafroscia/Code/github.com/alexlafroscia/ember-language-server/bin/ember-language-server.js', '--stdio'},
      filetypes = {'handlebars', 'html.handlebars'},
      root_dir = util.root_pattern('package.json', '.git')
    }
  }
end

-- RLS Configuration Set-Up
-- lspconfig.rls.setup {
--   settings = {
--     rust = {
--       unstable_features = true,
--       build_on_save = false,
--       all_features = ture,
--     }
--   }
-- }
lspconfig.rust_analyzer.setup {}

-- TSServer Configuration Set-Up
lspconfig.tsserver.setup {}

-- Deno LSP Set-Up
-- lspconfig.denols.setup{
--   filetypes = { "typescript" },
--   init_options = {
--     enable = true,
--     lint = true,
--     unstable = true,
--   }
-- }

-- Vim Language Server
lspconfig.vimls.setup {}

-- Ember Language Server
lspconfig.els.setup {
  settings = {
    useBuiltinLinting = false,
  },
}

-- SolarGraph (Ruby) Language Server
lspconfig.solargraph.setup {}

-- SourceKit (Swift/C/CPP) Language Server
lspconfig.sourcekit.setup {}
