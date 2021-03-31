" -*- vim: set ft=vim: -*-
if !has('nvim')
  finish
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-keysound                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" require sdl2 installed
" pyenv activate neovim3
" pip3 install pysdl2
" brew install sdl2
" brew install sdl2_mixer
let g:keysound_enable = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 nvim-compe                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/hrsh7th/nvim-compe
set completeopt=menuone,noselect
" https://www.reddit.com/r/vim/comments/8zx75v/what_is_the_minimal_code_to_trigger/
inoremap . .<C-x><C-o>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

" below source turned to false.
" let g:compe.source.spell = v:false
" let g:compe.source.tags = v:false
" let g:compe.source.snippets_nvim = v:false
" let g:compe.source.treesitter = v:false
let g:compe.source.omni = v:false

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" FIXME: add TAB autocomplete
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" check if the
function! _complete_comment() abort
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_dot() ? "\<C-x>\<C-o>" :
        \ "\<TAB>"
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
endfunction

function! s:check_dot() abort
  let col = col('.') - 1
  if !col
    return v:false
  else
    return getline('.')[col - 1] ==? '.'
  endif
endfunction

" not work with supertab
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
