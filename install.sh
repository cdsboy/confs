echo "Checking pre-reqs"
command -v zsh >/dev/null 2>&1 || { echo >&2 "zsh required to install. Aborting."; exit 1; }
#command -v gem >/dev/null 2>&1 || { echo >&2 "Ruby & Gem required to install. Aborting."; exit 1; }
#command -v hub >/dev/null 2>&1 || { echo >&2 "Hub is required for github module to work properly"; }

echo "Updating submodules"
git submodule init
git submodule update

echo "Copying dot-files"
cp -r .vim  ../.
cp -r antigen ../.antigen

if [ "$(uname)" == "Darwin" ]; then
    ln -s tmux.conf.osx ../.tmux.conf
    ln -s zshrc.osx ../.zshrc
    ln -s vimrc.osx ../.vimrc
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    ln -s .tmux.conf ../.
    ln -s .zshrc ../.
    ln -s .vimrc ../.
fi

echo "Installing vim bundles"
vim +BundleInstall +qall

#echo "Installing github gem"
#gem install github

echo "Done installing dot files"
