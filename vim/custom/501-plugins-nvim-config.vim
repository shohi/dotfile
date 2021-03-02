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