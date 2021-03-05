" -*- vim: set ft=vim: -*-
if !has('nvim')
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 colorizer                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('colorizer').setup()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                auto-session                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/rmagatti/auto-session
let g:auto_session_pre_save_cmds = ["tabdo NERDTreeClose"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-keysound                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" require sdl2 installed
" pyenv activate neovim3
" pip3 install pysdl2
" brew install sdl2
" brew install sdl2_mixer
let g:keysound_enable = 1
