.PHONY: compile run clean

PWD=./zziplib-0.13.62

count := 0

export CC=clang
export CXX=clang++

compile:
	cd ${PWD}; CFLAGS="-g -O0 -fsanitize=address" ./configure
	make -C ${PWD} -j32

clean:
	make -C ${PWD} clean

run:
	./zziplib-0.13.62/Linux_4.15.0-117-generic_x86_64.d/bins/unzzipcat-mem CVE-2017-5976/00152-zziplib-heapoverflow-zzip_mem_entry_extra_block;\
	./zziplib-0.13.62/Linux_4.15.0-117-generic_x86_64.d/bins/unzzipcat-mem CVE-2017-5977/00153-zziplib-invalidread-zzip_mem_entry_extra_block
