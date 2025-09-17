require("nvim-treesitter.configs").setup({
  -- 1. 安装 & 同步
  ensure_installed = {
    "c", "cpp", "rust", "go", "python", "java", "javascript", "typescript", "tsx",
    "lua", "vim", "vimdoc", "query", "html", "css", "scss", "json", "yaml", "toml",
    "markdown", "markdown_inline", "bash", "dockerfile", "sql", "regex", "gitignore",
  }, -- 常用语言全覆盖，按需增删
  sync_install = false,            -- 异步安装，不阻塞启动
  auto_install = true,             -- 打开未安装语言时自动补装

  -- 2. 高亮
  highlight = {
    enable = true,
    use_languagetree = true,       -- 支持多语言混合文件
    additional_vim_regex_highlighting = false,
  },

  -- 3. 增量选择：按 Ctrl 从节点向外扩选
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },

  -- 4. 文本对象（af / if / ac / ic 等）
  textobjects = {
    select = {
      enable = true,
      lookahead = true,            -- 自动跳到下一个对象
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { ["]m"] = "@function.outer", ["]c"] = "@class.outer" },
      goto_next_end   = { ["]M"] = "@function.outer", ["]C"] = "@class.outer" },
      goto_previous_start = { ["[m"] = "@function.outer", ["[c"] = "@class.outer" },
      goto_previous_end   = { ["[M"] = "@function.outer", ["[C"] = "@class.outer" },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader>sp"] = "@parameter.inner" },
      swap_previous = { ["<leader>sP"] = "@parameter.inner" },
    },
  },

  -- 5. 自动配对/关闭标签（HTML/JSX/TSX）
  -- autotag = { enable = true },

  -- 6. 内置重构模块
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition_lsp_fallback = "gd",
        list_definitions = "gD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A-*>",
        goto_previous_usage = "<A-#>",
      },
    },
  },

  -- 7. 缩进（语言支持度差异大，可关）
  indent = { enable = true, disable = { "python", "yaml" } },
})

-- 8. 配色后处理：让折叠、Rainbow 等插件更易读（可选）
vim.opt.foldmethod = "expr"
vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false        -- 启动时默认不折叠
