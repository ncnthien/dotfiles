#!/bin/bash

# Check brew version
if [[ -z "$(brew --version)" ]]; then
	echo "brew is not installed yet."
	exit 1
fi

# install package with brew
install_package_with_brew() {
	if [[ -z "$(brew list $1)" ]]; then
		echo "install $1"
		brew install $1
	fi
}

packages=('node' 'git' 'zsh' 'neovim' 'lazygit' 'ripgrep' 'tree-sitter')
packagesLength=${#packages[@]}

for ((i = 0; i < packagesLength; i++)); do
	install_package_with_brew ${packages[$i]}
done

# install oh-my-zsh
if [[ -z "$(omz version)" ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
