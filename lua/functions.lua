local M = {}

-- Toggle lazygit using toggleterm
M.toggle_lazygit = function()
  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
  })

  lazygit:toggle()
end

-- Toggle tig using toggleterm
M.toggle_tig = function()
  local Terminal  = require('toggleterm.terminal').Terminal
  local tig = Terminal:new({
    cmd = "tig",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
  })

  tig:toggle()
end

return M
