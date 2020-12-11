#-----------------------------------------------------
# Some usefull instructions...
#
EXCLUDE_URLS=.ignore_links.json
#-----------------------------------------------------

all: README.html README.pdf

README.html: README.adoc
	asciidoctor -a toc=left README.adoc

README.pdf: README.adoc
	asciidoctor-web-pdf README.adoc

todos: 
	@echo "========================================"
	@echo "==> Generating the list of today's totos"
	grep "^fix " README.adoc 

check: 
	@echo "========================================"
	@echo "==> checking the fix "
	asciidoc-link-check README.adoc -c $(EXCLUDE_URLS)

clean:
	rm *.html
