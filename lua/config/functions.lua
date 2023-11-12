local M = {}

LAZY_PLUGIN_SPEC = {}
function spec(item)
    table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

function M.stringInTbl(str, tbl)
  for i = 1, #tbl do
    if tbl[i] == str then
      return true
    end
  end
  return false
end

return M
