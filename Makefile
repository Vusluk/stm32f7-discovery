NAME = index
SOURCES_DIR = ./sources
BUILDS_DIR = ./builds

AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

all:
	$(AS) -o $(BUILDS_DIR)/$(NAME).o $(SOURCES_DIR)/$(NAME).asm
	$(LD) -T $(SOURCES_DIR)/$(NAME).ld -o $(BUILDS_DIR)/$(NAME).elf $(BUILDS_DIR)/$(NAME).o
	$(OBJCOPY) -O binary $(BUILDS_DIR)/$(NAME).elf $(BUILDS_DIR)/$(NAME).bin
