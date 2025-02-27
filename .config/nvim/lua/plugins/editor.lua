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
    keys = {
      {
        "<leader>e",
        function()
          local root_dir = util.find_project_root()
          require("neo-tree.command").execute({ toggle = true, dir = root_dir })
        end,
        desc = "Explorer NeoTree (Root)",
      },
    },
    config = function()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        -- neotree has way too much fucking default config and mappings. im not bothering with all that
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
      })
    end,
  },
  {
    -- TODO: for some reason this thing fails when i open a file after doing 'vim' and then file
    "akinsho/bufferline.nvim",
    event = { "VeryLazy" },
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "buffers",
        show_close_icon = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
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
        "<leader>ff",
        function()
          require("fzf-lua").files({ cwd = util.find_project_root() })
        end,
        desc = "Find files in root dir",
      },
      {
        "<leader>fg",
        function()
          require("fzf-lua").live_grep({ cwd = util.find_project_root() })
        end,
        desc = "Grep in root dir",
      },
      {
        "<leader>fb",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Fzf the buffers",
      },
    },
  },
  {
    -- TODO: this thing is deprecated, but there is no easier way to delete buffers
    "famiu/bufdelete.nvim",
    keys = {
      {
        "<leader>bd",
        function()
          require("bufdelete").bufdelete(0)
        end,
        desc = "Delete current buffer",
      },
      {
        "<leader>bD",
        function()
          require("bufdelete").bufdelete(0, true)
        end,
        desc = "Force delete current buffer",
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
}
