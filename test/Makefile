all: test.epub

test.epub: 0001.html 0002.html
	../epubgen

%.html: %.md
	../md2xhtml "$^" "$@"

clean:
	rm -rf *.html *.epub build/
