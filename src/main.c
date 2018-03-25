#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>

#if (F_CPU != 8000000)
#error "please compile with 8MHz cpu clock"
#endif

static volatile uint16_t count = 0;
static volatile bool tick = false;
static volatile bool overflow = true;

static volatile uint8_t phase = 0;

int main(void)
{
	/* initialize TIMER0 as phase counter */
	TCCR0A = (1<<WGM01) | (0<<WGM00);
	TCCR0B = (0<<WGM02)
		| (0<<CS02) | (0<<CS01) | (1<<CS00);
	TIMSK0 = (1<<OCIE0A);

	/* initialize TIMER1 for input capture F_CPU/64 */
	TCCR1A = (0<<WGM11) | (0<<WGM10);
	TCCR1B = (0<<WGM13) | (1<<WGM12) 
		| (1<<ICES1) 
		| (0<<CS12) | (1<<CS11) | (1<<CS10);
	TIMSK1 = (1<<ICIE1) | (1<<TOIE1);

	for(;;) {
		if (tick) {
			tick = false;
		}
		if (overflow) {}
			// sleep
	}

	// make compiler happy
	return 0;
}


SIGNAL(TIM1_CAPT_vect)
{
	TCNT1 = 0;
// TODO calculate OCR0A depending on ICR1
	// F_ = F_CPU / (2*N*(1+OCR0A))

	//OCR0A = F_CPU / ( 2 * N * t) - 1;

	count = ICR1;
	phase = 0;
}

SIGNAL(TIM1_OVF_vect)
{
	overflow = true;
}

SIGNAL(TIM0_COMPA_vect)
{
	phase++;
}
