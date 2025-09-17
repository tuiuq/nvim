-- -- =========================
-- -- LSP 配置入口
-- -- 基于 Neovim 原生 LSP API 
-- -- =========================
-- local mason = require("mason")
-- local mason_lspconfig = require("mason-lspconfig")
--
-- local servers = {
--   lua_ls = require("lsp.servers.lua_ls")
-- }
--
-- -- =========================
-- -- mason.nvim 初始化
-- -- =========================
-- mason.setup()
--
-- -- =========================
-- -- mason-lspconfig.nvim 初始化
-- -- =========================
-- mason_lspconfig.setup({
--   ensure_installed = vim.tbl_keys(servers),
-- })
--
-- -- =========================
-- -- 统一的能力 (capabilities)
-- -- =========================
-- local capabilities = require("cmp_nvim_lsp").default_capabilities(
--   vim.lsp.protocol.make_client_capabilities()
-- )
--
-- -- =========================
-- -- 通用的 on_attach
-- -- =========================
-- local on_attach = function (client, bufnr)
--   require("lsp.keymaps").setup(client, bufnr)
--   require("lspconfig.ui.windows").default_options = {
--     border = "rounded"
--   }
-- end
--
-- -- =========================
-- -- 注册到所有server源
-- -- =========================
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function (args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client then
--       on_attach(client, args.buf)
--     end
--   end
-- })
--
-- -- =========================
-- -- LSP server 配置
-- -- =========================
-- for name, opts in pairs(servers) do
--   opts.capabilities = capabilities
--   vim.lsp.config(name, opts)
-- end
--

local M = {}
local mason = pRequire("mason")
local mason_lspconfig = pRequire("mason-lspconfig")

local servers = {
  lua_ls = require("lsp.servers.lua_ls")
}
local available = vim.tbl_keys(servers or {});

M.setup = function ()
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

