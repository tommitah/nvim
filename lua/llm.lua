local add, now = MiniDeps.add, MiniDeps.now

local plugs = {
  {
    source = 'yetone/avante.nvim',
    monitor = 'main',
    depends = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "ibhagwan/fzf-lua",
      "echasnovski/mini.icons"
    },
    hooks = {
      post_checkout = function()
        vim.cmd('make')
      end
    }
  },
}

for _, plug in ipairs(plugs) do
  add(plug)
end
