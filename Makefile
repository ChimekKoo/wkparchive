# Usage: make prep-<folder-with-pdfs> VOIVODESHIP=<voivodeship>

prep-%: $(wildcard %/*.pdf)
	@echo "$*" | python3 -c "import os;d=input();n=sum(x.endswith('.pdf') for x in os.listdir(d));print(f'{n} PDF files in {d} to process.')"
	@for file in $(wildcard $*/*.pdf); do \
		echo "$$file"; \
		exiftool -m -q -all= $$file; \
		exiftool -m -q -Language="pl-PL" $$file; \
		exiftool -m -q -Author="$$(echo '$(VOIVODESHIP)' | sed 's/.*/\u&/') Kuratorium Oświaty" $$file; \
		exiftool -m -q -Creator="wkparchive" $$file; \
		rm -f $${file}_original; \
		qpdf --linearize --replace-input $$file; \
	done
