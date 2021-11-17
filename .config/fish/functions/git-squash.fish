function git-squash
    set -l HELP_TEXT 'Git-Squash - Squash COMMIT_COUNT latest commits

USAGE
 $ git-squash [-m|--messages] COMMIT_COUNT

OPTIONS
 -m, --messages         will prepopulate the new commit with previous commits messages
'
    if test -z "$argv"
        echo $HELP_TEXT
        return
    end

    argparse --name 'git-squash' --min-args 1 --max-args 1 'm/messages' -- $argv
    or return 1

    set -l commit_count $argv
    if not string match -qr '^-?\d+$' -- $commit_count 
        or test $commit_count -le 0
        echo "git-squash: COMMIT_COUNT has to be positive integer!" 1>&2
        return 1
    end

    git reset --soft HEAD~$commit_count
    
    if test -n "$_flag_messages"
        git commit --edit -m (git log --format=%B --reverse HEAD..HEAD@{1})
    else
        git commit
    end

end

