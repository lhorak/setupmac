#!/usr/bin/env bash

echo "Starting the installation script"

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# Check for Homebrew, install if not present
if hash brew &>/dev/null; then
	echo_ok "Homebrew already installed. Getting updates..."
	brew update
	brew doctor
else
	echo_warn "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew..."
brew update

brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names
brew install findutils
brew install zsh # zshell
brew install bash # bash just in case


BREW_PACKAGES=(
  cask
  wget
  git
  gist
  hub
  micro # default editor of choice
  node
  nvm
  yarn
  openssl
  wrk # http benchmarking tool
  docker
  docker-compose
  pipenv
  python3
  thefuck
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  ssh-copy-id
  xz
  mackup
  htop
  gatsby-cli
)

echo "Installing homebrew packages..."
brew install ${BREW_PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing homebrew cask..."
brew tap caskroom/cask

# Some apps don't have cask formula, those need to be installed manually
# Magnet - https://apps.apple.com/cz/app/magnet/id441258766
# Spark Mail - https://apps.apple.com/us/app/spark-email-app-by-readdle/id1176895641
# 2Do - https://apps.apple.com/us/app/2do/id477670270
CASK_APPS=(
  # Core everyday apps
  adobe-acrobat-reader
  the-unarchiver
  dashlane
  google-chrome
  firefox
  # DEV Apps
  iterm2
  visual-studio-code
  postman
  gpg-suite
  pgadmin4
  mysqlworkbench
  robo-3t
  pritunl
  xquartz
  docker
  forklift
  virtualbox
  dbeaver-community
  # Communication tools
  slack
  zoomus
  whatsapp
  telegram
  keybase
  skype
  # multimedia
  vlc
  spotify
  teamviewer
)

echo "Installing cask apps..."
brew cask install ${CASK_APPS[@]}

QL_CASKS=(
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  qlimagesize
  quicklook-csv
  quicklook-json
  epubquicklook
)

echo "Installing quicklook plugins..."
brew cask install "${QL_CASKS[@]}"

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
	font-clear-sans
	font-consolas-for-powerline
	font-dejavu-sans-mono-for-powerline
	font-fira-code
	font-fira-mono-for-powerline
	font-inconsolata
	font-inconsolata-for-powerline
	font-liberation-mono-for-powerline
	font-menlo-for-powerline
	font-roboto
)
brew cask install "${FONTS[@]}"



# Set zsh as default shell
echo "Setting zsh as default shell..."
chsh -s /bin/zsh

