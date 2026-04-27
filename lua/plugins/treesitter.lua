-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local function _2_()
    local function _3_()
      return _G.vim.treesitter.start()
    end
    return pcall(_3_)
  end
  return _G.vim.schedule(_2_)
end
_G.vim.api.nvim_create_autocmd("FileType", {pattern = {"*"}, callback = _1_})
local function _4_()
  local ts = require("nvim-treesitter")
  local languages = {"rust", "vimdoc", "lua", "json", "markdown", "markdown_inline", "javascript", "typescript", "tsx", "html", "yaml", "clojure", "java", "fennel"}
  return ts.install(languages)
end
return {{"nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", config = _4_, main = "nvim-treesitter.configs"}, {"windwp/nvim-ts-autotag"}}
