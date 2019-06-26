function glignore -d "Add files go local ignore"
    if [ (count $argv) -eq 0 ]
        echo 'No files to add to ignore'
        return 1
    end

    if [ ! -d ./.git ]
        echo 'No .git folder found!'
        return 1
    end

    for file in $argv
        echo $file >> .git/info/exclude
    end
end
