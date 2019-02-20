
abbr -a gulp 'npm-exec gulp'
abbr -a bower 'npm-exec bower'
abbr -a s 'sudo'
abbr -a sai 'sudo apt-get install'
abbr -a gt 'git tag'
abbr -a gloo 'git log --all --decorate --oneline --graph'
abbr -a gct 'git checkout test'
abbr -a gpt 'git push; and git push --tags'
abbr -a jek 'bundle exec jekyll'
abbr -a o 'xdg-open'
abbr setclip "xclip -selection c"
abbr getclip "xclip -selecti   on c -o"

set -Ux EDITOR vim

set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER 'less'
set -x EDITOR 'vim'

set GEM_ROOT /var/lib/gems/2.3.0

__fish_complete_django django-admin.py
__fish_complete_django manage.py

eval (direnv hook fish)

# Pyenv
set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# GPG-Agent
set GPG_TTY (tty)
set SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# GO
set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gv="$GOPATH/bin/g"
