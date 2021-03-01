" -*- vim: set ft=vim: -*-

" neovim related basic settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                nvim-python                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/
" install python client to nvim - https://github.com/neovim/pynvim
" `neovim` python package is surpassed by `pynvim`
"
" required `pyenv` and `pyenv-virtualenv` installed first (using homebrew)
"
" $> pyenv virtualenv 2.7.18 neovim2
" $> pyenv activate neovim2
" $> pip install pynvim
" $> pyenv which python  # Note the path
" $> pyenv deactivate
"
" $> pyenv virtualenv 3.8.5 neovim3
" $> pyenv activate neovim3
" $> pip install pynvim
" $> pyenv which python  # Note the path
" $> pyenv deactivate
"
let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'
