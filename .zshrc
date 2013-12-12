source .antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    git-extras
    github

    python
    django

    gradle

    tmux
    jimhester/per-directory-history
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme juanghurtado

antigen apply

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.2:/usr/games/bin

eval `keychain --eval --timeout 180 ~/.ssh/id_rsa`
