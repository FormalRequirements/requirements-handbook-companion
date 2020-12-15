#-----------------------------------------------------
# Some usefull instructions...
#
EXCLUDE_URLS 	= .ignore_links.json
CHECK_RES 		= check-results.txt
#-----------------------------------------------------

all: README.html README.pdf

README.html: README.adoc
	asciidoctor -a toc=left README.adoc

README.pdf: README.adoc $(CHECK_RES)
	asciidoctor-web-pdf -a pdf-backend README.adoc

todos: 
	@echo "========================================"
	@echo "==> Generating the list of today's totos"
	grep "^fix " README.adoc 

check: $(CHECK_RES)

$(CHECK_RES): *.adoc
	@echo "========================================"
	@echo "==> checking the fix "
	asciidoc-link-check *.adoc -c $(EXCLUDE_URLS) > $(CHECK_RES)
	markdown-link-check *.md -c $(EXCLUDE_URLS) >> $(CHECK_RES)
clean:
	rm *.html
