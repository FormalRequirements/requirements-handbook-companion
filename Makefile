#-----------------------------------------------------
# Some usefull instructions...
#
EXCLUDE_URLS 	= config.json
CHECK_RES 		= check-results.txt
DIAGRAMS        = images/*.svg      
#-----------------------------------------------------

all: README.pdf index.html 

index.html: README.html
	cp README.html index.html

README.html: README.adoc $(CHECK_RES) $(DIAGRAMS)
	asciidoctor -a toc=left README.adoc

README.pdf: README.adoc $(CHECK_RES)  $(DIAGRAMS)
	asciidoctor-pdf -a allow-uri-read -a pdf-backend README.adoc

images/%.png: images/%.plantuml
	@echo '==> Compiling plantUML files to generate PNG'
	java -jar plantuml.jar $<

images/%.svg: images/%.plantuml
	@echo '==> Compiling plantUML files to generate SVG'
	java -jar plantuml.jar -tsvg $<

check: $(CHECK_RES)

checks/%.txt: %.adoc
	@echo "========================================"
	@echo "==> checking the URLs "
	asciidoc-link-check $ -c $(EXCLUDE_URLS) $< > $@


$(CHECK_RES): checks/*.txt
	@echo "========================================"
	@echo "==> checking the URLs "
	@echo `date` > $(CHECK_RES)
	cat checks/*.txt >> $(CHECK_RES)

clean:
	rm *.html

deploy: index.html
	@echo "========================================"
	@echo "==> Deploy updates "
	git commit -am "🤖 DEPLOY: last updates"; git pull; git push