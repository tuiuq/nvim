local M = {}

M.setup = function(_, bufnr)
  local map = function (mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
      buffer = bufnr,
      silent = true,
      desc = desc
    })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "<A-h>", vim.lsp.buf.hover, "Hover Documentation")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "<F2>", vim.lsp.buf.rename, "Rename Symbol")
  map("n", "<F5>", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>f", function()
    vim.lsp.buf.format { async = true }
  end, "Format Buffer")
end

return M
