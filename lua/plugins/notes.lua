-- [nfnl] fnl/plugins/notes.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local fzf = autoload("fzf-lua")
local root_path = "~/development/notes/work_wiki"
local function wiki_root(path)
  return (vim.b.ultimate_wiki_root or vim.fn.expand(path))
end
local function _2_()
  local function _3_()
    return {cwd = wiki_root(root_path)}
  end
  return fzf.files(_3_)
end
local function _4_()
  local function _5_()
    return {cwd = wiki_root(root_path)}
  end
  return fzf.live_grep(_5_)
end
return {{"echaya/neowiki.nvim", dependencies = {{"tpope/vim-repeat"}, {"ibhagwan/fzf-lua"}}, keys = {{"<leader>ww", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>"}, {"<leader>wf", _2_}, {"<leader>wg", _4_}}, opts = {wiki_dirs = {{name = "work_dev", path = root_path}}}}}
