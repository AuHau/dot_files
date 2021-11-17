function gpg-encrypt-me
    if not set -q GPG_ME
        echo "No your's GPG key set in GPG_ME variable!"
    end

    set recipients (gpg --list-keys --with-colons --fast-list-mode $GPG_ME | awk -F: '/^sub/{if ($12 == "e") {printf "-r 0x%s! ", $5}}') 
    gpg -r $recipients --armor --encrypt $argv

end

