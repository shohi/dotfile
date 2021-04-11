# README
vim configuration integrated with `tmux` and `iterm2` on MacOS using `neovim`
distribution.

- [ ] add Makefile for scripts installation

## Setup

```bash
git clone https://github.com/shohi/dotfile.git ~/tmpdotfile
cd ~/tmpdotfile

# create ~/.vim directory if not exist
mkdir -p ~/.vim
```

All following operations are taken under the directory - `~/tmpdotfile`. And
the scripts will be installed in `~/.vim` directory.

**1. install neovim**

```bash
# 1 install neovim
brew install neovim
```

**2. install vim-plug**

use [vim-plug](https://github.com/junegunn/vim-plug) as vim plugin manager.

```bash
# refer, <https://github.com/junegunn/vim-plug>
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# or clone repo and create soft link
mkdir -p ~/workshop/github/junegunn
git clone https://github.com/junegunn/vim-plug ~/workshop/github/junegunn/vim-plug
ln -s ~/workshop/github/junegunn/vim-plug/plug.vim ~/.vim/autoload/plug.vim

# or for neovim-only user
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

**3. install vim scripts**

```bash
# 1. use vimrc for `neovim`
# refer, <https://neovim.io/doc/user/nvim.html#nvim-from-vim>
mkdir -p ~/.config/nvim

# or create a soft link
# `ln -s $PWD/vim/nvim_init.vim ~/.config/nvim/init.vim`
cp $PWD/vim/nvim_init.vim ~/.config/nvim/init.vim

# 2. setup vimrc
# or create a soft link
# `ln -s $PWD/vim/vimrc ~/.vimrc`
mv $PWD/vim/vimrc ~/.vim/vimrc

# 3. custom settings
# ln -s $PWD/vim/custom ~/.vim/
# ln -s $PWD/vim/plugin ~/.vim/
# ln -s $PWD/vim/ftplugin ~/.vim/
# ln -s $PWD/vim/after ~/.vim/
# ln -s $PWD/vim/lua ~/.vim/
# ln -s $PWD/vim/config/coc-settings.json ~/.vim/
mv $PWD/vim/custom ~/.vim/
mv $PWD/vim/plugin ~/.vim/
mv $PWD/vim/ftplugin ~/.vim/
mv $PWD/vim/after ~/.vim/
mv $PWD/lua ~/.vim/
mv $PWD/vim/config/coc-settings.json ~/.vim/

# 4. customized snippets
# put `MyUltiSnips` folder to one of `runtimepath`, usually the runtimepath
# is `~/.vim`
# https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
#
# or create a soft link
# `ln -s $PWD/vim/UltiSnips ~/.vim/MyUltiSnips`
mkdir -p ~/.vim
mv $PWD/vim/UltiSnips ~/.vim/MyUltiSnips


```

**4. setup python-neovim**

install python client to nvim, some nvim plugins rely on the client.

```bash
# 1. install pyenv and pyenv-virtualenv
brew install pyenv
brew install pyenv-virtualenv

# 2. install latest python3 version
pyenv install -l

# zlib error fix
# https://stackoverflow.com/questions/50036091/pyenv-zlib-error-on-macos
#
# brew install zlib
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"
# pyenv install 3.8.5
pyenv install 3.8.5

# 3. create a virtualenv for neovim
pyenv virtualenv 3.8.5 neovim3

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
pyenv activate neovim3

# 4. install py-neovim package
pip install neovim

# 5. deactivate
pyenv deactivate
```

**5. setup tmux**

```bash
# 1. install tmux
brew install tmux

# 2. install tpm
# refer, <https://github.com/tmux-plugins/tpm>

# 3. update tmux config
# or create a soft link -- `ln -s $PWD/vim/tmux.conf ~/.tmux.conf`
mv $PWD/vim/tmux.conf ~/.tmux.conf

# 4. install tmux plugins
# $> tmux
# $> prefix + `I`
```

**6. setup iTerm2**
- color scheme -- nord-iterm2, <https://github.com/arcticicestudio/nord-iterm2>
- font -- `16pt Droid Sans Mono for Powerline` and **uncheck** `Use a different font for non-ASCII text` in *Profiles/Text* tab


**7. setup font and colorscheme**
- font
Patched fonts for Powerline users, https://github.com/powerline/fonts
- scheme
use `nord` color scheme for all - `vim/tmux/iTerm2`


**8. cleanup**

```bash
# if vimrc is created by soft link, it will be invalid after cleanup
rm -rf ~/tmpdotfile
```

## FAQ
1. such error occurs when opening `.go` file -- `..#SNR..go#lsp#DidOpen`

```vim
" reinstall related go binaries required by `vim-go`
:GoInstallBinaries`
```

2. the plugin `coc.nvim` requires `node`
```bash
brew install node
```

## Thanks
1. Tom Ryder's Dotfiles, https://sanctum.geek.nz/cgit/dotfiles.git
2. Attack of the 5,000-line vimrc, https://vimways.org/2018/from-vimrc-to-vim/

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
