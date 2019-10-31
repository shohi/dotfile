# README
SSH configuration - `~/.ssh/config`.

## Setup

1. downloand `config` file and put `config` to `~/.ssh/config`.

```bash
# backup previous config
mkdir ~/.ssh && [[ -f "$(realpath ~/.ssh/config)" ]] && mv ~/.ssh/config ~/.ssh/config.bak

# install
curl -L https://raw.githubusercontent.com/shohi/dotfile/master/ssh/config -o ~/.ssh/config
```

2. change `REMOTE_ADDRESS_RANGE`/`DEFAULT_USER_FOR_REMOTE`/`KEY_PAIR` to your own settings.
