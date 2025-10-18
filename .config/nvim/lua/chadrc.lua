-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "flexoki",
    transparency = true,

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
    lsp = {
        signature = {
            disabled = true,
        },
    },
    hl_add = {
        Added = {
            fg = "#77ab2e",
        },
        Changed = {
            fg = "#a6a6a6",
        },
        Removed = {
            fg = "#F44336",
        },
    },
    hl_override = {
        ColorColumn = {
            bg = "none",
        },
        FoldColumn = {
            bg = "none",
        },
        TelescopeBorder = {
            fg = "#161616",
        },
        TelescopePromptBorder = {
            fg = "#161616",
        },
        TelescopePreviewTitle = {
            fg = "#c5c8c6",
            bg = "#161616",
        },
        TelescopePromptTitle = {
            fg = "#c5c8c6",
            bg = "#161616",
        },
        TelescopeResultsTitle = {
            fg = "#c5c8c6",
            bg = "#161616",
        },
        TelescopeSelection = {
            fg = "#c5c8c6",
            bg = "#161616",
        },
        TbLineBufOn = { fg = "#c5c8c6" },
        Title = { fg = "#c5c8c6" },
        FloatBorder = { fg = "#161616" },
    },
    tabufline = {
        lazyload = false,
        enabled = false
    },
    statusline = {
        theme = "vscode",
        overriden_modules = function(modules)
            table.remove(modules, 2)
            table.insert(
                modules,
                2,
                (function()
                    local sep_l = " "
                    local sep_r = " "

                    local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
                        return sep_l_hlgroup ..
                            sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
                    end

                    local icon = "󰈚"
                    local name = vim.fn.expand("%:p")

                    if name ~= "" then
                        local devicons_present, devicons = pcall(require, "nvim-web-devicons")

                        if devicons_present then
                            local ft_icon = devicons.get_icon(name)
                            icon = (ft_icon ~= nil and ft_icon) or icon
                        end
                    else
                        name = "<new>"
                    end

                    return gen_block(icon, name, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#")
                end)()
            )
            -- table.remove(modules, 4)
            -- table.remove(modules, 8)
            -- table.remove(modules, 8)
            -- table.remove(modules, 8)
            -- table.remove(modules, 8)
            -- table.remove(modules, 8)
        end,
    },
}

return M
