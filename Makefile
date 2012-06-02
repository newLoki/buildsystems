all: minifycss

minifycss: $(patsubst %.min.css,%.css,$(wildcard *.min.css))
%.css: %.min.css; cleancss -o $< $@
