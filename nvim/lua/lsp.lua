local lspconfig = require("lspconfig")
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Autocompletado con nvim-cmp
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- Capabilities para LSP + cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Función auxiliar para configurar todos los LSPs igual
local function setup_server(server, opts)
  opts = opts or {}
  opts.capabilities = capabilities
  lspconfig[server].setup(opts)
end

-- Lista de servidores a configurar
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  pyright = {},
  ts_ls= {},
  phpactor = {},
  clangd = {},
  bashls = {},
  jsonls = {},
  html = {},
  cssls = {},
}

-- Configurar todos los LSPs
for server, opts in pairs(servers) do
  setup_server(server, opts)
end
