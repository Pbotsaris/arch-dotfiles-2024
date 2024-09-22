local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  print("Lspconfig not found")
  return
end

local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
  print("Mason not found")
  return
end

local mason_lspconfig_ok, mason_lsconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_ok then
  print("Mason lspconfig not found")
  return
end

local M = {}

function M.setup()
  mason.setup({})
  mason_lsconfig.setup()

  mason_lsconfig.setup_handlers({
    function(server_name)
      local has_settings, settings = pcall(require, "lsp.settings." .. server_name)
      if has_settings then
        lspconfig[server_name].setup(settings)
      else
        lspconfig[server_name].setup({})
      end
      require("lsp.lsp_setup").setup()
      require("lsp.null_ls")
    end,
  })
end

return M

