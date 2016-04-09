/* STM32F7xx, flash 1 mb, sram 320 kb, bkpsram 4 kb */

MEMORY
{
	/* FLASH - Программная flash память */
	FLASH (RX) : ORIGIN = 0x08000000, LENGTH = 1024K

}
SECTIONS
{
	.text : { /* Секция прошивки */
		*(.text);   /* Секция исходников */
	} > FLASH
}
