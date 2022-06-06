all: build

generate:
	cmake -GNinja -S src -B bin

build: generate
	cmake --build bin

run: build
	bin/Whale

clean:
	rm -rf bin
