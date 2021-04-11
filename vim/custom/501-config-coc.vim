if !(&rtp =~ 'coc.nvim')
  finish
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  coc.nvim                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://stackoverflow.com/questions/13710364/viml-checking-if-function-exists/48178537
" https://github.com/neoclide/coc.nvim

" Give more space for displaying messages.
" set cmdheight=2

let g:coc_config_home='~/.vim'

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nnoremap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nnoremap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xnoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap if <Plug>(coc-funcobj-i)
onoremap af <Plug>(coc-funcobj-a)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" also need install neovim
" $> pip3 install neovim
augroup my_python
  autocmd!
  autocmd FileType python nnoremap <silent> <leader>si :<C-u>CocCommand python.sortImports<cr>
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 coc-golang                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" refer, https://octetz.com/posts/vim-as-go-ide
" add following setting to :CocConfig
"  {
"    "languageserver": {
"      "golang": {
"        "command": "gopls",
"        "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
"        "filetypes": ["go"]
"      }
"    }
"  }

" coc for python
" https://github.com/neoclide/coc-python
"
" :CocInstall coc-python
"
"
" coc for bash - needs bash-language-server installed firstly
" https://github.com/mads-hartmann/bash-language-server
" {
"   languageserver": {
"     "bash": {
"       "command": "bash-language-server",
"       "args": ["start"],
"       "filetypes": ["sh"],
"       "ignoredRootPaths": ["~"]
"     }
"   }
" }

" coc for rust
" https://github.com/fannheyward/coc-rust-analyzer
"
" :CocInstall coc-rust-analyzer

" coc for R
" https://github.com/neoclide/coc-r-lsp
"
" :CocInstall coc-r-lsp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  coc-nim                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/alaviss/nim.nvim
" https://medium.com/@moinmoti/nim-on-neovim-ec3cf44dd82c
"
" use `nimlsp` to do autocompletition with coc.nvim
" + 1. install `nimlsp` - https://github.com/PMunch/nimlsp
"   - `nimble install nimlsp`
"   - export `~/.nimble/bin` to $PATH.
" + 2. add following setting to :CocConfig
"   - https://github.com/neoclide/coc.nvim/wiki/Language-servers#register-custom-language-servers
"
"  {
"    "languageserver": {
"       "nim": {
"         "command": "nimlsp",
"         "rootPatterns": ["*.nimble", ".vim/", ".git/", ".hg/"],
"         "filetypes": ["nim", "nimble", "nims"]
"       }
"    }
"  }
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                coc-clojure                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" conjure, https://github.com/Olical/conjure
" :CocInstall coc-conjure


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    coc-java                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" https://github.com/neoclide/coc-java
" https://github.com/jqno/dotfiles/blob/main/vim/vimrc
" https://jqno.nl/post/2020/09/09/my-vim-setup/
" NOTE: download lombok.jar to /usr/local/share/lombok/
" :CocInstall coc-java coc-java-debug coc-json coc-vimlsp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                airline-coc                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/neoclide/coc.nvim/blob/master/doc/coc.txt
