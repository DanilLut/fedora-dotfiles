require "nvchad.autocmds"

-- Highlight on yank
local hl_group = vim.api.nvim_create_augroup('!!YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = hl_group,
  pattern = '*',
})

-- Disable relative numbers in insert mode
local rn_group = vim.api.nvim_create_augroup('!!RelativeNumber', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
  callback = function()
    vim.api.nvim_set_option_value("relativenumber", false, {})
  end,
  group = rn_group,
  pattern = '*',
})
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    vim.api.nvim_set_option_value("relativenumber", true, {})
  end,
  group = rn_group,
  pattern = '*',
})
