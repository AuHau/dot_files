# Abbriviations
abbr -a gulp 'npm-exec gulp'
abbr -a bower 'npm-exec bower'
abbr -a s 'sudo'
abbr -a sai 'sudo apt-get install'
abbr -a gt 'git tag'
abbr -a gloo 'git log --all --decorate --oneline --graph'
abbr -a gct 'git checkout test'
abbr -a gpt 'git push; and git push --tags'
abbr -a jek 'bundle exec jekyll'

# System-wide settings
set -Ux EDITOR vim
set -x PAGER '~/.vim/bundle/vimpager/vimpager --no-passthrough'

set GEM_ROOT /var/lib/gems/2.3.0

__fish_complete_django django-admin.py
__fish_complete_django manage.py
