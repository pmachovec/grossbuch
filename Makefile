# Must be on PATH: acrobat, pdflatex

project = grossbuch

# Kills Acrobat Reader, assembles the document and displays PDF in Acrobat Reader. Fails if the PDF is already opened in another tool than Acrobat Reader.
killbuildview: killacrobat build view

# Assembles the document. Fails if the PDF is opened.
build:
	@pdflatex $(project).tex
	@pdflatex $(project).tex
	@makeindex $(project).idx
	@pdflatex $(project).tex
	@pdflatex $(project).tex

# Single pdfLaTex compilation, mainly for simple verification.
pdflatex:
	@pdflatex $(project).tex

# Displays the PDF in Acrobat Reader.
view:
	@acrobat $(project).pdf &

# Kills Acrobat Reader if running.
killacrobat:
	@-taskkill -im Acrobat.exe >/dev/null 2>&1 ; true
