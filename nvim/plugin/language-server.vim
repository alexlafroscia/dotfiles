lua << EOF
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')
local completion = require('completion')

-- Add custom entry for Ember Language Server
configs.els = {
  default_config = {
    cmd = {'ember-language-server', '--stdio'},
    filetypes = {'handlebars', 'html.handlebars'},
    root_dir = util.root_pattern('package.json', '.git')
  }
}

-- RLS Configuration Set-Up
lspconfig.rls.setup {
  on_attach = completion.on_attach,
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = ture,
    }
  }
}

-- TSServer Configuration Set-Up
lspconfig.tsserver.setup {
  on_attach = completion.on_attach,
}

-- Vim Language Server
lspconfig.vimls.setup {
  on_attach = completion.on_attach,
}

-- Ember Language Server
lspconfig.els.setup {
  on_attach = completion.on_attach,
}

EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Keyboard bindings for LSP functions
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga <cmd>lua require('telescope.builtin').lsp_code_actions()<CR>

" Configure nvim-lightbuilb to appear near cursor
" https://github.com/kosayoda/nvim-lightbulb#usage
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
