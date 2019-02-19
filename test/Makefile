SOURCES := $(wildcard *.md)
OBJECTS := $(patsubst %.md, %.html, $(SOURCES))

all: test.epub

test.epub: $(OBJECTS)
	../epubgen

%.html: %.md
	../md2xhtml "$^" "$@"

clean:
	rm -rf *.html *.epub build/
