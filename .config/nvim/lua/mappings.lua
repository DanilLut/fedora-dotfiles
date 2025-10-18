require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local builtin = require "telescope.builtin"

map("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true })

map("n", "k", function()
    return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true })

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Launch tmux-sessionizer" })

-- Buffer mappings
map("n", "<leader>bn", "<cmd> enew <CR>", { desc = "New buffer" })
map("n", "<leader>bp", "<cmd> echo expand('%:pv') <CR>", { desc = "Show current buffer path" })
map("n", "<leader>br", "<cmd> e! <CR>", { desc = "Refresh current buffer" })
map("n", "<leader>xfc", "<cmd> bd! <CR>", { desc = "Force close current buffer" })
map("n", "<leader>xfa", "<cmd> bufdo bd! <CR>", { desc = "Force close all buffers" })
map("n", "<leader>xfx", "<cmd> %bd!|e#|bd# <CR>", { desc = "Force close all buffers except current" })
map("n", "<leader>xc", "<cmd> bd <CR>", { desc = "Close current buffer" })
map("n", "<leader>xa", "<cmd> bufdo bd <CR>", { desc = "Close all buffers" })
map("n", "<leader>xx", "<cmd> %bd|e#|bd# <CR>", { desc = "Close all buffers except current" })
map("n", "<leader>c", "<cmd> Compile <CR>", { desc = "Compile" })
map("n", "-", "<cmd> Oil <CR>", { desc = "Open parent directory" })

-- Arduino

map("n", "<leader>aa", "<cmd> ArduinoAttach <CR>", { desc = "Arduino Attach" })
map("n", "<leader>av", "<cmd> ArduinoVerify <CR>", { desc = "Arduino Verify" })
map("n", "<leader>au", "<cmd> ArduinoUpload <CR>", { desc = "Arudino Upload" })
map("n", "<leader>aus", "<cmd> ArduinoUploadAndSerial <CR>", { desc = "Arudino Upload and Serial" })
map("n", "<leader>as", "<cmd> ArduinoSerial <CR>", { desc = "Arduino Serial" })
map("n", "<leader>ab", "<cmd> ArduinoChooseBoard <CR>", { desc = "Arduino choose Board" })
map("n", "<leader>ap", "<cmd> ArduinoChooseProgrammer <CR>", { desc = "Arduino choose Programmer" })

-- Insert mode
map("i", "<C-s>", "<C-c><cmd> w <CR>", { desc = "Save file" })
map("i", "<C-c>", "<ESC>", { desc = "Leave Insert mode", noremap = true })

-- Visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
map("v", "I", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Sessions
-- map("n", "<leader>sl", "<cmd> SessionsLoad <CR>", { desc = "Load session" })
-- map("n", "<leader>ss", "<cmd> SessionsSave <CR>", { desc = "Save session" })
-- map("n", "<leader>sx", "<cmd> SessionsStop <CR>", { desc = "Stop session" })

---- Comment plugin
-- map("n", "<leader>/", "<nop>")
-- map("n", "<C-_>", function() require("Comment.api").toggle.linewise.current() end, { desc = "Toggle comment" })
-- map("v", "<leader>/", "<nop>")
-- map("v", "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })

-- Blankline context
-- map("n", "<leader>cc", "<nop>", { desc = "Jump to current context" })
-- map("n", "gcc", function()
--   local ok, start = require("indent_blankline.utils").get_current_context(
--     vim.g.indent_blankline_context_patterns,
--     vim.g.indent_blankline_use_treesitter_scope
--   )
--   if ok then
--     vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
--     vim.cmd [[normal! _]]
--   end
-- end, { desc = "Go to current context" })

-- Vim Fugitive
map("n", "<leader>gg", "<cmd> Git <CR>", { desc = "Open Git" })
map("n", "<leader>gp", "<cmd> Git push <CR>", { desc = "Push" })
map("n", "<leader>gc", "<cmd> Git commit <CR>", { desc = "Commit" })
map("n", "<leader>gl", "<cmd> Git log <CR>", { desc = "Log" })
map("n", "<leader>gs", "<cmd> Git status <CR>", { desc = "Status" })

-- Gitsigns
map("n", "<leader>ghr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
map("n", "<leader>ghp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
map("n", "<leader>ghs", function() require("gitsigns").stage_hunk() end, { desc = "Stage hunk" })
map("n", "<leader>ghu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Undo stage hunk" })

-- LSP
map("n", "<leader>df", function()
    vim.lsp.buf.format { async = true }
end, { desc = "LSP formatting" })
map("n", "gr", builtin.lsp_references, { desc = "Search LSP references" })
map("n", "gd", builtin.lsp_definitions, { desc = "LSP Definitions" })
map("n", "<leader>.r", function()
    require("nvchad.renamer").open()
end, { desc = "LSP rename" })
map("n", "<leader>.a", function()
    vim.lsp.buf.code_action()
end, { desc = "LSP code action" })
map("n", "<leader>.q", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>.s", function()
    vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })
map("n", "<leader>.f", function()
    vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
map("v", "<leader>.a", function()
    vim.lsp.buf.code_action()
end, { desc = "LSP code action" })

-- NvTerm
map("n", "<leader>th", function()
    require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal term" })
map("n", "<leader>tv", function()
    require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical term" })
map("n", "<leader>tnh", function()
    require("nvterm.terminal").new "horizontal"
end, { desc = "New horizontal term" })
map("n", "<leader>tnv", function()
    require("nvterm.terminal").new "vertical"
end, { desc = "New vertical term" })

map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
map("t", "<C-w>", vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>", true, true, true))
map("t", "<leader>th", function()
    require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal term" })
map("t", "<leader>tv", function()
    require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical term" })

-- Telescope
map("n", "<leader>ww", "<cmd>Telescope workspaces<CR>", { desc = "Open workspaces list" })
map("n", "<leader>tp", "<cmd>Telescope terms<CR>", { desc = "Pick hidden term" })
map("n", "<leader>fm", "<nop>", { desc = "Disabled key" })
map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Search document symbols" })
map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "Search LSP workspace symbols" })
map("n", "\\t", "<cmd>Telescope themes<CR>", { desc = "NvChad themes" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })

-- WhichKey
map("n", "\\k", function()
    vim.cmd "WhichKey"
end, { desc = "All keymaps" })

-- Harpoon
map("n", "<C-e>", function()
    local harpoon = require "harpoon"
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)
map("n", "<C-a>", function()
    require("harpoon"):list():add()
end)
map("n", "<C-h>", function()
    require("harpoon"):list():select(1)
end)
map("n", "<C-j>", function()
    require("harpoon"):list():select(2)
end)
map("n", "<C-k>", function()
    require("harpoon"):list():select(3)
end)
map("n", "<C-l>", function()
    require("harpoon"):list():select(4)
end)

-- Disable default NvChad mappings
map("n", "<C-c>", "<nop>")
map("i", "<C-f>", "<nop>")
map("i", "<C-b>", "<nop>")
map("n", "<leader>n", "<nop>")
map("n", "<leader>rn", "<nop>")
map("n", "<leader>D", "<nop>")
map("n", "<leader>e", "<nop>")
map("n", "<leader>q", "<nop>")
map("n", "<leader>b", "<nop>")
map("n", "<leader>ca", "<nop>")
map("n", "<leader>cm", "<nop>")
map("n", "<leader>ma", "<nop>")
map("n", "<leader>ph", "<nop>")
map("n", "<leader>pt", "<nop>")
map("n", "<leader>ra", "<nop>")
map("n", "<leader>rh", "<nop>")
map("n", "<leader>td", "<nop>")
map("n", "<leader>wK", "<nop>")
map("n", "<leader>wk", "<nop>")
map("n", "<leader>lf", "<nop>")
map("n", "<leader>ch", "<nop>")
map("n", "<leader>x", "<nop>")
