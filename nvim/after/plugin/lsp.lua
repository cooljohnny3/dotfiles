-- NOTE: Remember that lua is a real programming language, and as such it is possible
-- to define small helper and utility functions so you don't have to repeat yourself
-- many times.
--
-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end


nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
nmap('<leader>e', vim.diagnostic.open_float, '[E]xpand error')

local builtin = require('telescope.builtin')
nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
