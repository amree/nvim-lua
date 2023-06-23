local lsp = require("lsp-zero")

-- lsp.preset("recommended")
lsp.preset({
  name = "minimal",
  set_lsp_keymaps = false,
  -- set_lsp_keymaps = {omit = {'<Ctrl-k>'}, preserve_mappings = false},
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
    },
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  -- Had to specify them manually
  bind("n", "gd", "<cmd> lua vim.lsp.buf.definition()<cr>", opts)
  bind("n", "gl", "<cmd> lua vim.diagnostic.open_float()<cr>", opts)
end)

-- nvim-cmp
--


-- Need to download codicons.ttf: https://github.com/microsoft/vscode-codicons
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

lsp.setup_nvim_cmp({
  -- :help cmp-config
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]

      return vim_item
    end
  },
})

lsp.setup()
