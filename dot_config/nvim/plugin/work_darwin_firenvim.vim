" let g:firenvim_config = { 
"     \ 'globalSettings': {
" 	    \ 'takeover': 'never',
"       \ 'cmdline': 'neovim',
"     \ },
"     \ 'localSettings': {
" 	    \ 'https://wiki.osc.edu/': {
" 	    \ 'takeover': 'always',
"       \ 'cmdline': 'neovim',
" 	    \},
" 	    \ '.*': {
" 	    \ 'takeover': 'never',
"       \ "cmdline": "neovim",
"     \},
"     \}
"     \}
" if exists('g:started_by_firenvim')
" 	colorscheme tokyonight-day
" 	au BufEnter wiki.osc.edu_*.txt set filetype=mediawiki
" 	let g:vim_mediawiki_surround_bold = 'b'
" 	let g:vim_mediawiki_surround_italic = 'i'
" endif
"
