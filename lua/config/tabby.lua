
local palette = {
    accent = '#88c0d0', -- nord8
    accent_sec = '#81a1c1', -- nord9
    bg = '#3b4252', -- nord1
    bg_sec = '#4c566a', -- nord3
    fg = '#e5e9f0', -- nord4
    fg_sec = '#d8dee9', -- nord4
}

local filename = require('tabby.filename')
local cwd = function()
  return ' ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
end
local tabname = function(tabid)
  return vim.api.nvim_tabpage_get_number(tabid)
end
local line = {
  hl = { fg = palette.fg, bg = palette.bg },
  layout = 'active_wins_at_end',
  head = {
    { cwd, hl = { fg = palette.bg, bg = palette.accent } },
    { '', hl = { fg = palette.accent, bg = palette.bg } },
  },
  active_tab = {
    label = function(tabid)
      return {
        '  ' .. tabname(tabid) .. ' ',
        hl = { fg = palette.bg, bg = palette.accent_sec, style = 'bold' },
      }
    end,
    left_sep = { '', hl = { fg = palette.accent_sec, bg = palette.bg } },
    right_sep = { '', hl = { fg = palette.accent_sec, bg = palette.bg } },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        '  ' .. tabname(tabid) .. ' ',
        hl = { fg = palette.fg, bg = palette.bg_sec, style = 'bold' },
      }
    end,
    left_sep = { '', hl = { fg = palette.bg_sec, bg = palette.bg } },
    right_sep = { '', hl = { fg = palette.bg_sec, bg = palette.bg } },
  },
  top_win = {
    label = function(winid)
      return {
        '  ' .. filename.unique(winid) .. ' ',
        hl = { fg = palette.fg, bg = palette.bg_sec },
      }
    end,
    left_sep = { '', hl = { fg = palette.bg_sec, bg = palette.bg } },
    right_sep = { '', hl = { fg = palette.bg_sec, bg = palette.bg } },
  },
  win = {
    label = function(winid)
      return {
        '  ' .. filename.unique(winid) .. ' ',
        hl = { fg = palette.fg, bg = palette.bg_sec },
      }
    end,
    left_sep = { '', hl = { fg = palette.bg_sec, bg = palette.bg } },
    right_sep = { '', hl = { fg = palette.bg_sec, bg = palette.bg } },
  },
  tail = {
    { '', hl = { fg = palette.accent_sec, bg = palette.bg } },
    { '  ', hl = { fg = palette.bg, bg = palette.accent_sec } },
  },
}
require('tabby').setup({ tabline = line })
