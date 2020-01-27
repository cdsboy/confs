source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    git-extras

    python

    tmux
EOBUNDLES

antigen theme juanghurtado

antigen apply

ssh-add ~/.ssh/id_rsa &>/dev/null

alias yarn=yarnpkg

export PATH="$(yarn global bin):$HOME/.cargo/bin:$PATH"
export EDITOR="/usr/bin/vim"
