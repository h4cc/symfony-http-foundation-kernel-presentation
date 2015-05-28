#
# Makefile for using pandoc and generating a Beamer PDF presentation.
#
# Author: Julius Beckmann
#

all:
	@echo "Use 'generate', 'show' ant 'watch'"

# Append this for using a own Font
# --latex-engine=xelatex -V mainfont='MyriadPro-Regular'
# 
generate:
	pandoc -f markdown -t beamer --slide-level 2 -o Presentation.pdf --highlight-style tango -V theme:Silpion --include-in-header preamble.tex --latex-engine=xelatex Presentation.md

watch:
	while true; do inotifywait -e modify -r . ; make generate ; done

show:
	evince Presentation.pdf &
