# README
vim configuration integrated with `tmux` and `iterm2` on MacOS using `neovim` distribution.


## Setup

```bash
git clone https://github.com/shohi/dotfile.git ~/tmpdotfile
cd ~/tmpdotfile
```

All following operations are taken under the directory - `~/tmpdotfile`.

### neovim

```bash
# 1 install neovim
brew install neovim

# 2 install vim-plug
# refer, <https://github.com/junegunn/vim-plug>

# 3 update vim config
# or create a soft link -- `ln -s $PWD/vim/vimrc ~/.vimrc`
mv $PWD/vim/vimrc ~/.vimrc

# 4 use vimrc for `neovim`
# refer, <https://neovim.io/doc/user/nvim.html#nvim-from-vim>
mkdir -p ~/.config/nvim && cp $PWD/vim/nvim_init.vim ~/.config/nvim/init.vim

# 5 customized snippets
#
# put `MyUltiSnips` folder to one of `runtimepath`, usually the runtimepath is `~/.vim`
# https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
#
# or create a soft link -- `ln -s $PWD/vim/UltiSnips ~/.vim/MyUltiSnips`
mkdir -p ~/.vim
mv $PWD/vim/UltiSnips ~/.vim/MyUltiSnips

```

### python-neovim

install python client to nvim, some nvim plugins rely on the client.

```bash
# 1 install pyenv and pyenv-virtualenv
brew install pyenv
brew install pyenv-virtualenv

# 2.2 install latest python3 version
pyenv list -l
pyenv install 3.8.5

# 2.2 create a virtualenv for neovim
pyenv virtualenv 3.8.5 neovim3
pyenv activate neovim3

# 2.3 install py-neovim package
pip install neovim

# 2.4 deactivate
pyenv deactivate
```

### tmux

```bash
# 1. install tmux
brew install tmux

# 2. install tpm
# refer, <https://github.com/tmux-plugins/tpm>

# 3. update tmux config
# or create a soft link -- `ln -s $PWD/vim/tmux.conf ~/.tmux.conf`
mv $PWD/vim/tmux.conf ~/.tmux.conf

# 4 install tmux plugins
# $> tmux
# $> prefix + `I`
```

### iTerm2
refer section `iterm2` for details

### font
refer `font` section for details

### cleanup

```bash
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

### Coc.nvim

require `node`
```bash
brew install node
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
