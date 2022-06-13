.PONY : all clean settings help

COUNT=bin/script_template.py
RUN_COUNT=python $(COUNT)
DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,$(DATA))
COLLATE=bin/collate.py
PLOT=bin/plot.py

## all : Regenerate all results
all : $(RESULTS) results/collated.csv results/collated.png

## results/collated.csv : collated all resukts.
results/collated.csv : $(RESULTS) $(COLLATE)
	mkdir -p resuslts
	python $(COLLATE) $(RESULTS) > $@

## results/collated.png : plot the collated results.
results/collated.png : results/collated.csv
	python $(PLOT) $< --outfile $@

## result/%.csv : Regenerate result for any book
results/%.csv : data/%.txt $(COUNT)
	$(RUN_COUNT) $< > $@


## clean : Remove all generated files.
clean :
	rm -f results/*.csv 

## settings : Show variable's value.
settings :
	@echo COUNT: $(COUNT)
	@echo DATA: $(DATA)
	@echo RESULTS: $(RESULTS)
	@echo COLLATE: $(COLLATE)
	@echo PLOT: $(PLOT)

## help : show this message.
help :
	@grep '^##' ./Makefile