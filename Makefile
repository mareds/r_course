#################################
# Makefile for website built:
# mareds/r_course website
# Copyright Saskia A. Otto 2018
#################################

# lectures are commented out if I want to change just the website
# (rendering takes too long and slides are independent of the website)
#RMD_LEC = $(wildcard lectures/lecture*.Rmd)
#HTML_LEC = $(patsubst lectures/%.Rmd, docs/%.html, $(RMD_LEC))

RMD_SITE = $(wildcard site/*.Rmd)
HTML_SITE = $(patsubst site/%.Rmd, docs/%.html, $(RMD_SITE))

RMD_EXER = $(wildcard exercises/ex_*.Rmd)
HTML_EXER  = $(patsubst exercises/%.Rmd, docs/%.html, $(RMD_EXER))


$(info Building the docs folder for github-pages)

#all : lectures exercises site
all : exercises site
	$(info The site is now in the docs folder)

#lectures : $(HTML_LEC)

exercises : $(HTML_EXER)

site : $(HTML_SITE)

#docs/lecture%.html : lectures/lecture%.Rmd
#	touch lectures/index.Rmd
#	Rscript -e "slidify::slidify(input = '$<')" || (rm lectures/index.Rmd; echo >&2 "Failed to build lectures"; false)
#	# cp $< $@ # copies files but the slide format is screwed -> manual copying!
#	rm lectures/index.Rmd

docs/ex_%.html : exercises/ex_%.Rmd
	touch exercises/index.Rmd
	cp site/_site.yml exercises/_site.yml
	cp site/_navbar.html  exercises/_navbar.html
	cp site/footer_site.html  exercises/footer_site.html
	Rscript -e "rmarkdown::render_site(input = '$<', encoding = 'UTF-8')" || (rm exercises/index.Rmd exercises/_site.yml exercises/_navbar.html exercises/footer_site.html; echo >&2 "Failed to build exercises"; false)
	rm exercises/index.Rmd exercises/_site.yml exercises/_navbar.html exercises/footer_site.html

docs/%.html : site/%.Rmd site/_site.yml
	touch docs/.nojekyll
	Rscript -e "rmarkdown::render_site(input = '$<', encoding = 'UTF-8')"


clean :
	rm -rf docs/*
	rm -f lectures/index.Rmd lectures/_site.yml lectures/footer_site.html exercises/index.Rmd exercises/_site.yml exercises/_navbar.html exercises/footer_site.html
	$(info The docs folder is now empty)
