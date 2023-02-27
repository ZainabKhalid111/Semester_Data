#include <reg51.h>
#include <stdio.h>
sbit pin=P1^0;
sbit pin_int=P3^2;
void start_timer0(){
		TR0=1;
}

void ext_int() interrupt 0
{
		TH0=0xFD;
		TL0=0x43;
}

void init_timer(){
		TMOD=0x01;
		TL0=0x18;
		TH0=0xFC;
}
//void Delay()

void main(void){
	init_timer();
	start_timer0();
	
	while(1)
	{
		if(TF0==0)
		{
			TR0=0;
			TF0=0;
		}
	}
}
		
		