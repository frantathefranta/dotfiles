let g:firenvim_config = { 
    \ 'globalSettings': {
	    \ 'takeover': 'never',
      \ 'cmdline': 'none',
    \ },
    \ 'localSettings': {
	    \ 'https://wiki.osc.edu/': {
	    \ 'takeover': 'always',
      \ 'cmdline': 'none',
	    \},
	    \ '.*': {
	    \ 'takeover': 'never',
      \ "cmdline":"none",
    \},
    \}
    \}
if exists('g:started_by_firenvim')
	colorscheme tokyonight-day
	au BufEnter wiki.osc.edu_*.txt set filetype=mediawiki
	let g:vim_mediawiki_surround_bold = 'b'
	let g:vim_mediawiki_surround_italic = 'i'
endif

