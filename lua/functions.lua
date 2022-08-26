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

return M
