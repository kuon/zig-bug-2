.PHONY: build

build: libs/microzig
	zig build -Drelease=true

libs/microzig:
	mkdir -p libs
	cd libs && git clone git@github.com:kuon/microzig.git

.PHONY: clean

clean:
	rm -fr libs zig-out zig-cache
