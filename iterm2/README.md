# README

iTerm2 best practice.

## KeyBindings

- `C-S n` - CTRL+SHIFT+n, duplicate Tab

## Setting

1. split with same working directory

> Open `Preferences` (`Cmd+,`) and switch to `Profiles` tab.
>
> `Working Directory`-> `Advanced Configuration` ->
> `Working Directory for New Split Panes` -> `Reuse previous session's directory`.
>
> Verified on v3.3.6.

2. change left option to `meta` key (https://stackoverflow.com/questions/196357/making-iterm-to-translate-meta-key-in-the-same-way-as-in-other-oses)

> Open `Preferences` (`Cmd+,`) and switch to `Profiles` tab.
> 
> `Keys` -> `Left Option Key` -> `Esc+`

## Tools
### 1. shell

**Oh-my-zsh** install (https://ohmyz.sh/#install)

```bash
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 2. fonts
install **powerline/fonts** (https://github.com/powerline/fonts)

```bash
mkdir tmp && cd tmp
git clone https://github.com/powerline/fonts.git

# click font file (.ttf or .otf) to install fonts

```

### 3. color scheme 
nord-iterm2, <https://github.com/arcticicestudio/nord-iterm2>
