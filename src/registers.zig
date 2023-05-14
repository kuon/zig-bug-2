const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    ///  STM32L0x1
    pub const STM32L0x1 = struct {
        pub const properties = struct {
            pub const @"cpu.mpuPresent" = "false";
            pub const @"cpu.nvicPrioBits" = "3";
            pub const @"cpu.vendorSystickConfig" = "false";
            pub const @"cpu.revision" = "r0p0";
            pub const @"cpu.endian" = "little";
            pub const @"cpu.name" = "CM0+";
            pub const @"cpu.fpuPresent" = "false";
        };

        pub const VectorTable = extern struct {
            const Handler = micro.interrupt.Handler;
            const unhandled = micro.interrupt.unhandled;

            initial_stack_pointer: u32,
            Reset: Handler = unhandled,
            NMI: Handler = unhandled,
            HardFault: Handler = unhandled,
            reserved2: [7]u32 = undefined,
            SVCall: Handler = unhandled,
            reserved10: [2]u32 = undefined,
            PendSV: Handler = unhandled,
            SysTick: Handler = unhandled,
            ///  Window Watchdog interrupt
            WWDG: Handler = unhandled,
            ///  PVD through EXTI line detection
            PVD: Handler = unhandled,
            ///  RTC global interrupt
            RTC: Handler = unhandled,
            ///  Flash global interrupt
            FLASH: Handler = unhandled,
            ///  RCC global interrupt
            RCC: Handler = unhandled,
            ///  EXTI Line[1:0] interrupts
            EXTI0_1: Handler = unhandled,
            ///  EXTI Line[3:2] interrupts
            EXTI2_3: Handler = unhandled,
            ///  EXTI Line15 and EXTI4 interrupts
            EXTI4_15: Handler = unhandled,
            reserved22: [1]u32 = undefined,
            ///  DMA1 Channel1 global interrupt
            DMA1_Channel1: Handler = unhandled,
            ///  DMA1 Channel2 and 3 interrupts
            DMA1_Channel2_3: Handler = unhandled,
            ///  DMA1 Channel4 to 7 interrupts
            DMA1_Channel4_7: Handler = unhandled,
            ///  ADC and comparator 1 and 2
            ADC_COMP: Handler = unhandled,
            ///  LPTIMER1 interrupt through EXTI29
            LPTIM1: Handler = unhandled,
            ///  USART4/USART5 global interrupt
            USART4_USART5: Handler = unhandled,
            ///  TIM2 global interrupt
            TIM2: Handler = unhandled,
            ///  TIM3 global interrupt
            TIM3: Handler = unhandled,
            ///  TIM6 global interrupt and DAC
            TIM6: Handler = unhandled,
            ///  TIM7 global interrupt and DAC
            TIM7: Handler = unhandled,
            reserved33: [1]u32 = undefined,
            ///  TIMER21 global interrupt
            TIM21: Handler = unhandled,
            ///  I2C3 global interrupt
            I2C3: Handler = unhandled,
            ///  TIMER22 global interrupt
            TIM22: Handler = unhandled,
            ///  I2C1 global interrupt
            I2C1: Handler = unhandled,
            ///  I2C2 global interrupt
            I2C2: Handler = unhandled,
            ///  SPI1_global_interrupt
            SPI1: Handler = unhandled,
            ///  SPI2 global interrupt
            SPI2: Handler = unhandled,
            ///  USART1 global interrupt
            USART1: Handler = unhandled,
            ///  USART2 global interrupt
            USART2: Handler = unhandled,
            ///  AES global interrupt RNG global interrupt and LPUART1 global interrupt through
            AES_RNG_LPUART1: Handler = unhandled,
        };

        pub const peripherals = struct {
            ///  General-purpose-timers
            pub const TIM2 = @intToPtr(*volatile types.peripherals.TIM2, 0x40000000);
            ///  General-purpose-timers
            pub const TIM3 = @intToPtr(*volatile types.peripherals.TIM2, 0x40000400);
            ///  Basic-timers
            pub const TIM6 = @intToPtr(*volatile types.peripherals.TIM6, 0x40001000);
            ///  Basic-timers
            pub const TIM7 = @intToPtr(*volatile types.peripherals.TIM6, 0x40001400);
            ///  Real-time clock
            pub const RTC = @intToPtr(*volatile types.peripherals.RTC, 0x40002800);
            ///  System window watchdog
            pub const WWDG = @intToPtr(*volatile types.peripherals.WWDG, 0x40002c00);
            ///  Independent watchdog
            pub const IWDG = @intToPtr(*volatile types.peripherals.IWDG, 0x40003000);
            ///  Serial peripheral interface
            pub const SPI2 = @intToPtr(*volatile types.peripherals.SPI1, 0x40003800);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART2 = @intToPtr(*volatile types.peripherals.USART1, 0x40004400);
            ///  Lower power Universal asynchronous receiver transmitter
            pub const LPUART1 = @intToPtr(*volatile types.peripherals.LPUART1, 0x40004800);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART4 = @intToPtr(*volatile types.peripherals.USART1, 0x40004c00);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART5 = @intToPtr(*volatile types.peripherals.USART1, 0x40005000);
            ///  Inter-integrated circuit
            pub const I2C1 = @intToPtr(*volatile types.peripherals.I2C1, 0x40005400);
            ///  Inter-integrated circuit
            pub const I2C2 = @intToPtr(*volatile types.peripherals.I2C1, 0x40005800);
            ///  Power control
            pub const PWR = @intToPtr(*volatile types.peripherals.PWR, 0x40007000);
            ///  Inter-integrated circuit
            pub const I2C3 = @intToPtr(*volatile types.peripherals.I2C1, 0x40007800);
            ///  Low power timer
            pub const LPTIM = @intToPtr(*volatile types.peripherals.LPTIM, 0x40007c00);
            ///  System configuration controller and COMP register
            pub const SYSCFG_COMP = @intToPtr(*volatile types.peripherals.SYSCFG_COMP, 0x40010000);
            ///  External interrupt/event controller
            pub const EXTI = @intToPtr(*volatile types.peripherals.EXTI, 0x40010400);
            ///  General-purpose-timers
            pub const TIM21 = @intToPtr(*volatile types.peripherals.TIM21, 0x40010800);
            ///  General-purpose-timers
            pub const TIM22 = @intToPtr(*volatile types.peripherals.TIM22, 0x40011400);
            ///  Firewall
            pub const Firewall = @intToPtr(*volatile types.peripherals.Firewall, 0x40011c00);
            ///  Analog-to-digital converter
            pub const ADC = @intToPtr(*volatile types.peripherals.ADC, 0x40012400);
            ///  Serial peripheral interface
            pub const SPI1 = @intToPtr(*volatile types.peripherals.SPI1, 0x40013000);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART1 = @intToPtr(*volatile types.peripherals.USART1, 0x40013800);
            ///  Debug support
            pub const DBG = @intToPtr(*volatile types.peripherals.DBG, 0x40015800);
            ///  Direct memory access controller
            pub const DMA1 = @intToPtr(*volatile types.peripherals.DMA1, 0x40020000);
            ///  Reset and clock control
            pub const RCC = @intToPtr(*volatile types.peripherals.RCC, 0x40021000);
            ///  Flash
            pub const Flash = @intToPtr(*volatile types.peripherals.Flash, 0x40022000);
            ///  Cyclic redundancy check calculation unit
            pub const CRC = @intToPtr(*volatile types.peripherals.CRC, 0x40023000);
            ///  Advanced encryption standard hardware accelerator
            pub const AES = @intToPtr(*volatile types.peripherals.AES, 0x40026000);
            ///  General-purpose I/Os
            pub const GPIOA = @intToPtr(*volatile types.peripherals.GPIOA, 0x50000000);
            ///  General-purpose I/Os
            pub const GPIOB = @intToPtr(*volatile types.peripherals.GPIOB, 0x50000400);
            ///  General-purpose I/Os
            pub const GPIOC = @intToPtr(*volatile types.peripherals.GPIOB, 0x50000800);
            ///  General-purpose I/Os
            pub const GPIOD = @intToPtr(*volatile types.peripherals.GPIOB, 0x50000c00);
            ///  General-purpose I/Os
            pub const GPIOE = @intToPtr(*volatile types.peripherals.GPIOB, 0x50001000);
            ///  General-purpose I/Os
            pub const GPIOH = @intToPtr(*volatile types.peripherals.GPIOB, 0x50001c00);
            ///  SysTick timer
            pub const STK = @intToPtr(*volatile types.peripherals.STK, 0xe000e010);
            ///  Nested Vectored Interrupt Controller
            pub const NVIC = @intToPtr(*volatile types.peripherals.NVIC, 0xe000e100);
            ///  System control block
            pub const SCB = @intToPtr(*volatile types.peripherals.SCB, 0xe000ed00);
            ///  Memory protection unit
            pub const MPU = @intToPtr(*volatile types.peripherals.MPU, 0xe000ed90);
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Advanced encryption standard hardware accelerator
        pub const AES = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  AES enable
                EN: u1,
                ///  Data type selection (for data in and data out to/from the cryptographic block)
                DATATYPE: u2,
                ///  AES operating mode
                MODE: u2,
                ///  AES chaining mode
                CHMOD: u2,
                ///  Computation Complete Flag Clear
                CCFC: u1,
                ///  Error clear
                ERRC: u1,
                ///  CCF flag interrupt enable
                CCFIE: u1,
                ///  Error interrupt enable
                ERRIE: u1,
                ///  Enable DMA management of data input phase
                DMAINEN: u1,
                ///  Enable DMA management of data output phase
                DMAOUTEN: u1,
                padding: u19,
            }),
        };

    };
};
