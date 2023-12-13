local M = {
  "jake-stewart/jfind.nvim",
  branch = "2.0"
}

function M.config()
  local jfind = require("jfind")
  local key = require("jfind.key")

  local opts = { noremap = true, silent = true }
  jfind.setup({
    exclude = {
      ".git",
      ".idea",
      ".vscode",
      ".sass-cache",
      ".class",
      "__pycache__",
      "node_modules",
      "target",
      "build",
      "tmp",
      "assets",
      "dist",
      "tests",
      "*.iml",
      "*.meta"
    },
    windowBorder = true,
    maxWidth = 400,
    maxHeight = 400,
    -- tmux = true,
  })

  vim.keymap.set("n", "<leader>ff", function()
    jfind.findFile({
      preview = true,
      caseSensitivity = "smart",
      previewPosition = "top"
    })
  end, opts)

  vim.keymap.set("n", "<leader>fg", function()
    jfind.liveGrep({
      hidden = true,             -- grep hidden files/directories
      caseSensitivity = "smart", -- sensitive, insensitive, smart
      --     will use vim settings by default
      preview = true,
      previewPosition = "top",
      callback = {
        [key.DEFAULT] = jfind.editGotoLine,
        [key.CTRL_B] = jfind.splitGotoLine,
        [key.CTRL_N] = jfind.vsplitGotoLine,
      }
    })
  end)
end

return M
