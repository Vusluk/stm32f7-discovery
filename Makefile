BINARY = VuslukSTM32F7
DEVICE = stm32f407vgt6

TOOLCHAIN_DIR = /usr/arm-none-eabi
CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

ifndef CFLAGS
	CFLAGS = -Os
endif
CFLAGS += -mthumb

LDFLAGS += -Wl,--gc-sections --static -nostartfiles -lc -lgcc -lnosys -lm
LDFLAGS += -Wl,-Map,$(BINARY).map

LDSCRIPT ?= $(BINARY).ld

SOURCES=$(wildcard *.c *.cpp)
HEADERS=$(wildcard *.h)

all: $(BINARY).bin

SRCLIBDIR = $(TOOLCHAIN_DIR)
include $(TOOLCHAIN_DIR)/ld/Makefile.linker
LDFLAGS += -T$(LDSCRIPT)

$(BINARY).bin: $(BINARY).elf
	$(OBJCOPY) -Obinary $(BINARY).elf $(BINARY).bin
$(BINARY).elf: $(SOURCES) $(HEADERS) $(LDSCRIPT)
	$(CC) -o $(BINARY).elf $(SOURCES) $(CFLAGS) $(LDFLAGS)
flash: $(BINARY).bin
	st-flash --reset write $(BINARY).bin 0x08000000
clean:
	rm -fv $(LDSCRIPT) $(BINARY).elf $(BINARY).bin $(BINARY).map *.o
