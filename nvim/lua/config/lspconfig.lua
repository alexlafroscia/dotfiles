local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local cmpLsp = require('cmp_nvim_lsp')

-- Run this when an LSP attaches to a buffer
local on_attach = function(client, bufnr)
  -- If the LSP supports formatting, allow for format-on-save through LSP
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
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

-- Ember Configuration Set-Up
lspconfig.ember.setup{
  capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

-- TSServer Configuration Set-Up
lspconfig.tsserver.setup {
  capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, buffer)
    -- Disable formatting from `tsserver`; `efm` will format through ESLint/Pretier
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, buffer)
  end
}

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
lspconfig.ember.setup {
  capabilities = cmpLsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
    useBuiltinLinting = false,
  },
}

-- SolarGraph (Ruby) Language Server
lspconfig.solargraph.setup {}

-- SourceKit (Swift/C/CPP) Language Server
lspconfig.sourcekit.setup {}

-- LSP to wrap linters (eslint & prettier)
local formatter = {
  formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true,
}
local linter = {
  lintCommand = "eslint -f visualstudio --stdin --stdin-filename ${INPUT}",
  -- lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
  formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}
local languages = {
  typescript = { formatter, linter },
  javascript = { formatter, linter },
  typescriptreact = { formatter, linter },
  ["typescript.tsx"] = { formatter, linter },
  javascriptreact = { formatter, linter },
  ["javascript.jsx"] = { formatter, linter },
  yaml = { formatter },
  json = { formatter },
  html = { formatter },
  scss = { formatter },
  css = { formatter },
  markdown = { formatter },
}

lspconfig.efm.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
  },
  settings = {
    rootMarkers = {
      ".git/",        -- Otherwise, use the git repo root
      "package.json", -- Use a `package.json` if present (for mono-repos)
    },
    lintDebounce = 500,
    languages = languages,
  }
}
