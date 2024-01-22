.PHONY: compile run clean

PWD=./lame-3.99.5

count := 0

export CC=clang
export CXX=clang++

compile:
	cd ${PWD}; CFLAGS="-g -O0 -fsanitize=address" ./configure
	make -C ${PWD} -j32

clean:
	make -C ${PWD} clean

run:
	./lame-3.99.5/frontend/lame -f -V 9 CVE-2015-9101/00292-lame-heapoverflow-fill_buffer_resample out.wav
