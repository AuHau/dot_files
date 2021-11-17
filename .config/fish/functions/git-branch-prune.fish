function git-branch-prune -d "Removes local branches that are gone on upstream" 
    git fetch -p ; and git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
end
