ASM = nasm
CC = gcc

SRC_DIR = src
TOOLS_DIR = tools
BUILD_DIR = build

.PHONY: all floppy_image kernel bootloader clean always tools_fat

all: floppy_image tools_fat

floppy_image: $(BUILD_DIR)/main_floppy.img

$(BUILD)/main_floppy.img: bootloader kernel
	dd if=/dev/zero of = $(BUILD_DIR)/mainfloppy .img bs-512 count = 2880
	mkfs.fat -F 12 -n "DOS" $(BUILD_DIR)/main_floppy.img
	dd if=$(BUILD_DIR)/main_floppy $(BUILD_DIR)/kernel.bin "::kernel.bin"
	