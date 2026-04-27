-- [nfnl] fnl/plugins/mini_plugs.fnl
local function _1_()
  return require("mini.git"):setup()
end
local function _2_()
  return require("mini.pairs"):setup()
end
local function _3_()
  return require("mini.diff"):setup()
end
local function _4_()
  return require("mini.cmdline"):setup()
end
return {{"nvim-mini/mini-git", config = _1_}, {"nvim-mini/mini.pairs", config = _2_}, {"nvim-mini/mini.diff", config = _3_}, {"nvim-mini/mini.cmdline", config = _4_}}
