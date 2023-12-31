require("pasha.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/neodev.nvim",
  "tpope/vim-fugitive",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-commentary",
  "tpope/vim-sleuth",
  {
    "windwp/nvim-autopairs",

    event = "InsertEnter",
    opts = {}
  },

  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { import = "pasha.plugins" },
})

require("pasha.remap.nvim-tree")
require("pasha.remap.telescope")
require("pasha.remap.lsp")
require("pasha.remap.navigation")
require("pasha.set")

-- open netrw if no file was provided
if #vim.v.argv < 3 then
  vim.cmd("Ex")
end

require("pasha.config.lsp")
