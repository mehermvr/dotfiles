return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onSave",
            outputPath = "$root/target/$dir/$name",
            semanticTokens = "disable",
          },
        },
      },
    },
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    opts = {
      debug = true,
      open_cmd = "NO_AT_BRIDGE=1 firefox %s",
      dependencies_bin = {
        ["tinymist"] = "tinymist",
      },
    },
    keys = {
      -- mapping stuff from typst-preview's docs
      { "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Start Typst Preview" },
      { "<leader>ts", "<cmd>TypstPreviewStop<cr>", desc = "Stop Typst Preview" },
      { "<leader>tt", "<cmd>TypstPreviewToggle<cr>", desc = "Toggle Typst Preview" },
      { "<leader>tf", "<cmd>TypstPreviewFollowCursor<cr>", desc = "Follow Cursor in Typst Preview" },
      { "<leader>tn", "<cmd>TypstPreviewNoFollowCursor<cr>", desc = "No Follow Cursor in Typst Preview" },
      { "<leader>tc", "<cmd>TypstPreviewSyncCursor<cr>", desc = "Sync Cursor in Typst Preview" },
      -- open the file in zathura
      {
        "<leader>to",
        function()
          local filepath = vim.api.nvim_buf_get_name(0)
          if filepath:match("%.typ$") then
            vim.fn.jobstart("zathura " .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf")))
          end
        end,
        desc = "Open PDF in Zathura",
      },
    },
  },
}
