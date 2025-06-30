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
        semanticTokens = true,
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
  ruby_lsp = {},
  helm_ls = {},
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

  nmap('gd', function()
    vim.cmd("Telescope lsp_definitions jump_type=never")
  end, '[G]oto [D]efinition')

  nmap('gd', function()
    require('telescope.builtin').lsp_references({}, {})
  end, '[G]oto [R]eferences')

  nmap('gi', function()
    require('telescope.builtin').lsp_implementations({}, {})
  end, '[G]oto [I]mplementation')

  nmap('td', function()
    require('telescope.builtin').lsp_type_definitions({}, {})
  end, '[T]ype [D]efinition')


  nmap('rn', function()
    vim.lsp.buf.rename()
  end, '[R]e[n]ame')

end

local lspconfig = require('lspconfig')
for server, config in pairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = config.settings or {},
  })
end
