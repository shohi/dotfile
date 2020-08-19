# README
vim configuration integrated with `tmux` and `iterm2` on MacOS using `neovim` distribution.


## Setup

```bash
git clone https://github.com/shohi/dotfile.git ~/tmpdotfile

# 1. vim

# 1.1 install neovim
brew install neovim

# 1.2 install vim-plug
# refer, <https://github.com/junegunn/vim-plug>

# 1.3 update vim config
# or create a soft link -- `ln -s ~/tmpdotfile/vim/vimrc ~/.vimrc`
mv ~/tmpdotfile/vim/vimrc ~/.vimrc

# 1.4 use vimrc for `neovim`
# refer, <https://neovim.io/doc/user/nvim.html#nvim-from-vim>
mkdir -p ~/.config/nvim && copy ~/tmpdotfile/vim/nvim_init.vim ~/.config/nvim/init.vim

# 1.5 customized snippets
# or create a soft link -- `ln -s ~/tmpdotfile/vim/UltiSnips ~/.vimrc/MyUltiSnips`
mv ~/tmpdotfile/vim/UltiSnips ~/.vimrc/MyUltiSnips

# 2. tmux

# 2.1 install tmux
brew install tmux

# 2.2 install tpm
# refer, <https://github.com/tmux-plugins/tpm>

# 2.3 update tmux config
# or create a soft link -- `ln -s ~/tmpdotfile/vim/tmux.conf ~/.tmux.conf`
mv ~/tmpdotfile/vim/tmux.conf ~/.tmux.conf

# 2.4 install tmux plugins
# $> tmux
# $> prefix + `I`

# 3. iterm2
# refer section `iterm2` for details


# 4. font
# refer `font` section for details

# 5. cleanup
# if `.vimrc` is created by soft link, it will be invalid after cleanup
rm -rf ~/tmpdotfile

```

### vim-plug
use `vim-plug` as Vim Plugin Manager, make sure it is installed. (https://github.com/junegunn/vim-plug)

```bash
# for neovim user
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```

## iTerm2

* color scheme -- nord-iterm2, <https://github.com/arcticicestudio/nord-iterm2>
* font -- `16pt Droid Sans Mono for Powerline` and **uncheck** `Use a different font for non-ASCII text` in _Profiles_/_Text_ tab

## font
Patched fonts for Powerline users, https://github.com/powerline/fonts

## scheme
use `nord` color scheme for all - `vim/tmux/iTerm2`


## FAQ
1. such error occurs when opening `.go` file -- `..#SNR..go#lsp#DidOpen`

    reinstall related go binaries required by `vim-go`, `:GoInstallBinaries`


## Reference

1. `neovim`, <https://github.com/neovim/neovim>
2. `nvim for vim`, <https://neovim.io/doc/user/nvim.html#nvim-from-vim>
3. `vim-plug`-- minimalist Vim Plugin Manager, <https://github.com/junegunn/vim-plug>
4. `tmux`, <https://github.com/tmux/tmux>
5. `tpm` -- Tmux Plugin Manager, <https://github.com/tmux-plugins/tpm>
6. `nord` -- nord color scheme for iTerm2, <https://github.com/arcticicestudio/nord-iterm2>
7. `fonts` -- Patched fonts for Powerline users, <https://github.com/powerline/fonts>
8. The Ultimate Vim Configuration, <https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim>
9. Google Vimscript Style Guide, <https://google.github.io/styleguide/vimscriptguide.xml>
