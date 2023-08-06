-- returns the extension name of a file
local function get_extension()
  local buff_name = vim.api.nvim_buf_get_name(0)
  local buff_len = string.len(buff_name)
  local ext = ""
  while buff_len >= 0 do
    local subs = string.sub(buff_name, buff_len, buff_len)
    if subs == '.' then
      return string.reverse(ext)
    end
    ext = ext..subs
    buff_len = buff_len - 1
  end
  return nil
end

-- colorscheme
local function setColor(color)
  vim.opt.termguicolors = true
  color = color or "nord"
  --local cmd_color_txt_bg = "highlight Normal ctermbg=none"
  --local cmd_color_bg = "highlight Normal guibg=none"
  --vim.cmd(cmd_color_bg)
  --vim.cmd(cmd_color_txt_bg)
  vim.cmd.colorscheme(color)
  --vim.cmd("hi VertSplit guibg=none guifg=none gui=none")
end

local function setLineNumber()
  vim.opt.nu = true
  vim.opt.relativenumber = true
end

local function setIndentation()
  local shiftwidth = 4
  local softtabstop = 4
  local tabstop = 4

  small = {"lua", "dart", "html", "css", "nim"}
  local buff_ext = get_extension()
  if buff_ext ~= nil then
    for _, ext in ipairs(small) do
      if buff_ext == ext then
        shiftwidth = 2
        softtabstop = 2
        tabstop = 2
        break
      end
    end
  end

  if get_extension() == "go" then
    shiftwidth = 8
    softtabstop = 8
    tabstop = 8
  end
  vim.opt.shiftwidth = shiftwidth
  vim.opt.softtabstop = softtabstop
  vim.opt.tabstop = tabstop
  vim.opt.expandtab = true
end

require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

setColor("nord")
setLineNumber()
setIndentation()
