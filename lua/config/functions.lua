local M = {}

function M.stringInTbl(str, tbl)
  for i = 1, #tbl do
    if tbl[i] == str then
      return true
    end
  end
  return false
end

return M
