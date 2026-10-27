-- [nfnl] fnl/plugins/files.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
local _local_2_ = require("nfnl.module")
local autoload = _local_2_.autoload
local fzf = autoload("fzf-lua")
local quicker = autoload("quicker")
local function oil_select_right()
  local oil_preview_ratio = 0.7
  local function _3_(err)
    if not err then
      return vim.api.nvim_win_set_width(0, math.floor((vim.o.columns * oil_preview_ratio)))
    else
      return nil
    end
  end
  return require("oil").select({vertical = true, split = "belowright"}, _3_)
end
local function _5_()
  return quicker.toggle()
end
local function _6_(bufnr)
  if not (vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat) then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
local function _8_()
  return fzf.files()
end
local function _9_()
  return fzf.live_grep()
end
local function _10_()
  return fzf.live_grep_resume()
end
local function _11_()
  return fzf.grep_cword()
end
local function _12_()
  return fzf.git_status()
end
local function _13_()
  return fzf.git_bcommits()
end
local function _14_()
  return fzf.git_commits()
end
local function _15_()
  return fzf.grep_visual()
end
local function _16_()
  return fzf.buffers()
end
local function _17_()
  return fzf.quickfix()
end
local function _18_()
  return fzf.diagnostics_workspace()
end
local function _19_()
  return fzf.diagnostics_document()
end
local function _20_()
  return require("todo-comments").setup()
end
return {{"stevearc/oil.nvim", keys = {{"-", "<cmd>Oil<CR>", keymap_opts}}, lazy = false, opts = {["default-file-explorer"] = true, view_options = {show_hidden = true}, win_options = {signcolumn = "yes:2"}, keymaps = {["<C-s>"] = {callback = oil_select_right, desc = "Open in right split (30/70)"}}}}, {"otavioschwanck/arrow.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}, opts = {show_icons = true, leader_key = "<leader>p", buffer_leader_key = "<leader>P"}}, {"stevearc/quicker.nvim", keys = {{"<leader>q", _5_, keymap_opts}, {"<leader>cq", "<cmd>call setqflist([])<cr>", keymap_opts}, {"<C-k>", "<cmd>cprev<CR>zz", keymap_opts}, {"<C-j>", "<cmd>cnext<CR>zz", keymap_opts}}, opts = {}}, {"stevearc/conform.nvim", opts = {formatters_by_ft = {lua = {"stylua"}, javascript = {"prettierd"}, javascriptreact = {"prettierd"}, typescript = {"prettierd"}, typescriptreact = {"prettierd"}, rust = {"rustfmt", "lsp_format", "fallback"}, clojure = {"zprint"}, clj = {"zprint"}, cljs = {"zprint"}, cljc = {"zprint"}, edn = {"zprint"}, fennel = {"fnlfmt"}, xml = {"xmlstarlet"}}, format_on_save = _6_, formatters = {zprint = {map = {["comma?"] = false}}}}}, {"ibhagwan/fzf-lua", cmd = "FzfLua", keys = {{"<leader>ff", _8_, keymap_opts}, {"<leader>fg", _9_, keymap_opts}, {"<leader>fG", _10_, keymap_opts}, {"<leader>f*", _11_, "mode", {"n", "v"}, keymap_opts}, {"<leader>gs", _12_, keymap_opts}, {"<leader>gB", _13_, keymap_opts}, {"<leader>gC", _14_, keymap_opts}, {"<leader>fv", _15_, "mode", {"n", "v"}, keymap_opts}, {"<leader>bb", _16_, keymap_opts}, {"<leader>Q", _17_, keymap_opts}, {"<leader>dW", _18_, keymap_opts}, {"<leader>dD", _19_, keymap_opts}, {"<leader>ga", "<cmd>Git add %<cr>", keymap_opts}, {"<leader>gc", "<cmd>Git commit<cr>", keymap_opts}, {"<leader>gl", "<cmd>Git log<cr>", keymap_opts}, {"<leader>gid", "<cmd>Git diff<cr>", keymap_opts}}, opts = {keymap = {fzf = {["ctrl-q"] = "select-all+accept"}}, winopts = {fullscreen = true, preview = {border = "none", vertical = "down:50%", layout = "vertical"}}}}, {"jinh0/eyeliner.nvim", opts = {highlight_on_key = true, dim = true, disabled_filetypes = {"orgagenda"}}}, {"kylechui/nvim-surround"}, {"folke/todo-comments.nvim", config = _20_, dependencies = {{"nvim-lua/plenary.nvim"}}}}
