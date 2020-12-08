all: resume.html

%.html: %.md
	pandoc -s $< -o $@ --metadata pagetitle="Brian Campbell Resume" \
		--css resume.css
