local util = require("config.util")

-- TODO consider adding Harpoon later
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
    },
    config = function(_, opts)
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup(opts)
    end,
    keys = {
      {
        "<leader>e",
        function()
          local root_dir = util.find_project_root()
          require("neo-tree.command").execute({ toggle = true, dir = root_dir, reveal_file = vim.fn.expand("%:p") })
        end,
        desc = "Explorer NeoTree (Root)",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    -- event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "auto",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "neo-tree", "aerial" },
          ignore_focus = { "neo-tree", "aerial" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = {
            { "diagnostics", sources = { "nvim_lsp" } },
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>f",
        function()
          require("fzf-lua").files({ cwd = util.find_project_root() })
        end,
        desc = "Find files in root dir",
      },
      {
        "<leader>g",
        function()
          require("fzf-lua").live_grep({ cwd = util.find_project_root() })
        end,
        desc = "Grep in root dir",
      },
      {
        "<leader>b",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Fzf the buffers",
      },
    },
  },
  {
    -- clipboard
    "gbprod/yanky.nvim",
    opts = {
      highlight = {
        timer = 200,
      },
    },
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "<c-n>", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "<c-p>", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    },
  },
  {
    -- code outline window
    "stevearc/aerial.nvim",
    opts = { layout = { placement = "edge" } },
    ignore = { filetypes = { "neo-tree" } },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    main = "ibl",
    opts = function()
      return {
        exclude = {
          filetypes = { "dashboard" },
        },
      }
    end,
  },
  {
    "echasnovski/mini.comment",
    opts = {},
    event = { "VeryLazy" },
  },
  { "echasnovski/mini.pairs", opts = {}, event = { "VeryLazy" } },
  { "echasnovski/mini.cursorword", opts = {}, event = { "VeryLazy" } },
  {
    "echasnovski/mini.bufremove",
    opts = {},
    keys = {
      {
        "<leader>db",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete current buffer",
      },
      {
        "<leader>Db",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Force delete current buffer",
      },
    },
  },
  -- TODO: mini.pick might be useful later
  {
    "smjonas/inc-rename.nvim",
    opts = {},
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        mode = "n",
        desc = "Rename symbol under cursor",
      },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" }, -- Normal and visual modes
        desc = "Search and Replace",
      },
    },
  },
  {
    "shrynx/line-numbers.nvim",
    opts = {
      mode = "relative", -- Use LineNumberBoth or Toggle to switch around
      format = "abs_rel",
      separator = " ",
    },
  },
}
