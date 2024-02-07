local opamshare = vim.fn.trim(vim.fn.system('opam var share'))
local merlin_path = "/merlin/vim"

if vim.fn.executable('opam') == 1 then
  if vim.fn.isdirectory(opamshare .. merlin_path) == 1 then
    vim.o.runtimepath = vim.o.runtimepath .. opamshare .. merlin_path
  end
end
