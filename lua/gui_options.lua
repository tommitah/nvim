-- [nfnl] fnl/gui_options.fnl
if vim.g.neovide then
  vim.o.guifont = "ZedMono Nerd Font Mono:h28"
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.7
  vim.g.neovide_normal_opacity = 0.7
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.experimental_layer_grouping = true
  return nil
else
  return nil
end
