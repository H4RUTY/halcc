CFLAGS = -std=c11 -g -static

run:
	docker run --rm -it --platform linux/amd64 \
		-v $(HOME)/dev/side-projects/c-compiler:/c-compiler \
		-w /c-compiler compilerbook bash
