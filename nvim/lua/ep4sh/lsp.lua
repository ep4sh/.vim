local servers = {
  gopls = {},
  pyright = {},
  ruby_lsp = {},
  helm_ls = {},
  biome = {},
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

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('td', vim.lsp.buf.type_definition, 'Type [D]efinition')
end

local lspconfig = require('lspconfig')
for server, config in pairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = config,
  })
end
