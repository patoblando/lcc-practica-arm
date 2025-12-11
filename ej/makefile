ASM = main.s
OUTPUT = main
ARGS = -static -marm -g -o $(OUTPUT)

all:
	arm-linux-gnueabi-gcc $(ARGS) $(ASM)

clean:
	rm -f $(OUTPUT)
