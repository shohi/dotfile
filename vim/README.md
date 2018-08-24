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
mv ~/tmpdotfile/vim/vimrc ~/.vimrc

# 1.4 use vimrc for `neovim`
# refer, <https://neovim.io/doc/user/nvim.html#nvim-from-vim> 
mkdir -p ~/.config/nvim && copy ~/tmpdotfile/vim/nvim_init.vim ~/.config/nvim/init.vim

# 2. tmux

# 2.1 install tmux
brew install tmux

# 2.2 install tpm
# refer, <https://github.com/tmux-plugins/tpm> 

# 2.3 update tmux config
mv ~/tmpdotfile/vim/tmux.conf ~/.tmux.conf

# 2.4 install tmux plugins
# $> tmux
# $> prefix + `I` 

# 3. iterm2
# refer section `iterm2` for details 


# 4. font
# refer `font` section for details

# 5. cleanup
rm -rf ~/tmpdotfile

```

## iTerm2

* color scheme -- nord-iterm2, <https://github.com/arcticicestudio/nord-iterm2>
* font -- `16pt Droid Sans Mono for Powerline` and **uncheck** `Use a different font for non-ASCII text`

## font
Patched fonts for Powerline users, https://github.com/powerline/fonts

## scheme
use `nord` color scheme for all - `vim/tmux/iTerm2`


## Reference

1. `neovim`, <https://github.com/neovim/neovim>
2. `nvim for vim`, <https://neovim.io/doc/user/nvim.html#nvim-from-vim>
3. `vim-plug`-- minimalist Vim Plugin Manager, <https://github.com/junegunn/vim-plug>
4. `tmux`, <https://github.com/tmux/tmux>
5. `tpm` -- Tmux Plugin Manager, <https://github.com/tmux-plugins/tpm>
6. `nord` -- nord color scheme for iTerm2, <https://github.com/arcticicestudio/nord-iterm2>
7. `fonts` -- Patched fonts for Powerline users, <https://github.com/powerline/fonts> 
