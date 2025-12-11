ASM = main.s
OUTPUT = main
ARGS = -static -marm -g -march=armv7-a -o $(OUTPUT)

all:
	arm-linux-gnueabi-gcc $(ARGS) $(ASM)

clean:
	rm -f $(OUTPUT)
