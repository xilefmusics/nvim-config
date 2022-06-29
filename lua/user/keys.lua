local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- map leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<Space>", "<Nop>", opts)

-- move mappings
keymap("n", "gb", "<C-o>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

vim.keymap.set('v', 'cc', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
vim.keymap.set('v', 'cb', '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')
vim.keymap.set('x', 'cc', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
vim.keymap.set('x', 'cb', '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>')

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.api.nvim_echo({ { "which-key failed to load", "None" } }, false, {})
  return
end

local opts2 = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files theme=ivy<cr>", "File" },
    t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Text" },
  },
  g = {
    name = "Git",
    g = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
    c = { "<cmd>Telescope git_commits theme=ivy<cr>", "Commits" },
    b = { "<cmd>Telescope git_branches theme=ivy<cr>", "Branches" },
    f = { "<cmd>Telescope git_files theme=ivy<cr>", "Files" },
    s = { "<cmd>Telescope git_status theme=ivy<cr>", "Status" },
    S = { "<cmd>Telescope git_stash theme=ivy<cr>", "Stash" },
    B = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
    h = { "<cmd>Gitsigns toggle_linehl<cr>", "Highlight" },
    t = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle Signs" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff Buffer" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
    n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
    p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk" },
    P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
    y = { "<cmd>Gitsigns select_hunk<cr>", "Select Hunk" },
    a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  c = {
    name = "Comment",
    c = { '<cmd>lua require("Comment.api").toggle_current_linewise()<cr>', "Toogle Line" },
    C = { '<cmd>lua require("Comment.api").call("toggle_linewise_op")<cr>g@', "Toogle Lines" },
    b = { '<cmd>lua require("Comment.api").toggle_current_blockwise()<cr>', "Toogle Block" },
    B = { '<cmd>lua require("Comment.api").call("toggle_blockwise_op")<cr>g@', "Toogle Blocks" },
  },
  b = {
    name = "Build",
    b = { '<cmd>lua Build()<cr>', "Build" },
    t = { '<cmd>lua ToggleBuild()<cr>', "Toggle Build" },
    B = { '<cmd>lua ComplexBuild()<cr>', "Complex Build" },
    T = { '<cmd>lua ToggleComplexBuild()<cr>', "Toggle Complex Build" },
  },
}

which_key.setup()
which_key.register(mappings, opts2)
