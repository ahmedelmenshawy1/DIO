/*
 * DIO_Prog.c
 *
 *  Created on: ??þ/??þ/????
 *      Author: ahmed
 */

#include "Types.h"
#include "DIO_Private.h"
#include "DIO_config.h"
#include "DIO_interface.h"
#include "DIO-utilites.h"
#include "delay.h"
/*****************************Global***********************************/
u8* const DIO_u8ArrPORT[4]={&PORTA,&PORTB,&PORTC,&PORTD};
u8* const DIO_u8ArrDDR[4]= {&DDRA,&DDRB,&DDRC,&DDRD};
u8* const DIO_u8ArrPIN[4]= {&PINA,&PINB,&PINC,&PIND};
//static u8 PortA,PortB,PortC,PortD;
/*****************************main***********************************/

//int main (void)
//{}
	/*u8 Local_u8Count;
	DIO_VoidInit();

	while(1)
	{*/
/************************************************************************************/
	/*	for(Local_u8Count=14;Local_u8Count>7;Local_u8Count--)
		{
			DIO_u8WritePinVal(Local_u8Count,DIO_u8HIGH);
			Delay_ms(100);Delay_ms(100);Delay_ms(100);
		}
		PORTB=0X00;
		Delay_ms(100);Delay_ms(100);Delay_ms(100);
		for(Local_u8Count=7;Local_u8Count<14;Local_u8Count++)
		{
			DIO_u8WritePinVal(Local_u8Count,DIO_u8HIGH);
			Delay_ms(100);Delay_ms(100);Delay_ms(100);
		}
		PORTB=0X00;
		Delay_ms(100);Delay_ms(100);Delay_ms(100);
*/
/************************************************************************************/
	//}
	//return 0;
//}
/*****************************DIO_VoidInit***********************************/
extern void DIO_VoidInit(void)
{
	DDRA=DIO_u8PORTADIR;//ELY ANA BSHAER 3LEH 5LEH BL2IMH DEH
	DDRB=DIO_u8PORTBDIR;
	DDRC=DIO_u8PORTCDIR;
	DDRD=DIO_u8PORTDDIR;

	/*Comment!:karnouf map  */
	PORTA=(DIO_u8PORTAVAL & DIO_u8PORTADIR ) | (PORTA & (~DIO_u8PORTADIR));
	PORTB=(DIO_u8PORTBVAL & DIO_u8PORTBDIR ) | (PORTB & (~DIO_u8PORTBDIR));
	PORTC=(DIO_u8PORTCVAL & DIO_u8PORTCDIR ) | (PORTC & (~DIO_u8PORTCDIR));
	PORTD=(DIO_u8PORTDVAL & DIO_u8PORTDDIR ) | (PORTD & (~DIO_u8PORTDDIR));

}
/*****************************DIO_u8ReadPinVal***********************************/

extern u8 DIO_u8ReadPinVal(u8 Copy_u8PinIdx,u8* Copy_u8PtrToVal )
{
	u8 Local_u8Status,Local_u8Port,Local_u8Pin;
	if(Copy_u8PinIdx < DIO_u8NumberAllPins)
	{
		Local_u8Port=Copy_u8PinIdx / DIO_u8NumberOfPin;
		Local_u8Pin= Copy_u8PinIdx % DIO_u8NumberOfPin;
		*Copy_u8PtrToVal=Get_Bit(*DIO_u8ArrPIN[Local_u8Port],Local_u8Pin);
		Local_u8Status=Ok;
	}
	else
	{
		Local_u8Status=Error;
	}
	return Local_u8Status;
}
/*****************************DIO_u8WritePinVal***********************************/
extern u8 DIO_u8WritePinVal(u8 Copy_u8PinIdx,u8 Copy_u8PinToVal )
{
		u8 Local_u8Status,Local_u8Port,Local_u8Pin;
		if(Copy_u8PinIdx < DIO_u8NumberAllPins)
		{
			Local_u8Port=Copy_u8PinIdx / DIO_u8NumberOfPin;
			Local_u8Pin= Copy_u8PinIdx % DIO_u8NumberOfPin;
			if(Copy_u8PinToVal==DIO_u8LOW)
			{
				Clr_Bit(*DIO_u8ArrPORT[Local_u8Port],Local_u8Pin);
			}
			else
			{
				Set_Bit(*DIO_u8ArrPORT[Local_u8Port],Local_u8Pin);
			}
			Local_u8Status=Ok;
		}
		else
		{
			Local_u8Status=Error;
		}
		return Local_u8Status;

}
/*****************************DIO_u8ReadPortVal***********************************/

extern u8 DIO_u8ReadPortVal(u8 Copy_u8PortIdx,u8* Copy_u8PtrToVal )
{
	u8 Local_u8Status;

	if(Copy_u8PortIdx < DIO_u8NumberOfPort)
	{
		*Copy_u8PtrToVal=*DIO_u8ArrPIN[Copy_u8PortIdx];
		Local_u8Status=Ok;
	}
	else
	{
		Local_u8Status=Error;
	}
	return Local_u8Status;
}
/*****************************DIO_u8WritePortVal***********************************/

extern u8 DIO_u8WritePortVal(u8 Copy_u8PortIdx,u8* Copy_u8PtrToVal )
{
		u8 Local_u8Status;

		if(Copy_u8PortIdx < DIO_u8NumberOfPort)
		{
			*DIO_u8ArrPORT[Copy_u8PortIdx]=*Copy_u8PtrToVal;
			Local_u8Status=Ok;
		}
		else
		{
			Local_u8Status=Error;
		}
		return Local_u8Status;

}
/*****************************DIO_u8ReadPortDir***********************************/
extern u8 DIO_u8WritePinDir(u8 Copy_u8PinIdx,u8 Copy_u8PinDir)
{
			u8 Local_u8Status,Local_u8Port,Local_u8Pin;
			if(Copy_u8PinIdx < DIO_u8NumberAllPins)
			{
				Local_u8Port=Copy_u8PinIdx / DIO_u8NumberOfPin;
				Local_u8Pin= Copy_u8PinIdx % DIO_u8NumberOfPin;
				Assign_Bit(*DIO_u8ArrDDR[Local_u8Port],Local_u8Pin,Copy_u8PinDir);
			}
			else
			{
				Local_u8Status=Error;
			}
			return Local_u8Status;
}
/*****************************DIO_u8WritePortDir***********************************/

extern u8 DIO_u8WritePortDir(u8 Copy_u8PortIdx,u8 Copy_u8PortDir)
{
				u8 Local_u8Status;//,Local_u8Port;
				if(Copy_u8PortIdx < DIO_u8NumberOfPort)
				{
					//Local_u8Port=Copy_u8PortIdx / DIO_u8NumberOfPin;
					Assign_Reg(*DIO_u8ArrDDR[Copy_u8PortIdx],Copy_u8PortDir);
				}
				else
				{
					Local_u8Status=Error;
				}
				return Local_u8Status;

}
/*****************************DIO_u8ReadPinDir***********************************/

extern u8 DIO_u8ReadPinDir(u8 Copy_u8PinIdx,u8* Copy_u8PinDir)
{
				u8 Local_u8Status,Local_u8Port,Local_u8Pin;
				if(Copy_u8PinIdx < DIO_u8NumberAllPins)
				{
					Local_u8Port=Copy_u8PinIdx / DIO_u8NumberOfPin;
					Local_u8Pin= Copy_u8PinIdx % DIO_u8NumberOfPin;
					*Copy_u8PinDir=Get_Bit(*DIO_u8ArrDDR[Local_u8Port],Local_u8Port);
				}
				else
				{
					Local_u8Status=Error;
				}
				return Local_u8Status;
}
/*****************************DIO_u8ReadPortDir***********************************/

extern u8 DIO_u8ReadPortDir(u8 Copy_u8PortIdx,u8* Copy_u8PortDir)
{
		u8 Local_u8Status;

		if(Copy_u8PortIdx < DIO_u8NumberOfPort)
		{
			*Copy_u8PortDir=*DIO_u8ArrDDR[Copy_u8PortIdx];
			Local_u8Status=Ok;
		}
		else
		{
			Local_u8Status=Error;
		}
		return Local_u8Status;

}












