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
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# or download repo
mkdir -p ~/workshop/github/ohmyzsh
git clone https://github.com/ohmyzsh/ohmyzsh ~/workshop/github/ohmyzsh/ohmyzsh

sh -c ~/workshop/github/ohmyzsh/ohmyzsh/tools/install.sh

```

### 2. fonts
install **powerline/fonts** (https://github.com/powerline/fonts)

```bash
mkdir -p ~/workshop/github/powerline
git clone https://github.com/powerline/fonts.git ~/workshop/github/powerline/fonts

# click font file (.ttf or .otf) to install fonts
# e.g. Droid Sans Mono For Powerline
```

set font size to `24` and select font - `Droid Sans Mono For Powerline`.

### 3. color scheme
Install colorscheme - `zenburn` and `nord`

```bash
open -a iTerm iterm2/colors/nord.itermcolors
open -a iTerm iterm2/colors/zenburn.itermcolors
```

1. nord-iterm2, <https://github.com/arcticicestudio/nord-iterm2>
2. zenburn-iterm2, https://github.com/jabbas/zenburn
