vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.conceallevel = 0
opt.number = true
opt.relativenumber = true
-- Indentation and Tab Settings
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
opt.smartindent = true -- Do smart autoindenting when starting a new line
-- Search Improvements
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override ignorecase if search pattern contains upper case characters
opt.hlsearch = true -- Highlight all matches on previous search pattern
opt.incsearch = true -- Show where the pattern matches as it is typed
-- User Interface Enhancements
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
opt.cursorline = true -- Highlight the text line of the cursor
opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
opt.splitbelow = true -- Force all horizontal splits to go below current window
opt.splitright = true -- Force all vertical splits to go to the right of current window
-- Performance and Usability
opt.hidden = true -- Enable modified buffers in background
opt.updatetime = 400 -- Faster completion (4000ms default)
opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.mouse = "a" -- Enable mouse support
-- File Handling
opt.swapfile = false -- Creates a swapfile
opt.backup = false -- Creates a backup file
opt.undofile = true -- Enable persistent undo
