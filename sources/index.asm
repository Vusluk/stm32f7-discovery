@STM32F746-DISCO assembler example.
@COMPILER SETUP -->> START
.syntax unified
.cpu cortex-m7
.thumb
@COMPILER SETUP <<-- END

@MACROS -->> START
.macro	MOV32 regnum,number
  MOVW \regnum,:lower16:\number
  MOVT \regnum,:upper16:\number
.endm
@MACROS -->> END


.include "./sources/memory.asm" @ Добавляем карту памяти(Memory Map)
.include "./sources/peripheral.asm" @ Добавляем карту периферии

.section .text
.word INT_SRAM_END
.word RESET + 1
.word RESET + 1
.word RESET + 1
.word RESET + 1
.word RESET + 1
.word RESET + 1

.align 4
.global RESET
RESET:
  BKPT
  MRS     R10,  PSR

  MOV32   R0, RCC + RCC_AHB1ENR   @ Загрузили адрес RCC_AHB1ENR в R0
  MOV32   R1, GPIOI_EN            @ Загрузили битовую маску в R1
	LDR	    R2, [R0]			          @ прочитали значение регистра
  ORR	    R1, R1, R2              @ логическое, побитовое ИЛИ : R1= R1 ИЛИ R2
	STR	    R1, [R0]                @ запись R1 по адресу указанному в R0

  MOV32   R0, GPIO_I + GPIO_MODER         @ Загрузили адрес GPIO_I_MODER в R0
  MOV32   R1, GPIO_MODER_OUTPUT << (2*1)  @ Загрузили значение настройки для вывода 1 в R1
	LDR	    R2, [R0]			                  @ прочитали текущее значение GPIO_I_MODER
	ORR	    R1, R1, R2                      @ логическое, побитовое ИЛИ : R1= R1 ИЛИ R2
	STR	    R1, [R0]                        @ записали новое значение GPIO_I_MODER

  MOV32   R0, GPIO_I + GPIO_BSRR          @ Загрузили адрес GPIO_I_BSRR в R0
  MOV32   R1, 0x02                        @ Загрузили значение настройки для вывода 1 в R1
	STR	    R1, [R0]                        @ записали новое значение GPIO_I_MODER

  MOV32	  R2, 0x00020000
Delay:
  SUBS    R2, 0x1
  IT      NE
	BNE.W   Delay

  BKPT

  MOV32   R0, GPIO_I + GPIO_BSRR          @ Загрузили адрес GPIO_I_BSRR в R0
  MOV32   R1, 0x02 << (1*16)              @ Загрузили значение настройки для вывода 1 в R1
	STR	    R1, [R0]                        @ записали новое значение GPIO_I_MODER

Cycle:
  NOP
  NOP
  B       Cycle

.end
