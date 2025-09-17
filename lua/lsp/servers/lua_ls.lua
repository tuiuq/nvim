return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = vim.env.VIMRUNTIME,
        checkThirdParty = false
      },
      format = { enable = false },
      hint = { enable = true, setType = true }
    }
  }
}
