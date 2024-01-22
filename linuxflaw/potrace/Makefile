.PHONY: compile run clean

PWD=./potrace-1.2

count := 0

export CC=clang
export CXX=clang++

compile:
	cd ${PWD}; CFLAGS="-g -O0 -fsanitize=address" ./configure
	make -C ${PWD} -j32

clean:
	make -C ${PWD} clean

run:
	./potrace-1.2/src/potrace CVE-2017-7263/00210-potrace-heapoverflow-bm_readbody_bmp
