local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local cmpLsp = require("cmp_nvim_lsp")

local M = {}

-- Run this when an LSP attaches to a buffer
local on_attach = function(client, bufnr)
  -- If the LSP supports formatting, allow for format-on-save through LSP
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end
M.on_attach = on_attach

-- Broadcast capabilities based on `nvim-cmp`
local capabilities = cmpLsp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Ember Configuration Set-Up
lspconfig.ember.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Svelte Configuration Set-Up
lspconfig.svelte.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- TailwindCSS Configuration Set-Up
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- TSServer Configuration Set-Up
lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, buffer)
    -- Disable formatting from `tsserver`
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, buffer)
  end,
  root_dir = util.root_pattern(
    "package.json",
    "tsconfig.json",
    "jsconfig.json"
  ),
})

-- Deno LSP Set-Up
lspconfig.denols.setup({
  capabilities = capabilities,
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
  on_attach = on_attach,
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
})

-- JSON Language Server
lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Vim Language Server
lspconfig.vimls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Ember Language Server
lspconfig.ember.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    useBuiltinLinting = false,
  },
})

-- SolarGraph (Ruby) Language Server
lspconfig.solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- SourceKit (Swift/C/CPP) Language Server
lspconfig.sourcekit.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

return M
