local g = vim.g
local o = vim.o

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Case insensitive UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Better editing
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- Better editor UI
o.number = true
-- o.numberwidth = 5
-- o.relativenumber = true
o.signcolumn = 'yes:2'
o.cursorline = true
