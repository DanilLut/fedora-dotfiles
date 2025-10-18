require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig.gopls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "gopls" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--       },
--     },
--   },
-- }

-- lspconfig.arduino_language_server.setup {
--   cmd = {
--     "arduino-language-server",
--     "-cli",
--     "arduino-cli",
--     "-cli-config",
--     os.getenv "HOME" .. "/.arduino15/arduino-cli.yaml",
--     "-fqbn",
--     "arduino:avr:uno",
--     "-clangd",
--     "clangd",
--   },
-- }

-- lspconfig.clangd.setup {
--   on_attach = function(client, buffnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, buffnr)
--   end,
--   capabilities = capabilities,
-- }
