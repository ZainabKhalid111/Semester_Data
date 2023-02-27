#include <reg51.h>
#include <stdio.h>

sbit pin1=P1^1;
sbit pin2=P1^2;

sbit led1=P2^1;
sbit led2=P2^2;
sbit led3=P2^3;
sbit led4=P2^4;

void main(){
	
	led1=0x00;
	led2=0x00;
	led3=0x00;
	led4=0x00;
	while(1)
	{
		if(pin1==0 && pin2==0)
		{
			led1=0x01;
			led2=0x00;
			led3=0x00;
			led4=0x00;
		}
		else if(pin1==0 && pin2==1)
		{
			led1=0x00;
			led2=0x01;
			led3=0x00;
			led4=0x00;
		}
		else if(pin1==1 && pin2==0)
		{
			led1=0x00;
			led2=0x00;
			led3=0x01;
			led4=0x00;
		}
		else if(pin1==1 && pin2==1)
		{
			led1=0x01;
			led2=0x01;
			led3=0x01;
			led4=0x01;
		}
		else;
	
	}
	//return 0;
}