vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- vim.keymap.set({'n', 'x'}, 'cp', '"+y')
-- vim.keymap.set({'n', 'x'}, 'cv', '"+p')

vim.g.mapleader = ' '

-- 
-- setup lazy.nvim
--
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	lazy.install(lazy.path)
	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	{'ellisonleao/gruvbox.nvim', lazy = false, priority = 1000 },
	{'nvim-lualine/lualine.nvim'},
	{'nvim-tree/nvim-web-devicons'},
	{'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons'},
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	{'nvim-treesitter/nvim-treesitter-textobjects', dependencies= 'nvim-treesitter/nvim-treesitter'},
	{'wellle/targets.vim'},
	{'numToStr/Comment.nvim'},
	{'lukas-reineke/indent-blankline.nvim'},
	{'tpope/vim-surround'},
	{'kyazdani42/nvim-tree.lua'},
	{'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim'},
	{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'},
	{'lewis6991/gitsigns.nvim'},
	{ 'tpope/vim-repeat' },
	{ 'neovim/nvim-lspconfig' },
	-- temporary fix until we figure out lsp semantic tokens
	{ 'm-demare/hlargs.nvim' },
})

vim.opt.termguicolors = true
vim.o.background = 'dark' -- or "light" for light mode
vim.cmd.colorscheme('gruvbox')
vim.opt.showmode = false
-- most of this follows https://vonheikemen.github.io/devlog/tools/neovim-plugins-to-get-started/, need to read the docs myself
require('lualine').setup({
	options = {
		theme = 'gruvbox',
		icons_enabled = 'true',
		disabled_filetypes = {
			statusline = {'NvimTree'}
		}
	}
})
require('bufferline').setup({
	options = {
		mode = 'buffers',
		offsets = {
			{filetype = 'NvimTree'}
		},
	},
	highlights = {
		indicator_selected = {
			fg = {attribute = 'fg', highlight = 'Function'},
		}
	}
})

require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			}
		},
	},
	ensure_installed = {
		'bash',
		'bibtex',
		'c',
		'cmake',
		'cpp',
		'css',
		'cuda',
		'dockerfile',
		'git_config',
		'git_rebase',
		'gitattributes',
		'gitcommit',
		'gitignore',
		'glsl',
		'html',
		'ini',
		'json',
		'json5',
		'latex',
		'lua',
		'luadoc',
		'make',
		'markdown',
		'markdown_inline',
		'meson',
		'ninja',
		'python',
		'rasi',
		'regex',
		'rst',
		'rust',
		'toml',
		'vim',
		'vimdoc',
		'yaml',
	},
})
require('indent_blankline').setup({
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	-- use_treesitter = true,
	show_current_context = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
	}
})

require('Comment').setup({})
require('nvim-tree').setup({
})
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

require('telescope').load_extension('fzf')
require('gitsigns').setup()
-- temporary until LSP semantic tokens
require('hlargs').setup()
