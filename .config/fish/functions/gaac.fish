# Defined in /tmp/fish.cCTycg/gaac.fish @ line 1
function gaac
	git add --all
    git commit -m "$argv[1]"
end
