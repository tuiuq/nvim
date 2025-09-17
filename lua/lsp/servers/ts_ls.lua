return {
  settings = {
    typescript = {
      format = {
        indentSize = 2,
        convertTabsToSpaces = true,
        tabSize = 2,
      },
      inlayHints = {
        includeInlayParameterNameHints = "all", -- 显示所有参数名提示
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      format = {
        indentSize = 2,
        convertTabsToSpaces = true,
        tabSize = 2,
      },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
  init_options = {
    preferences = {
      importModuleSpecifier = "relative",
      quotePreference = "auto",
    },
  },
}
