# Abbriviations
abbr -a s 'sudo'
abbr -a sai 'sudo apt-get install'
abbr -a gt 'git tag'
abbr -a gloo 'git log --all --decorate --oneline --graph'
abbr -a gct 'git checkout test'
abbr -a gpt 'git push; and git push --tags'
abbr -a hl 'hyperlayout'

# System-wide settings
set -Ux EDITOR vim
set -x PAGER '~/.vim/bundle/vimpager/vimpager --no-passthrough'
set -x pager '~/.vim/bundle/vimpager/vimpager --no-passthrough'

eval (direnv hook fish)

# Pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
fish_add_path ~/Library/Python/3.9/bin/

# My GPG key
set -x GPG_ME 0x5DF6C83ACFBD5247

# GPG-Agent
set GPG_TTY (tty)
set SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# nvm to alias current version
set -gx NVM_SYMLINK_CURRENT true

# Homebrew
fish_add_path /opt/homebrew/bin

# Custom Bins
fish_add_path ~/.bin

# GO
set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gv="$GOPATH/bin/g"
