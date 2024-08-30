return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>bn"] = { "<cmd>enew<cr>", desc = "New buffer" },
          ["<Leader>bd"] = { "<cmd>bd<cr>", desc = "Close buffer" },
        },
        t = {
          ["<C-h>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" },
          ["<C-j>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" },
          ["<C-k>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" },
          ["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {},
      },
    },
  },
}
