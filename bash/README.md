# README
bash configuration used on macOS - `.bash_profile`.


## Setup

```bash
# use `install.sh`
curl -sSL "https://github.com/shohi/dotfile/raw/master/bash/install.sh" | sh

# or manually
mkdir -p ~/.local/config && cd ~/.local/config
git clone https://github.com/shohi/dotfile.git

cd dotfile/bash && source bash_profile
```

## Tips

### Alias

1. alias for creating k8s secret

```bash
export [NS]-SECRET=`cat [/path/to/<ns>-secret.yaml]`

alias k8s_create_secet='echo ${[NS]-SECRET} | kubectl create -f -'
```


## FAQ
1. how to source `.bash_profile` automatically when using `oh-my-zsh`? ([link](https://superuser.com/questions/866683/iterm-zsh-not-reading-bashrc-or-bash-profile)

```bash
# append the line to the end of `~/.zshrc`
source ~/.bash_profile
```

## Reference

1. 提高效率从编写init.sh开始, <https://zhuanlan.zhihu.com/p/50080614>
2. holman/dotfils, <https://github.com/holman/dotfiles>
3. mathiasbynens/dotfiles, <https://github.com/mathiasbynens/dotfiles>
4. Install Rust, <https://www.rust-lang.org/tools/install>
