local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "bash",
    "bibtex",
    "cmake",
    "cpp",
    "css",
    "cuda",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "glsl",
    "html",
    "ini",
    "json",
    "json5",
    "latex",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "meson",
    "ninja",
    "python",
    "rasi",
    "regex",
    "rst",
    "rust",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    -- low level
    "c",
  },
  indent = {
    enable = true,
  },
}

-- mason to install the binaries, null-ls for actually using 'formatters', lspconfig for usings lsp diags, use checkhealth to see which null-ls stuff doesnt work
-- https://mason-registry.dev/registry/list
M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "clangd",
    "clang-format",
    "pyright",
    "black",
    "docformatter",
    "latexindent",
    "json-lsp",
    "prettierd",
    "texlab",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extensions_list = { "yank_history" },
}
return M
