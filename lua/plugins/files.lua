-- [nfnl] fnl/plugins/files.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
local function fzf(method)
  local function _2_()
    return require("fzf-lua")[method]()
  end
  return _2_
end
local function quicker(method)
  local function _3_()
    return require("quicker")[method]()
  end
  return _3_
end
local function _4_(bufnr)
  if not (vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat) then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
local function _6_()
  return require("todo-comments"):setup()
end
return {{"stevearc/oil.nvim", keys = {{"-", "<cmd>Oil<CR>", keymap_opts}}, lazy = false, opts = {["default-file-explorer"] = true, view_options = {show_hidden = true}, win_options = {signcolumn = "yes:2"}}}, {"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {{"nvim-lua/plenary.nvim"}, {"MunifTanjim/nui.nvim"}}, lazy = false, opts = {filesystem = {follow_current_file = {enabled = true, leave_dirs_open = true}, window = {width = 55}}}}, {"otavioschwanck/arrow.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}, opts = {show_icons = true, leader_key = "<leader>p", buffer_leader_key = "<leader>P"}}, {"stevearc/quicker.nvim", keys = {{"<leader>q", quicker("toggle"), keymap_opts}, {"<leader>cq", "<cmd>call setqflist([])<cr>", keymap_opts}, {"<C-k>", "<cmd>cprev<CR>zz", keymap_opts}, {"<C-j>", "<cmd>cnext<CR>zz", keymap_opts}}, opts = {}}, {"stevearc/conform.nvim", opts = {formatters_by_ft = {lua = {"stylua"}, javascript = {"prettierd"}, javascriptreact = {"prettierd"}, typescript = {"prettierd"}, typescriptreact = {"prettierd"}, rust = {"rustfmt", "lsp_format", "fallback"}, clojure = {"zprint"}, clj = {"zprint"}, cljs = {"zprint"}, cljc = {"zprint"}, edn = {"zprint"}, fennel = {"fnlfmt"}, xml = {"xmlstarlet"}}, format_on_save = _4_, formatters = {zprint = {map = {["comma?"] = false}}}}}, {"ibhagwan/fzf-lua", cmd = "FzfLua", keys = {{"<leader>ff", fzf("files"), keymap_opts}, {"<leader>fg", fzf("live_grep"), keymap_opts}, {"<leader>fG", fzf("live_grep_resume"), keymap_opts}, {"<leader>f*", fzf("grep_cword"), "mode", {"n", "v"}, keymap_opts}, {"<leader>gs", fzf("git_status"), keymap_opts}, {"<leader>gB", fzf("git_bcommits"), keymap_opts}, {"<leader>gC", fzf("git_commits"), keymap_opts}, {"<leader>fv", fzf("grep_visual"), "mode", {"n", "v"}, keymap_opts}, {"<leader>bb", fzf("buffers"), keymap_opts}, {"<leader>Q", fzf("quickfix"), keymap_opts}, {"<leader>dW", fzf("diagnostics_workspace"), keymap_opts}, {"<leader>dD", fzf("diagnostics_document"), keymap_opts}, {"<leader>ga", "<cmd>Git add %<cr>", keymap_opts}, {"<leader>gc", "<cmd>Git commit<cr>", keymap_opts}, {"<leader>gl", "<cmd>Git log<cr>", keymap_opts}, {"<leader>gid", "<cmd>Git diff<cr>", keymap_opts}}, opts = {keymap = {fzf = {["ctrl-q"] = "select-all+accept"}}, winopts = {fullscreen = true, preview = {border = "none", vertical = "down:50%", layout = "vertical"}}}}, {"jinh0/eyeliner.nvim", opts = {highlight_on_key = true, dim = true, disabled_filetypes = {"orgagenda"}}}, {"kylechui/nvim-surround"}, {"folke/todo-comments.nvim", config = _6_, dependencies = {{"nvim-lua/plenary.nvim"}}}}
