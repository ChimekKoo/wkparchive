# wkparchive
[![Website](https://img.shields.io/website?down_color=lightgrey&down_message=offline&up_color=green&up_message=online&url=http%3A%2F%2Fchimekkoo.github.io/wkparchive)](https://chimekkoo.github.io/wkparchive)  

Simple but useful archive of polish provincial subject competitions (Wojewódzkie Konkursy Przedmiotowe).  

Everything in `docs/pdf` directory was downloaded (and converted from DOCX to PDF in some cases) from polish education boards' websites ([full list](https://www.gov.pl/web/edukacja-i-nauka/kuratoria-oswiaty)) and they were not written myself.

## Features
- all documents from many voivodeships in one place as PDFs (but keep in mind I'm still downloading them)
- filtering and sorting results
- everything in HTML and client-side JS, so ready to host on a static website server (e.g. GitHub Pages)

## Deployment
`docs` directory contains a ready-to-host static website - just upload it onto your server.

## Development
```
git clone https://github.com/chimekkoo/wkparchive.git
pip install -r requirements-dev.txt # only flask as a static server
python3 srv.py
```
and open `localhost:5000`.

## PDF preparation
- download your file
- convert it to PDF (for example [cloudconvert](https://cloudconvert.com/) does it really well)
- rename to format `id.pdf` (where `id` is some unique random 8-digit number)
- run `exiftool -all= id.pdf && rm -f id.pdf_original` to remove any metadata (replace `id`)
- run `exiftool -Language=pl-PL id.pdf && rm -f id.pdf_original` to set language metadata to polish (replace `id`)
- run `qpdf --linearize --replace-input id.pdf` to linearize the PDF (replace `id`)
- move your PDFs to `docs/pdf` folder (be careful to not overwrite any existing files - choose a not taken id)
- add new entry `docs/api/resources.json` (template soon)
- (commit and push your changes)
