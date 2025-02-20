#!bin/bash

# Author:       Aamnah <https://github.com/aamnah>
# Description : Script to install FBGrab - a linux utility
#               to take PNG screenshots from terminal using
#               framebuffer device
# Link:         https://github.com/aamnah/fbgrab

INSTALL_PATH="/opt/fbgrab"
# /opt/fbgrab/
# ├── bin/
# │   └── fbgrab
# └── share/
#     └── man/
#         └── man1/
#             └── fbgrab.1.gz

install_deps()
{
  # install dependencies for FBGrab
  echo "\n Installing dependencies... "
  sudo -qq apt update
  sudo -qq apt install -y build-essential libpng-dev zlib1g-dev git
}

install_fbgrab()
{
  echo "\n Install FBGrab..."

  # Clone the project from Github
  git clone https://github.com/aamnah/fbgrab.git
  cd fbgrab

  # build
  make

  # install in specified location
  make prefix=${INSTALL_PATH} install
}

cleanup()
{
  echo "\n Cleaning up..."

  # Delete the cloned repo
  cd ../
  rm -rf fbgrab
}

add_to_path() 
{
  echo "\n Updating PATH... "

  EXPORT_CMD="export PATH=\$PATH:${INSTALL_PATH}/bin"

  # Detect the shell
  USER_SHELL=$(basename "${SHELL}")
  # ${SHELL} could be '/bin/bash', '/bin/zsh'
  # basename will give you 'bash', 'zsh'

  # Determine the appropriate shell config file
  case "${USER_SHELL}" in
    bash)
      if [ -f "$HOME/.bashrc" ]; then
        CONFIG_FILE="$HOME/.bashrc"
      else
        CONFIG_FILE="$HOME/.bash_profile"
      fi
      ;;
    zsh)
      CONFIG_FILE="$HOME/.zshrc"
      ;;
    fish)
      CONFIG_FILE="$HOME/.config/fish/config.fish"
      EXPORT_CMD="set -Ux PATH $INSTALL_PATH \$PATH"
      ;;
    *)
    echo "Unsupported shell: $USER_SHELL"
    exit 1
    ;;
  esac

  # Check if PATH is already in file
  if grep -qxF "${EXPORT_CMD}" "${CONFIG_FILE}"; then
    echo "PATH already set in $CONFIG_FILE"
  else
    # Add install location to $PATH
    echo "${EXPORT_CMD}" >> "${CONFIG_FILE}"
    echo "Added PATH to ${CONFIG_FILE}"
  fi

  # Apply the changes
  if [ "${USER_SHELL}" != "fish"]; then
    source ${CONFIG_FILE}
  fi

  echo "\n 'fbgrab' has been added to PATH"
  echo "If it does not work, restart your terminal or run 'source $CONFIG_FILE' for the changes to take effect."
}

install_deps
install_fbgrab
cleanup
add_to_path