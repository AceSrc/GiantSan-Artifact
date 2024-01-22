.PHONY: compile run clean

compile:
	cd libzip-1.2.0; CFLAGS="-g -O0 -fsanitize=address" ./configure
	make -C libzip-1.2.0 -j32

clean:
	make -C libzip-1.2.0 clean

run:
	./libzip-1.2.0/src/ziptool CVE-2017-12858/poc.zip cat ./index
