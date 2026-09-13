/*
 * DSP56F801 DSP + GPIO Demonstration
 *
 * Purpose:
 *   1. Configure GPIOA as a digital output.
 *   2. Perform a DSP multiply-accumulate operation.
 *   3. Use the calculation result to control GPIOA.
 */

typedef unsigned short UWord16; // DSP56800 uses 16-bit 'short' integers

#define GPIOA_BASE   0x0FB0

#define GPIO_A_DR    (*(volatile UWord16 *)(GPIOA_BASE + 1))
#define GPIO_A_DDR   (*(volatile UWord16 *)(GPIOA_BASE + 2))
#define GPIO_A_PER   (*(volatile UWord16 *)(GPIOA_BASE + 3))

/*
 * DSP assembly function.
 *
 * DSP56800:
 *   sample      -> Y0
 *   coefficient -> Y1
 *   result      -> Y0
 */
int dsp_mac(int sample, int coefficient);

static void gpio_init(void)
{
    /*
     * Select GPIO functionality for Port A.
     *
     * PER = 0
     * means GPIO controls the pins.
     */
    GPIO_A_PER = 0x0000;

    /*
     * Configure PA0 as output.
     *
     * DDR bit 0 = 1
     */
    GPIO_A_DDR = 0x0001;

    /*
     * Initial output state = LOW.
     */
    GPIO_A_DR = 0x0000;
}


static void gpio_set_high(void)
{
    GPIO_A_DR = 0x0001;
}


static void gpio_set_low(void)
{
    GPIO_A_DR = 0x0000;
}


int main(void)
{
	int sample = 0x4000;       /* 0.5 in Q15 */
	int coefficient = 0x2000;  /* 0.25 in Q15 */
    int result;


    /*
     * MCU-side initialization
     */
    gpio_init();


    /*
     * DSP-style operation:
     *
     * result = 0 + sample * coefficient
     *
     * The multiplication is performed by
     * the DSP56800 MAC hardware.
     */
    result = dsp_mac(sample, coefficient);


    /*
     * MCU-side response to DSP result
     */
    if (result > 0)
    {
        gpio_set_high();
    }
    else
    {
        gpio_set_low();
    }


    /*
     * Keep the result available for debugger inspection.
     */
    while (1)
    {
    }

    return 0;
}