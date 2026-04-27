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
  if not (_G.vim.g.disable_autoformat or _G.vim.b[bufnr].disable_autoformat) then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
return {{"stevearc/oil.nvim", keys = {{"-", "<cmd>Oil<CR>", keymap_opts}}, opts = {view_options = {show_hidden = true}, win_options = {signcolumn = "yes:2"}}}, {"refractalize/oil-git-status.nvim", dependencies = {{"stevearc/oil.nvim"}}, opts = {show_ignored = true}}, {"JezerM/oil-lsp-diagnostics.nvim", dependencies = {{"stevearc/oil.nvim"}}}, {"otavioschwanck/arrow.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}, opts = {show_icons = true, leader_key = "<leader>p", buffer_leader_key = "<leader>P"}}, {"stevearc/quicker.nvim", keys = {{"<leader>q", quicker("toggle"), keymap_opts}, {"<leader>cq", "<cmd>call setqflist([])<cr>", keymap_opts}, {"<C-k>", "<cmd>cprev<CR>zz", keymap_opts}, {"<C-j>", "<cmd>cnext<CR>zz", keymap_opts}}, opts = {}}, {"stevearc/conform.nvim", opts = {formatters_by_ft = {lua = {"stylua"}, javascript = {"prettierd"}, javascriptreact = {"prettierd"}, typescript = {"prettierd"}, typescriptreact = {"prettierd"}, rust = {"rustfmt", "lsp_format", "fallback"}, clojure = {"cljstyle"}, clj = {"cljstyle"}, cljs = {"cljstyle"}, cljc = {"cljstyle"}, edn = {"cljstyle"}, fennel = {"fnlfmt"}}, format_on_save = _4_, formatters = {zprint = {map = {["comma?"] = false}}}}}, {"ibhagwan/fzf-lua", keys = {{"<leader>ff", fzf("files"), keymap_opts}, {"<leader>fg", fzf("live_grep"), keymap_opts}, {"<leader>fG", fzf("live_grep_resume"), keymap_opts}, {"<leader>f*", fzf("grep_cword"), "mode", {"n", "v"}, keymap_opts}, {"<leader>gs", fzf("git_status"), keymap_opts}, {"<leader>gB", fzf("git_bcommits"), keymap_opts}, {"<leader>gC", fzf("git_commits"), keymap_opts}, {"<leader>fv", fzf("grep_visual"), "mode", {"n", "v"}, keymap_opts}, {"<leader>bb", fzf("buffers"), keymap_opts}, {"<leader>Q", fzf("quickfix"), keymap_opts}, {"<leader>dW", fzf("diagnostics_workspace"), keymap_opts}, {"<leader>dD", fzf("diagnostics_document"), keymap_opts}, {"<leader>ga", "<cmd>Git add %<cr>", keymap_opts}, {"<leader>gc", "<cmd>Git commit<cr>", keymap_opts}, {"<leader>gl", "<cmd>Git log<cr>", keymap_opts}, {"<leader>gid", "<cmd>Git diff<cr>", keymap_opts}}, opts = {ui_select = true, keymap = {fzf = {["ctrl-q"] = "select-all+accept"}}, winopts = {fullscreen = true, preview = {border = "none", vertical = "down:50%", layout = "vertical"}}}}, {"jinh0/eyeliner.nvim", opts = {highlight_on_key = true, dim = true, disabled_filetypes = {"orgagenda"}}}, {"kylechui/nvim-surround"}, {"nvim-orgmode/orgmode", keys = {{"<leader>ot", ":lua Org.capture.t()<cr>", keymap_opts}}, opts = {org_agenda_files = "~/development/notes/orgfiles/**/*", org_default_notes_file = "~/development/notes/orgfiles/refile.org"}}, {"folke/todo-comments.nvim"}}
