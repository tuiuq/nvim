local M = {}
local mason = pRequire("mason")
local mason_lspconfig = pRequire("mason-lspconfig")

local function load_servers()
  local servers = {}
  local servers_path = vim.fn.stdpath("config") .. "/lua/lsp/servers"
  local scan = vim.loop.fs_scandir(servers_path)

  if not scan then
    return servers
  end

  while true do
    local name, t = vim.loop.fs_scandir_next(scan)
    if not name then break end

    if t == "file" and name:match("%.lua$") then
      local server = name:gsub("%.lua$", "")
      servers[server] = require("lsp.servers." .. server)
    end
  end

  return servers
end


M.setup = function ()
  local servers = load_servers()
  local available = vim.tbl_keys(servers or {});
  -- Mason
  if mason then
    mason.setup()
  end

  -- Mason Lspconfig
  if mason_lspconfig then
    mason_lspconfig.setup({
      ensure_installed = available,
      automatic_enable = true
    })
  end

  -- capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local cmp_nvim_lsp = pRequire("cmp_nvim_lsp")
  if cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  -- on_attach
  local on_attach = function (client, bufnr)
    require("lsp.keymaps").setup(client,  bufnr)
    require("lspconfig.ui.windows").default_options = {
      border = "rounded"
    }
  end

  -- LspAttach 自动注入 on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then
        on_attach(client, args.buf)
      end
    end
  })

  -- 注册所有 server
  for name, opts in pairs(servers) do
    opts.capabilities = capabilities
    vim.lsp.config(name, opts)
  end
end

return M

