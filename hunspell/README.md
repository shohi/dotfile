# README

settings of `hunspell` spell checker

## Install

```bash
# 1. install hunspell
brew install hunspell

# 2. install dictionaries
# download dictionaries and put them in aspell/hunspell's search path
# https://stackoverflow.com/questions/62464054/how-to-add-dictionary-path-in-search-path-for-hunspell-on-windows
# https://www.cnblogs.com/zhenyuyaodidiao/p/9288469.html
cd ~/Desktop/tmp && cd ~/Desktop/tmp
git clone https://github.com/LibreOffice/dictionaries
cp dictionaries/en/en* ~/Library/Spelling

# 3. check installed dictionaries
hunspell -D
```

## Personal Dictionary

```bash
# 1. download personal dicitionary file
cd ~/Desktop/tmp && cd ~/Desktop/tmp
git clone https://github.com/shohi/dotfile

# 2. copy to home dir and rename
# a customized dictionary file should be in the format `.hunspell_<dictname>`
cp dotfile/hunspell/hunspell_en_US ~/.hunspell_en_US

# or create a soft link
ln -s $PWD/dotfile/hunspell/hunspell_en_US ~/.hunspell_en_US
```

The personal dictionary [hunspell_en_US](./hunspell_en_US) is shamelessly copied from [redguardtoo/.aspell.en.pws](https://gist.github.com/redguardtoo/8a232c0aad3b4d712bef1c2e910b8b33) with some updates.

## Reference

1. hunspell/hunspell, https://github.com/hunspell/hunspell
2. redguardtoo/wucuo, https://github.com/redguardtoo/wucuo
