.PHONY: all complete concise watch clean

all: complete concise

complete: resume.typ
	typst compile resume.typ resume-complete.pdf

concise: resume.typ
	sed 's/^#let complete = true/#let complete = false/' resume.typ | typst compile - resume-concise.pdf

watch: resume.typ
	typst watch resume.typ resume.pdf

clean:
	rm -f resume-complete.pdf resume-concise.pdf resume.pdf
