source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    git
    git-extras

    python
    django

    gradle
    grails

    tmux
    
    thefuck
EOBUNDLES

antigen theme juanghurtado

antigen apply
