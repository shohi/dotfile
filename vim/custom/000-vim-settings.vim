" -*- vim: set ft=vim: -*-
" automatically executes filetype plugin indent on and syntax enable.
" be iMproved, required
set nocompatible

" change the mapleader from \ to ,
" and keep reverse character search command
let mapleader=","
let maplocalleader=","
noremap \ ,

set encoding=utf-8        " set utf-8 as default encoding
set number                " show number line

set expandtab             " On pressing tab, insert 4 spaces
set tabstop=4             " show existing tab with 4 spaces width
set shiftwidth=4          " when indenting with '>', use 4 spaces width

set dictionary=/usr/share/dict/words " enable dictionary completion

set foldmethod=indent     " enable folding and keep unfolded when opening a file
set foldlevel=99

set clipboard^=unnamed    " enable copy/paste between clipboard and vim
set autoread              " set to auto read when a file is changed from the outside

set ignorecase            " when searching try to be smart about cases
set smartcase

filetype plugin indent on        " enable filetype plugin
set noswapfile
set colorcolumn=80

syntax enable
set termguicolors

" clear highlighting by hitting return in normal mode
" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nnoremap <silent> <CR> :noh<CR><CR>

" fast saving
nnoremap <leader>w :w!<CR>

" enable matchit plugin. this plugin does not work well with
" `match-up`.
" runtime macros/matchit.vim

" visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call <SID>visual_selection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call <SID>visual_selection('', '')<CR>?<C-R>=@/<CR><CR>

" helper functions
function! s:cmd_line(str)
  call feedkeys(":" . a:str)
endfunction

function! s:visual_selection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call s:cmd_line("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call s:cmd_line("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" fast editing vimrc
" $MYVIMRC is not `~/.vimrc` when using neovim
nnoremap <leader>ev :vsplit ~/.vim/vimrc<CR>

" fast sourcing vimrc
nnoremap <leader>sv :source ~/.vim/vimrc<CR>

" Source Vim configuration file and install plugins
" https://pragmaticpineapple.com/improving-vim-workflow-with-fzf/
nnoremap <silent><leader>1 :source ~/.vim/vimrc \| :PlugInstall<CR>
nnoremap <silent><leader>2 :source ~/.vim/vimrc \| :PlugUpdate<CR>
nnoremap <silent><leader>3 :source ~/.vim/vimrc \| :PlugClean<CR>

" highlight cursorline
nnoremap <leader><leader> :set cursorline! cursorcolumn!<CR>

" mapping to open and close quickfix window
nnoremap <silent> <leader>oo :copen<CR>
nnoremap <silent> <leader>oc :cclose<CR>

" per project setting
" https://medium.com/@dnrvs/per-project-settings-in-nvim-fc8c8877d970
" enable loading local executing local rc files.
" nvim -> xxx.nvimrc
" vim -> xxx.vimrc
set exrc
set secure

" map jk to Esc for insert mode
" https://learnvimscriptthehardway.stevelosh.com/chapters/10.html
inoremap jk <esc>
inoremap <esc> <nop>

" cmdline mode mappings
" https://stackoverflow.com/questions/12315612/move-forward-backwards-one-word-in-command-mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" window resize mapping
" https://vim.fandom.com/wiki/Fast_window_resizing_with_plus/minus_keys
" Maps Alt-[h,j,k,l] to resizing a window split
" NOTE: Conflict with vim-move
nnoremap <silent> <C-a> <C-w>>
nnoremap <silent> <C-b> <C-w><
nnoremap <silent> - <C-W>-
nnoremap <silent> + <C-W>+

" buffer mapping
" https://www.reddit.com/r/vim/comments/m9chaf/what_are_your_favourite_mappings_esc_ctrlw_others/

" kill current buffer
" kill all buffers
" previous buffer
" next buffer
nnoremap <leader>k :bd<cr>
nnoremap <leader>c :%bd<cr>
nnoremap <C-b>p :bprev<cr>
nnoremap <C-b>n :bnext<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   spell                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://nickjanetakis.com/blog/using-configuring-and-customizing-vim-spell-check#going-over-everything
" TODO: update
" disable spell check by default and turn it on only when needed
set nospell
" setlocal spell!

set spelllang=en_us

" set hightlight style for spell check error


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 highlight                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlights the current word under the cursor
let g:highlight_current_keyword = 0
function! s:ToggleKeywordHighlight()
  if g:highlight_current_keyword == 0
    augroup highlight_keyword
      au!
      autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    augroup END
    let g:highlight_current_keyword = 1
  else
    augroup highlight_keyword
      au!
    augroup END
    match none
    let g:highlight_current_keyword = 0
  endif
endfunction

augroup hlcursor
  autocmd!
  nnoremap <silent> <leader>lw :<C-u>call <SID>ToggleKeywordHighlight()<CR>
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   format                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://vi.stackexchange.com/questions/19663/neovim-single-line-comments-also-format-the-next-line
" formatoptions is buffer local
" set formatoptions-=ro
autocmd! BufEnter * set formatoptions-=ro
