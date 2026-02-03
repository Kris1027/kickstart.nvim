-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('bufferline').setup {
        options = {
          diagnostics = 'nvim_lsp',
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'Explorer',
              highlight = 'Directory',
              separator = true,
            },
          },
        },
      }
      vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next tab' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous tab' })
      vim.keymap.set('n', '<leader>x', function()
        local buf = vim.api.nvim_get_current_buf()
        vim.cmd 'BufferLineCyclePrev'
        vim.api.nvim_buf_delete(buf, { force = false })
      end, { desc = 'Close tab' })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
      { '<leader>dd', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>dD', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>ds', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
    },
    opts = {},
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      enable_autocmd = false,
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    },
    opts = {},
  },
  {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ft = 'json',
    config = function()
      local pi = require 'package-info'
      pi.setup()
      vim.keymap.set('n', '<leader>ns', pi.show, { desc = 'Show package versions', silent = true })
      vim.keymap.set('n', '<leader>nh', pi.hide, { desc = 'Hide package versions', silent = true })
      vim.keymap.set('n', '<leader>nu', pi.update, { desc = 'Update package', silent = true })
      vim.keymap.set('n', '<leader>nd', pi.delete, { desc = 'Delete package', silent = true })
      vim.keymap.set('n', '<leader>ni', pi.install, { desc = 'Install new package', silent = true })
      vim.keymap.set('n', '<leader>nc', pi.change_version, { desc = 'Change package version', silent = true })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup {
        preset = 'modern',
      }
      vim.diagnostic.config { virtual_text = false }
    end,
  },
}
