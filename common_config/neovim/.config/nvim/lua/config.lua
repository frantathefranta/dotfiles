vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "bashls", "pyright", "yamlls", "ansiblels", "dockerls" }
})
require("mason-lspconfig").setup_handlers {
-- The first entry (without a key) will be the default handler
-- and will be called for each installed server that doesn't have
-- a dedicated handler.
function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
end
}
-- require('neorg').setup {load = {
-- 	["core.defaults"] = {},
-- 	["core.norg.concealer"] = {},
-- 	["core.norg.dirman"] = {
--             config = {
--                 workspaces = {
--                     work = "~/notes/work",
--                     home = "~/notes/home",
--                 }
--             }
--         }
-- }}

  local home = os.getenv('HOME')
  local db = require('dashboard')
  db.session_directory = home
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'Telescope oldfiles',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      -- {icon = '  ',
      -- desc = 'Open Personal dotfiles                  ',
      -- action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
      -- shortcut = 'SPC f d'},
}
-- vim.g.bubbly_palette = {
--       background = "#34343c",
--       foreground = "#c5cdd9",
--       black = "#3e4249",
--       red = "#ec7279",
--       green = "#a0c980",
--       yellow = "#deb974",
--       blue = "#6cb6eb",
--       purple = "#d38aea",
--       cyan = "#5dbbc1",
--       white = "#c5cdd9",
--       lightgrey = "#57595e",
--       darkgrey = "#404247",
--     }
-- vim.g.bubbly_statusline = {
--       'mode',
--
--       'truncate',
--
--       'path',
--       'branch',
--       'signify',
--       'gitsigns',
--       'coc',
--
--       'divisor',
--
--       'filetype',
--       'progress',
--     }
