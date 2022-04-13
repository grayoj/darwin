BUILD_DIR?=build/
ASM?=nasm
.PHONY: all clean

all: phase1

phase1: $(BUILD_DIR)/phase1.bin

	$(BUILD_DIR)/phase1.bin:
		$(ASM) boot.asm -f bin -o $(BUILD_DIR)/phase1.bin
clean:
	im -f $(BUILD_DIR)/phase1.bin
