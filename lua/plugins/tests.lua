-- [nfnl] fnl/plugins/tests.fnl
return {{"nvim-neotest/neotest", dependencies = {{"nvim-neotest/nvim-nio"}, {"antoinemadec/FixCursorHold.nvim"}, {"adrigzr/neotest-mocha"}, {"marilari88/neotest-vitest"}}, opts = {adapters = {["neotest-vitest"] = {}, ["neotest-mocha"] = {command = "npm test --"}}}}}
