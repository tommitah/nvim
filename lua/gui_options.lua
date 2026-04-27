-- [nfnl] fnl/gui_options.fnl
if _G.vim.g.neovide then
  _G.vim.o.guifont = "ZedMono Nerd Font Mono:h28"
  _G.vim.g.neovide_window_blurred = true
  _G.vim.g.neovide_opacity = 0.7
  _G.vim.g.neovide_normal_opacity = 0.7
  _G.vim.g.neovide_hide_mouse_when_typing = true
  _G.vim.g.experimental_layer_grouping = true
  return nil
else
  return nil
end
