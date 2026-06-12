# Abbriviations
abbr -a gt 'git tag'
abbr -a gloo 'git log --all --decorate --oneline --graph'
abbr -a gpt 'git push; and git push --tags'

# System-wide settings
set -Ux EDITOR vim
set -x PAGER '/Users/adam/.vim/bundle/vimpager/vimpager --no-passthrough'
set -x pager '/Users/adam/.vim/bundle/vimpager/vimpager --no-passthrough'

eval (direnv hook fish)

# Pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# My GPG key
set -x GPG_ME 0x5DF6C83ACFBD5247

# GPG-Agent
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# nvm to alias current version
set -gx NVM_SYMLINK_CURRENT true

# Custom Bins
fish_add_path ~/.bin
fish_add_path ~/.local/bin

# Nim a Nimble
fish_add_path ~/.nimble/bin

# Cargo bins
fish_add_path ~/.cargo/bin

# GO
set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gv="$GOPATH/bin/g"

# Secrets
#source (status dirname)/config.secrets.fish

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
