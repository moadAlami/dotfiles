function Compile()
    vim.cmd('write')
    vim.cmd('silent !mkdir out')
    vim.cmd('!latexmk -outdir=out/ --output-format=pdf -file-line-error -interaction=nonstopmode -synctex=1 %:p')
end

function OpenPdf()
    local pdf_path = tostring(vim.fn.expand('%:p:h:') .. '/out/' .. vim.fn.expand('%:t:r') .. '.pdf')
    local opta = "--synctex-forward "
    local optb = tostring(vim.fn.line('.')) .. ":" .. tostring(vim.fn.col('.')) .. ":" .. vim.fn.expand('%:p')
    vim.fn.system('zathura "' .. pdf_path .. '" ' .. opta .. optb .. " & disown")
end

vim.keymap.set('n', '<leader>ar', ':AngryReviewer<CR>')
vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/tex.lua<CR>')

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua Compile()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>o', ':lua OpenPdf()<LF>', { silent = true })
