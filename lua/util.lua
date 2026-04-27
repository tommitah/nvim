-- [nfnl] fnl/util.fnl
local function print_active_lsp_clients()
  for _, client in ipairs(_G.vim.lsp.get_clients()) do
    print(client.name)
  end
  return nil
end
print_active_lsp_clients()
return {["print-active-lsp-clients"] = print_active_lsp_clients}
