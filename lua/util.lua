-- [nfnl] fnl/util.fnl
local function print_active_lsp_clients()
  for _, client in ipairs(vim.lsp.get_clients()) do
    print(client.name)
  end
  return nil
end
return {["print-active-lsp-clients"] = print_active_lsp_clients}
