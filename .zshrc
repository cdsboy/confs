source .antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    git-extras

    python
    django

    gradle
    grails

    tmux
    jimhester/per-directory-history
EOBUNDLES

antigen theme juanghurtado

antigen apply
