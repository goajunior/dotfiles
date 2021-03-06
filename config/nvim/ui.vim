"{ UI-related settings
"{{ General settings about colors
" Enable true colors support. Do not set this option if your terminal does not
" support true colors! For a comprehensive list of terminals supporting true
" colors, see https://github.com/termstandard/colors and
" https://gist.github.com/XVilka/8346728.
if $TERM == "xterm-256color" || exists('g:started_by_firenvim')
    set termguicolors
endif
" Use dark background
set background=dark
"}}

"{{ Colorscheme settings
""""""""""""""""""""""""""""gruvbox settings"""""""""""""""""""""""""""
" We should check if theme exists before using it, otherwise you will get
" error message when starting Nvim
if utils#HasColorscheme('gruvbox8')
    " Italic options should be put before colorscheme setting,
    " see https://github.com/morhetz/gruvbox/wiki/Terminal-specific#1-italics-is-disabled
    let g:gruvbox_italics=1
    let g:gruvbox_italicize_strings=1
    let g:gruvbox_filetype_hi_groups = 0
    let g:gruvbox_plugin_hi_groups = 0
    colorscheme gruvbox8_hard
else
    colorscheme desert
endif

let ayucolor="dark" " for mirage version of theme
" colorscheme ayu
colorscheme gruvbox8

""""""""""""""""""""""""""" deus settings"""""""""""""""""""""""""""""""""
" colorscheme ayu

""""""""""""""""""""""""""" solarized8 settings"""""""""""""""""""""""""
" Solarized colorscheme without bullshit
" let g:solarized_term_italics=1
" let g:solarized_visibility="high"
" colorscheme solarized8_high

""""""""""""""""""""""""""" vim-one settings"""""""""""""""""""""""""""""
" let g:one_allow_italics = 1
" colorscheme one

"""""""""""""""""""""""""""material.vim settings""""""""""""""""""""""""""
" let g:material_terminal_italics = 1
" " theme_style can be 'default', 'dark' or 'palenight'
" let g:material_theme_style = 'dark'
" colorscheme material

""""""""""""""""""""""""""" badwolf settings """""""""""""""""""""""""""""
" let g:badwolf_darkgutter = 0
" " Make the tab line lighter than the background.
" let g:badwolf_tabline = 2
" colorscheme badwolf
"}}

"{{ Cursor colors and shapes
" highlight groups for cursor color
highlight Cursor cterm=bold gui=bold guibg=cyan guifg=black
highlight Cursor2 guifg=red guibg=red

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20
highlight Normal guibg=none
highlight NonText guibg=none

"}}
"}
