LATEXMK:=./latexrun
LATEXMK_OPTS:=--color auto -Wall
figures=$(patsubst %.eps,%.pdf,$(wildcard figures/*.eps))
chapters=$(wildcard chapters/*.tex)

all: figures thesis | tidy

chapters: $(patsubst %.tex,%.pdf,$(wildcard ch*.tex)) | tidy

figures: ${figures}
thesis: .thesis-timestamp

clean: tidy
	@latexmk -C
	@rm -f .thesis-timestamp

tidy:
	@echo "[INFO] tidying up"
	@latexmk -c

.thesis-timestamp: thesis.tex phdthesis.sty ${figures} ${chapters}
	@echo "[INFO] compiling"
	@${LATEXMK} ${LATEXMK_OPTS} ${<}
	touch "${@}"

%.pdf: %.eps
	@echo "[INFO] converting " "${<}" " to pdf"
	@epstopdf "${<}" >"${@}"

%.pdf: %.tex ${figures} ${chapters} | tidy
	@${LATEXMK} ${LATEXMK_OPTS} ${<}
