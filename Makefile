html:
	# make pdf
	bash tex2html.sh
	cp _static/*.css _build/html/
	# cp _build/pdf/book.pdf _build/html/book-the_1090mhz_riddle-junzi_sun.pdf
	# cp images/*.svg _build/html/adsb/images/

pdf:
	pdflatex -output-directory=/tmp -synctex=1 book.tex
	biber /tmp/book
	pdflatex -output-directory=/tmp -synctex=1 book.tex
	mv /tmp/book.pdf _build/pdf/output.pdf
	mv /tmp/book.synctex.gz _build/pdf/output.synctex.gz

clean:
	find _build/html/ -type f -delete
	find _build/pdf/ -type f -delete
