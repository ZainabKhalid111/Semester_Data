#include<reg51.h>
#include<stdio.h>
sbit interrupt_button =P3^2; 	//externalinterrupt at pin 12
sbit led=P2^0;  
int count=0;
int i=0;
void start_timer(void)
{
	TR0=1;		//starting timer 0
}
void ext_int_0(void)interrupt 0   //ISR for external interrupt0 INT0 when button is pressed
{
	count=count+1;	
}
void timer_int(void)interrupt 3   //	ISR for roll over condition
{

	switch(count%3)
	{
		case 0:
			if(led==1)
			{
				led=0;
				TH0=0xF4;
				TL0=0x44;
			}
			else
			{
				led=1;
				TH0=0xFC;
				TL0=0x17;
			}
			break;
		case 1:
			if(led==1)
			{
				led=0;
				TH0=0xFC;
				TL0=0x17;
			}
			else
			{
				led=1;
				TH0=0xFC;
				TL0=0x17;
			}
			break;
		case 2:
			if(led==1)
			{
				led=0;
				TH0=0xFB;
				TL0=0x1D;
			}
			else
			{
				led=1;
				TH0=0xFD;
				TL0=0x11;
			}
			break;
		}
	}
void init_timer(void)
{
	TMOD=0x01; //mod 1 timer
	TH0=0xFC;
	TL0=0x17;
	IE=0x83; //timer 0 overflowinterrupt and externalinterrupt 0
	INT0=1; //externalinterrupt at pin 3.2
}
void main(void)
{
	led=1;
	interrupt_button=1; //configure INT0 pin as an input
	init_timer();
	start_timer();
	
	while(1)
	{
	}
}