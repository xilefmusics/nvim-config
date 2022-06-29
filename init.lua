-- TODO
-- multiline
-- [x] cmp
-- [x] comments
-- [x] builds
-- [x] autopairs
-- [x] surround
-- test diff
-- kubectl integration
-- multiple terminals
-- autoformatting
-- hadolint
-- shellcheck
-- splits, buffers, windows
-- lsp
-- treesitter

require "user.helper"
require "user.build"
require "user.lsp"
require "user.cmp"
require "user.lualine"
require "user.gitsigns"
require "user.terminal"
require "user.keys"
require "user.comment"
require "user.plugins"
require "user.autopairs"

-- split
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

-- search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.hlsearch = false -- highlight all matches on previous search pattern
vim.opt.incsearch = true -- highlight all matches on previous search pattern

-- files
vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile

-- clipboard
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- colors
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

-- linenumbers
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines

-- tabs and spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab

