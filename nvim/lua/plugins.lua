-- Initialize Packer
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- UI
  use '~/Code/night-owl.vim'
  use 'itchyny/lightline.vim'
  use 'maximbaz/lightline-ale'

  -- Project Navigation
  use {
    'junegunn/fzf',
    run = './install --all'
  }
  use 'junegunn/fzf.vim'
  use 'mhinz/vim-grepper'
  use {
    'francoiscabrol/ranger.vim',
    requires = {'rbgrouleff/bclose.vim'}
  }
  use 'mcchrish/nnn.vim'
  use 'simeji/winresizer'
  use 'junegunn/goyo.vim'

-- Editing
  use 'tpope/vim-surround'                 -- Change word surroundings
  use 'tpope/vim-commentary'               -- Comments stuff
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'junegunn/vim-peekaboo'

  -- File Navigation
  use 'vim-scripts/matchit.zip'            -- More powerful % matching
  use 'Lokaltog/vim-easymotion'            -- Move like the wind!
  use 'jeffkreeftmeijer/vim-numbertoggle'  -- Smarter line numbers
  use 'kshenoy/vim-signature'              -- Show marks in the gutter
  use 'haya14busa/incsearch.vim'           -- Better search highlighting
  use 'liuchengxu/vista.vim'

  -- Tree Sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    require = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-refactor'
    },
    config = [[require('config/treesitter')]]
  }

  -- Git Integration
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {'junegunn/gv.vim', cmd = 'GV' }
  use 'jez/vim-github-hub'                 -- Filetype for hub pull requests
  use {
     'lewis6991/gitsigns.nvim',
     requires = 'nvim-lua/plenary.nvim',
     config = function()
        require('gitsigns').setup {}
     end
   }

  -- Auto-Complete
  use 'dense-analysis/ale'
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config/lspconfig')]]
  }
  use {
    'hrsh7th/nvim-compe',
    config = [[require('config/compe')]]
  }
  use 'kosayoda/nvim-lightbulb'

  -- Task Running
  use 'christoomey/vim-tmux-navigator'
  use {'vim-test/vim-test', requires = 'tpope/vim-dispatch'}
end)
