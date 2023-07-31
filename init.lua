require("settings")
require("plugins")
require("keymaps")
require("colorscheme")

-- Some of the plugins are orchids and won't accept the 'config' prop
require("plugins.express_line")
-- require("plugins.noice")

-- This one just hates being loaded before the colorscheme, so maybe make sure that 
-- you run it last
-- require("plugins.indent")
