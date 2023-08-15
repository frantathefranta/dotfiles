if vim.g.started_by_firenvim == true then
  vim.g.firenvim_config = { 
      globalSettings = { alt = "all",
      },
      localSettings = {
        ["wiki.osc.edu"] = {
          takeover = "always",
          priority = 10,
          cmdline = "neovim",
        },
        [".*"] = {
          takeover = "never",
          priority = 0,
          -- cmdline = "neovim",
      },
    }
  }
  vim.api.nvim_create_autocmd({'BufEnter'}, {
      pattern = "wiki.osc.edu_*.txt",
      command = "set filetype=mediawiki | colorscheme tokyonight-day | set nofoldenable"
  })
else

end
