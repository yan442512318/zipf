.PONY : all clean settings help

COUNT=bin/script_template.py
RUN_COUNT=python $(COUNT)
DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,$(DATA))

## all : Regenerate all results
all : $(RESULTS)

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
	@echo RESULTS : $(RESULTS)

## help : show this message.
help :
	@grep '^##' ./Makefile