dir /usr/src/glibc/glibc-2.23/malloc/

set print pretty on

source /home/ubuntu/.gdbinit-gef.py
gef config context.nb_lines_code 40

define n
next
heap chunks
heap bins
end
