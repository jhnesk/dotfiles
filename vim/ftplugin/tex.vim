
setlocal makeprg=pdflatex\ %\ &&\ bibtex\ `basename\ %\ .tex`\ &&\ pdflatex\ %
