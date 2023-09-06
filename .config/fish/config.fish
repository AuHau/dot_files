# Abbriviations
abbr -a gt 'git tag'
abbr -a gloo 'git log --all --decorate --oneline --graph'
abbr -a gpt 'git push; and git push --tags'

# System-wide settings
set -Ux EDITOR vim
set -x PAGER '~/.vim/bundle/vimpager/vimpager --no-passthrough'
set -x pager '~/.vim/bundle/vimpager/vimpager --no-passthrough'


# My GPG key
set -x GPG_ME 0x5DF6C83ACFBD5247

# Custom Bins
fish_add_path ~/.bin

# Nim a Nimble
fish_add_path ~/.nimble/bin

# GO
set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gv="$GOPATH/bin/g"

# Secrets
source (status dirname)/config.secrets.fish
