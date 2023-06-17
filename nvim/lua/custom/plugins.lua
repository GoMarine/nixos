local plugins = {
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "gopls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },

  
  {
    "mfussenegger/nvim-dap",
    -- init = function()
    --   require("core.utils").load_mappings("dap")
    -- end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
--       require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- {
  --   'saecki/crates.nvim',
  --   ft = {"rust", "toml"},
  --   config = function(_, opts)
  --     local crates  = require('crates')
  --     crates.setup(opts)
  --     require('cmp').setup.buffer({
  --       sources = { { name = "crates" }}
  --     })
  --     crates.show()
  --     require("core.utils").load_mappings("crates")
  --   end,
  -- },

  
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local M = require "plugins.configs.cmp"
  --     M.completion.completeopt = "menu,menuone,noselect"
  --     M.mapping["<CR>"] = cmp.mapping.confirm {
  --       behavior = cmp.ConfirmBehavior.Insert,
  --       select = false,
  --     }
  --     table.insert(M.sources, {name = "crates"})
  --     return M
  --   end,
  -- },

}
return plugins
