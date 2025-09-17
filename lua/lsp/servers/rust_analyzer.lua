return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy", -- 保存时用 clippy 检查
      },
      inlayHints = {
        enable = true,
        typeHints = true,
        parameterHints = true,
        chainingHints = true,
      },
    },
  },
}
