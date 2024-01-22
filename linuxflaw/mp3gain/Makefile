.PHONY: compile run clean

PWD=./mp3gain-1.5.2


compile:
	make -C ${PWD} -j32

clean:
	make -C ${PWD} clean

run:
	./mp3gain-1.5.2/mp3gain -f CVE-2017-14407/00345-aacgain-stackoverflow-filterYule; \
	./mp3gain-1.5.2/mp3gain -f CVE-2017-14408/00351-aacgain-stackoverflow-dct36; \
	./mp3gain-1.5.2/mp3gain -f CVE-2017-14409/00350-aacgain-globaloverflow-III_dequantize_sample

