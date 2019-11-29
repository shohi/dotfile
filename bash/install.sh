# -*- vim: set ft=bash: -*-

if [[ -z "$_INIT_SH_LOADED" ]]; then
  _INIT_SH_LOADED=1
else
  return
fi

# TODO: add login shell check
function init_repo() {
  mkdir -p ~/.local/config/shohi && pushd -q "$_"

  if [[ -d "dotfile" ]]; then
    pushd -q $PWD/dotfile
    git pull
    popd -q
  else
    git clone https://github.com/shohi/dotfile.git
  fi

  popd -q
}

function install_script() {
  echo "source ~/.local/config/shohi/dotfile/bash/bash_profile" >> ~/.bash_profile
  source ~/.bash_profile
}

#######################################################################
#                             main entry                              #
#######################################################################
function main() {
  init_repo
  install_script
}

main
