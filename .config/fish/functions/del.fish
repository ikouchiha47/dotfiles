function del -d "moves stuff to /tmp"
	set len (count $argv)
	if test (count $argv) -eq 0
		printf "%s\n" "del: missing file operand" "Try del --help"
		return 1
	end
	
	if test $argv = "--help"; or test $argv = "-h"
		printf "%s\n" "Usage: del SOURCE..." "Soft removes FILE(s), moves to /tmp."
		return 1
	end
	mv $argv /tmp/
end
