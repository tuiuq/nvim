return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "ray-x/lsp_signature.nvim",
        opts = {
          bind = true,
          max_width = math.floor(vim.o.columns * 0.84),
          max_height = math.floor(vim.o.columns * 0.6),
          hint_inline = function ()
            return vim.version.gt(vim.version(), { 0, 9, 0 })
          end,
          handler_opts = {
            border = "shodow"
          }
        }
      },
      {
        "folke/neodev.nvim",
        ft = "lua",
        opts = {
          pathStrict = true,
          library = {
            plugins = {
              "nvim-dap-ui"
            },
            types = true
          }
        }
      },
      "hrsh7th/cmp-nvim-lsp"
    },
    opts = {
      servers = {
        bashls = {
          filetypes = { "bash", "sh" },
        },
        clangd = {
          cmd = {
            "clangd",
            "--clang-tidy",
            "-j=5",
            "--malloc-trim"
          },
          filetypes = { "c" }
        },
        rust_analyzer = {
          settings = {
            ["rust_analyzer"] = {
              check = {
                command = "clippy",
                features = "all"
              }
            }
          }
        },
        lua_ls = {
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
      },
      setup = {
        lua_ls = function(server, opts)
          require("lspconfig")[server].setup(opts)
        end,
      },
    },
    config = function (_, opts)
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local available = vim.tbl_keys(opts.servers or {})

      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = available,
        automatic_installation = true
      })


      local on_attach = function (client, bufnr)
        _ = client
        _ = bufnr
        require("lspconfig.ui.windows").default_options = {
          border = "shadow"
        }
      end

      local function setup(server, server_config)
        if opts.setup[server] then
          if opts.setup[server](server, server_config) then
            return
          end
        end
        require("lspconfig")[server].setup(server_config)
      end

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      for server, _ in pairs(servers) do
        local server_config = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach
        }, servers[server] or {})

        setup(server, server_config)
      end
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      ui = {
        border = "shadow"
      },
      outline = {
        layout = "float"
      }
    }
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function ()
      local null_ls = require("null-ls")
      return {
        diagnostics_format = "#{m} (#{s})",
        sources = {
          null_ls.builtins.diagnostics.cppcheck.with({
            extra_args = {
              "--inconclusive"
            }
          }),
          null_ls.builtins.diagnostics.selene,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.phpstan,
          null_ls.builtins.formatting.phpcsfixer,
          null_ls.builtins.diagnostics.zsh.with({
            filetypes = { "zsh" }
          }),
          null_ls.builtins.hover.printenv.with({
            filetypes = {
              "zsh",
              "bash",
              "sh",
              "dosbatch",
              "ps1"
            }
          }),
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.glslc.with({
            extra_args = {
              "--target-env=opengl"
            }
          })
        }
      }
    end
  }
}
