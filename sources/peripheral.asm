@DEFINE PERIPHERALS MAP
@TIMERS
  .set TIM_1        ,0x40010000
  .set TIM_8        ,0x40010400

  .set TIM_2        ,0x40000000
  .set TIM_3        ,0x40000400
  .set TIM_4        ,0x40000800
  .set TIM_5        ,0x40000C00

  .set TIM_6        ,0x40001000
  .set TIM_7        ,0x40001400

  .set TIM_9        ,0x40014000
  .set TIM_12       ,0x40001800

  .set TIM_10       ,0x40014400
  .set TIM_11       ,0x40014800
  .set TIM_13       ,0x40001C00
  .set TIM_14       ,0x40002000

  .set LPTIM        ,0x40002400

  .set RTC          ,0x40002800

  .set WWDG         ,0x40002C00
  .set IWDG         ,0x40003000

@INTERFACES
 @SERIAL
  .set SPI_1        ,0x40013000
  .set SPI_I2S_2    ,0x40003800
  .set SPI_I2S_3    ,0x40003C00
  .set SPI_4        ,0x40013400
  .set SPI_5        ,0x40015000
  .set SPI_6        ,0x40015400

  .set I2C_1        ,0x40005400
  .set I2C_2        ,0x40005800
  .set I2C_3        ,0x40005C00
  .set I2C_4        ,0x40006000

  .set USART_1      ,0x40011000
  .set USART_2      ,0x40004400
  .set USART_3      ,0x40004800
  .set UART_4       ,0x40004C00
  .set UART_5       ,0x40005000
  .set USART_6      ,0x40011400
  .set UART_7       ,0x40007800
  .set UART_8       ,0x40007C00

  .set CAN_1        ,0x40006400
  .set CAN_2        ,0x40006800

  .set USB_OTG_HS   ,0x40040000
  .set USB_OTG_FS   ,0x50000000

  .set ETHERNET     ,0x40028000

 @MEMORY
  .set FMC          ,0xA0000000   @Flexible Memory Controller
  .set QSPI         ,0xA0001000   @Quad-SPI interface

 @AUDIO
  .set SPDIFRX      ,0x40004000
  .set SAI_1        ,0x40015800
  .set SAI_2        ,0x40015C00

 @OTHER
  .set HDMI_CEC     ,0x40006C00
  .set LCD_TFT      ,0x40016800
  .set DCMI         ,0x50050000   @Digital Camera Interface

  .set SDMMC        ,0x40012C00
  .set DAC          ,0x40007400
  .set ADC          ,0x40012000

@GPIO
 @Base addresses
  .set GPIO_A       ,0x40020000
  .set GPIO_B       ,0x40020400
  .set GPIO_C       ,0x40020800
  .set GPIO_D       ,0x40020C00
  .set GPIO_E       ,0x40021000
  .set GPIO_F       ,0x40021400
  .set GPIO_G       ,0x40021800
  .set GPIO_H       ,0x40021C00
  .set GPIO_I       ,0x40022000
  .set GPIO_J       ,0x40022400
  .set GPIO_K       ,0x40022800

 @Control Registers offset
  .set GPIO_MODER   ,0x00         @GPIO Mode Register
  @Control Values
    .set GPIO_MODER_INPUT   ,0x00 @Input mode (reset state)
    .set GPIO_MODER_OUTPUT  ,0x01 @General purpose output mode
    .set GPIO_MODER_ALTERN  ,0x10 @Alternate function mode
    .set GPIO_MODER_ANALOG  ,0x11 @Analog mode

  .set GPIO_OTYPER  ,0x04         @GPIO Output Type Register
  @Control Values
    .set GPIO_OTYPER_PP     ,0x00 @Output push-pull (reset state)
    .set GPIO_OTYPER_OD     ,0x01 @Output open-drain

  .set GPIO_OSPEEDR ,0x08         @GPIO Output Speed Register
  @Control Values
    .set GPIO_OSPEEDR_LS    ,0x00 @Low Speed
    .set GPIO_OSPEEDR_MS    ,0x01 @Medium Speed
    .set GPIO_OSPEEDR_HS    ,0x10 @High Speed
    .set GPIO_OSPEEDR_VS    ,0x11 @Very High Speed

  .set GPIO_PUPDR   ,0x0C         @GPIO Pull-Up/Pull-Down Register
  @Control Values
    .set GPIO_PUPDR_NO    ,0x00   @No pull-up, pull-down
    .set GPIO_PUPDR_PU    ,0x01   @Pull-up
    .set GPIO_PUPDR_PD    ,0x10   @Pull-down

  .set GPIO_IDR     ,0x10         @GPIO input data register
  @Read-Only
  .set GPIO_ODR     ,0x14         @GPIO output data register
  @Read-Write for non atomic ops

  .set GPIO_BSRR    ,0x18         @GPIO bit set/reset register
  @White-Only:
  @[0-15] sets the corresponding ODRx bit
  @[16-31] resets the corresponding ODRx bit

  .set GPIO_LCKR    ,0x1C
  .set GPIO_AFRL    ,0x20
  .set GPIO_AFRH    ,0x24

@CORE
  .set SYSCFG       ,0x40013800

 @Reser and Clock Control
  .set RCC          ,0x40023800   @Base
  .set RCC_AHB1ENR  ,0x30         @AHB1 Clock Enable Register
    @GPIO Clock Enable Bit Mask
    .set GPIOA_EN   ,0x00000001
    .set GPIOB_EN   ,0x00000002
    .set GPIOC_EN   ,0x00000004
    .set GPIOD_EN   ,0x00000008
    .set GPIOE_EN   ,0x00000010
    .set GPIOF_EN   ,0x00000020
    .set GPIOG_EN   ,0x00000040
    .set GPIOH_EN   ,0x00000080
    .set GPIOI_EN   ,0x00000100
    .set GPIOJ_EN   ,0x00000200
    .set GPIOK_EN   ,0x00000400

  .set EXTI         ,0x40013C00
  .set PWR          ,0x40007000
  .set FIR          ,0x40023C00   @Flash Interface Register
  .set BKPSRAM      ,0x40024000
  .set RNG          ,0x50060800   @Random Number Generator
  .set CRC          ,0x40023000   @Cyclic Redundancy Check

  .set DMA2D        ,0x4002B000
  .set DMA_1        ,0x40026000
  .set DMA_2        ,0x40026400

  .set CRYP         ,0x50060000   @Cryptographic Processor(STM32F756xx only)
  .set HASH         ,0x50060400   @Hash processor(STM32F756xx only)
