# Defined in /tmp/fish.zEI3cJ/npm-exec.fish @ line 2
function npm-exec
	#PATH=$(npm bin):$PATH	
    set -lx PATH (npm bin) $PATH 
    eval $argv
end
