local M = {
  "nvim-treesitter/nvim-treesitter"
}

function M.config()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    autotag = { enable = true }
  })
end

return M