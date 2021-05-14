" -*- vim: set ft=vim: -*-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  zenburn                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nord setting
" use nord color scheme as default
" colorscheme nord
colorscheme zenburn

" set nord comment color
" augroup nord-theme-overrides
"  autocmd!
"  " Use 'nord7' as foreground color for Vim comment titles.
"  autocmd ColorScheme nord highlight Comment ctermfg=3 guifg=#7b88a1
" augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NERDTree                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" refer, https://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
" refer, https://stackoverflow.com/questions/6467634/create-a-command-shortcut-for-nerdtree-in-vim-editor
noremap <leader>nr :NERDTreeFind<CR>
noremap <leader>ne :NERDTree<CR>
noremap <leader>nn :NERDTreeToggle<CR>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFocus<CR>
noremap <leader>no :<C-u>call <SID>only_current_and_nerdtree()<CR>
noremap <leader>ns :<C-u>call <SID>nerdtree_show()<CR>

" turn on case-sensitive sort
let g:NERDTreeCaseSensitiveSort=1

" Close all windows except the current one and NERDTree
" https://vi.stackexchange.com/questions/13331/close-all-windows-except-the-current-one-and-nerdtree
" only work on vim 8+
" command! Only call only_current_and_nerdtree()
function! s:only_current_and_nerdtree()
  let l:currentWindowID = win_getid()
  windo if win_getid() != l:currentWindowID && &filetype !=? 'nerdtree' | close | endif
endfunction

" Show file navigation in nerdtree and still keep focus on current window
" https://vi.stackexchange.com/questions/15918/quit-a-window-by-its-win-getid-identifier
" https://stackoverflow.com/questions/32802143/vim-function-to-switch-between-splits/32802251
function! s:nerdtree_show()
  if &filetype ==? "nerdtree"
    return
  endif

  let l:currentWin = winnr()
  execute 'NERDTreeFind'
  execute l:currentWin . "wincmd w"
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            NERDTree Git Plugin                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default bindings
" - next hunk in nerdtree -- `]c`
" - previous hunk in nerdtree -- `[c`


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-go/golang                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use vim-go's :GoDef short cut (gd)
" which work better that LanguageClient [LC]
let g:go_def_mapping_enabled = 1

" let g:go_gopls_enabled = 1
let g:go_def_mode = 'gopls'
let g:go_referrers_mode = 'gopls'
let g:go_info_mode = 'gopls'

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_test_show_name = 1

" highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" use quickfix instead of location list
" the unimpaired plugin makes location switch more pleasant :-)
" - *[q*     |:cprevious|
" - *]q*     |:cnext|
" - *[Q*     |:cfirst|
" - *]Q*     |:clast|
let g:go_list_type="quickfix"

" lint
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode',
      \ 'gosimple', 'ineffassign', 'staticcheck',
      \ 'structcheck', 'unused', 'varcheck']

" " fast editing go alternative files
" TODO:
" - GoKeyify
" - GoFillStruct
" - GoIfErr
augroup gogroup
  autocmd!
  autocmd FileType go nmap <silent> gr :GoReferrers<CR>
  autocmd FileType go nmap <silent> gi :GoImplements<CR>

  autocmd FileType go nmap <silent> <leader>ga :GoAlternate!<CR>
  autocmd FileType go nmap <silent> <leader>gl :GoMetaLinter<CR>
  autocmd FileType go nmap <silent> <leader>ec :GoErrCheck<CR>
  autocmd FileType go nmap <silent> <leader>ft :GoTestFunc<CR>
  autocmd FileType go nmap <silent> <leader>cc <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <silent> <leader>pt <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>gb :<C-u>call <SID>build_go_files()<CR>
  " TODO: add GoAddTag toggling
augroup end


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files() abort
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Rust                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1

augroup rustgroup
  autocmd!
  autocmd FileType rust nmap gd <Plug>(rust-def)
  autocmd FileType rust nmap gs <Plug>(rust-def-split)
  autocmd FileType rust nmap gx <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <leader>gd <Plug>(rust-doc)
  autocmd FileType rust nmap <leader>ta :RustTest! -- --nocapture<CR>
  autocmd FileType rust nmap <leader>tt :RustTest -- --nocapture<CR>
augroup end


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EasyAlign                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  rainbow                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable it by default as it does not work well with nord-theme.
" use :RainbowToggle to enable it later.
let g:rainbow_active = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-move                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/matze/vim-move
" set a custom modifier for key bindings to `Alt`
" set `C` to use `Ctrl`.
let g:move_key_modifier = 'A'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    ale                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/dense-analysis/ale

" keybinds for ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" linters
" nim linter already integrated in ale
" - 'nim': ['nimlsp', 'nimcheck']
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'go': ['golangci-lint'],
      \ }

" default - '--enable-all'
" let g:ale_go_golangci_lint_options='--fast'

" auto fix
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ }

" set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Snippets                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["MyUltiSnips", "UltiSnips"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" https://stackoverflow.com/questions/58081390/why-doesnt-ultisnips-listing-of-available-snippets-work
" https://github.com/SirVer/ultisnips/issues/859
" NOTE: work in insert-mode
let g:UltiSnipsListSnippets="<c-l>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 which-key                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" By default timeoutlen is 1000 ms
set timeoutlen=500

" After pressing leader the guide buffer will pop up
" when there are no further keystrokes within timeoutlen.
nnoremap <silent> <leader> :WhichKey ','<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  markdown                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable auto update toc on save as it doesn't work well
let g:vmt_auto_update_on_save = 0

" don't insert fence
let g:vmt_dont_insert_fence = 1

" vim-markdown
" Markdown Vim Mode (https://github.com/plasticboy/vim-markdown)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 easymotion                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'easymotion'
  " https://github.com/easymotion/vim-easymotion
  " Disable default mappings
  let g:EasyMotion_do_mapping = 0

  " Turn on case-insensitive feature
  let g:EasyMotion_smartcase = 1

  " `s{char}{char}{label}`
  " Need one more keystroke, but on average, it may be more comfortable.
  nnoremap s <Plug>(easymotion-overwin-f2)

  " JK motions: Line motions
  nnoremap <leader>j <Plug>(easymotion-j)
  nnoremap <leader>k <Plug>(easymotion-k)
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   tagbar                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set keybind for tagbar toggle
nnoremap <leader>tb :TagbarToggle<CR>

" golang tagbar setting
" refer-1, https://github.com/majutsushi/tagbar/wiki#google-go
" refer-2, https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" rust tagbar setting
" refer-1, https://github.com/majutsushi/tagbar/wiki#rust
" need `universal-ctags` installed first (https://github.com/universal-ctags/ctags)
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim

"  use following config to set ctagsbin, by default `ctagsbin` is search in PATH
"  TODO: how to use ENV variable in vimrc
"  'ctagsbin' : '/path/to/your/universal/ctags'
let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
      \ ],
      \ 'sro': '::',
      \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
      \ },
      \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  supertab                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perform all your vim insert mode completions with Tab
" run `:help supertab` for accessing supertab documentation.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-maximizer                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable default keymapping
let g:maximizer_set_default_mapping = 0

" set keybind for tagbar toggle
nnoremap <leader>ww :MaximizerToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-table                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Table Mode for instant table creation.

" set keybind for table model toggle
" map <Leader>tm :TableModeToggle<CR> " default

" for Markdown-compatible tables use
let g:table_mode_corner='|'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               terminal-mode                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting for terminals, see :help terminal-emulator for details

" map <Esc> to exit terminal-mode
" fix fzf terminal issue - https://github.com/junegunn/fzf.vim/issues/544
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" or use following snippets
" if has("nvim")
"  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
"  au FileType fzf tunmap <buffer> <Esc>
" endif

" use `ALT+{h,j,k,l}` to navigate windows from terminal mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-translator                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ------------------ vim-translator --------------------
" https://github.com/voldikss/vim-translator
" NOTE: no default mapping is set by default in vim-translator.
" let g:translator_window_enable_icon = 'false'

" Echo translation in the cmdline
nnoremap <silent> <leader>t <Plug>Translate
vnoremap <silent> <leader>t <Plug>TranslateV


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             vim-copy-filename                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/AdamWhittingham/vim-copy-filename
nnoremap <leader>fp :CopyRelativePath<CR>
nnoremap <leader>fl :CopyRelativePathAndLine<CR>
nnoremap <leader>fa :CopyAbsolutePath<CR>
nnoremap <leader>fn :CopyFileName<CR>
nnoremap <leader>fd :CopyDirectoryPath<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  targets                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugin that provides additional text objects
" https://github.com/wellle/targets.vim#quote-text-objects

" Targets.vim comes with five kinds for text objects:
"   * Pair text objects
"   * Quote text objects
"   * Separator text objects
"   * Argument text objects
"   * Tag text objects


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    goyo                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" goyo - distraction-free writing in Vim
" https://github.com/junegunn/goyo.vim
"
" limelight - Hyperfocus-writing in Vim.
" https://github.com/junegunn/limelight.vim

" goyo & limelight integration
augroup goyogroup
  autocmd!
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
augroup end

" kbd for goyo and limelight
" https://stackoverflow.com/questions/20579142/toggle-function-in-vim
let s:enable_limelight=0
function! s:toggle_limelight()
  if s:enable_limelight
    Limelight!
    let s:enable_limelight=0
  else
    Limelight
    let s:enable_limelight=1
  endif
endfunction

" toggle functions for goyo and limelight
nnoremap <silent> <leader>gl :<C-u>call <SID>toggle_limelight()<CR>
xnoremap <silent> <leader>gl :<C-u>call <SID>toggle_limelight()<CR>
nnoremap <silent> <leader>gg :Goyo<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              markdown-preview                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/iamcco/markdown-preview.nvim
" TODO: documentation for markdown-prview

"" do not close the preview tab when switching to other buffers
" https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
let g:mkdp_auto_close = 0

let s:enable_mkdp=0
function! s:toggle_mkdp()
  " TODO: check filetype
  " If current file is not .md file, do nothing
  if s:enable_mkdp
    MarkdownPreviewStop
    let s:enable_mkdp=0
  else
    MarkdownPreview
    let s:enable_mkdp=1
  endif
endfunction

nnoremap <silent> <leader>md :<C-u>call <SID>toggle_mkdp()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-header                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  vim-header behaves wiredly for header update, better
"  to use it for adding license only.
"
"  disable auto insert
let g:header_auto_add_header = 0
let g:header_field_timestamp = 0
" not clear how it works
let g:header_max_size = 7


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vim-autoformat                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/chiel92/vim-autoformat

" shell script formatter using google style
" needs `shfmt` installed, https://github.com/mvdan/sh
let g:formatdef_shfmt = '"shfmt -ci -i ".(&expandtab ? shiftwidth() : "0")'
let g:formatters_sh = ['shfmt']

" javascript
" let g:formatdef_JSCS= 'jscs --preset=airbnb'
" let g:formatters_javascript = ['jsbeautify_javascript']

" let g:autoformat_verbosemode=1

xnoremap <silent> <leader>ff :Autoformat<CR>
nnoremap <silent> <leader>ff :Autoformat<CR>

" protobuf - require clang-format installed firstly
" https://www.electronjs.org/docs/development/clang-format
" npm install -g clang-format

augroup autoformat_group
  autocmd!
  " auto format on save for [sh,py]
  " https://github.com/z0mbix/vim-shfmt/blob/master/plugin/shfmt.vim
  autocmd BufWritePre *.sh :Autoformat
  autocmd FileType sh autocmd BufWritePre <buffer> :Autoformat

  " TODO: add formatter for vimscript

  " auto format on save for python
  " autocmd BufWritePre *.py :Autoformat
  " autocmd FileType python autocmd BufWritePre <buffer> :Autoformat
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-airline                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-airline/vim-airline
" NOTE: vista.vim relies on this setting
" let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                airline-ale                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/dense-analysis/ale
" let g:airline#extensions#ale#enabled = 1
" let airline#extensions#ale#show_line_numbers = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 neoformat                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nim-lang
let g:neoformat_nim_custom= {
      \ 'exe': 'nimpretty',
      \ 'replace': 1,
      \ }

let g:neoformat_enabled_nim= ['custom']
let g:neoformat_run_all_formatters = 0
" let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 javascript                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup js_rc
  autocmd!
  autocmd BufNewFile,BufRead *.eslintrc,*.babelrc set syntax=json
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vimscript                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup nvim_rc
  autocmd!
  autocmd BufNewFile,BufRead *.vimrc,*.nvimrc set syntax=vim
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-rooter                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/airblade/vim-rooter
"
" To stop vim-rooter changing directory automatically
" Use `:Rooter` to invoke vim-rooter manually.
let g:rooter_manual_only = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    anzu                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/osyo-manga/vim-anzu
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
" nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" statusline
"set statusline=%{anzu#search_status()}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    yaml                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"
let g:indentLine_fileType = ['yaml', 'yml']
let g:indentLine_color_gui = "#D08770"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  beacon                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/DanilaMihailov/beacon.nvim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    fzf                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/fzf.vim

nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fh :History:<cr>

" help window
nnoremap <silent> <leader>h :Helptags<CR>

" search current file directory
" https://vi.stackexchange.com/questions/24927/open-fzf-in-current-directory-of-file-i-am-viewing
nnoremap <leader>fl :Files %:p:h<CR>

" search file in current working directory
" https://github.com/junegunn/fzf.vim/issues/360
nnoremap <leader>fc :<C-U>call fzf#vim#files(getcwd())<CR>

" search content in current working directory
" https://github.com/junegunn/fzf.vim#advanced-customization
" TODO: figure out what's going on here
" https://github.com/preservim/nerdtree/issues/254
function! s:GetNERDTreeRootOrWorkingDir()
  if !exists("g:NERDTree")
    return getcwd()
  endif

  if type(g:NERDTree.ForCurrentTab()) == v:t_dict
      return g:NERDTree.ForCurrentTab().getRoot().path.str()
  endif

  return getcwd()
endfunction

command! -bang -nargs=* Rgg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'dir': <SID>GetNERDTreeRootOrWorkingDir()}), <bang>0)

nnoremap <leader>fw :Rgg<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" To install useful key bindings and fuzzy completion
" $(brew --prefix)/opt/fzf/install
"
if has('nvim')
  lua require('lspfuzzy').setup {}
endif


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
"                               telescope.nvim                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: use fzf instead of telescope
" Using lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').command_history()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vista.vim                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" require nerd-fonts
" https://github.com/ryanoasis/nerd-fonts#font-installation
" brew tap homebrew/cask-fonts
" brew install --cask font-hack-nerd-font
" TODO: fix font issue

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                pomodoro.vim                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIXME: show status with airline
" set statusline=%#ErrorMsg#%{pomo#status_bar()}%#StatusLine#
nnoremap <leader>pm :PomodoroStatus<CR>
nnoremap <leader>ps :PomodoroStart<CR>
nnoremap <leader>pt :PomodoroStop<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  startify                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_disable_at_vimenter = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-test                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-test/vim-test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

let test#go#runner = 'gotest'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-dispatch                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>m<Esc> :AbortDispatch<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vim-qf                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://stackoverflow.com/questions/1747091/how-do-you-use-vims-quickfix-feature
nmap <silent> <leader>oo <Plug>(qf_qf_toggle)
nmap <C-j> <Plug>(qf_qf_previous)
nmap <C-k> <Plug>(qf_qf_next)
