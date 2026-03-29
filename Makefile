SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -euo pipefail -c

.PHONY: all compile assemble clean cleantemp help

# We make 'all' depend on 'clean' so it always starts fresh
all: clean compile assemble cleantemp
	@echo ""
	@echo "ALL DONE."

compile:
	zilf main.zil

assemble:
	zapf main.zap

clean:
	@rm -f *.zap *.z1 *.z2 *.z3 *.z4 *.z5 *.abc *.tmp

cleantemp:
	@rm -f *.zap *.abc *.tmp

help:
	@echo "TARGETS:"
	@echo "  make"
	@echo "  OR"
	@echo "  make all		- compile and assemble main.zil, then cleanup"
	@echo "  make compile		- compile main.zil, no cleaning"
	@echo "  make assemble		- assemble main.zil, no cleaning"
	@echo "  make clean		- clean sweep, including compiled files"
	@echo "  make cleantemp	- clean only temp files"

