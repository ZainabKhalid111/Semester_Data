#include <stdio.h>
#include <reg51.h>

sbit col1=P2^2;
sbit col2=P2^1;
sbit col3=P2^0;

sbit rowA=P2^3;
sbit rowB=P2^4;
sbit rowC=P2^5;
sbit rowD=P2^6;

sbit LED1=P1^0;
sbit LED2=P1^1;
sbit LED3=P1^2;
sbit LED4=P1^3;
sbit LED5=P1^4;
sbit LED6=P1^5;
sbit LED7=P1^6;
sbit LED8=P1^7;
sbit LED9=P3^0;

void main(){
	P1=P3=0;
	rowB=rowC=rowD=1;
	rowA=0;
	if (rowA==0)
	{
		if(col1==0)
			LED1=1;

		else if(col2==0)
			LED2=1;
		
		else if(col3==0)
			LED3=1;
	}
	rowA=rowC=rowD=1;
	rowB=0;
	if (rowB==0)
		{
			if(col1==0)
				LED4=1;

			else if(col2==0)
				LED5=1;
			
			else if(col3==0)
				LED6=1;
		}
		
		rowA=rowB=rowD=1;
		rowC=0;
		if (rowC==0)
		{
			if(col1==0)
				LED7=1;

			else if(col2==0)
				LED8=1;
			
			else if(col3==0)
				LED9=1;
		}
	}