let python_highlight_all = 1 " Supposedly better python syntax


"setlocal omnifunc=pythoncomplete#Complete

" Error formats
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Error codes http://pypi.python.org/pypi/flake8
" W293 - blank line contains whitespace
" E701 - multiple statements on one line
" E128, E127 - Indent level of continuation lines
" E712 - comparisons to True
" E262 - inline comments have space after hash; but sphinx auto attributes
"        want a `#:`.
" let g:syntastic_python_checker_args='--ignore=W293,E701,E128,E127,E712,E262'
let g:syntastic_python_flake8_args='--ignore=W293,E701,E712,E262,E231'

setlocal completeopt-=preview "disable auto docstring popup with jedi-vim

python << EOF
import os
import sys

home = os.path.expanduser("~")
basepath = sys.executable
libpath = basepath.split('b')[0] + 'lib/python2.7/site-packages'
path1 = "/hd1/anaconda/lib/python2.7/site-packages"
path2 = home + "/anaconda/lib/python2.7/site-packages"
if not path2 in sys.path:
    sys.path.insert(0, path2)
if not path1 in sys.path:
    sys.path.insert(0, path1)
EOF
