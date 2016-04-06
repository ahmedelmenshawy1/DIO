/*
 * DIO_Private.h
 *
 *  Created on: ??þ/??þ/????
 *      Author: ahmed
 */

#ifndef _DIO_PRIVATE_H_
#define _DIO_PRIVATE_H_

/*Comment!:Concatination  */

#define conchelper(x7,x6,x5,x4,x3,x2,x1,x0) 0b##x7##x6##x5##x4##x3##x2##x1##x0
#define conc(x7,x6,x5,x4,x3,x2,x1,x0)		conchelper(x0,x1,x2,x3,x4,x5,x6,x7)
/*Comment!:Set Initial Direction  */

#define DIO_u8PORTADIR	conc(DIO_u8Pin0_INITDIR,DIO_u8Pin1_INITDIR,DIO_u8Pin2_INITDIR,DIO_u8Pin3_INITDIR,DIO_u8Pin4_INITDIR,DIO_u8Pin5_INITDIR,DIO_u8Pin6_INITDIR,DIO_u8Pin7_INITDIR)
#define DIO_u8PORTBDIR  conc(DIO_u8Pin8_INITDIR,DIO_u8Pin9_INITDIR,DIO_u8Pin10_INITDIR,DIO_u8Pin11_INITDIR,DIO_u8Pin12_INITDIR,DIO_u8Pin13_INITDIR,DIO_u8Pin14_INITDIR,DIO_u8Pin15_INITDIR)
#define DIO_u8PORTCDIR  conc(DIO_u8Pin16_INITDIR,DIO_u8Pin17_INITDIR,DIO_u8Pin18_INITDIR,DIO_u8Pin19_INITDIR,DIO_u8Pin20_INITDIR,DIO_u8Pin21_INITDIR,DIO_u8Pin22_INITDIR,DIO_u8Pin23_INITDIR)
#define DIO_u8PORTDDIR  conc(DIO_u8Pin25_INITDIR,DIO_u8Pin26_INITDIR,DIO_u8Pin27_INITDIR,DIO_u8Pin28_INITDIR,DIO_u8Pin29_INITDIR,DIO_u8Pin29_INITDIR,DIO_u8Pin30_INITDIR,DIO_u8Pin31_INITDIR)

/*Comment!:Set Initial Value  */

#define DIO_u8PORTAVAL conc(DIO_u8Pin0_INITVAL,DIO_u8Pin1_INITVAL,DIO_u8Pin2_INITVAL,DIO_u8Pin3_INITVAL,DIO_u8Pin4_INITVAL,DIO_u8Pin5_INITVAL,DIO_u8Pin6_INITVAL,DIO_u8Pin7_INITVAL)
#define DIO_u8PORTBVAL conc(DIO_u8Pin8_INITVAL,DIO_u8Pin9_INITVAL,DIO_u8Pin10_INITVAL,DIO_u8Pin11_INITVAL,DIO_u8Pin12_INITVAL,DIO_u8Pin13_INITVAL,DIO_u8Pin14_INITVAL,DIO_u8Pin15_INITVAL)
#define DIO_u8PORTCVAL conc(DIO_u8Pin16_INITVAL,DIO_u8Pin17_INITVAL,DIO_u8Pin18_INITVAL,DIO_u8Pin19_INITVAL,DIO_u8Pin20_INITVAL,DIO_u8Pin21_INITVAL,DIO_u8Pin22_INITVAL,DIO_u8Pin23_INITVAL)
#define DIO_u8PORTDDIR  conc(DIO_u8Pin24_INITDIR,DIO_u8Pin25_INITDIR,DIO_u8Pin26_INITDIR,DIO_u8Pin27_INITDIR,DIO_u8Pin28_INITDIR,DIO_u8Pin29_INITDIR,DIO_u8Pin30_INITDIR,DIO_u8Pin31_INITDIR)

/*Comment!:PORT,PIN And DDR address  */
#define PORTA_Address	(0x3B)
#define DDRA_Address	(0x3A)
#define PINA_Address	(0x39)

#define PORTB_Address	(0x38)
#define DDRB_Address	(0x37)
#define PINB_Address	(0x36)

#define PORTC_Address	(0x35)
#define DDRC_Address	(0x34)
#define PINC_Address	(0x33)

#define PORTD_Address	(0x32)
#define DDRD_Address	(0x31)
#define PIND_Address	(0x30)

/*Comment!:PORTA,PINA And DDRA   */
#define PORTA 	*((volatile u8*)PORTA_Address)
#define DDRA 	*((volatile u8*)DDRA_Address)
#define PINA 	*((volatile u8*)PINA_Address)

/*Comment!:PORTB,PINB And DDRB   */
#define PORTB 	*((volatile u8*)PORTB_Address)
#define DDRB 	*((volatile u8*)DDRB_Address)
#define PINB 	*((volatile u8*)PINB_Address)

/*Comment!:PORTC,PINC And DDRC   */
#define PORTC 	*((volatile u8*)PORTC_Address)
#define DDRC 	*((volatile u8*)DDRC_Address)
#define PINC 	*((volatile u8*)PINC_Address)

/*Comment!:PORTD,PIND And DDRD   */
#define PORTD 	*((volatile u8*)PORTD_Address)
#define DDRD 	*((volatile u8*)DDRD_Address)
#define PIND 	*((volatile u8*)PIND_Address)

#endif /* DIO_PRIVATE_H_ */
