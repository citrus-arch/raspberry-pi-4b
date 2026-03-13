ASM=fasmarm

all: build/kernel8.img

build/kernel8.img: src/boot.s
	mkdir -p build
	$(ASM) src/boot.s build/kernel8.img

clean:
	rm -rf build
