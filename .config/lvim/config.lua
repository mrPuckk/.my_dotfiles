-- ██╗    ██╗   ██╗██╗███╗   ███╗
-- ██║    ██║   ██║██║████╗ ████║
-- ██║    ██║   ██║██║██╔████╔██║
-- ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
-- ███████╗╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

-------------------------
--------- RELOAD ----------
----------------------------
reload('user.keymaps')
reload('user.options')

reload('user.alpha')
reload('user.notify')
reload('user.treesitter')

reload('user.cmp')
reload('user.lsp')
reload('user.lspsaga')

reload('user.linters')
reload('user.formatters')

----------------------------
--------- PLUGINS  ---------
----------------------------
lvim.plugins = {
  --
  {"folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  --
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  -- --
  {
    "simrat39/rust-tools.nvim",
  },
  -- --
  -- {"zbirenbaum/copilot.lua",
  -- cmd = "Copilot",
  -- event = "InsertEnter",
  -- config = function()
  --   require("copilot").setup({
  --     suggestion = { enabled = false, auto_trigger = true},
  --     panel = { enabled = false, auto_refresh = true},
  --     filetypes = { cpp = true }
  --   })
  --   end,
  -- },

  --
  -- {"zbirenbaum/copilot-cmp",
  -- after = { "copilot.lua" },
  -- config = function ()
  --     require("copilot_cmp").setup({
  --     method = "getCompletionsCycling",
  --     })
  --   end
  -- },

  --
  {'onsails/lspkind.nvim'},

  --
  {'rcarriga/nvim-notify'},

  --
  -- {
  --   "jackMort/ChatGPT.nvim",
  --     config = function()
  --       require("chatgpt").setup({
  --         -- optional configuration
  --       })
  --     end,
  --     requires = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "nvim-telescope/telescope.nvim"
  --     }
  -- },
  -----------------------------
  {
    "lmburns/lf.nvim",
    cmd = "Lf",
    dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
    opts = {
      winblend = 0,
      highlights = { NormalFloat = { guibg = "NONE" } },
      border = "single",
      escape_quit = true,
    },
    keys = {
      { "<leader>vf", "<cmd>Lf<cr>", desc = "NeoTree" },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, "ThePrimeagen/harpoon" },
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require("telescope")
      -- telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("notify")
      telescope.load_extension("harpoon")
    end,
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        layout_config = {
          preview_width = 0.6,
          prompt_position = "top",
        },
        path_display = { "smart" },
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
      },
      pickers = {
        buffers = {
          prompt_prefix = "﬘ ",
        },
        commands = {
          prompt_prefix = " ",
        },
        git_files = {
          prompt_prefix = " ",
          show_untracked = true,
        },
        find_files = {
          prompt_prefix = " ",
          find_command = { "rg", "--files", "--hidden" },
        },
      },
    },
    keys = function()
      return {}
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
        {"nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"}
    }
  },
}


