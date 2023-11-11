local M = {
    "kevinhwang91/rnvimr"
}

function M.config()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "-", "<cmd>RnvimrToggle<cr>", opts)
    vim.cmd[[
       let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines - 2,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal'
            \ }
    ]]
end

return M
