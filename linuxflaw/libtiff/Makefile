.PHONY: compile run clean

PWD=./tiff-4.0.7

count := 0

export CC=clang
export CXX=clang++

compile:
	cd ${PWD}; CFLAGS="-g -O0 -fsanitize=address" ./configure
	make -C ${PWD} -j32

clean:
	make -C ${PWD} clean

run:
	./tiff-4.0.7/tools/tiffcp -i ./CVE-2016-10270/00074-libtiff-heapoverflow-TIFFFillStrip /tmp/foo; \
	./tiff-4.0.7/tools/tiffcrop -i ./CVE-2016-10271/00100-libtiff-heapoverflow-_TIFFFax3fillruns /tmp/foo; \
	./tiff-4.0.7/tools/tiffsplit ./CVE-2016-10095/00104-libtiff-stackoverflow-_TIFFVGetField /tmp/foo
