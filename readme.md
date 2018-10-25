MAREDS - Data analysis with R
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
About the course
----------------

This is a course taught as part of the curriculum of the Master program [MARSYS-MARine EcoSYStem and Fishery Sciences](https://www.biologie.uni-hamburg.de/en/studium/master/marine-oekosystem-und-fischereiwissenschaften.html) at the [Institute of Marine Ecosystem and Fishery Science (IMF)](https://www.biologie.uni-hamburg.de/en/einrichtungen/imf.html), University of Hamburg, Germany.

About the course website and repo
---------------------------------

All code (.Rmd) is available in this github repository. Feel free to browse, download, and even contribute by forking.

Source files for the gh-pages doc folder are organized as follows:

-   `site` folder for the global webpages.
-   `lectures` folder for slidify presentations (.Rmd files starting with "lecture\*") and supporting files.
-   `exercises` folder for the case studies and exercise demo codes of specific lectures.

To create the html files for the docs folder, use the Build -&gt; Build All button in RStudio. This button will use the rules defined in `Makefiles` to produce the HTML files. `make` will use the `rmarkdown::render_site()` function to create the files in the `docs` folder.

However, the lecture presentations are coded using the [slidify](http://slidify.org) framework. To render the .Rmd files into HTML another function is used (`slidify::slidify()`) for which I did not get the output files and any supporting files (in asset, library, data, image and \_plotting\_files folders) moved into the `docs` folder for gh-pages. That needs to be done manually for now (I'm happy if someone can fix that in the `Makefile` file).
