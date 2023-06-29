local neotest = require("neotest")

local opts = {}

neotest.setup({
    adapters = {
        require("neotest-jest"),
        require("neotest-plenary"),
    },
})
