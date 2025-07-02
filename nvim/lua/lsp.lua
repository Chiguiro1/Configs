local lspconfig = require("lspconfig")
local cmp = require("cmp")

require("cmp").setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- Habilita LSPs
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver = nil
lspconfig.ts_ls.setup({})
lspconfig.phpactor.setup({})

