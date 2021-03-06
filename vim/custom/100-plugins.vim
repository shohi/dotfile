" -*- vim: set ft=vim: -*-

" use vim-plug as plugin manager.

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" declare the list of plugins
" surround
Plug 'tpope/vim-surround'

" sleuth.vim: Heuristically set buffer options
Plug 'tpope/vim-sleuth'

" NERDtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dsimidzija/vim-nerdtree-ignore'

" Comenter
if has('nvim')
  Plug 'tpope/vim-commentary'
else
  Plug 'b3nj5m1n/kommentary'
endif

" git status
Plug 'tpope/vim-fugitive'

" vim-signify - Show a diff using Vim its sign column
Plug 'mhinz/vim-signify'

" async lint engine
Plug 'dense-analysis/ale'

" rust.vim
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" airline.vim - lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" yaml
Plug 'stephpy/vim-yaml'
Plug 'Yggdroot/indentLine', { 'for': 'yaml' }
Plug 'pedrohdz/vim-yaml-folds'

" markdown preview plugin
" Plug 'junegunn/vim-xmark', { 'do': 'make' } " not work on macOS 10.14.6
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" markdown toc (table of contents)
Plug 'mzlogin/vim-markdown-toc'

" markdown syntax
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" table mode (also support markdown table)
Plug 'dhruvasagar/vim-table-mode'

" multiple selection plugin (a.k.a column edit mode)
Plug 'terryma/vim-multiple-cursors'

" Elixir and formatter
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" permut - swap columns
Plug 'jlemetay/permut'

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" nim-lang
" FIXME: only support neoviim
Plug 'alaviss/nim.nvim'

" translator
Plug 'voldikss/vim-translator'

" undotree
Plug 'mbbill/undotree'

" repeat
Plug 'tpope/vim-repeat'

" unimpaired - pairs of handy bracket mappings
" Plug 'tpope/vim-unimpaired'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" match-up
Plug 'andymass/vim-matchup'

" matchquote
Plug 'airblade/vim-matchquote'

" rainbow
Plug 'frazrepo/vim-rainbow'

" vim-move
Plug 'matze/vim-move'

" beacon
Plug 'danilamihailov/beacon.nvim'

" ultisnips
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" whichkey
Plug 'liuchengxu/vim-which-key'

" easymotion
" https://github.com/easymotion/vim-easymotion
" Plug 'easymotion/vim-easymotion'

" tagbar
Plug 'majutsushi/tagbar'

" supertab for autocomplete
Plug 'ervandew/supertab'

" window maximizer
Plug 'szw/vim-maximizer'

" copy-filename
Plug 'adamwhittingham/vim-copy-filename'

" targets provides additional text objects
Plug 'wellle/targets.vim'

" goyo - Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" visual indent
Plug 'nathanaelkane/vim-indent-guides'

" A git commit browser in Vim
Plug 'junegunn/gv.vim'

" Easily adds brief author info and license headers
Plug 'alpertuna/vim-header'

" shell interface
Plug 'shougo/deol.nvim'

" quick run
Plug 'thinca/vim-quickrun'

" R support
Plug 'jalvesaq/nvim-r'

" code formatter
" NOTE: vim-autoformat does not support formatters which can't read input
" from stdin or write output to stdout.
Plug 'chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'

" javascript
Plug 'pangloss/vim-javascript'

" emmet
Plug 'mattn/emmet-vim'

" Async Run
Plug 'skywind3000/asyncrun.vim'

" Vim Rooter
Plug 'airblade/vim-rooter'

" Stylus
Plug 'iloginow/vim-stylus'

" Easily substitute
Plug 'tpope/vim-abolish'

" Toml
Plug 'cespare/vim-toml'

" quickfix
Plug 'romainl/vim-qf'

" endwise
" Plug 'tpope/vim-endwise'

" vim-slash - enhance in-buffer search
" Plug 'junegunn/vim-slash'

" colorschemes
"   * vim-colorschemes - one colorscheme pack to rule them all (inactive)
"     - Plug 'flazz/vim-colorschemes'
"   * nord color theme
"     - Plug 'arcticicestudio/nord-vim'
"     - already included in `awesome-vim-colorschemes`
" Zenburn theme
Plug 'jnurmine/zenburn'
Plug 'rafi/awesome-vim-colorschemes'

" scratch buffer
Plug 'mtth/scratch.vim'

" vim-orgmode
Plug 'jceb/vim-orgmode'

" anzu - show search status
Plug 'osyo-manga/vim-anzu'

" fzf - A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" wordmotion - More useful word motions for Vim
Plug 'chaoren/vim-wordmotion'

" vim-lua - Improved Lua 5.3 syntax and indentation support for Vim.
Plug 'tbastos/vim-lua'

" fennel.vim -  Syntax highlighting for Fennel
Plug 'bakpakin/fennel.vim'


" git-blame -  Git Blame plugin for Neovim written in Lua
" Plug 'f-person/git-blame.nvim'

" neoterm -  Wrapper of some vim/neovim's :terminal functions.
Plug 'kassio/neoterm'

" vimpeccable - Neovim plugin that allows you to easily write your .vimrc in lua
" https://github.com/svermeulen/vimpeccable
" Plug 'svermeulen/vimpeccable'
" Plug 'svermeulen/vimpeccable-lua-vimrc-example'

" vim-rt-format - Prettify Current Line on Enter !!
Plug 'skywind3000/vim-rt-format', { 'do': 'pip3 install autopep8' }

" vim-floaterm - Terminal manager for (neo)vim
Plug 'voldikss/vim-floaterm'

" vim-json - A better JSON for Vim
Plug 'elzr/vim-json'
" vim-jsonc - Vim syntax highlighting plugin for JSON with C-style line (//) and block (/* */) comments.
Plug 'kevinoid/vim-jsonc'

" vim-highlightedyank - Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" vim-sandwich - plugins to search/select/edit sandwiched textobjects.
Plug 'machakann/vim-sandwich'

" vista - Viewer & Finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim'

" vim-lastplace -  Intelligently reopen files at your last edit position in Vim.
Plug 'farmergreg/vim-lastplace'

" pomodoro.vim - Bring the beauty of the Pomodoro technique to (Neo)Vim
Plug 'tricktux/pomodoro.vim'

" vim-test - Run your tests at the speed of thought
Plug 'vim-test/vim-test'

" vim-startify - The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" vim-dotoo -  Org-mode like task logging & time tracking in Vim
Plug 'dhruvasagar/vim-dotoo'

" vimspector - A multi-language debugging system for Vim
Plug 'puremourning/vimspector'

" dispatch.vim - Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" vim-vue
Plug 'posva/vim-vue'

" nvim only plugins
if has('nvim')

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                lua-utils                                "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " plenary.nvim - All the lua functions I don't want to write twice.
  Plug 'nvim-lua/plenary.nvim'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                nvim lsp                                 "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " nvim language server related
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'

  " nvim-jdtls -  Extensions for the built-in LSP support in Neovim for
  " eclipse.jdt.ls
  " Plug 'mfussenegger/nvim-jdtls'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                                complete                                 "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " NOTE: nvim-compe installed but not used
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/nvim-compe'
  Plug 'rafamadriz/friendly-snippets'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "                               nvim tools                                "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " gitabra -  Magit-lite for neovim
  Plug 'Odie/gitabra'

  " hop.nvim -  Neovim motions on speed
  Plug 'phaazon/hop.nvim'

  " telescope.nvim -  Find, Filter, Preview, Pick. All lua, all the time.
  Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " interactive real time neovim scratchpad for embedded lua engine
  Plug 'rafcamlet/nvim-luapad'

  " numb.nvim -  Peek lines just when you intend
  Plug 'nacro90/numb.nvim'

  " auto-session - A small automated session manager for Neovim
  " NOTE: require setup `prehook` to close nerdtree before save
  " not work well with NERDTree automatically
  Plug 'rmagatti/auto-session'

  " vim-keysound - Play typewriter sound in Vim when you are typing a letter
  " FIXME: not work with vim
  Plug 'skywind3000/vim-keysound'

  " nvim-peekup -  dynamically show content of vim registers
  Plug 'gennaro-tedesco/nvim-peekup'

  " nvim-colorizer - The fastest Neovim colorizer
  Plug 'norcalli/nvim-colorizer.lua'

  " NOTE: only work for neovim
  " https://oli.me.uk/getting-started-with-clojure-neovim-and-conjure-in-minutes/
  Plug 'Olical/conjure', { 'tag': 'v4.15.0' }

  " nvim-lspfuzzy -  A Neovim plugin to make the LSP client use FZF
  Plug 'ojroques/nvim-lspfuzzy'

  " Nvim Treesitter configurations and abstraction layer
  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
