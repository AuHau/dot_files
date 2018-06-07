
# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

abbr -a gulp 'npm-exec gulp'
abbr -a bower 'npm-exec bower'
abbr -a s 'sudo'
abbr -a sai 'sudo apt-get install'
abbr -a gt 'git tag'
abbr -a gloo 'git lg'
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

eval (python -m virtualfish)
eval (direnv hook fish)

# GO
set -x PATH "/usr/local/go/bin" $PATH
set -x -U GOPATH $HOME/.go
set -x PATH "$GOPATH/bin" $PATH

# Pyenv
set -x PYENV_ROOT "/home/adam/.pyenv"
set -x PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
