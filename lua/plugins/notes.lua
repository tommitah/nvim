-- [nfnl] fnl/plugins/notes.fnl
local function fzf(method, opts)
  local function _1_()
    return require("fzf-lua")[method](opts())
  end
  return _1_
end
local root_path = "~/development/notes/work_wiki"
local function wiki_root(path)
  return (vim.b.ultimate_wiki_root or vim.fn.expand(path))
end
local function _2_()
  return {cwd = wiki_root(root_path)}
end
local function _3_()
  return {cwd = wiki_root(root_path)}
end
return {{"echaya/neowiki.nvim", dependencies = {{"tpope/vim-repeat"}, {"ibhagwan/fzf-lua"}}, keys = {{"<leader>ww", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>"}, {"<leader>wf", fzf("files", _2_)}, {"<leader>wg", fzf("live_grep", _3_)}}, opts = {wiki_dirs = {{name = "work_dev", path = root_path}}}}}
