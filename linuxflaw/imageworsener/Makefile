.PHONY: compile run clean

PWD=./imageworsener-1.3.1
BIN=${PWD}/imagew

count := 0

compile:
	CC='clang' CXX='clang++' CFLAGS="-g -O0 -fsanitize=address" make -C ${PWD}/scripts

clean:
	make -C ${PWD}/scripts clean

run:
	${BIN} ./CVE-2017-9204/00281-imageworsener-invalidread-iw_get_ui16le /tmp/out -outfmt bmp; \
	${BIN} ./CVE-2017-9205/00282-imageworsener-invalidread-iw_get_ui16be /tmp/out -outfmt bmp; \
	${BIN} ./CVE-2017-9206/00283-imageworsener-heapoverflow-iw_get_ui16le /tmp/out -outfmt bmp; \
	${BIN} ./CVE-2017-9207/00284-imageworsener-heapoverflow-iw_get_ui16be /tmp/out -outfmt bmp
