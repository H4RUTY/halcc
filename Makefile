CFLAGS = -std=c11 -g -static

run:
	docker run --rm -it --platform linux/amd64 \
		-v $(HOME)/dev/my-projects/halcc:/halcc \
		-w /halcc compilerbook bash

halcc:
	gcc -o halcc halcc.c

test: halcc
		./test.sh

clean:
	rm -f halcc *.o *~ tmp*

.PHONY: test clean run halcc
