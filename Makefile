.PONY : all clean settings

COUNT=bin/script_template.py
RUN_COUNT=python $(COUNT)
DATA=$(wildcard data/*.txt)
RESULTS=$(patsubst data/%.txt,results/%.csv,$(DATA))

# Regenerate all results
all : $(RESULTS)

# Regenerate results for "Moby Dick"
results/moby_dick.csv : data/moby_dick.txt $(COUNT)
	$(RUN_COUNT) $< > $@

# Regenerate results for "Jane Eyre"
results/jane_eyre.csv : data/jane_eyre.txt $(COUNT)
	$(RUN_COUNT) \
		data/jane_eyre.txt > results/jane_eyre.csv

# Regenerate result for any book
results/%.csv : data/%.txt $(COUNT)
	$(RUN_COUNT) $< > $@


# Remove all generated files.
clean :
	rm -f results/*.csv 

# Show variable's value.
settings :
	@echo COUNT: $(COUNT)
	@echo DATA: $(DATA)
	@echo RESULTS : $(RESULTS)