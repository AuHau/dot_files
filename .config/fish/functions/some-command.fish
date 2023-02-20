function some-command
    set filename "/Users/adam/example.log"

    if test -z "$filename"
        echo "file not specified or does not exists"
        return 1
    end

    cat "$filename" | while read -l line
        echo "$line"
        sleep (math (random 0 1000)/1000)
    end
end

