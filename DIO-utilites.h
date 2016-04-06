/*
 * DIO-registers.h
 *
 *  Created on: Jan 30, 2016
 *      Author: m.mamdooh
 */

#ifndef _DIO_REGISTERS_H_
#define _DIO_REGISTERS_H_


#define Get_Bit(reg,bits_no)  (reg &(1<<bits_no))>>bits_no
#define Clr_Bit(reg,bits_no)   reg &= ~(1<<bits_no)
#define Set_Bit(reg,bits_no)  reg|=(1<<bits_no)
#define Assign_Bit(reg,bits_no,value)		reg=(reg & (~(1<<bits_no)))|(value<<bits_no)
#define toggele_bit(reg,bits_no)  reg^=(1<<bits_no)
#define set_reg(reg) reg= 0xff
#define clr_reg(reg)  reg = 0x00
#define toogle_reg(reg) reg^=0xff
#define Assign_Reg(reg,value)   reg=value
#define get_low_nible(reg) reg& 0x0f
#define clr_low_nible(reg ) reg&= 0xf0
#define set_low_nible(reg )  reg|=0x0f
#define toggle_low_nible(reg) reg^=0x0f
#define assign_low_nible(reg,value) reg=(reg&0xf0)|(value&0x0f)
#define get_high_nible(reg) (reg& 0x0f )>> 4
#define clr_high_nible(reg) reg&=0x0f
#define set_high_nible(reg) reg|=0xf0
#define toggle_high_nible(reg) reg^=0xf0
#define assign_high_nible(reg,value) reg=(reg&0x0f)|(value<<4)


#endif /* DIO_REGISTERS_H_ */
