#include<reg51.h>
#include<stdio.h>
void main(void)
{
	P0=0xFF;
	
	P1=0x01;//P1=1
	P2=0x03;//P2=3
	P0=0x99;//P0=4=0x99 on  seven segment anode
}