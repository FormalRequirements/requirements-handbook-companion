#-----------------------------------------------------
# Some usefull instructions...
#
EXCLUDE_URLS 	= config.json
CHECK_RES 		= check-results.txt
DIAGRAMS                = images      
#-----------------------------------------------------

all: README.html README.pdf

README.html: README.adoc
	asciidoctor -a toc=left README.adoc

README.pdf: README.adoc $(CHECK_RES)
	asciidoctor-web-pdf -a pdf-backend README.adoc

images/%.png: images/%.plantuml
	@echo '==> Compiling plantUML files to generate PNG'
	java -jar plantuml.jar $<

images/%.svg: images/%.plantuml
	@echo '==> Compiling plantUML files to generate SVG'
	java -jar plantuml.jar -tsvg $<

check: $(CHECK_RES)

$(CHECK_RES): *.adoc
	@echo "========================================"
	@echo "==> checking the fix "
	asciidoc-link-check *.adoc -c $(EXCLUDE_URLS) > $(CHECK_RES)
	markdown-link-check *.md -c $(EXCLUDE_URLS) >> $(CHECK_RES)

lean:
	rm *.html
