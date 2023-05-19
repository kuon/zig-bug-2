.PHONY: build

build: 
	zig build -Drelease=true

.PHONY: clean

clean:
	rm -fr zig-out zig-cache
