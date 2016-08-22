LATEXMK:=latexmk
LATEXMK_OPTS:=-pdf

all: thesis.pdf | tidy

%.pdf: %.tex
	@${LATEXMK} ${LATEXMK_OPTS} ${<}

clean: tidy
	@${LATEXMK} -C

tidy:
	@${LATEXMK} -c
