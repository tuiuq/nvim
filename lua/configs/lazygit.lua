local Terminal = require("toggleterm.terminal").Terminal

local lazygit_term = nil

function _G.lazygit_toggle(...)
  local args = table.concat({...}, " ")
  if not lazygit_term or lazygit_term.cmd ~= args then
    lazygit_term = Terminal:new({
      cmd = ("lg %s"):format(args),
      direction = "float",
      float_opts = {
        border = "curved"
      },
      on_close = function ()
        lazygit_term = nil
      end
    })
  end
  lazygit_term:toggle()
end

vim.api.nvim_create_user_command("LazyGit", function (opts)
  _G.lazygit_toggle(unpack(opts.args))
end, {
    nargs = "*",
    desc = "Toggleterm LazyGit with args"
  })

local map = vim.keymap.set

-- LazyGit
map("n", "<leader>gg", function ()
  _G.lazygit_toggle()
end)
