local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()

-- require("lspconfig").sumneko_lua.setup({
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" }
--       },
--     },
--   }
-- })
