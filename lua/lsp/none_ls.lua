local null_ls = pRequire("null-ls")

if null_ls then
  null_ls.setup({
    diagnostics_format = "#{m} (#{s})",
    sources = {
      -- Lua
      null_ls.builtins.formatting.stylua,
      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.flake8,
      -- JavaScript/TypeScript
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint,
    },
  })
end
