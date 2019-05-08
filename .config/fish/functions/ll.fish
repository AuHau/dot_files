function ll
    if test (count $argv) -eq 0
        ls -la
        return
    else if test (count $argv) -ne 1
        echo "You must provide exactly one argument/path!"
        return
    end

    set path $argv[1]

    if test -d $path
        ls -la $path
    else
        eval $PAGER $path
    end
end

