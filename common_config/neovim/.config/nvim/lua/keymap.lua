vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<c-P>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', "<cmd>:source $MYVIMRC <CR>", {noremap=true} )
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser <CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap('n', '<leader>sl', "<cmd>:SessionLoad <CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>:Telescope oldfiles <CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>:Telescope find_files find_command=rg,--hidden,--files <CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fw', "<cmd>:Telescope live_grep <CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>ge', "<cmd>:GkeepEnter <CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<Left>', "<cmd>:echoe 'Use h'<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<Right>', "<cmd>:echoe 'Use l'<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<Up>', "<cmd>:echoe 'Use k'<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<Down>', "<cmd>:echoe 'Use j'<CR>", {noremap=true})
