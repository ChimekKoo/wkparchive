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
- download files
- convert them to PDF (e.g. [cloudconvert](https://cloudconvert.com/) does it really well)
- rename to format `id.pdf`, where `id` is a unique random number from `10000000` to `99999999`
- move your files to one folder and run `make prep-myfolder VOIVODESHIP=myvoivodeship`, where `myfolder` is name of the folder where PDFs are in and `myvoivodeship` is name of the voivodeship of the resources
- move your PDFs to `docs/pdf` folder (be careful to not overwrite any existing files - choose a not taken id)
- add new entries to `docs/api/resources.json`
