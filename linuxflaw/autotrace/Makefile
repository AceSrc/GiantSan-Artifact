.PHONY: compile run clean

PWD=./autotrace-0.31.1
FILES := $(shell find . -type f -name '*.BMP')

count := 0

compile:
	cd ${PWD}; CFLAGS="-g -O0 -fsanitize=address" ./configure
	make -C ${PWD} -j32

clean:
	make -C ${PWD} clean

run:
	for i in $(FILES); do \
		./autotrace-0.31.1/autotrace $$i; \
	done

