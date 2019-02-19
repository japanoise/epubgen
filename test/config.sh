#!/bin/bash
# This is epubgen's configuration file. It is a bash script and will be sourced
# when epubgen runs.

# Final filename
EPUBTARGET="test.epub"

# Metadata for content.opf
EPUBTITLE="My Super Novel"
EPUBAUTHOR="Jane Doe"
EPUBFILEAS="Doe, Jane"
# Use a url instead of an isbn?
EPUBUSEURL=true
EPUBISBN="123456789X"
EPUBURL="http://site.for.my.book/book.htm"
# Lang must conform to https://www.ietf.org/rfc/rfc3066.txt
# I.E. [ISO 639-2 or -1 code](-[variant]) - e.g eo, eng-gb
EPUBLANG="en"
# Mime-type for chapters - I think it has to be xhtml, but I'm not certain.
EPUBMIME="application/xhtml+xml"

# List of chapters. Modify the regex to suit your naming scheme; it currently
# assumes you're using a naming scheme like [0-9]*.html. Order matters as it
# will use this order to generate the table of contents. If you're doing 
# something funky, you can just set this to a list of files seperated by '\n's
EPUBSRCS=$(find ./ -regex ".*[0-9]*.html" -not -path "*build/*" | sort)

# Command to generate tempfiles. If you don't have mktemp, you can use something
# like 'date +%s | xargs printf "/tmp/tmp.%s\n"'
maketemp() {
	mktemp
}

# Command to generate a chapter title. As-is, it will use the positional order.
# It is passed the basename, filename, and positional order.
gentitle() {
	echo "Chapter $3"
}

# Command to validate epub at the end of the run. It will be passed the path to 
# the epub.
validate() {
	if [ -f "$HOME/builds/epubcheck-4.1.1/epubcheck.jar" ]
	then
		java -jar "$HOME/builds/epubcheck-4.1.1/epubcheck.jar" "$1"
	fi
}
