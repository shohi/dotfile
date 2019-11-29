# -*- vim: set ft=bash: -*-

if [[ -z "$_INIT_SH_LOADED" ]]; then
  _INIT_SH_LOADED=1
else
  return
fi

# TODO: add login shell check
function download_script() {
  mkdir -p ~/.local/config/bash && pushd -q "$_"

  if [[ ! -f "bash_profile" ]]; then
    curl -sSL -O "https://github.com/shohi/dotfile/raw/master/bash/bash_profile"
  fi

  popd -q
}

function install_script() {
  echo "source ~/.local/config/bash/bash_profile" >> ~/.bash_profile
  source ~/.bash_profile
}

#######################################################################
#                             main entry                              #
#######################################################################
function main() {
  download_script

  if [ $? -eq 0 ]; then
    install_script
  fi
}

main
