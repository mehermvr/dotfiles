local Util = require("external.lazyvim_util")
-- fuzzy finder
return {
  {
    "nvim-telescope/telescope.nvim",
    commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>fw", Util.telescope("live_grep"), desc = "fzf: Grep (root dir)" },
      { "<leader>fW", Util.telescope("live_grep", { cwd = vim.loop.cwd() }), desc = "fzf: Grep (cwd)" },
      { "<leader>ff", Util.telescope("files"), desc = "fzf: Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files", { cwd = vim.loop.cwd() }), desc = "fzf: Find Files (cwd)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Telescope: Command History" },
      { "<leader><space>", Util.telescope("files"), desc = "fzf: Find Files (root dir)" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope: Buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Telescope: Recent" },
      { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Telescope: Recent (cwd)" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Telescope: git commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Telescope: git status" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Telescope: Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Telescope: Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "fzf: Search current buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Telescope: Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "fzf: Search commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics: Telescope document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics: Telescope workspace diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help: Telescope help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Telescope: Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Telescope: Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Telescope: Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Telescop: Vim options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Telescope: Resume" },
      {
        "<leader>sw",
        Util.telescope("grep_string", { word_match = "-w" }),
        desc = "fzf: Search current word (root dir)",
      },
      {
        "<leader>sW",
        Util.telescope("grep_string", { cwd = false, word_match = "-w" }),
        desc = "fzf: Search current word (cwd)",
      },
      { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "fzf: Search selection (root dir)" },
      {
        "<leader>sW",
        Util.telescope("grep_string", { cwd = false }),
        mode = "v",
        desc = "fzf: Search selection (cwd)",
      },
      {
        "<leader>th",
        Util.telescope("colorscheme", { enable_preview = true }),
        desc = "Telescope: Colorscheme, theme, with preview",
      },
      {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "lsp: Goto Symbol",
      },
      {
        "<leader>sS",
        Util.telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "lsp: Goto Symbol (Workspace)",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              local action_state = require("telescope.actions.state")
              local line = action_state.get_current_line()
              Util.telescope("find_files", { no_ignore = true, default_text = line })()
            end,
            ["<a-h>"] = function()
              local action_state = require("telescope.actions.state")
              local line = action_state.get_current_line()
              Util.telescope("find_files", { hidden = true, default_text = line })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
}
