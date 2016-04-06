# 1 "DIO_Prog.c"
# 1 "<command-line>"
# 1 "DIO_Prog.c"







# 1 "Types.h" 1




typedef unsigned short int u16;
typedef short int s16;

typedef unsigned long int u32;
typedef signed long int s32;

typedef unsigned char u8;
typedef signed char s8;

typedef unsigned long long int u64;
typedef signed long long int s64;

typedef float f32;
typedef double d64;
# 9 "DIO_Prog.c" 2
# 1 "DIO_Private.h" 1
# 10 "DIO_Prog.c" 2
# 1 "DIO_config.h" 1
# 11 "DIO_Prog.c" 2
# 1 "DIO_interface.h" 1
# 75 "DIO_interface.h"
extern u8 DIO_u8ReadPinVal(u8 Copy_u8PinIdx,u8* Copy_u8PtrToVal );


extern u8 DIO_u8WritePinVal(u8 Copy_u8PinIdx,u8 Copy_u8PinToVal );


extern u8 DIO_u8ReadPortVal(u8 Copy_u8PortIdx,u8* Copy_u8PtrToVal );


extern u8 DIO_u8WritePortVal(u8 Copy_u8PortIdx,u8* Copy_u8PtrToVal );


extern u8 DIO_u8WritePinDir(u8 Copy_u8PinIdx,u8 Copy_u8PinDir);


extern u8 DIO_u8WritePortDir(u8 Copy_u8PortIdx,u8 Copy_u8PortDir);


extern u8 DIO_u8ReadPinDir(u8 Copy_u8PinIdx,u8* Copy_u8PinDir);


extern void DIO_VoidInit(void);


extern u8 DIO_u8ReadPortDir(u8 Copy_u8PortIdx,u8* Copy_u8PortDir);
# 12 "DIO_Prog.c" 2
# 1 "DIO-utilites.h" 1
# 13 "DIO_Prog.c" 2
# 1 "delay.h" 1





# 1 "types.h" 1
# 7 "delay.h" 2
# 1 "delay_config.h" 1
# 8 "delay.h" 2
# 14 "DIO_Prog.c" 2

u8* const DIO_u8ArrPORT[4]={&*((volatile u8*)(0x3B)),&*((volatile u8*)(0x38)),&*((volatile u8*)(0x35)),&*((volatile u8*)(0x32))};
u8* const DIO_u8ArrDDR[4]= {&*((volatile u8*)(0x3A)),&*((volatile u8*)(0x37)),&*((volatile u8*)(0x34)),&*((volatile u8*)(0x31))};
u8* const DIO_u8ArrPIN[4]= {&*((volatile u8*)(0x39)),&*((volatile u8*)(0x36)),&*((volatile u8*)(0x33)),&*((volatile u8*)(0x30))};
# 49 "DIO_Prog.c"
extern void DIO_VoidInit(void)
{
 *((volatile u8*)(0x3A))=0b11111111;
 *((volatile u8*)(0x37))=0b11111111;
 *((volatile u8*)(0x34))=0b00000000;
 *((volatile u8*)(0x31))=0b00000000;


 *((volatile u8*)(0x3B))=(0b11111111 & 0b11111111 ) | (*((volatile u8*)(0x3B)) & (~0b11111111));
 *((volatile u8*)(0x38))=(0b00001111 & 0b11111111 ) | (*((volatile u8*)(0x38)) & (~0b11111111));
 *((volatile u8*)(0x35))=(0b00000000 & 0b00000000 ) | (*((volatile u8*)(0x35)) & (~0b00000000));
 *((volatile u8*)(0x32))=(0b00000000 & 0b00000000 ) | (*((volatile u8*)(0x32)) & (~0b00000000));

}


extern u8 DIO_u8ReadPinVal(u8 Copy_u8PinIdx,u8* Copy_u8PtrToVal )
{
 u8 Local_u8Status,Local_u8Port,Local_u8Pin;
 if(Copy_u8PinIdx < 32)
 {
  Local_u8Port=Copy_u8PinIdx / 8;
  Local_u8Pin= Copy_u8PinIdx % 8;
  *Copy_u8PtrToVal=(*DIO_u8ArrPIN[Local_u8Port] &(1<<Local_u8Pin))>>Local_u8Pin;
  Local_u8Status=1;
 }
 else
 {
  Local_u8Status=0;
 }
 return Local_u8Status;
}

extern u8 DIO_u8WritePinVal(u8 Copy_u8PinIdx,u8 Copy_u8PinToVal )
{
  u8 Local_u8Status,Local_u8Port,Local_u8Pin;
  if(Copy_u8PinIdx < 32)
  {
   Local_u8Port=Copy_u8PinIdx / 8;
   Local_u8Pin= Copy_u8PinIdx % 8;
   if(Copy_u8PinToVal==0)
   {
    *DIO_u8ArrPORT[Local_u8Port] &= ~(1<<Local_u8Pin);
   }
   else
   {
    *DIO_u8ArrPORT[Local_u8Port]|=(1<<Local_u8Pin);
   }
   Local_u8Status=1;
  }
  else
  {
   Local_u8Status=0;
  }
  return Local_u8Status;

}


extern u8 DIO_u8ReadPortVal(u8 Copy_u8PortIdx,u8* Copy_u8PtrToVal )
{
 u8 Local_u8Status;

 if(Copy_u8PortIdx < 4)
 {
  *Copy_u8PtrToVal=*DIO_u8ArrPIN[Copy_u8PortIdx];
  Local_u8Status=1;
 }
 else
 {
  Local_u8Status=0;
 }
 return Local_u8Status;
}


extern u8 DIO_u8WritePortVal(u8 Copy_u8PortIdx,u8* Copy_u8PtrToVal )
{
  u8 Local_u8Status;

  if(Copy_u8PortIdx < 4)
  {
   *DIO_u8ArrPORT[Copy_u8PortIdx]=*Copy_u8PtrToVal;
   Local_u8Status=1;
  }
  else
  {
   Local_u8Status=0;
  }
  return Local_u8Status;

}

extern u8 DIO_u8WritePinDir(u8 Copy_u8PinIdx,u8 Copy_u8PinDir)
{
   u8 Local_u8Status,Local_u8Port,Local_u8Pin;
   if(Copy_u8PinIdx < 32)
   {
    Local_u8Port=Copy_u8PinIdx / 8;
    Local_u8Pin= Copy_u8PinIdx % 8;
    *DIO_u8ArrDDR[Local_u8Port]=(*DIO_u8ArrDDR[Local_u8Port] & (~(1<<Local_u8Pin)))|(Copy_u8PinDir<<Local_u8Pin);
   }
   else
   {
    Local_u8Status=0;
   }
   return Local_u8Status;
}


extern u8 DIO_u8WritePortDir(u8 Copy_u8PortIdx,u8 Copy_u8PortDir)
{
    u8 Local_u8Status,Local_u8Port;
    if(Copy_u8PortIdx < 4)
    {
     Local_u8Port=Copy_u8PortIdx / 8;
     *DIO_u8ArrDDR[Local_u8Port]=Copy_u8PortDir;
    }
    else
    {
     Local_u8Status=0;
    }
    return Local_u8Status;

}


extern u8 DIO_u8ReadPinDir(u8 Copy_u8PinIdx,u8* Copy_u8PinDir)
{
    u8 Local_u8Status,Local_u8Port,Local_u8Pin;
    if(Copy_u8PinIdx < 32)
    {
     Local_u8Port=Copy_u8PinIdx / 8;
     Local_u8Pin= Copy_u8PinIdx % 8;
     *Copy_u8PinDir=(*DIO_u8ArrDDR[Local_u8Port] &(1<<Local_u8Port))>>Local_u8Port;
    }
    else
    {
     Local_u8Status=0;
    }
    return Local_u8Status;
}


extern u8 DIO_u8ReadPortDir(u8 Copy_u8PortIdx,u8* Copy_u8PortDir)
{
  u8 Local_u8Status;

  if(Copy_u8PortIdx < 4)
  {
   *Copy_u8PortDir=*DIO_u8ArrDDR[Copy_u8PortIdx];
   Local_u8Status=1;
  }
  else
  {
   Local_u8Status=0;
  }
  return Local_u8Status;

}
