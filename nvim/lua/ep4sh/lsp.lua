local servers = {
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          unusedwrite = true,
          nilness = true,
          shadow = true,
        },
        staticcheck = true,
        gofumpt = true,
        buildFlags = {"-tags=integration"},
        completeUnimported = true,
        usePlaceholders = true,
        semanticTokens = false,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          parameterNames = true,
        },
        codelenses = {
          generate = true,
          gc_details = true,
        }
      }
    }
  },
  pyright = {},
  helm_ls = {},
  zls = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = vim.tbl_keys(servers)
})

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local builtin = require('telescope.builtin')

  nmap('gd', function()
    builtin.lsp_definitions({})
  end, '[G]oto [D]efinition')

  nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
  nmap('gi', builtin.lsp_implementations, '[G]oto [I]mplementation')
  nmap('gt', builtin.lsp_type_definitions, '[T]ype [D]efinition')
  nmap('rn', vim.lsp.buf.rename, '[R]e[n]ame')

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end
    })
  end

end

for server, config in pairs(servers) do
 vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = config.settings or {},
  })
end
